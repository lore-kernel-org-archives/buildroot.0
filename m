From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed,  1 Mar 2017 17:23:45 +0100
Subject: [Buildroot] [PATCH] configs/telit_evk_pro3: bump barebox to
	2017.01.0
Message-ID: <20170301162345.22300-1-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fix the build failure with gcc5 for barebox.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch | 26 ---------
 ...1.0-0001-watchdog-add-keep-alive-support.patch} | 36 +++++++------
 ...2-watchdog-add-at91sam9-watchdog-support.patch} | 36 ++++++++-----
 ...003-at91sam9260-9g20-add-wathdog-support.patch} | 27 ++++------
 ...004-at91sam9260-9g20-fix-wathdog-support.patch} |  8 +--
 ...17.01.0-0005-watchdog-enable-for-evk-pro3.patch | 61 ++++++++++++++++++++++
 configs/telit_evk_pro3_defconfig                   |  2 +-
 7 files changed, 120 insertions(+), 76 deletions(-)
 delete mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
 rename board/telit/evk-pro3/{barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch => barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch} (73%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch => barebox-2017.01.0-0002-watchdog-add-at91sam9-watchdog-support.patch} (90%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch => barebox-2017.01.0-0003-at91sam9260-9g20-add-wathdog-support.patch} (67%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch => barebox-2017.01.0-0004-at91sam9260-9g20-fix-wathdog-support.patch} (81%)
 create mode 100644 board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch

diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch b/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
deleted file mode 100644
index 837e8c632..000000000
--- a/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 98c96ea36a4b3bb9b92dde849db5e8d6918b5168 Mon Sep 17 00:00:00 2001
-From: Fabio Porcedda <fabio.porcedda@gmail.com>
-Date: Thu, 17 Jan 2013 11:32:59 +0100
-Subject: [PATCH 5/5] watchdog: enable for evk-pro3
-
-Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
----
- arch/arm/configs/telit_evk_pro3_defconfig | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/arch/arm/configs/telit_evk_pro3_defconfig b/arch/arm/configs/telit_evk_pro3_defconfig
-index 050d176..436cecf 100644
---- a/arch/arm/configs/telit_evk_pro3_defconfig
-+++ b/arch/arm/configs/telit_evk_pro3_defconfig
-@@ -68,6 +68,8 @@ CONFIG_MCI_ATMEL=y
- CONFIG_LED=y
- CONFIG_LED_GPIO=y
- CONFIG_LED_TRIGGERS=y
-+CONFIG_WATCHDOG=y
-+CONFIG_WATCHDOG_AT91SAM9X=y
- CONFIG_FS_TFTP=y
- CONFIG_FS_FAT=y
- CONFIG_FS_FAT_LFN=y
--- 
-1.8.1.4
-
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch b/board/telit/evk-pro3/barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch
similarity index 73%
rename from board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
rename to board/telit/evk-pro3/barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch
index 155154603..4465298f5 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
+++ b/board/telit/evk-pro3/barebox-2017.01.0-0001-watchdog-add-keep-alive-support.patch
@@ -1,4 +1,4 @@
-From b5e57a9f158a293b1151638336478af8a5aad0f0 Mon Sep 17 00:00:00 2001
+From 1ae2a27187d1123ff9daca60f86810d6b3a25943 Mon Sep 17 00:00:00 2001
 From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Date: Wed, 14 Nov 2012 19:16:35 +0800
 Subject: [PATCH 1/5] watchdog: add keep alive support
@@ -13,7 +13,7 @@ Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  3 files changed, 24 insertions(+)
 
 diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
-index 2e2900c..0b4dc84 100644
+index 63fb1a8c5..7ebff89b9 100644
 --- a/drivers/watchdog/Kconfig
 +++ b/drivers/watchdog/Kconfig
 @@ -4,6 +4,7 @@ config WATCHDOG_IMX_RESET_SOURCE
@@ -25,19 +25,20 @@ index 2e2900c..0b4dc84 100644
  	  Many platforms support a watchdog to keep track of a working machine.
  	  This framework provides routines to handle these watchdogs.
 diff --git a/drivers/watchdog/wd_core.c b/drivers/watchdog/wd_core.c
-index 3d0cfc6..a1b9e28 100644
+index 3a3f51964..38251ee96 100644
 --- a/drivers/watchdog/wd_core.c
 +++ b/drivers/watchdog/wd_core.c
-@@ -17,18 +17,39 @@
+@@ -18,6 +18,7 @@
  #include <errno.h>
  #include <linux/ctype.h>
  #include <watchdog.h>
 +#include <poller.h>
  
- /*
-  * Note: this simple framework supports one watchdog only.
-  */
- static struct watchdog *watchdog;
+ static LIST_HEAD(watchdog_list);
+ 
+@@ -31,6 +32,15 @@ static const char *watchdog_name(struct watchdog *wd)
+ 	return "unknown";
+ }
  
 +static void watchdog_poller_func(struct poller_struct *poller)
 +{
@@ -50,10 +51,11 @@ index 3d0cfc6..a1b9e28 100644
 +
  int watchdog_register(struct watchdog *wd)
  {
- 	if (watchdog != NULL)
- 		return -EBUSY;
+ 	if (!wd->priority)
+@@ -41,6 +51,17 @@ int watchdog_register(struct watchdog *wd)
+ 	pr_debug("registering watchdog %s with priority %d\n", watchdog_name(wd),
+ 			wd->priority);
  
- 	watchdog = wd;
 +
 +	if (watchdog->keep_alive) {
 +		int ret;
@@ -69,20 +71,24 @@ index 3d0cfc6..a1b9e28 100644
  }
  EXPORT_SYMBOL(watchdog_register);
 diff --git a/include/watchdog.h b/include/watchdog.h
-index 3e2d08e..d5ecf2f 100644
+index 3e8a487a4..a2660c2e0 100644
 --- a/include/watchdog.h
 +++ b/include/watchdog.h
-@@ -13,8 +13,10 @@
+@@ -13,12 +13,14 @@
  #ifndef INCLUDE_WATCHDOG_H
  # define INCLUDE_WATCHDOG_H
  
 +
  struct watchdog {
  	int (*set_timeout)(struct watchdog *, unsigned);
+ 	const char *name;
+ 	struct device_d *dev;
+ 	unsigned int priority;
+ 	struct list_head list;
 +	void (*keep_alive)(struct watchdog *);
  };
  
- int watchdog_register(struct watchdog *);
+ #ifdef CONFIG_WATCHDOG
 -- 
-1.8.1.4
+2.11.1
 
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch b/board/telit/evk-pro3/barebox-2017.01.0-0002-watchdog-add-at91sam9-watchdog-support.patch
similarity index 90%
rename from board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
rename to board/telit/evk-pro3/barebox-2017.01.0-0002-watchdog-add-at91sam9-watchdog-support.patch
index 1ca87695a..67638e779 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
+++ b/board/telit/evk-pro3/barebox-2017.01.0-0002-watchdog-add-at91sam9-watchdog-support.patch
@@ -1,4 +1,4 @@
-From e1d54ffb987c346c45c20968be34c50c62a91c07 Mon Sep 17 00:00:00 2001
+From d3ea7b4124e912e645ea174f9103c74af9331c1d Mon Sep 17 00:00:00 2001
 From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Date: Wed, 14 Nov 2012 19:17:47 +0800
 Subject: [PATCH 2/5] watchdog: add at91sam9 watchdog support
@@ -7,19 +7,19 @@ with keep alive support
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 ---
- drivers/watchdog/Kconfig        |   7 +++
+ drivers/watchdog/Kconfig        |   8 +++
  drivers/watchdog/Makefile       |   1 +
  drivers/watchdog/at91sam9_wdt.c | 131 ++++++++++++++++++++++++++++++++++++++++
  drivers/watchdog/at91sam9_wdt.h |  38 ++++++++++++
- 4 files changed, 177 insertions(+)
+ 4 files changed, 178 insertions(+)
  create mode 100644 drivers/watchdog/at91sam9_wdt.c
  create mode 100644 drivers/watchdog/at91sam9_wdt.h
 
 diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
-index 0b4dc84..98a21d7 100644
+index 7ebff89b9..479e737f0 100644
 --- a/drivers/watchdog/Kconfig
 +++ b/drivers/watchdog/Kconfig
-@@ -11,6 +11,13 @@ menuconfig WATCHDOG
+@@ -11,12 +11,20 @@ menuconfig WATCHDOG
  
  if WATCHDOG
  
@@ -30,21 +30,29 @@ index 0b4dc84..98a21d7 100644
 +	  Watchdog timer embedded into AT91SAM9X and AT91CAP9 chips. This will
 +	  reboot your system when the timeout is reached.
 +
- config WATCHDOG_MXS28
- 	bool "i.MX28"
- 	depends on ARCH_IMX28
+ config WATCHDOG_DAVINCI
+ 	bool "TI Davinci"
+ 	depends on ARCH_DAVINCI
+ 	help
+ 	  Add support for watchdog on the TI Davinci SoC.
+ 
++
+ config WATCHDOG_DW
+ 	bool "Synopsys DesignWare watchdog"
+ 	select RESET_CONTROLLER
 diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
-index f522b88..3d15d52 100644
+index 5fca4c368..245a5c84a 100644
 --- a/drivers/watchdog/Makefile
 +++ b/drivers/watchdog/Makefile
-@@ -1,3 +1,4 @@
+@@ -1,4 +1,5 @@
  obj-$(CONFIG_WATCHDOG) += wd_core.o
 +obj-$(CONFIG_WATCHDOG_AT91SAM9X) += at91sam9_wdt.o
+ obj-$(CONFIG_WATCHDOG_DAVINCI) += davinci_wdt.o
+ obj-$(CONFIG_WATCHDOG_OMAP) += omap_wdt.o
  obj-$(CONFIG_WATCHDOG_MXS28) += im28wd.o
- obj-$(CONFIG_WATCHDOG_IMX_RESET_SOURCE) += imxwd.o
 diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
 new file mode 100644
-index 0000000..203d83a
+index 000000000..203d83aff
 --- /dev/null
 +++ b/drivers/watchdog/at91sam9_wdt.c
 @@ -0,0 +1,131 @@
@@ -181,7 +189,7 @@ index 0000000..203d83a
 +coredevice_initcall(at91sam9_wdt_init);
 diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
 new file mode 100644
-index 0000000..2b68c1a
+index 000000000..2b68c1a2a
 --- /dev/null
 +++ b/drivers/watchdog/at91sam9_wdt.h
 @@ -0,0 +1,38 @@
@@ -224,5 +232,5 @@ index 0000000..2b68c1a
 +
 +#endif
 -- 
-1.8.1.4
+2.11.1
 
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch b/board/telit/evk-pro3/barebox-2017.01.0-0003-at91sam9260-9g20-add-wathdog-support.patch
similarity index 67%
rename from board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
rename to board/telit/evk-pro3/barebox-2017.01.0-0003-at91sam9260-9g20-add-wathdog-support.patch
index bf9720030..84902fb35 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
+++ b/board/telit/evk-pro3/barebox-2017.01.0-0003-at91sam9260-9g20-add-wathdog-support.patch
@@ -1,30 +1,21 @@
-From 3338bcb05479f1149420d4a0ea3904cb9e42eef5 Mon Sep 17 00:00:00 2001
+From b533ae77a4104b50a9b524261859618d9bf29daf Mon Sep 17 00:00:00 2001
 From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Date: Wed, 14 Nov 2012 19:18:22 +0800
 Subject: [PATCH 3/5] at91sam9260/9g20: add wathdog support
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 ---
- arch/arm/mach-at91/at91sam9260_devices.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
+ arch/arm/mach-at91/at91sam9260_devices.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
 
 diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
-index 1c375ee..5885f91 100644
+index 67c4ea860..51852a9a8 100644
 --- a/arch/arm/mach-at91/at91sam9260_devices.c
 +++ b/arch/arm/mach-at91/at91sam9260_devices.c
-@@ -10,6 +10,7 @@
-  *
-  */
- #include <common.h>
-+#include <init.h>
- #include <sizes.h>
- #include <asm/armlinux.h>
- #include <asm/hardware.h>
-@@ -397,3 +398,14 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data)
- #else
+@@ -400,6 +400,17 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data)
  void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
  #endif
-+
+ 
 +#ifdef CONFIG_WATCHDOG_AT91SAM9X
 +static int at91_add_device_watchdog(void)
 +{
@@ -35,6 +26,10 @@ index 1c375ee..5885f91 100644
 +}
 +coredevice_initcall(at91_add_device_watchdog);
 +#endif
++
+ static int at91_fixup_device(void)
+ {
+ 	at91_rtt_irq_fixup(IOMEM(AT91SAM9260_BASE_RTT));
 -- 
-1.8.1.4
+2.11.1
 
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch b/board/telit/evk-pro3/barebox-2017.01.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
similarity index 81%
rename from board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
rename to board/telit/evk-pro3/barebox-2017.01.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
index cdfd026ad..66bfc9695 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
+++ b/board/telit/evk-pro3/barebox-2017.01.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
@@ -1,4 +1,4 @@
-From e03bf0e3ad24898019b89eb9a6935d159c60268f Mon Sep 17 00:00:00 2001
+From 68f5eabd08c49889f5b2decd5943dd02e824f318 Mon Sep 17 00:00:00 2001
 From: Fabio Porcedda <fabio.porcedda@gmail.com>
 Date: Thu, 17 Jan 2013 11:32:35 +0100
 Subject: [PATCH 4/5] at91sam9260/9g20: fix wathdog support
@@ -9,10 +9,10 @@ Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
-index 5885f91..df675d2 100644
+index 51852a9a8..20c8cac9d 100644
 --- a/arch/arm/mach-at91/at91sam9260_devices.c
 +++ b/arch/arm/mach-at91/at91sam9260_devices.c
-@@ -403,7 +403,7 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
+@@ -404,7 +404,7 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
  static int at91_add_device_watchdog(void)
  {
  	add_generic_device("at91sam9_wdt", DEVICE_ID_SINGLE, NULL,
@@ -22,5 +22,5 @@ index 5885f91..df675d2 100644
  	return 0;
  }
 -- 
-1.8.1.4
+2.11.1
 
diff --git a/board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch b/board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch
new file mode 100644
index 000000000..6735e3887
--- /dev/null
+++ b/board/telit/evk-pro3/barebox-2017.01.0-0005-watchdog-enable-for-evk-pro3.patch
@@ -0,0 +1,61 @@
+From 705a6b6add1dd60a862c3a677eac4efeefb3bd0b Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Thu, 17 Jan 2013 11:32:59 +0100
+Subject: [PATCH 5/5] watchdog: enable for evk-pro3
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ arch/arm/configs/telit_evk_pro3_defconfig |  2 ++
+ drivers/watchdog/wd_core.c                | 10 +++++++---
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/configs/telit_evk_pro3_defconfig b/arch/arm/configs/telit_evk_pro3_defconfig
+index 3bf5968bf..7a47fb951 100644
+--- a/arch/arm/configs/telit_evk_pro3_defconfig
++++ b/arch/arm/configs/telit_evk_pro3_defconfig
+@@ -64,6 +64,8 @@ CONFIG_MCI_ATMEL=y
+ CONFIG_LED=y
+ CONFIG_LED_GPIO=y
+ CONFIG_LED_TRIGGERS=y
++CONFIG_WATCHDOG=y
++CONFIG_WATCHDOG_AT91SAM9X=y
+ CONFIG_FS_TFTP=y
+ CONFIG_FS_FAT=y
+ CONFIG_FS_FAT_LFN=y
+diff --git a/drivers/watchdog/wd_core.c b/drivers/watchdog/wd_core.c
+index 38251ee96..52537afef 100644
+--- a/drivers/watchdog/wd_core.c
++++ b/drivers/watchdog/wd_core.c
+@@ -32,9 +32,14 @@ static const char *watchdog_name(struct watchdog *wd)
+ 	return "unknown";
+ }
+ 
++static struct watchdog *watchdog_get_default(void);
++
+ static void watchdog_poller_func(struct poller_struct *poller)
+ {
+-	watchdog->keep_alive(watchdog);
++	struct watchdog *wd = watchdog_get_default();
++
++	if (wd)
++                wd->keep_alive(wd);
+ }
+ 
+ static struct poller_struct watchdog_poller = {
+@@ -52,12 +57,11 @@ int watchdog_register(struct watchdog *wd)
+ 			wd->priority);
+ 
+ 
+-	if (watchdog->keep_alive) {
++	if (wd->keep_alive) {
+ 		int ret;
+ 
+ 		ret = poller_register(&watchdog_poller);
+ 		if (ret) {
+-			watchdog = NULL;
+ 			return ret;
+ 		}
+ 	}
+-- 
+2.11.1
+
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
index 946c2f04a..84aeba30a 100644
--- a/configs/telit_evk_pro3_defconfig
+++ b/configs/telit_evk_pro3_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_ROOTFS_UBI=y
 # Bootloader
 BR2_TARGET_BAREBOX=y
 BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
-BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2013.04.0"
+BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2017.01.0"
 BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/telit/evk-pro3"
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="telit_evk_pro3"
 
-- 
2.11.1
