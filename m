From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 22 Apr 2012 08:39:18 -0300
Subject: [Buildroot] [PATCH] u-boot: add 2012.04 release
Message-ID: <1335094758-10034-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in                               |    6 +-
 ...012.04-change-kernel-address-in-dataflash.patch |  181 ++++++++++++++++++++
 2 files changed, 186 insertions(+), 1 deletions(-)
 create mode 100644 boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index c8db9fb..7c5f2c6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_12
+	default BR2_TARGET_UBOOT_2012_04
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2012_04
+	bool "2012.04"
+
 config BR2_TARGET_UBOOT_2011_12
 	bool "2011.12"
 
@@ -47,6 +50,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2012.04"	if BR2_TARGET_UBOOT_2012_04
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
diff --git a/boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch
new file mode 100644
index 0000000..4cdbb98
--- /dev/null
+++ b/boot/uboot/uboot-2012.04/uboot-2012.04-change-kernel-address-in-dataflash.patch
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
-- 
1.7.3.4
