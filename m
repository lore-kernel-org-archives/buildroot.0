From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 21:18:05 +0100
Subject: [Buildroot] [git commit] configs/telit_evk_pro3: bump barebox to
	2017.01.0
Message-ID: <20170306201810.62B17822A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bafe9bc093d5d3140a298a2983a1cc52207d1e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump fix the build failure with gcc5 for barebox.

Some changes were made to the first patch to align to the latest
barebox api.

Also done the following changes:
- Use "BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES" instead of patching
  the barebox sources.
- Use "BR2_GLOBAL_PATCH_DIR" instead of
  "BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR".

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch | 26 -----------
 board/telit/evk-pro3/barebox.fragment              |  2 +
 .../0001-watchdog-add-keep-alive-support.patch}    | 53 +++++++++++++---------
 ...2-watchdog-add-at91sam9-watchdog-support.patch} | 39 ++++++++++------
 ...003-at91sam9260-9g20-add-wathdog-support.patch} | 30 ++++++------
 ...004-at91sam9260-9g20-fix-wathdog-support.patch} | 10 ++--
 configs/telit_evk_pro3_defconfig                   |  7 ++-
 7 files changed, 81 insertions(+), 86 deletions(-)

diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch b/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
deleted file mode 100644
index 837e8c6..0000000
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
diff --git a/board/telit/evk-pro3/barebox.fragment b/board/telit/evk-pro3/barebox.fragment
new file mode 100644
index 0000000..750ad19
--- /dev/null
+++ b/board/telit/evk-pro3/barebox.fragment
@@ -0,0 +1,2 @@
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_AT91SAM9X=y
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch b/board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch
similarity index 60%
rename from board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
rename to board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch
index 1551546..80bd459 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
+++ b/board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch
@@ -1,19 +1,20 @@
-From b5e57a9f158a293b1151638336478af8a5aad0f0 Mon Sep 17 00:00:00 2001
+From 76e2b190803484db033153fe8a97b381a567ed25 Mon Sep 17 00:00:00 2001
 From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Date: Wed, 14 Nov 2012 19:16:35 +0800
-Subject: [PATCH 1/5] watchdog: add keep alive support
+Subject: [PATCH 1/4] watchdog: add keep alive support
 
 this will allow to ping the watchdog via poller
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 ---
  drivers/watchdog/Kconfig   |  1 +
- drivers/watchdog/wd_core.c | 21 +++++++++++++++++++++
+ drivers/watchdog/wd_core.c | 25 +++++++++++++++++++++++++
  include/watchdog.h         |  2 ++
- 3 files changed, 24 insertions(+)
+ 3 files changed, 28 insertions(+)
 
 diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
-index 2e2900c..0b4dc84 100644
+index 63fb1a8c5..7ebff89b9 100644
 --- a/drivers/watchdog/Kconfig
 +++ b/drivers/watchdog/Kconfig
 @@ -4,6 +4,7 @@ config WATCHDOG_IMX_RESET_SOURCE
@@ -25,23 +26,29 @@ index 2e2900c..0b4dc84 100644
  	  Many platforms support a watchdog to keep track of a working machine.
  	  This framework provides routines to handle these watchdogs.
 diff --git a/drivers/watchdog/wd_core.c b/drivers/watchdog/wd_core.c
-index 3d0cfc6..a1b9e28 100644
+index 3a3f51964..52537afef 100644
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
  
+@@ -31,6 +32,20 @@ static const char *watchdog_name(struct watchdog *wd)
+ 	return "unknown";
+ }
+ 
++static struct watchdog *watchdog_get_default(void);
++
 +static void watchdog_poller_func(struct poller_struct *poller)
 +{
-+	watchdog->keep_alive(watchdog);
++	struct watchdog *wd = watchdog_get_default();
++
++	if (wd)
++                wd->keep_alive(wd);
 +}
 +
 +static struct poller_struct watchdog_poller = {
@@ -50,17 +57,17 @@ index 3d0cfc6..a1b9e28 100644
 +
  int watchdog_register(struct watchdog *wd)
  {
- 	if (watchdog != NULL)
- 		return -EBUSY;
+ 	if (!wd->priority)
+@@ -41,6 +56,16 @@ int watchdog_register(struct watchdog *wd)
+ 	pr_debug("registering watchdog %s with priority %d\n", watchdog_name(wd),
+ 			wd->priority);
  
- 	watchdog = wd;
 +
-+	if (watchdog->keep_alive) {
++	if (wd->keep_alive) {
 +		int ret;
 +
 +		ret = poller_register(&watchdog_poller);
 +		if (ret) {
-+			watchdog = NULL;
 +			return ret;
 +		}
 +	}
@@ -69,20 +76,24 @@ index 3d0cfc6..a1b9e28 100644
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
+2.12.0
 
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch b/board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch
similarity index 89%
rename from board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
rename to board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch
index 1ca8769..b97c126 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
+++ b/board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch
@@ -1,25 +1,26 @@
-From e1d54ffb987c346c45c20968be34c50c62a91c07 Mon Sep 17 00:00:00 2001
+From 24d99ffc4b22e45721e74bfc10717cc5bacdbfc4 Mon Sep 17 00:00:00 2001
 From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Date: Wed, 14 Nov 2012 19:17:47 +0800
-Subject: [PATCH 2/5] watchdog: add at91sam9 watchdog support
+Subject: [PATCH 2/4] watchdog: add at91sam9 watchdog support
 
 with keep alive support
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
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
  
@@ -30,21 +31,29 @@ index 0b4dc84..98a21d7 100644
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
@@ -181,7 +190,7 @@ index 0000000..203d83a
 +coredevice_initcall(at91sam9_wdt_init);
 diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
 new file mode 100644
-index 0000000..2b68c1a
+index 000000000..2b68c1a2a
 --- /dev/null
 +++ b/drivers/watchdog/at91sam9_wdt.h
 @@ -0,0 +1,38 @@
@@ -224,5 +233,5 @@ index 0000000..2b68c1a
 +
 +#endif
 -- 
-1.8.1.4
+2.12.0
 
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch b/board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch
similarity index 62%
rename from board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
rename to board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch
index bf97200..6f4efab 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
+++ b/board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch
@@ -1,30 +1,22 @@
-From 3338bcb05479f1149420d4a0ea3904cb9e42eef5 Mon Sep 17 00:00:00 2001
+From 60110b93a5cbc6ec3d92035d9daf86a30a7fd791 Mon Sep 17 00:00:00 2001
 From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 Date: Wed, 14 Nov 2012 19:18:22 +0800
-Subject: [PATCH 3/5] at91sam9260/9g20: add wathdog support
+Subject: [PATCH 3/4] at91sam9260/9g20: add wathdog support
 
 Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
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
@@ -35,6 +27,10 @@ index 1c375ee..5885f91 100644
 +}
 +coredevice_initcall(at91_add_device_watchdog);
 +#endif
++
+ static int at91_fixup_device(void)
+ {
+ 	at91_rtt_irq_fixup(IOMEM(AT91SAM9260_BASE_RTT));
 -- 
-1.8.1.4
+2.12.0
 
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch b/board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch
similarity index 75%
rename from board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
rename to board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch
index cdfd026..edc1ea4 100644
--- a/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
+++ b/board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch
@@ -1,7 +1,7 @@
-From e03bf0e3ad24898019b89eb9a6935d159c60268f Mon Sep 17 00:00:00 2001
+From d8231b1726a020733d87c2685ec1631403e050cf Mon Sep 17 00:00:00 2001
 From: Fabio Porcedda <fabio.porcedda@gmail.com>
 Date: Thu, 17 Jan 2013 11:32:35 +0100
-Subject: [PATCH 4/5] at91sam9260/9g20: fix wathdog support
+Subject: [PATCH 4/4] at91sam9260/9g20: fix wathdog support
 
 Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
 ---
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
+2.12.0
 
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
index 946c2f0..d2fd7d5 100644
--- a/configs/telit_evk_pro3_defconfig
+++ b/configs/telit_evk_pro3_defconfig
@@ -2,6 +2,9 @@
 BR2_arm=y
 BR2_arm926t=y
 
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/telit/evk-pro3/patches"
+
 # Linux headers same as kernel, a 3.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
@@ -15,9 +18,9 @@ BR2_TARGET_ROOTFS_UBI=y
 # Bootloader
 BR2_TARGET_BAREBOX=y
 BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
-BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2013.04.0"
-BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/telit/evk-pro3"
+BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2017.01.0"
 BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="telit_evk_pro3"
+BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES="board/telit/evk-pro3/barebox.fragment"
 
 # Kernel
 BR2_LINUX_KERNEL=y
