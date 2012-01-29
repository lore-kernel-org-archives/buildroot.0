From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Sun, 29 Jan 2012 22:31:47 +0100
Subject: [Buildroot] [PATCH v2] configs: at91sam926* use latest u-boot and
	mainline linux
Message-ID: <1327872707-11682-1-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While upgrading the configs, it proved necessary to make more space on
the dataflash for u-boot since it grew because of relocation.

dataflash is then repartitionned to make more room for u-boot and a redundant
environment.

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 .../at91bootstrap-1.16-u-boot-relocation-fix.patch |  299 ++++++++++++++++++++
 ...011.12-change-kernel-address-in-dataflash.patch |  181 ++++++++++++
 configs/at91sam9260dfc_defconfig                   |   10 +-
 configs/at91sam9261ek_defconfig                    |   11 +-
 configs/at91sam9263ek_defconfig                    |   11 +-
 5 files changed, 492 insertions(+), 20 deletions(-)
 create mode 100644 boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
 create mode 100644 boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch

diff --git a/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch b/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
new file mode 100644
index 0000000..884519c
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap-1.16-u-boot-relocation-fix.patch
@@ -0,0 +1,299 @@
+Every AT91SAM plaforms were broken between 2010.12 and 2011.03 because
+of the relocation changes.
+
+We have to get JUMP_ADDR consistant with what is used by u-boot
+(CONFIG_SYS_TEXT_BASE).
+
+I didn't know what to do with at91sam9m10g45ek as it doesn't seems to be
+converted yet. But anyway, that means that it is either not working or
+doesn't care so changing it here shouldn't harm.
+
+I also chose to "repartition" the dataflash. u-boot is now living at
+0x4000, letting 16kB for the bootstrap. We also have to increase the
+IMG_SIZE as u-boot as grown larger than the default value.
+As requested on the u-boot ML, we assume that it could be up to 512kB
+big.
+
+It means that now, you have to flash your kernel at 0x0008C000 instead
+of 0x00042000. And so you also have to load it from that adress from
+u-boot.
+
+Then, remember that you could decrease IMG_SIZE to boot faster.
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
+---
+ board/at91sam9260ek/dataflash/at91sam9260ek.h      |    6 +++---
+ board/at91sam9260ek/nandflash/at91sam9260ek.h      |    2 +-
+ board/at91sam9261ek/dataflash/at91sam9261ek.h      |    6 +++---
+ board/at91sam9261ek/nandflash/at91sam9261ek.h      |    2 +-
+ board/at91sam9263ek/dataflash/at91sam9263ek.h      |    6 +++---
+ board/at91sam9263ek/nandflash/at91sam9263ek.h      |    2 +-
+ board/at91sam9g10ek/dataflash/at91sam9g10ek.h      |    6 +++---
+ board/at91sam9g10ek/nandflash/at91sam9g10ek.h      |    2 +-
+ board/at91sam9g20ek/dataflash/at91sam9g20ek.h      |    6 +++---
+ board/at91sam9g20ek/nandflash/at91sam9g20ek.h      |    2 +-
+ board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h  |    4 ++--
+ .../at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h  |    4 ++--
+ board/at91sam9rlek/dataflash/at91sam9rlek.h        |    6 +++---
+ board/at91sam9rlek/nandflash/at91sam9rlek.h        |    2 +-
+ board/at91sam9xeek/dataflash/at91sam9xeek.h        |    6 +++---
+ board/at91sam9xeek/nandflash/at91sam9xeek.h        |    2 +-
+ 16 files changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/board/at91sam9260ek/dataflash/at91sam9260ek.h b/board/at91sam9260ek/dataflash/at91sam9260ek.h
+index 1834246..5c52bc6 100644
+--- a/board/at91sam9260ek/dataflash/at91sam9260ek.h
++++ b/board/at91sam9260ek/dataflash/at91sam9260ek.h
+@@ -73,11 +73,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
+ 
+ #define MACH_TYPE       0x44B       /* AT91SAM9260-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9260ek/nandflash/at91sam9260ek.h b/board/at91sam9260ek/nandflash/at91sam9260ek.h
+index 2cac601..f8fdff2 100644
+--- a/board/at91sam9260ek/nandflash/at91sam9260ek.h
++++ b/board/at91sam9260ek/nandflash/at91sam9260ek.h
+@@ -92,7 +92,7 @@
+ #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
+ 
+ #define MACH_TYPE       	0x44B		/* AT91SAM9260-EK */
+-#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9261ek/dataflash/at91sam9261ek.h b/board/at91sam9261ek/dataflash/at91sam9261ek.h
+index 8ce30e9..675f80b 100644
+--- a/board/at91sam9261ek/dataflash/at91sam9261ek.h
++++ b/board/at91sam9261ek/dataflash/at91sam9261ek.h
+@@ -96,11 +96,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
+ 
+ #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9261ek/nandflash/at91sam9261ek.h b/board/at91sam9261ek/nandflash/at91sam9261ek.h
+index badc3ac..e628c97 100644
+--- a/board/at91sam9261ek/nandflash/at91sam9261ek.h
++++ b/board/at91sam9261ek/nandflash/at91sam9261ek.h
+@@ -114,7 +114,7 @@
+ #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
+ 
+ #define MACH_TYPE       	0x350		/* AT91SAM9261-EK */
+-#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9263ek/dataflash/at91sam9263ek.h b/board/at91sam9263ek/dataflash/at91sam9263ek.h
+index 5c9da4b..d07b5d1 100644
+--- a/board/at91sam9263ek/dataflash/at91sam9263ek.h
++++ b/board/at91sam9263ek/dataflash/at91sam9263ek.h
+@@ -95,11 +95,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 			0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE			0x33900			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 			0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE			0x80000			/* Image Size in DataFlash    */
+ 
+ #define MACH_TYPE       		0x4B2       		/* AT91SAM9263-EK */
+-#define JUMP_ADDR			0x23F00000		/* Final Jump Address 	      */
++#define JUMP_ADDR			0x21F00000		/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9263ek/nandflash/at91sam9263ek.h b/board/at91sam9263ek/nandflash/at91sam9263ek.h
+index 505afc7..8ab4f46 100644
+--- a/board/at91sam9263ek/nandflash/at91sam9263ek.h
++++ b/board/at91sam9263ek/nandflash/at91sam9263ek.h
+@@ -108,7 +108,7 @@
+ #define	IMG_SIZE	0x40000		/* Image Size in NandFlash    */
+ 
+ #define MACH_TYPE       1202       	/* AT91SAM9263-EK */
+-#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
++#define JUMP_ADDR	0x21F00000	/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
+index b2faf44..0882644 100644
+--- a/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
++++ b/board/at91sam9g10ek/dataflash/at91sam9g10ek.h
+@@ -97,11 +97,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
+ 
+ #define MACH_TYPE       0x350       /* AT91SAM9261-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9g10ek/nandflash/at91sam9g10ek.h b/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
+index 66c40a3..6c3ecda 100644
+--- a/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
++++ b/board/at91sam9g10ek/nandflash/at91sam9g10ek.h
+@@ -115,7 +115,7 @@
+ #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
+ 
+ #define MACH_TYPE       	0x350		/* AT91SAM9G10-EK */
+-#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
+index eea0439..44bd578 100644
+--- a/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
++++ b/board/at91sam9g20ek/dataflash/at91sam9g20ek.h
+@@ -74,11 +74,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
+ 
+ #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9g20ek/nandflash/at91sam9g20ek.h b/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
+index 31bd499..e797e4d 100644
+--- a/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
++++ b/board/at91sam9g20ek/nandflash/at91sam9g20ek.h
+@@ -93,7 +93,7 @@
+ #define	IMG_SIZE		0x40000			/* Image Size in NandFlash */
+ 
+ #define MACH_TYPE		0x658			/* AT91SAM9G20-EK */
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
+index a60fd41..144dd6d 100644
+--- a/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
++++ b/board/at91sam9m10ekes/dataflash/at91sam9m10ekes.h
+@@ -88,8 +88,8 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
+ 
+ #define MACH_TYPE		0x9CD			/* AT91SAM9M10-EKES */
+ #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
+diff --git a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
+index 5c726b5..3152b79 100644
+--- a/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
++++ b/board/at91sam9m10g45ek/dataflash/at91sam9m10g45ek.h
+@@ -84,8 +84,8 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash */
+ 
+ #define MACH_TYPE		0x726			/* AT91SAM9M10G45-EK */
+ #define JUMP_ADDR		0x73F00000		/* Final Jump Address */
+diff --git a/board/at91sam9rlek/dataflash/at91sam9rlek.h b/board/at91sam9rlek/dataflash/at91sam9rlek.h
+index 05c42dc..be277b6 100644
+--- a/board/at91sam9rlek/dataflash/at91sam9rlek.h
++++ b/board/at91sam9rlek/dataflash/at91sam9rlek.h
+@@ -88,11 +88,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS0_DATAFLASH	/* Boot on SPI NCS0 */
+ 
+-#define IMG_ADDRESS 	0x8400		/* Image Address in DataFlash */
+-#define	IMG_SIZE	0x33900		/* Image Size in DataFlash    */
++#define IMG_ADDRESS 	0x4000		/* Image Address in DataFlash */
++#define	IMG_SIZE	0x80000		/* Image Size in DataFlash    */
+ 
+ #define MACH_TYPE       1326       	/* AT91SAM9RL-EK */
+-#define JUMP_ADDR	0x23F00000	/* Final Jump Address 	      */
++#define JUMP_ADDR	0x21F00000	/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9rlek/nandflash/at91sam9rlek.h b/board/at91sam9rlek/nandflash/at91sam9rlek.h
+index 656b4ba..594db8f 100644
+--- a/board/at91sam9rlek/nandflash/at91sam9rlek.h
++++ b/board/at91sam9rlek/nandflash/at91sam9rlek.h
+@@ -112,7 +112,7 @@
+ #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
+ 
+ #define MACH_TYPE       1326       		/* AT91SAM9RL-EK */
+-#define JUMP_ADDR		0x23F00000	/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000	/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9xeek/dataflash/at91sam9xeek.h b/board/at91sam9xeek/dataflash/at91sam9xeek.h
+index 27d1822..e3172da 100644
+--- a/board/at91sam9xeek/dataflash/at91sam9xeek.h
++++ b/board/at91sam9xeek/dataflash/at91sam9xeek.h
+@@ -73,11 +73,11 @@
+ /* ******************************************************************* */
+ #define AT91C_SPI_PCS_DATAFLASH		AT91C_SPI_PCS1_DATAFLASH	/* Boot on SPI NCS1 */
+ 
+-#define IMG_ADDRESS 		0x8400			/* Image Address in DataFlash */
+-#define	IMG_SIZE		0x33900			/* Image Size in DataFlash    */
++#define IMG_ADDRESS 		0x4000			/* Image Address in DataFlash */
++#define	IMG_SIZE		0x80000			/* Image Size in DataFlash    */
+ 
+ #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+diff --git a/board/at91sam9xeek/nandflash/at91sam9xeek.h b/board/at91sam9xeek/nandflash/at91sam9xeek.h
+index 5dbc63e..9fac7cb 100644
+--- a/board/at91sam9xeek/nandflash/at91sam9xeek.h
++++ b/board/at91sam9xeek/nandflash/at91sam9xeek.h
+@@ -94,7 +94,7 @@
+ #define	IMG_SIZE		0x40000		/* Image Size in NandFlash    */
+ 
+ #define MACH_TYPE		0x44B			/* AT91SAM9XE-EK same id as AT91SAM9260-EK*/
+-#define JUMP_ADDR		0x23F00000		/* Final Jump Address 	      */
++#define JUMP_ADDR		0x21F00000		/* Final Jump Address 	      */
+ 
+ /* ******************************************************************* */
+ /* Application Settings                                                */
+-- 
+1.7.5.4
+
diff --git a/boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch
new file mode 100644
index 0000000..4cdbb98
--- /dev/null
+++ b/boot/uboot/uboot-v2011.12-change-kernel-address-in-dataflash.patch
@@ -0,0 +1,181 @@
+From 9fc4787c7a6c797db649831f86e49c4bf9780b4e Mon Sep 17 00:00:00 2001
+From: Alexandre Belloni <alexandre.belloni@piout.net>
+Date: Mon, 2 Jan 2012 03:51:11 +0100
+Subject: [PATCH] Change kernel address in dataflash to match u-boot's size
+
+On at91sam platforms, u-boot grew larger than the allocated size in
+dataflash, the layout was:
+bootstrap  0x00000000
+ubootenv   0x00004200
+uboot      0x00008400
+kernel     0x00042000
+
+u-boot with the defconfig doesn't seem to fit in 0x42000 - 0x8400 =
+0x39C00 bytes anymore.
+
+Now, the layout is:
+bootstrap  0x00000000
+uboot      0x00004000
+ubootenv   0x00084000
+ubootenv2  0x00088000
+kernel     0x0008C000
+
+Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
+---
+ include/configs/at91sam9260ek.h |   18 ++++++++++++------
+ include/configs/at91sam9261ek.h |   18 ++++++++++++------
+ include/configs/at91sam9263ek.h |   10 +++++++---
+ include/configs/at91sam9rlek.h  |   10 +++++++---
+ 4 files changed, 38 insertions(+), 18 deletions(-)
+
+diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
+index db52ee6..b537760 100644
+--- a/include/configs/at91sam9260ek.h
++++ b/include/configs/at91sam9260ek.h
+@@ -185,10 +185,12 @@
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+ #define CONFIG_ENV_IS_IN_DATAFLASH	1
+ #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
+-#define CONFIG_ENV_OFFSET		0x4200
++#define CONFIG_ENV_OFFSET		0x84000
+ #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SIZE		0x4000
++#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
+ 				"root=/dev/mtdblock0 "			\
+ 				"mtdparts=atmel_nand:-(root) "		\
+@@ -199,10 +201,12 @@
+ /* bootstrap + u-boot + env + linux in dataflash on CS1 */
+ #define CONFIG_ENV_IS_IN_DATAFLASH	1
+ #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + 0x8400)
+-#define CONFIG_ENV_OFFSET		0x4200
++#define CONFIG_ENV_OFFSET		0x84000
+ #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SIZE		0x4000
++#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
++#define CONFIG_BOOTCOMMAND	"cp.b 0xD008C000 0x22000000 0x210000; bootm"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
+ 				"root=/dev/mtdblock0 "			\
+ 				"mtdparts=atmel_nand:-(root) "		\
+@@ -231,6 +235,8 @@
+ #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
+ #define CONFIG_SYS_LONGHELP		1
+ #define CONFIG_CMDLINE_EDITING	1
++#define CONFIG_AUTO_COMPLETE
++#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
+ 
+ /*
+  * Size of malloc() pool
+diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
+index 5140b26..fa461da 100644
+--- a/include/configs/at91sam9261ek.h
++++ b/include/configs/at91sam9261ek.h
+@@ -187,10 +187,12 @@
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+ #define CONFIG_ENV_IS_IN_DATAFLASH
+ #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
+-#define CONFIG_ENV_OFFSET	0x4200
++#define CONFIG_ENV_OFFSET	0x84000
+ #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SIZE		0x4000
++#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
+ 				"root=/dev/mtdblock0 "			\
+ 				"mtdparts=atmel_nand:-(root) "		\
+@@ -201,10 +203,12 @@
+ /* bootstrap + u-boot + env + linux in dataflash on CS3 */
+ #define CONFIG_ENV_IS_IN_DATAFLASH
+ #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + 0x8400)
+-#define CONFIG_ENV_OFFSET	0x4200
++#define CONFIG_ENV_OFFSET	0x84000
+ #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SIZE		0x4000
++#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
++#define CONFIG_BOOTCOMMAND	"cp.b 0xD008C000 0x22000000 0x210000; bootm"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
+ 				"root=/dev/mtdblock0 "			\
+ 				"mtdparts=atmel_nand:-(root) "		\
+@@ -233,6 +237,8 @@
+ #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
+ #define CONFIG_SYS_LONGHELP
+ #define CONFIG_CMDLINE_EDITING
++#define CONFIG_AUTO_COMPLETE
++#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
+ 
+ /*
+  * Size of malloc() pool
+diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
+index 8399246..253bee4 100644
+--- a/include/configs/at91sam9263ek.h
++++ b/include/configs/at91sam9263ek.h
+@@ -314,10 +314,12 @@
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+ #define CONFIG_ENV_IS_IN_DATAFLASH	1
+ #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
+-#define CONFIG_ENV_OFFSET		0x4200
++#define CONFIG_ENV_OFFSET		0x84000
+ #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SIZE		0x4000
++#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+ 				"root=/dev/mtdblock0 " \
+ 				"mtdparts=atmel_nand:-(root) "\
+@@ -347,6 +349,8 @@
+ #define CONFIG_AUTO_COMPLETE
+ #define CONFIG_SYS_HUSH_PARSER
+ #define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
++#define CONFIG_AUTO_COMPLETE
++#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
+ 
+ /*
+  * Size of malloc() pool
+diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
+index 79ea1f2..423f523 100644
+--- a/include/configs/at91sam9rlek.h
++++ b/include/configs/at91sam9rlek.h
+@@ -153,10 +153,12 @@
+ /* bootstrap + u-boot + env + linux in dataflash on CS0 */
+ #define CONFIG_ENV_IS_IN_DATAFLASH	1
+ #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
+-#define CONFIG_ENV_OFFSET		0x4200
++#define CONFIG_ENV_OFFSET		0x84000
+ #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
+-#define CONFIG_ENV_SIZE		0x4200
+-#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
++#define CONFIG_ENV_SIZE		0x4000
++#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
+ #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
+ 				"root=/dev/mtdblock0 " \
+ 				"mtdparts=atmel_nand:-(root) "\
+@@ -183,6 +185,8 @@
+ #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
+ #define CONFIG_SYS_LONGHELP		1
+ #define CONFIG_CMDLINE_EDITING		1
++#define CONFIG_AUTO_COMPLETE
++#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
+ 
+ /*
+  * Size of malloc() pool
+-- 
+1.7.5.4
+
diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 13748d3..de7ac42 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -1,21 +1,19 @@
 # Architecture
 BR2_arm=y
+BR2_arm926t=y
 
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASHCARD=y
+BR2_TARGET_AT91BOOTSTRAP_DATAFLASH=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9260ek"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9260ek_dataflash_cs0"
+BR2_TARGET_UBOOT_2011_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.33"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.33-at91.patch.gz"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260ek"
 
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index cea28cb..73edd89 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -5,20 +5,17 @@ BR2_arm926t=y
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9261ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASHCARD=y
+BR2_TARGET_AT91BOOTSTRAP_DATAFLASH=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9261ek"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9261ek_dataflash_cs0"
+BR2_TARGET_UBOOT_2011_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.33"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.33-at91.patch.gz"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261ek"
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261"
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 1a79482..ca2117a 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -5,20 +5,17 @@ BR2_arm926t=y
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9263ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASHCARD=y
+BR2_TARGET_AT91BOOTSTRAP_DATAFLASH=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9263ek"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9263ek_dataflash_cs0"
+BR2_TARGET_UBOOT_2011_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.33"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.33-at91.patch.gz"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263ek"
+BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263"
 
 # Filesystem
 BR2_TARGET_ROOTFS_TAR=y
\ No newline at end of file
-- 
1.7.5.4
