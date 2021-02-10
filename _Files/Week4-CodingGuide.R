```{r readdiet, include=FALSE}
diet <- read.dta(paste(here(),"Data/diet.dta", sep = "/"))
acts <- table(diet$act, diet$mort)
rownames(acts) <- c("Activity level 0","Activity level 1","Activity level 2","Activity level 3")
colnames(acts) <- c("Alive", "Dead")
#rownames(diet) <- c("Low-fat", "other")
```


```{r diet}
acts
epi.2by2(acts, 
         method = "cohort.count", 
         conf.level = 0.95, 
         units = 1, 
         outcome = "as.rows")
```