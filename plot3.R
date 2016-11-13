
# download file
url<- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="data.zip")
# unzip file
unzip ("data.zip")

# read file
fname <- "household_power_consumption.txt"
data<- read.table(fname, header=TRUE, na.strings="?", sep=";")
data2 <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]



# convert DateTime col from factor to date type
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$DateTime <- paste(data2$Date,data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime)



#plot 3
png("plot3.png",width=480,height=480)
plot(data2$DateTime,data2$Sub_metering_1,col="black",type="l",xlab="", ylab="Energy sub metering")
lines(data2$DateTime,data2$Sub_metering_2,col="red",type="l")
lines(data2$DateTime,data2$Sub_metering_3,col="blue",type="l")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()