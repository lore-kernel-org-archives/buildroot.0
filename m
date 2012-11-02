From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 21:27:18 +0100
Subject: [Buildroot] [git commit] u-boot: update at91 patches to match
	mainline
Message-ID: <20121102231434.7C00E999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1504a791ce8bc6222d7d604295550e2fcbef8a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch that was included in buildroot was not the same as the final
one submitted in the mainline.

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...011.12-change-kernel-address-in-dataflash.patch |  210 +++++++++++---------
 ...012.04-change-kernel-address-in-dataflash.patch |  210 +++++++++++---------
 2 files changed, 224 insertions(+), 196 deletions(-)

diff --git a/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
index 4cdbb98..c7d9a7e 100644
--- a/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
+++ b/boot/uboot/uboot-2011.12/uboot-2011.12-change-kernel-address-in-dataflash.patch
@@ -1,7 +1,9 @@
-From 9fc4787c7a6c797db649831f86e49c4bf9780b4e Mon Sep 17 00:00:00 2001
+From e139cb31d32a4f39241bfd83bf622a97d08f6c9d Mon Sep 17 00:00:00 2001
 From: Alexandre Belloni <alexandre.belloni@piout.net>
-Date: Mon, 2 Jan 2012 03:51:11 +0100
-Subject: [PATCH] Change kernel address in dataflash to match u-boot's size
+Date: Mon, 2 Jul 2012 04:26:58 +0000
+Subject: [PATCH] AT91SAM9*: Change kernel address in dataflash to
+ match u-boot's size
+
 
 On at91sam platforms, u-boot grew larger than the allocated size in
 dataflash, the layout was:
@@ -9,173 +11,185 @@ bootstrap  0x00000000
 ubootenv   0x00004200
 uboot      0x00008400
 kernel     0x00042000
+fs         0x00252000
 
 u-boot with the defconfig doesn't seem to fit in 0x42000 - 0x8400 =
 0x39C00 bytes anymore.
 
 Now, the layout is:
 bootstrap  0x00000000
-uboot      0x00004000
-ubootenv   0x00084000
-ubootenv2  0x00088000
-kernel     0x0008C000
+ubootenv   0x00004200
+uboot      0x00008400
+kernel     0x00084000
+fs         0x00294000
 
 Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
+Signed-off-by: Andreas Bie??mann <andreas.devel@googlemail.com>
 ---
- include/configs/at91sam9260ek.h |   18 ++++++++++++------
- include/configs/at91sam9261ek.h |   18 ++++++++++++------
- include/configs/at91sam9263ek.h |   10 +++++++---
- include/configs/at91sam9rlek.h  |   10 +++++++---
- 4 files changed, 38 insertions(+), 18 deletions(-)
+ board/atmel/at91sam9260ek/partition.c |    6 +++---
+ board/atmel/at91sam9261ek/partition.c |    6 +++---
+ board/atmel/at91sam9263ek/partition.c |    6 +++---
+ board/atmel/at91sam9rlek/partition.c  |    6 +++---
+ include/configs/at91sam9260ek.h       |    5 +++--
+ include/configs/at91sam9261ek.h       |    5 +++--
+ include/configs/at91sam9263ek.h       |    2 +-
+ include/configs/at91sam9rlek.h        |    3 ++-
+ 8 files changed, 21 insertions(+), 18 deletions(-)
 
+diff --git a/board/atmel/at91sam9260ek/partition.c b/board/atmel/at91sam9260ek/partition.c
+index 2629c67..9ec054f 100644
+--- a/board/atmel/at91sam9260ek/partition.c
++++ b/board/atmel/at91sam9260ek/partition.c
+@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
+diff --git a/board/atmel/at91sam9261ek/partition.c b/board/atmel/at91sam9261ek/partition.c
+index c739b11..51cac77 100644
+--- a/board/atmel/at91sam9261ek/partition.c
++++ b/board/atmel/at91sam9261ek/partition.c
+@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
+diff --git a/board/atmel/at91sam9263ek/partition.c b/board/atmel/at91sam9263ek/partition.c
+index 7e1d46f..d48fab7 100644
+--- a/board/atmel/at91sam9263ek/partition.c
++++ b/board/atmel/at91sam9263ek/partition.c
+@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
+diff --git a/board/atmel/at91sam9rlek/partition.c b/board/atmel/at91sam9rlek/partition.c
+index 7e1d46f..d48fab7 100644
+--- a/board/atmel/at91sam9rlek/partition.c
++++ b/board/atmel/at91sam9rlek/partition.c
+@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
 diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
-index db52ee6..b537760 100644
+index 07b1968..ef25fa5 100644
 --- a/include/configs/at91sam9260ek.h
 +++ b/include/configs/at91sam9260ek.h
-@@ -185,10 +185,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -187,7 +187,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -199,10 +201,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS1 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -201,7 +201,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -231,6 +235,8 @@
+@@ -230,6 +230,7 @@
  #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
  #define CONFIG_SYS_LONGHELP		1
  #define CONFIG_CMDLINE_EDITING	1
 +#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
  
  /*
   * Size of malloc() pool
 diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
-index 5140b26..fa461da 100644
+index 6fd0b83..014437b 100644
 --- a/include/configs/at91sam9261ek.h
 +++ b/include/configs/at91sam9261ek.h
-@@ -187,10 +187,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET	0x4200
-+#define CONFIG_ENV_OFFSET	0x84000
+@@ -189,7 +189,7 @@
+ #define CONFIG_ENV_OFFSET	0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -201,10 +203,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS3 */
- #define CONFIG_ENV_IS_IN_DATAFLASH
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + 0x8400)
--#define CONFIG_ENV_OFFSET	0x4200
-+#define CONFIG_ENV_OFFSET	0x84000
+@@ -203,7 +203,7 @@
+ #define CONFIG_ENV_OFFSET	0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -233,6 +237,8 @@
+@@ -232,6 +232,7 @@
  #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
  #define CONFIG_SYS_LONGHELP
  #define CONFIG_CMDLINE_EDITING
 +#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
  
  /*
   * Size of malloc() pool
 diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
-index 8399246..253bee4 100644
+index f2163f1..4309f71 100644
 --- a/include/configs/at91sam9263ek.h
 +++ b/include/configs/at91sam9263ek.h
-@@ -314,10 +314,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -318,7 +318,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
  				"root=/dev/mtdblock0 " \
  				"mtdparts=atmel_nand:-(root) "\
-@@ -347,6 +349,8 @@
- #define CONFIG_AUTO_COMPLETE
- #define CONFIG_SYS_HUSH_PARSER
- #define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
-+#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
- 
- /*
-  * Size of malloc() pool
 diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
-index 79ea1f2..423f523 100644
+index 45f8baf..c5952e9 100644
 --- a/include/configs/at91sam9rlek.h
 +++ b/include/configs/at91sam9rlek.h
-@@ -153,10 +153,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -155,7 +155,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
  				"root=/dev/mtdblock0 " \
  				"mtdparts=atmel_nand:-(root) "\
-@@ -183,6 +185,8 @@
+@@ -182,6 +182,7 @@
  #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
  #define CONFIG_SYS_LONGHELP		1
  #define CONFIG_CMDLINE_EDITING		1
 +#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
  
  /*
   * Size of malloc() pool
 -- 
-1.7.5.4
+1.7.9.5
 
diff --git a/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch b/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
index 4cdbb98..c7d9a7e 100644
--- a/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
+++ b/boot/uboot/uboot-2012.04.01/uboot-2012.04-change-kernel-address-in-dataflash.patch
@@ -1,7 +1,9 @@
-From 9fc4787c7a6c797db649831f86e49c4bf9780b4e Mon Sep 17 00:00:00 2001
+From e139cb31d32a4f39241bfd83bf622a97d08f6c9d Mon Sep 17 00:00:00 2001
 From: Alexandre Belloni <alexandre.belloni@piout.net>
-Date: Mon, 2 Jan 2012 03:51:11 +0100
-Subject: [PATCH] Change kernel address in dataflash to match u-boot's size
+Date: Mon, 2 Jul 2012 04:26:58 +0000
+Subject: [PATCH] AT91SAM9*: Change kernel address in dataflash to
+ match u-boot's size
+
 
 On at91sam platforms, u-boot grew larger than the allocated size in
 dataflash, the layout was:
@@ -9,173 +11,185 @@ bootstrap  0x00000000
 ubootenv   0x00004200
 uboot      0x00008400
 kernel     0x00042000
+fs         0x00252000
 
 u-boot with the defconfig doesn't seem to fit in 0x42000 - 0x8400 =
 0x39C00 bytes anymore.
 
 Now, the layout is:
 bootstrap  0x00000000
-uboot      0x00004000
-ubootenv   0x00084000
-ubootenv2  0x00088000
-kernel     0x0008C000
+ubootenv   0x00004200
+uboot      0x00008400
+kernel     0x00084000
+fs         0x00294000
 
 Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
+Signed-off-by: Andreas Bie??mann <andreas.devel@googlemail.com>
 ---
- include/configs/at91sam9260ek.h |   18 ++++++++++++------
- include/configs/at91sam9261ek.h |   18 ++++++++++++------
- include/configs/at91sam9263ek.h |   10 +++++++---
- include/configs/at91sam9rlek.h  |   10 +++++++---
- 4 files changed, 38 insertions(+), 18 deletions(-)
+ board/atmel/at91sam9260ek/partition.c |    6 +++---
+ board/atmel/at91sam9261ek/partition.c |    6 +++---
+ board/atmel/at91sam9263ek/partition.c |    6 +++---
+ board/atmel/at91sam9rlek/partition.c  |    6 +++---
+ include/configs/at91sam9260ek.h       |    5 +++--
+ include/configs/at91sam9261ek.h       |    5 +++--
+ include/configs/at91sam9263ek.h       |    2 +-
+ include/configs/at91sam9rlek.h        |    3 ++-
+ 8 files changed, 21 insertions(+), 18 deletions(-)
 
+diff --git a/board/atmel/at91sam9260ek/partition.c b/board/atmel/at91sam9260ek/partition.c
+index 2629c67..9ec054f 100644
+--- a/board/atmel/at91sam9260ek/partition.c
++++ b/board/atmel/at91sam9260ek/partition.c
+@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
+diff --git a/board/atmel/at91sam9261ek/partition.c b/board/atmel/at91sam9261ek/partition.c
+index c739b11..51cac77 100644
+--- a/board/atmel/at91sam9261ek/partition.c
++++ b/board/atmel/at91sam9261ek/partition.c
+@@ -34,7 +34,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
+diff --git a/board/atmel/at91sam9263ek/partition.c b/board/atmel/at91sam9263ek/partition.c
+index 7e1d46f..d48fab7 100644
+--- a/board/atmel/at91sam9263ek/partition.c
++++ b/board/atmel/at91sam9263ek/partition.c
+@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
+diff --git a/board/atmel/at91sam9rlek/partition.c b/board/atmel/at91sam9rlek/partition.c
+index 7e1d46f..d48fab7 100644
+--- a/board/atmel/at91sam9rlek/partition.c
++++ b/board/atmel/at91sam9rlek/partition.c
+@@ -33,7 +33,7 @@ struct dataflash_addr cs[CONFIG_SYS_MAX_DATAFLASH_BANKS] = {
+ dataflash_protect_t area_list[NB_DATAFLASH_AREA] = {
+ 	{0x00000000, 0x000041FF, FLAG_PROTECT_SET,   0, "Bootstrap"},
+ 	{0x00004200, 0x000083FF, FLAG_PROTECT_CLEAR, 0, "Environment"},
+-	{0x00008400, 0x00041FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
+-	{0x00042000, 0x00251FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
+-	{0x00252000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
++	{0x00008400, 0x00083FFF, FLAG_PROTECT_SET,   0, "U-Boot"},
++	{0x00084000, 0x00293FFF, FLAG_PROTECT_CLEAR, 0,	"Kernel"},
++	{0x00294000, 0xFFFFFFFF, FLAG_PROTECT_CLEAR, 0,	"FS"},
+ };
 diff --git a/include/configs/at91sam9260ek.h b/include/configs/at91sam9260ek.h
-index db52ee6..b537760 100644
+index 07b1968..ef25fa5 100644
 --- a/include/configs/at91sam9260ek.h
 +++ b/include/configs/at91sam9260ek.h
-@@ -185,10 +185,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -187,7 +187,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -199,10 +201,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS1 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -201,7 +201,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS1 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -231,6 +235,8 @@
+@@ -230,6 +230,7 @@
  #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
  #define CONFIG_SYS_LONGHELP		1
  #define CONFIG_CMDLINE_EDITING	1
 +#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
  
  /*
   * Size of malloc() pool
 diff --git a/include/configs/at91sam9261ek.h b/include/configs/at91sam9261ek.h
-index 5140b26..fa461da 100644
+index 6fd0b83..014437b 100644
 --- a/include/configs/at91sam9261ek.h
 +++ b/include/configs/at91sam9261ek.h
-@@ -187,10 +187,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET	0x4200
-+#define CONFIG_ENV_OFFSET	0x84000
+@@ -189,7 +189,7 @@
+ #define CONFIG_ENV_OFFSET	0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -201,10 +203,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS3 */
- #define CONFIG_ENV_IS_IN_DATAFLASH
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + 0x8400)
--#define CONFIG_ENV_OFFSET	0x4200
-+#define CONFIG_ENV_OFFSET	0x84000
+@@ -203,7 +203,7 @@
+ #define CONFIG_ENV_OFFSET	0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS3 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xD0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xD008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xD0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 "			\
  				"root=/dev/mtdblock0 "			\
  				"mtdparts=atmel_nand:-(root) "		\
-@@ -233,6 +237,8 @@
+@@ -232,6 +232,7 @@
  #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
  #define CONFIG_SYS_LONGHELP
  #define CONFIG_CMDLINE_EDITING
 +#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
  
  /*
   * Size of malloc() pool
 diff --git a/include/configs/at91sam9263ek.h b/include/configs/at91sam9263ek.h
-index 8399246..253bee4 100644
+index f2163f1..4309f71 100644
 --- a/include/configs/at91sam9263ek.h
 +++ b/include/configs/at91sam9263ek.h
-@@ -314,10 +314,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -318,7 +318,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
  				"root=/dev/mtdblock0 " \
  				"mtdparts=atmel_nand:-(root) "\
-@@ -347,6 +349,8 @@
- #define CONFIG_AUTO_COMPLETE
- #define CONFIG_SYS_HUSH_PARSER
- #define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
-+#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
- 
- /*
-  * Size of malloc() pool
 diff --git a/include/configs/at91sam9rlek.h b/include/configs/at91sam9rlek.h
-index 79ea1f2..423f523 100644
+index 45f8baf..c5952e9 100644
 --- a/include/configs/at91sam9rlek.h
 +++ b/include/configs/at91sam9rlek.h
-@@ -153,10 +153,12 @@
- /* bootstrap + u-boot + env + linux in dataflash on CS0 */
- #define CONFIG_ENV_IS_IN_DATAFLASH	1
- #define CONFIG_SYS_MONITOR_BASE	(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + 0x8400)
--#define CONFIG_ENV_OFFSET		0x4200
-+#define CONFIG_ENV_OFFSET		0x84000
+@@ -155,7 +155,7 @@
+ #define CONFIG_ENV_OFFSET		0x4200
  #define CONFIG_ENV_ADDR		(CONFIG_SYS_DATAFLASH_LOGIC_ADDR_CS0 + CONFIG_ENV_OFFSET)
--#define CONFIG_ENV_SIZE		0x4200
+ #define CONFIG_ENV_SIZE		0x4200
 -#define CONFIG_BOOTCOMMAND	"cp.b 0xC0042000 0x22000000 0x210000; bootm"
-+#define CONFIG_ENV_SIZE		0x4000
-+#define CONFIG_ENV_ADDR_REDUND (CONFIG_ENV_ADDR+CONFIG_ENV_SIZE)
-+#define CONFIG_ENV_SIZE_REDUND CONFIG_ENV_SIZE
-+#define CONFIG_BOOTCOMMAND	"cp.b 0xC008C000 0x22000000 0x210000; bootm"
++#define CONFIG_BOOTCOMMAND	"cp.b 0xC0084000 0x22000000 0x210000; bootm"
  #define CONFIG_BOOTARGS		"console=ttyS0,115200 " \
  				"root=/dev/mtdblock0 " \
  				"mtdparts=atmel_nand:-(root) "\
-@@ -183,6 +185,8 @@
+@@ -182,6 +182,7 @@
  #define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)
  #define CONFIG_SYS_LONGHELP		1
  #define CONFIG_CMDLINE_EDITING		1
 +#define CONFIG_AUTO_COMPLETE
-+#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
  
  /*
   * Size of malloc() pool
 -- 
-1.7.5.4
+1.7.9.5
 
