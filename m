From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 18:00:26 +0200
Subject: [Buildroot] [git commit] u-boot: remove stale patches and bump to
	2013.07
Message-ID: <20130731160445.9C0C49AF61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5adb0f46a26099dbbbf4d9904d391962f5de8f85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in                               |    4 +-
 ...011.12-change-kernel-address-in-dataflash.patch |  195 --------------------
 ...012.04-change-kernel-address-in-dataflash.patch |  195 --------------------
 3 files changed, 2 insertions(+), 392 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2e37856..1b98339 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2013.04"
+	bool "2013.07"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
        bool "Custom version"
@@ -46,7 +46,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2013.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2013.07"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
diff --git a/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
deleted file mode 100644
index c7d9a7e..0000000
--- a/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From e139cb31d32a4f39241bfd83bf622a97d08f6c9d Mon Sep 17 00:00:00 2001
-From: Alexandre Belloni <alexandre.belloni@piout.net>
-Date: Mon, 2 Jul 2012 04:26:58 +0000
-Subject: [PATCH] AT91SAM9*: Change kernel address in dataflash to
- match u-boot's size
-
-
-On at91sam platforms, u-boot grew larger than the allocated size in
-dataflash, the layout was:
-bootstrap  0x00000000
-ubootenv   0x00004200
-uboot      0x00008400
-kernel     0x00042000
-fs         0x00252000
-
-u-boot with the defconfig doesn't seem to fit in 0x42000 - 0x8400 =
-0x39C00 bytes anymore.
-
-Now, the layout is:
-bootstrap  0x00000000
-ubootenv   0x00004200
-uboot      0x00008400
-kernel     0x00084000
-fs         0x00294000
-
-Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
-Signed-off-by: Andreas Bie??mann <andreas.devel@googlemail.com>
----
- board/atmel/at91sam9260ek/partition.c |    6 +++---
- board/atmel/at91sam9261ek/partition.c |    6 +++---
- board/atmel/at91sam9263ek/partition.c |    6 +++---
- board/atmel/at91sam9rlek/partition.c  |    6 +++---
- include/configs/at91sam9260ek.h       |    5 +++--
- include/configs/at91sam9261ek.h       |    5 +++--
- include/configs/at91sam9263ek.h       |    2 +-
- include/configs/at91sam9rlek.h        |    3 ++-
- 8 files changed, 21 insertions(+), 18 deletions(-)
-
-diff --git a/board/atmel/at91sam9260ek/partition.c b/board/atmel/at91sam9260ek/partition.c
-index 2629c67..9ec054f 100644
---- a/board/atmel/at91sam9260ek/partition.c
-+++ b/board/atmel/at91sam9260ek/partition.c
-@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/board/atmel/at91sam9261ek/partition.c b/board/atmel/at91sam9261ek/partition.c
-index c739b11..51cac77 100644
---- a/board/atmel/at91sam9261ek/partition.c
-+++ b/board/atmel/at91sam9261ek/partition.c
-@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/board/atmel/at91sam9263ek/partition.c b/board/atmel/at91sam9263ek/partition.c
-index 7e1d46f..d48fab7 100644
---- a/board/atmel/at91sam9263ek/partition.c
-+++ b/board/atmel/at91sam9263ek/partition.c
-@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/board/atmel/at91sam9rlek/partition.c b/board/atmel/at91sam9rlek/partition.c
-index 7e1d46f..d48fab7 100644
---- a/board/atmel/at91sam9rlek/partition.c
-+++ b/board/atmel/at91sam9rlek/partition.c
-@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
-index 07b1968..ef25fa5 100644
---- a/include/configs/at91sam9260ek.h
-+++ b/include/configs/at91sam9260ek.h
-@@ -187,7 +187,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -201,7 +201,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -230,6 +230,7 @@
- #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
- #define CONFIG_SYS_LONGHELP		1
- #define CONFIG_CMDLINE_EDITING	1
-+#define CONFIG_AUTO_COMPLETE
- 
- /*
-  * Size of malloc() pool
-diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
-index 6fd0b83..014437b 100644
---- a/include/configs/at91sam9261ek.h
-+++ b/include/configs/at91sam9261ek.h
-@@ -189,7 +189,7 @@
- #define CONFIG_ENV_OFFSET	0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -203,7 +203,7 @@
- #define CONFIG_ENV_OFFSET	0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -232,6 +232,7 @@
- #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
- #define CONFIG_SYS_LONGHELP
- #define CONFIG_CMDLINE_EDITING
-+#define CONFIG_AUTO_COMPLETE
- 
- /*
-  * Size of malloc() pool
-diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
-index f2163f1..4309f71 100644
---- a/include/configs/at91sam9263ek.h
-+++ b/include/configs/at91sam9263ek.h
-@@ -318,7 +318,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
- 				"root=/dev/mtdblock0 " \
- 				"mtdparts=atmel_nand:-(root) "\
-diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
-index 45f8baf..c5952e9 100644
---- a/include/configs/at91sam9rlek.h
-+++ b/include/configs/at91sam9rlek.h
-@@ -155,7 +155,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
- 				"root=/dev/mtdblock0 " \
- 				"mtdparts=atmel_nand:-(root) "\
-@@ -182,6 +182,7 @@
- #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
- #define CONFIG_SYS_LONGHELP		1
- #define CONFIG_CMDLINE_EDITING		1
-+#define CONFIG_AUTO_COMPLETE
- 
- /*
-  * Size of malloc() pool
--- 
-1.7.9.5
-
diff --git a/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
deleted file mode 100644
index c7d9a7e..0000000
--- a/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From e139cb31d32a4f39241bfd83bf622a97d08f6c9d Mon Sep 17 00:00:00 2001
-From: Alexandre Belloni <alexandre.belloni@piout.net>
-Date: Mon, 2 Jul 2012 04:26:58 +0000
-Subject: [PATCH] AT91SAM9*: Change kernel address in dataflash to
- match u-boot's size
-
-
-On at91sam platforms, u-boot grew larger than the allocated size in
-dataflash, the layout was:
-bootstrap  0x00000000
-ubootenv   0x00004200
-uboot      0x00008400
-kernel     0x00042000
-fs         0x00252000
-
-u-boot with the defconfig doesn't seem to fit in 0x42000 - 0x8400 =
-0x39C00 bytes anymore.
-
-Now, the layout is:
-bootstrap  0x00000000
-ubootenv   0x00004200
-uboot      0x00008400
-kernel     0x00084000
-fs         0x00294000
-
-Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
-Signed-off-by: Andreas Bie??mann <andreas.devel@googlemail.com>
----
- board/atmel/at91sam9260ek/partition.c |    6 +++---
- board/atmel/at91sam9261ek/partition.c |    6 +++---
- board/atmel/at91sam9263ek/partition.c |    6 +++---
- board/atmel/at91sam9rlek/partition.c  |    6 +++---
- include/configs/at91sam9260ek.h       |    5 +++--
- include/configs/at91sam9261ek.h       |    5 +++--
- include/configs/at91sam9263ek.h       |    2 +-
- include/configs/at91sam9rlek.h        |    3 ++-
- 8 files changed, 21 insertions(+), 18 deletions(-)
-
-diff --git a/board/atmel/at91sam9260ek/partition.c b/board/atmel/at91sam9260ek/partition.c
-index 2629c67..9ec054f 100644
---- a/board/atmel/at91sam9260ek/partition.c
-+++ b/board/atmel/at91sam9260ek/partition.c
-@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/board/atmel/at91sam9261ek/partition.c b/board/atmel/at91sam9261ek/partition.c
-index c739b11..51cac77 100644
---- a/board/atmel/at91sam9261ek/partition.c
-+++ b/board/atmel/at91sam9261ek/partition.c
-@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/board/atmel/at91sam9263ek/partition.c b/board/atmel/at91sam9263ek/partition.c
-index 7e1d46f..d48fab7 100644
---- a/board/atmel/at91sam9263ek/partition.c
-+++ b/board/atmel/at91sam9263ek/partition.c
-@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/board/atmel/at91sam9rlek/partition.c b/board/atmel/at91sam9rlek/partition.c
-index 7e1d46f..d48fab7 100644
---- a/board/atmel/at91sam9rlek/partition.c
-+++ b/board/atmel/at91sam9rlek/partition.c
-@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
- dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
- 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
- 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
--	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
--	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
--	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
-+	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
-+	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
-+	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
- };
-diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
-index 07b1968..ef25fa5 100644
---- a/include/configs/at91sam9260ek.h
-+++ b/include/configs/at91sam9260ek.h
-@@ -187,7 +187,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -201,7 +201,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -230,6 +230,7 @@
- #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
- #define CONFIG_SYS_LONGHELP		1
- #define CONFIG_CMDLINE_EDITING	1
-+#define CONFIG_AUTO_COMPLETE
- 
- /*
-  * Size of malloc() pool
-diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
-index 6fd0b83..014437b 100644
---- a/include/configs/at91sam9261ek.h
-+++ b/include/configs/at91sam9261ek.h
-@@ -189,7 +189,7 @@
- #define CONFIG_ENV_OFFSET	0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -203,7 +203,7 @@
- #define CONFIG_ENV_OFFSET	0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
- 				"root=/dev/mtdblock0 "			\
- 				"mtdparts=atmel_nand:-(root) "		\
-@@ -232,6 +232,7 @@
- #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
- #define CONFIG_SYS_LONGHELP
- #define CONFIG_CMDLINE_EDITING
-+#define CONFIG_AUTO_COMPLETE
- 
- /*
-  * Size of malloc() pool
-diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
-index f2163f1..4309f71 100644
---- a/include/configs/at91sam9263ek.h
-+++ b/include/configs/at91sam9263ek.h
-@@ -318,7 +318,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
- 				"root=/dev/mtdblock0 " \
- 				"mtdparts=atmel_nand:-(root) "\
-diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
-index 45f8baf..c5952e9 100644
---- a/include/configs/at91sam9rlek.h
-+++ b/include/configs/at91sam9rlek.h
-@@ -155,7 +155,7 @@
- #define CONFIG_ENV_OFFSET		0x4200
- #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
- #define CONFIG_ENV_SIZE		0x4200
--#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
- #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
- 				"root=/dev/mtdblock0 " \
- 				"mtdparts=atmel_nand:-(root) "\
-@@ -182,6 +182,7 @@
- #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
- #define CONFIG_SYS_LONGHELP		1
- #define CONFIG_CMDLINE_EDITING		1
-+#define CONFIG_AUTO_COMPLETE
- 
- /*
-  * Size of malloc() pool
--- 
-1.7.9.5
-
