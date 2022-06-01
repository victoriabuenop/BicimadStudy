#####################################
## Name: Victoria Bueno Perez
## Final Project
#####################################

## FILE TO CHANGE ORIGINAL DATASET TO DIFERENT FORMAT AND CLEAN IT

# Now I am going to work with meteo files, which contains the temperature and raining data
# they are distributed in 3 different files that I am going to join

meteo19 <- read.csv("meteo19.csv", sep = ";") 
meteo20 <- read.csv("meteo20.csv", sep = ";") 
meteo <- rbind(meteo19, meteo20)
meteo21 <- read.csv("meteo21.csv", sep = ";")
meteo <- rbind(meteo, meteo21)


# From "Punto de muestreo" feature I only need parameters 83 that stands for temperature, and 89 for rain

# Temperature values
temp <- subset(meteo, MAGNITUD==83)
# Delete columns with same value: provincia, municipio, magnitud, punto de muestreo
temp <- select(temp, -c(1, 2, 4, 5))

# Delete station 104, 108, 110, 111,114,16,39 because they do not have values por all months every year, clean dataset
temp <- subset(temp, ESTACION!=104 & ESTACION!=108 & ESTACION!= 110 & ESTACION!=111 & ESTACION!=114 & ESTACION!=16 & ESTACION!=39)

temp <- temp %>%
  group_by(ANO, MES) %>%
  summarise(D01 = sum(D01)/19, 
            D02 = sum(D02)/19,
            D03 = sum(D03)/19,
            D04 = sum(D04)/19,
            D05 = sum(D05)/19,
            D06 = sum(D06)/19,
            D07 = sum(D07)/19,
            D08 = sum(D08)/19,
            D09 = sum(D09)/19,
            D10 = sum(D10)/19,
            D11 = sum(D11)/19,
            D12 = sum(D12)/19,
            D13 = sum(D13)/19,
            D14 = sum(D14)/19,
            D15 = sum(D15)/19,
            D16 = sum(D16)/19,
            D17 = sum(D17)/19,
            D18 = sum(D18)/19,
            D19 = sum(D19)/19,
            D20 = sum(D20)/19,
            D21 = sum(D21)/19,
            D22 = sum(D22)/19,
            D23 = sum(D23)/19,
            D24 = sum(D24)/19,
            D25 = sum(D25)/19,
            D26 = sum(D26)/19,
            D27 = sum(D27)/19,
            D28 = sum(D28)/19,
            D29 = sum(D29)/19,
            D30 = sum(D30)/19,
            D31 = sum(D31)/19)

# Save cleaned file to letter change it manually
write.csv(temp,"temp.csv", row.names = TRUE)


# Now the same as before but for rain
rain <- subset(meteo, MAGNITUD==89)
# Delete columns with same value: provincia, municipio, magnitud, punto de muestreo
rain <- select(rain, -c(1, 2, 4, 5))

#Delete stations with missing dates: 104, 108,59
rain <- subset(rain, ESTACION!=104 & ESTACION!=108 & ESTACION!= 59)

rain <- rain %>%
  group_by(ANO, MES) %>%
  summarise(D01 = sum(D01)/8, 
            D02 = sum(D02)/8,
            D03 = sum(D03)/8,
            D04 = sum(D04)/8,
            D05 = sum(D05)/8,
            D06 = sum(D06)/8,
            D07 = sum(D07)/8,
            D08 = sum(D08)/8,
            D09 = sum(D09)/8,
            D10 = sum(D10)/8,
            D11 = sum(D11)/8,
            D12 = sum(D12)/8,
            D13 = sum(D13)/8,
            D14 = sum(D14)/8,
            D15 = sum(D15)/8,
            D16 = sum(D16)/8,
            D17 = sum(D17)/8,
            D18 = sum(D18)/8,
            D19 = sum(D19)/8,
            D20 = sum(D20)/8,
            D21 = sum(D21)/8,
            D22 = sum(D22)/8,
            D23 = sum(D23)/8,
            D24 = sum(D24)/8,
            D25 = sum(D25)/8,
            D26 = sum(D26)/8,
            D27 = sum(D27)/8,
            D28 = sum(D28)/8,
            D29 = sum(D29)/8,
            D30 = sum(D30)/8,
            D31 = sum(D31)/8)

# Save cleaned file to letter change it manually
write.csv(rain,"rain.csv", row.names = TRUE)

## After this changes I have reordered the files manually, so final files used are in the zip and are called temp.csv and rain.csv
