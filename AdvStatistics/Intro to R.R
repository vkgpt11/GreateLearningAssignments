## ================================================================================================
## INTRODUCTION TO R
##
## We will be stepping through different solutions and functions that R provides starting from
## the very basics.  The topics covered include:
##    1.  Reading different input data types
##    2.  Understanding data
##    3.  Data types
##    4.  Introducing packages in R
##    5.  Getting help in R
##    6.  Introduction to Data frames
##    7.  Subsetting data
##    8.  Basic Statistical calculations
##    9.  Understanding data graphically
## ================================================================================================


## REFERENCES
## Jenny BC - https://github.com/jennybc/ggplot2-tutorial
## R Graphics Cookbook by Winston Chang - http://www.cookbook-r.com/
## Visualization: ggplot Cheatsheet: https://www.rstudio.com/wp-content/uploads/2016/11/ggplot2-cheatsheet-2.1.pdf
## cricketr Package demo: https://gigadom.wordpress.com/2015/07/04/introducing-cricketr-a-r-package-to-analyze-performances-of-cricketers/


## ================================================================================================
## Set Working Directory and Read Input data
## ================================================================================================

# Get Working Directory
getwd()

## Set Working Directory
setwd("D:\\Git\\GreatLakesAssignments\\RProg")

## Read Data from local machine - Make sure the dataset is in the Working Directory mentioned above
input.data.local = read.csv("Cars.csv", header = TRUE)
input.data = input.data.local


install.packages("MASS")
library(MASS)

input.data = Cars93


## ================================================================================================
## Understanding Data
## ================================================================================================

##  Display first few lines of data
head(input.data)        ## Displays the first 6 rows
head(input.data, 10)    ## Display first 20 rows

##  Display last few lines of data
tail(input.data)
tail(input.data, 10)

## Structure of Data
str(input.data)

    ##  OBSERVATIONS:
    ##  1.  There are 93 observations or rows
    ##  2.  There are 27 variables or columns
    ##  3.  Data types include: Integers, Factors and Numeric

## Summary of Data
summary(input.data)

    ##  OBSERVATIONS:
    ##  1.  Variable X is just a Serial Number
    ##  2.  There are 8 rows where Manufacturer is Chevrolet
    ##  3.  There are 16 Compact cars, 11 Large, 22 Midsize, 21 Small, 14 Sporty and 9 Van
    ##  4.  Rear.seat.room has 2 missing values and Luggage.room has 11 missing values
    ##  5.  Check if any of the Numeric variables have unreasonable values

## List Names of columns
names(input.data)


## ================================================================================================
##  Basics
## ================================================================================================

## Setting variables
x = 3  
x

x1 <- 7
x1

y = x + 5
y

m = "Money"
m

players = c("Kohli", "Dhoni", "Ashwin", "k L Rahul", "Md Shami")   ## String variables - use " "
players




## Creating a Vector
    ## A Vector can contain either numbers, strings or logical values - But NOT a mixture
    ## c(...) operator constructs a vector
v1 = c(1,2,3,3,5,6,9,10)      ## Numeric Vector
v1
class(v1)
str(v1)

v2 = c(1*pi, 2*pi, 3*pi)      ## Computed Vector
v2
class(v2)

v3 = c("Introduction", "To", "R")    ## String Vector
v3
class(v3)

v4 = c(FALSE, TRUE, TRUE, FALSE)  ## Logical Vector
v4
class(v4)
str(v4)

v5 = c(1, pi)
v5
class(v5)

v6 = c("Introduction", "To", pi)  
v6                                ## Note pi converted from Numeric to String
class(v6)

v7 = c("Introduction", "To" , 1)   
v7                                ## Note 1 converted from Numeric to String
class(v7)

## **********************

## Creating a Sequence

s1 = 1:5      
s1            ## Create a Sequence

s2 = seq(from=1, to=15, by=2)
s2            ## Create odd numbered Sequence from 1 to 15

s3 = seq(from=0, to=15, length.out = 5)
s3            ## Split 1 to 15 into 5 parts

s4 = rep(7, times = 5)
s4            ## Repeat a value

## *********************

## Comparing Vectors
v.a = c(4,1,4,5,3,2)
v.b = c(4,1,5,5,1,2)
v.a == v.b
sum(v.a == v.b)

## Selecting Elements within a Vector
v.a[3]           ## Display only the 3rd value

v.a[1:3]         ## Display the first 3 values

v.a[c(1,3,5)]    ## Display only the 1,3 and 5th values

v.a[-3]     ## Dispaly all values except the 3rd

## Vector Arithmetic
v.a + v.b         ## Adding Vectors

v.a * v.b         ## Multiplying Vectors

mean(v.a)         ## Mean of a Vector


## ************************
## Lists - Unlike Vectors, List can contain a mixture of different data types

l1 = list(2, "m", players)
l1
class(l1)

l1[[2]]        ## Display only 2nd value in the list
l1[c(2,3)]     ## Display 2nd and 3rd values in the list - Note z has been expanded
class(l1[[1]])   ## First value is numeric
class(l1[[2]])   ## Second value is a character
class(l1[[3]])
str(l1[[3]])

l1[[3]][4]


## **************************
##  Factors
## **************************

##  factor function encodes vector of discrete values as a vector

factor.v.a = factor(v.a)
factor.v.a

wday = c("Mon","Fri","Mon","Wed","Wed","Sat")
factor.wday = factor(wday)
factor.wday

## ================================================================================================
## Packages
## ================================================================================================

## List of Packages currenty installed
library()

## List Packages currently loaded
search()

## Install Packages
install.packages("MASS")

## Load Packages
library(MASS)

## Update Packages
update.packages("MASS")

## Remove Packages
detach(package::MASS)

## Useful Packages
    ## Refer: https://support.rstudio.com/hc/en-us/articles/201057987-Quick-list-of-useful-R-packages

## Built-in Datasets
data()        ## List of datasets in each of the packages loaded

install.packages("datasets")
library(datasets)

data(Animals)    ## Load Animals dataset
head(Animals)    ## View first few lines of Animals dataset

## ================================================================================================
## Getting Help in R
## ================================================================================================

## Help on a Function
help("mean")       ## Displays documentation for the function

example(subset)    ## Displays example for the function

?subset            ## Also displays documentation for the function

args(subset)           ## Displays arguments for the function

help(package = dplyr)   ## Displays help for the package


## ================================================================================================
## Introduction to Data Frames
## ================================================================================================

## NOTES:
    ##  Each ROW of a Dataframe is a LIST
    ##  Each COLUMN of a Dataframe is a VECTOR
    ##  Displays data as a grid

dataframe.1 = data.frame(v.a, v.b, v3)
dataframe.1
str(dataframe.1)

## Note: RECYCLING RULE applied for V3

## Adding row to dataframe
new.row = data.frame(v.a = 9, v.b= 12, v3="New_Row_Added")

dataframe.2 = rbind(dataframe.1, new.row)
dataframe.2

## Adding new column to dataframe
new.col = c("Time", "To", "Now", "Add", "A", "New", "Column")
dataframe.3 = cbind(dataframe.2, new.col)
dataframe.3

## Renaming Columns in a Dataframe
colnames(dataframe.3) = c("Session","Students","Topic","New_Topic")
dataframe.3
names(dataframe.3)


## Dimensions of a dataframe
nrow(dataframe.3)      ## Number of rows

ncol(dataframe.3)      ## Number of columns

dim(dataframe.3)       ## Rows x Columns


## Referencing Rows and Columns in a Dataframe
dataframe.3[3,]        ## Only the 3rd row is displayed

dataframe.3[,4]        ## Only the 4th column is displayed

dataframe.3[3,4]       ## Value in 3rd row, 4th column is displayed

dataframe.3$Session    ## Only the Session column is displayed

dataframe.3$Session[3] ## 3rd row of Session column is displayed

dataframe.3$Session[3] = 66
dataframe.3$Session[3] ## Updated from 4 to 66

## ****************************
## Apply Function
## ****************************

apply(dataframe.3[,1:2], 2, mean)   ## Reduces the need to individually find mean for each column


## ****************************
## Subsetting Dataframe
## ****************************

dataframe.sub1 = dataframe.3[,1:2]   ## Subsets only the first 2 columns
dataframe.sub1
class(dataframe.sub1)

dataframe.sub2 = dataframe.3[,c("Session","Topic")]   ## Subset by column name
dataframe.sub2

dataframe.sub3 = subset(dataframe.3, Students == 5)      ## Subset based on defined parameter
dataframe.sub3

dataframe.sub4 = subset(dataframe.3, Topic == "Introduction")
dataframe.sub4


## ****************************
## Sorting Dataframe
## ****************************

dataframe.3[order(dataframe.3$Students),]

dataframe.3[order(dataframe.3$Students, decreasing = TRUE),]


## ===============================================================================================
## Understanding Data Visually
## ===============================================================================================

head(input.data)

## Single Numeric Variable

##    x axis is	        Height of bar represents	      Common name
##  ==================================================================
##  Continuous	              Count	                    Histogram
##  Discrete	                Count	                    Bar graph
##  Continuous	              Value	                    Bar graph
##  Discrete	                Value	                    Bar graph


hist(input.data$Horsepower)

hist(input.data$Horsepower, main = "Horsepower Histogram", xlab = "Horsepower", ylab = "Count")

hist(input.data$Horsepower, col = "green", main = "Horsepower Histogram", xlab = "Horsepower", ylab = "Count")

## Single Numeric Variable - Price
price.colors = ifelse(input.data$Price > 25, "blue", "red")
barplot(input.data$Price, col = price.colors)


## Two Numeric Variables - Scatter plot
plot(input.data$Horsepower, input.data$Price, main = "Horsepower Vs Price", 
     xlab = "Horsepower", ylab = "Price ($)")


## *****************************************
## Using ggplot2 Package
## *****************************************

install.packages("ggplot2")
library(ggplot2)

## qplot syntax
    ## qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, 
    ##     formula=, facets=, xlim=, ylim= xlab=, ylab=, main=, sub=)

qplot(Cylinders, MPG.city, data = input.data)    ## Factor Vs Numeric

qplot(MPG.city, Price, data = input.data)        ## Numeric Vs Numeric

qplot(input.data$Cylinders)

table(input.data$Cylinders)
barplot(table(input.data$Cylinders))

## ************************************
## ggplot Histogram - x is continous
## ************************************
ggplot(input.data, aes(x = Price))       ## Created plot space

ggplot(input.data, aes(x = Price)) +     ## Added Histogram on plot space
  geom_histogram(binwidth = 2)

ggplot(input.data, aes(x = Price)) +     ## Draw Histogram with black outline and white fill
  geom_histogram(binwidth = 2, colour = "black", fill = "white")

ggplot(input.data, aes(x = Price)) +     ## Draw Density Curve
  geom_density()

ggplot(input.data, aes(x = Price)) +                    ## Overlay Histogram with Density Curve
  geom_histogram(aes(y=..density..),binwidth = 2, colour = "black", fill = "white") +     ## Use Density instead of Count on y-axis
  geom_density(alpha=.2, fill = "#FF6666")


## ************************************
## ggplot Barplot - x is Discrete
## ************************************
ggplot(input.data, aes(x = Type, y=Price)) +     ## Simple bar chart
  geom_bar()                                     ## Errors because it is not able to identify x-axis values as Factor

ggplot(input.data, aes(x = Type, y=Price)) +     ## Simple bar chart
  geom_bar(stat = "identity")                    ## Added stat = "identity"

ggplot(input.data, aes(x = Type, y=Price, fill = Type)) +     ## Simple bar chart
  geom_bar(stat = "identity", colour = "black")                    ## Added stat = "identity"

ggplot(input.data, aes(x = Type, y=Price, fill = Type)) +     
  geom_bar(stat = "identity", colour = "black")         +     
  guides(fill = FALSE)                                        ## Removed Legend (Redundant Information)

gg1 = ggplot(input.data, aes(x = Type, fill = Type)) +     
  geom_bar(stat = "count", colour = "black")         +     
  guides(fill = FALSE)                                        ## stat = "count" : If you need Count of each Type

gg1


## ************************************
## ggplot: Line Graphs
## ************************************

gg2 = ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +       ## Simple Line Graph
  geom_line()

ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +       ## Add Points
  geom_line() +
  geom_point()

gg2+ geom_point()

ggplot(input.data, aes(x = Horsepower, y = MPG.city, colour = Cylinders)) +       ## Finer details: Added Cylinders
  geom_line() +
  geom_point()




## ************************************
## ggplot: Box Plots
## ************************************

ggplot(input.data, aes(x = Cylinders, y = MPG.city)) +       ## Simple Box Plot
  geom_boxplot()

ggplot(input.data, aes(x = Cylinders, y = MPG.city, fill = Cylinders)) +       ## Coloured Box Plot
  geom_boxplot()

ggplot(input.data, aes(x = Cylinders, y = MPG.city, fill = Cylinders)) +       ## Coloured Box Plot without Legend
  geom_boxplot() +
  guides(fill = FALSE)

ggplot(input.data, aes(x = Cylinders, y = MPG.city, fill = Cylinders)) +       ## Coloured Box Plot with Flipped Coordinates
  geom_boxplot() +
  guides(fill = FALSE) +
  coord_flip()


## ************************************
## ggplot: Scatter Plots
## ************************************

ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +       ## Simple Scatter Plot
  geom_point()

ggplot(input.data, aes(x = Horsepower, y = MPG.city, colour = Cylinders)) +       ## Simple Scatter Plot
  geom_point()

## ************************************
## ggplot: Adding Titles
## ************************************

gg2 = ggplot(input.data, aes(x = Horsepower, y = MPG.city, colour = Cylinders)) +       ## Simple Scatter Plot
  geom_point() +
  ggtitle("Horsepower Vs MPG.city")  +                                            ## Add Title
  theme(plot.title = element_text(lineheight = 0.8, face = "bold"))               ## Set text size and bold face

gg2

## ************************************
## ggplot: Facet_grid and Facet_wrap
## ************************************

ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +       
  geom_point() +
  facet_grid(Cylinders ~ .)                                                       ##  Separates by Cylinders Horizontally


ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +       
  geom_point() +
  facet_grid(. ~ Cylinders)                                                       ##  Separates by Cylinders Vertically

ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +       
  geom_point() +
  facet_grid(Cylinders ~ Type)                                                       ##  Separates by Cylinders and Type

ggplot(input.data, aes(x = Horsepower, y = MPG.city)) +                           ## Facet_wrap: Arrange in 3 columns
  geom_point() +
  facet_wrap( ~ Cylinders, ncol = 3)




## **************
##  Plotly: Interactive Graphs
## **************

install.packages("plotly")
library(plotly)

ggplotly(gg1)

ggplotly(gg2)


## Volcano

data("volcano")

class(volcano)

dim(volcano)

str(volcano)

head(volcano)


plot_ly(z=volcano, type = "surface")



## *********************
## Area-Chart
## *********************
# For the weatherAUS dataset.
install.packages("rattle")
library(rattle)

# To generate a density plot.

cities = c("Canberra", "Darwin", "Melbourne", "Sydney")
ds = subset(weatherAUS, Location %in% cities & ! is.na(Temp3pm))
p  = ggplot(ds, aes(Temp3pm, colour=Location, fill=Location))
p  = p + geom_density(alpha=0.55)
p

## Make it Interactive!!
ggplotly(p)


## *********************
## Geographical Maps
## *********************

us_map = map_data("state")
head(us_map,3)

ggplot(subset(us_map, region %in% c("ohio", "indiana", "kentucky")),
       aes(x = long,
           y = lat,
           fill = region)) +
  geom_polygon()



countries_map = map_data("world")
head(countries_map)
gg.map = ggplot(subset(countries_map, region %in% c("India","Sri Lanka", "Bangladesh", "Nepal")),
       aes(x = long,
           y = lat,
           fill = region)) +
      geom_polygon()

ggplotly(gg.map)

