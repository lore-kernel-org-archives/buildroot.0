From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Fri, 26 Oct 2012 00:15:31 +0200
Subject: [Buildroot] [PATCH 1/3] at91bootstrap: update patch for latest
	u-boot
In-Reply-To: <1351203333-26588-1-git-send-email-alexandre.belloni@piout.net>
References: <1351203333-26588-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <1351203333-26588-2-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The u-boot patch got mainlined but not exactly as it was submitted to
buildroot. Update the at91bootstrap to match what is in the mainline.

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  127 +++++++++-----------
 1 file changed, 56 insertions(+), 71 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
index 884519c..0c9b911 100644
--- a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
+++ b/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
@@ -1,3 +1,8 @@
+From d4e4a1aad559e35d84b445d1379be94ad036984e Mon Sep 17 00:00:00 2001
+From: Alexandre Belloni <alexandre.belloni@piout.net>
+Date: Thu, 25 Oct 2012 22:57:14 +0200
+Subject: [PATCH] u-boot relocation fix
+
 Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
 of the relocation changes.
 
@@ -8,13 +13,11 @@ I didn't know what to do with at91sam9m10g45ek as it doesn't seems to be
 converted yet. But anyway, that means that it is either not working or
 doesn't care so changing it here shouldn't harm.
 
-I also chose to "repartition" the dataflash. u-boot is now living at
-0x4000, letting 16kB for the bootstrap. We also have to increase the
-IMG_SIZE as u-boot as grown larger than the default value.
-As requested on the u-boot ML, we assume that it could be up to 512kB
-big.
+We also have to increase the IMG_SIZE as u-boot as grown larger than the
+default value. As requested on the u-boot ML, we assume that it could
+be up to 495kB big.
 
-It means that now, you have to flash your kernel at 0x0008C000 instead
+It means that now, you have to flash your kernel at 0x00084000 instead
 of 0x00042000. And so you also have to load it from that adress from
 u-boot.
 
@@ -22,36 +25,34 @@ Then, remember that you could decrease IMG_SIZE to boot faster.
 
 Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
 ---
- board/at91sam9260ek/dataflash/at91sam9260ek.h      |    6 +++---
+ board/at91sam9260ek/dataflash/at91sam9260ek.h      |    4 ++--
  board/at91sam9260ek/nandflash/at91sam9260ek.h      |    2 +-
- board/at91sam9261ek/dataflash/at91sam9261ek.h      |    6 +++---
+ board/at91sam9261ek/dataflash/at91sam9261ek.h      |    4 ++--
  board/at91sam9261ek/nandflash/at91sam9261ek.h      |    2 +-
- board/at91sam9263ek/dataflash/at91sam9263ek.h      |    6 +++---
+ board/at91sam9263ek/dataflash/at91sam9263ek.h      |    4 ++--
  board/at91sam9263ek/nandflash/at91sam9263ek.h      |    2 +-
- board/at91sam9g10ek/dataflash/at91sam9g10ek.h      |    6 +++---
+ board/at91sam9g10ek/dataflash/at91sam9g10ek.h      |    4 ++--
  board/at91sam9g10ek/nandflash/at91sam9g10ek.h      |    2 +-
- board/at91sam9g20ek/dataflash/at91sam9g20ek.h      |    6 +++---
+ board/at91sam9g20ek/dataflash/at91sam9g20ek.h      |    4 ++--
  board/at91sam9g20ek/nandflash/at91sam9g20ek.h      |    2 +-
- board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h  |    4 ++--
- .../at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h  |    4 ++--
- board/at91sam9rlek/dataflash/at91sam9rlek.h        |    6 +++---
+ board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h  |    2 +-
+ .../at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h  |    2 +-
+ board/at91sam9rlek/dataflash/at91sam9rlek.h        |    4 ++--
  board/at91sam9rlek/nandflash/at91sam9rlek.h        |    2 +-
- board/at91sam9xeek/dataflash/at91sam9xeek.h        |    6 +++---
+ board/at91sam9xeek/dataflash/at91sam9xeek.h        |    4 ++--
  board/at91sam9xeek/nandflash/at91sam9xeek.h        |    2 +-
- 16 files changed, 32 insertions(+), 32 deletions(-)
+ 16 files changed, 23 insertions(+), 23 deletions(-)
 
 diff --git a/board/at91sam9260ek/dataflash/at91sam9260ek.h b/board/at91sam9260ek/dataflash/at91sam9260ek.h
-index 1834246..5c52bc6 100644
+index 1834246..91081a1 100644
 --- a/board/at91sam9260ek/dataflash/at91sam9260ek.h
 +++ b/board/at91sam9260ek/dataflash/at91sam9260ek.h
-@@ -73,11 +73,11 @@
- /* ******************************************************************* */
+@@ -74,10 +74,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
  
  #define MACH_TYPE       0x44B       /* AT91SAM9260-EK */
 -#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
@@ -73,17 +74,15 @@ index 2cac601..f8fdff2 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 diff --git a/board/at91sam9261ek/dataflash/at91sam9261ek.h b/board/at91sam9261ek/dataflash/at91sam9261ek.h
-index 8ce30e9..675f80b 100644
+index 8ce30e9..276ba3d 100644
 --- a/board/at91sam9261ek/dataflash/at91sam9261ek.h
 +++ b/board/at91sam9261ek/dataflash/at91sam9261ek.h
-@@ -96,11 +96,11 @@
- /* ******************************************************************* */
+@@ -97,10 +97,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
  
  #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
 -#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
@@ -105,17 +104,15 @@ index badc3ac..e628c97 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 diff --git a/board/at91sam9263ek/dataflash/at91sam9263ek.h b/board/at91sam9263ek/dataflash/at91sam9263ek.h
-index 5c9da4b..d07b5d1 100644
+index 5c9da4b..870f9e2 100644
 --- a/board/at91sam9263ek/dataflash/at91sam9263ek.h
 +++ b/board/at91sam9263ek/dataflash/at91sam9263ek.h
-@@ -95,11 +95,11 @@
- /* ******************************************************************* */
+@@ -96,10 +96,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 			0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 			0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE			0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 			0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE			0x80000			/* Image Size in DataFlash    */
++#define	IMG_SIZE			0x7BC00			/* Image Size in DataFlash    */
  
  #define MACH_TYPE       		0x4B2       		/* AT91SAM9263-EK */
 -#define JUMP_ADDR			0x23F00000		/* Final Jump Address 	      */
@@ -137,17 +134,15 @@ index 505afc7..8ab4f46 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 diff --git a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
-index b2faf44..0882644 100644
+index b2faf44..f4f556b 100644
 --- a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
 +++ b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
-@@ -97,11 +97,11 @@
- /* ******************************************************************* */
+@@ -98,10 +98,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
  
  #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
 -#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
@@ -169,17 +164,15 @@ index 66c40a3..6c3ecda 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 diff --git a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
-index eea0439..44bd578 100644
+index eea0439..7fc70d6 100644
 --- a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
 +++ b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
-@@ -74,11 +74,11 @@
- /* ******************************************************************* */
+@@ -75,10 +75,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash */
  
  #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
 -#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
@@ -201,47 +194,41 @@ index 31bd499..e797e4d 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 diff --git a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
-index a60fd41..144dd6d 100644
+index a60fd41..5587a00 100644
 --- a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
 +++ b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
-@@ -88,8 +88,8 @@
- /* ******************************************************************* */
+@@ -89,7 +89,7 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash */
  
  #define MACH_TYPE		0x9CD			/* AT91SAM9M10-EKES */
  #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
 diff --git a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
-index 5c726b5..3152b79 100644
+index 5c726b5..9090097 100644
 --- a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
 +++ b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
-@@ -84,8 +84,8 @@
- /* ******************************************************************* */
+@@ -85,7 +85,7 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash */
  
  #define MACH_TYPE		0x726			/* AT91SAM9M10G45-EK */
  #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
 diff --git a/board/at91sam9rlek/dataflash/at91sam9rlek.h b/board/at91sam9rlek/dataflash/at91sam9rlek.h
-index 05c42dc..be277b6 100644
+index 05c42dc..150f17e 100644
 --- a/board/at91sam9rlek/dataflash/at91sam9rlek.h
 +++ b/board/at91sam9rlek/dataflash/at91sam9rlek.h
-@@ -88,11 +88,11 @@
- /* ******************************************************************* */
+@@ -89,10 +89,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
  
--#define IMG_ADDRESS 	0x8400		/* Image Address in DataFlash */
+ #define IMG_ADDRESS 	0x8400		/* Image Address in DataFlash */
 -#define	IMG_SIZE	0x33900		/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 	0x4000		/* Image Address in DataFlash */
-+#define	IMG_SIZE	0x80000		/* Image Size in DataFlash    */
++#define	IMG_SIZE	0x7BC00		/* Image Size in DataFlash    */
  
  #define MACH_TYPE       1326       	/* AT91SAM9RL-EK */
 -#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
@@ -263,17 +250,15 @@ index 656b4ba..594db8f 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 diff --git a/board/at91sam9xeek/dataflash/at91sam9xeek.h b/board/at91sam9xeek/dataflash/at91sam9xeek.h
-index 27d1822..e3172da 100644
+index 27d1822..08e515d 100644
 --- a/board/at91sam9xeek/dataflash/at91sam9xeek.h
 +++ b/board/at91sam9xeek/dataflash/at91sam9xeek.h
-@@ -73,11 +73,11 @@
- /* ******************************************************************* */
+@@ -74,10 +74,10 @@
  #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
  
--#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+ #define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
 -#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
-+#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
-+#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
++#define	IMG_SIZE		0x7BC00			/* Image Size in DataFlash    */
  
  #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
 -#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
@@ -295,5 +280,5 @@ index 5dbc63e..9fac7cb 100644
  /* ******************************************************************* */
  /* Application Settings                                                */
 -- 
-1.7.5.4
+1.7.9.5
 
-- 
1.7.9.5
