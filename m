From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 12 Apr 2013 11:53:36 +0200
Subject: [Buildroot] [PATCH] configs: add defconfig for Telit EVK-PRO3
Message-ID: <1365760416-8155-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For more info, please find board/telit/evk-pro3/readme.txt

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...04.0-0001-watchdog-add-keep-alive-support.patch |  88 ++++++++
 ...02-watchdog-add-at91sam9-watchdog-support.patch | 228 +++++++++++++++++++++
 ...0003-at91sam9260-9g20-add-wathdog-support.patch |  40 ++++
 ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 +++
 ...13.04.0-0005-watchdog-enable-for-evk-pro3.patch |  26 +++
 ...t91-at91_dt_defconfig-update-for-evk-pro3.patch |  44 ++++
 board/telit/evk-pro3/readme.txt                    |  28 +++
 configs/telit_evk_pro3_defconfig                   |  15 ++
 8 files changed, 495 insertions(+)
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
 create mode 100644 board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
 create mode 100644 board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
 create mode 100644 board/telit/evk-pro3/readme.txt
 create mode 100644 configs/telit_evk_pro3_defconfig

diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch b/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
new file mode 100644
index 0000000..1551546
--- /dev/null
+++ b/board/telit/evk-pro3/barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch
@@ -0,0 +1,88 @@
+From b5e57a9f158a293b1151638336478af8a5aad0f0 Mon Sep 17 00:00:00 2001
+From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Date: Wed, 14 Nov 2012 19:16:35 +0800
+Subject: [PATCH 1/5] watchdog: add keep alive support
+
+this will allow to ping the watchdog via poller
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ drivers/watchdog/Kconfig   |  1 +
+ drivers/watchdog/wd_core.c | 21 +++++++++++++++++++++
+ include/watchdog.h         |  2 ++
+ 3 files changed, 24 insertions(+)
+
+diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
+index 2e2900c..0b4dc84 100644
+--- a/drivers/watchdog/Kconfig
++++ b/drivers/watchdog/Kconfig
+@@ -4,6 +4,7 @@ config WATCHDOG_IMX_RESET_SOURCE
+ 
+ menuconfig WATCHDOG
+ 	bool "Watchdog support"
++	select GENERIC_POLLER
+ 	help
+ 	  Many platforms support a watchdog to keep track of a working machine.
+ 	  This framework provides routines to handle these watchdogs.
+diff --git a/drivers/watchdog/wd_core.c b/drivers/watchdog/wd_core.c
+index 3d0cfc6..a1b9e28 100644
+--- a/drivers/watchdog/wd_core.c
++++ b/drivers/watchdog/wd_core.c
+@@ -17,18 +17,39 @@
+ #include <errno.h>
+ #include <linux/ctype.h>
+ #include <watchdog.h>
++#include <poller.h>
+ 
+ /*
+  * Note: this simple framework supports one watchdog only.
+  */
+ static struct watchdog *watchdog;
+ 
++static void watchdog_poller_func(struct poller_struct *poller)
++{
++	watchdog->keep_alive(watchdog);
++}
++
++static struct poller_struct watchdog_poller = {
++	.func = watchdog_poller_func,
++};
++
+ int watchdog_register(struct watchdog *wd)
+ {
+ 	if (watchdog != NULL)
+ 		return -EBUSY;
+ 
+ 	watchdog = wd;
++
++	if (watchdog->keep_alive) {
++		int ret;
++
++		ret = poller_register(&watchdog_poller);
++		if (ret) {
++			watchdog = NULL;
++			return ret;
++		}
++	}
++
+ 	return 0;
+ }
+ EXPORT_SYMBOL(watchdog_register);
+diff --git a/include/watchdog.h b/include/watchdog.h
+index 3e2d08e..d5ecf2f 100644
+--- a/include/watchdog.h
++++ b/include/watchdog.h
+@@ -13,8 +13,10 @@
+ #ifndef INCLUDE_WATCHDOG_H
+ # define INCLUDE_WATCHDOG_H
+ 
++
+ struct watchdog {
+ 	int (*set_timeout)(struct watchdog *, unsigned);
++	void (*keep_alive)(struct watchdog *);
+ };
+ 
+ int watchdog_register(struct watchdog *);
+-- 
+1.8.1.4
+
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch b/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
new file mode 100644
index 0000000..1ca8769
--- /dev/null
+++ b/board/telit/evk-pro3/barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch
@@ -0,0 +1,228 @@
+From e1d54ffb987c346c45c20968be34c50c62a91c07 Mon Sep 17 00:00:00 2001
+From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Date: Wed, 14 Nov 2012 19:17:47 +0800
+Subject: [PATCH 2/5] watchdog: add at91sam9 watchdog support
+
+with keep alive support
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ drivers/watchdog/Kconfig        |   7 +++
+ drivers/watchdog/Makefile       |   1 +
+ drivers/watchdog/at91sam9_wdt.c | 131 ++++++++++++++++++++++++++++++++++++++++
+ drivers/watchdog/at91sam9_wdt.h |  38 ++++++++++++
+ 4 files changed, 177 insertions(+)
+ create mode 100644 drivers/watchdog/at91sam9_wdt.c
+ create mode 100644 drivers/watchdog/at91sam9_wdt.h
+
+diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
+index 0b4dc84..98a21d7 100644
+--- a/drivers/watchdog/Kconfig
++++ b/drivers/watchdog/Kconfig
+@@ -11,6 +11,13 @@ menuconfig WATCHDOG
+ 
+ if WATCHDOG
+ 
++config WATCHDOG_AT91SAM9X
++	tristate "AT91SAM9X / AT91CAP9 watchdog"
++	depends on ARCH_AT91
++	help
++	  Watchdog timer embedded into AT91SAM9X and AT91CAP9 chips. This will
++	  reboot your system when the timeout is reached.
++
+ config WATCHDOG_MXS28
+ 	bool "i.MX28"
+ 	depends on ARCH_IMX28
+diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
+index f522b88..3d15d52 100644
+--- a/drivers/watchdog/Makefile
++++ b/drivers/watchdog/Makefile
+@@ -1,3 +1,4 @@
+ obj-$(CONFIG_WATCHDOG) += wd_core.o
++obj-$(CONFIG_WATCHDOG_AT91SAM9X) += at91sam9_wdt.o
+ obj-$(CONFIG_WATCHDOG_MXS28) += im28wd.o
+ obj-$(CONFIG_WATCHDOG_IMX_RESET_SOURCE) += imxwd.o
+diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
+new file mode 100644
+index 0000000..203d83a
+--- /dev/null
++++ b/drivers/watchdog/at91sam9_wdt.c
+@@ -0,0 +1,131 @@
++/*
++ * (c) 2012 Juergen Beisert <kernel@pengutronix.de>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * Note: this driver works for the i.MX28 SoC. It might work for the
++ * i.MX23 Soc as well, but is not tested yet.
++ */
++
++#include <common.h>
++#include <init.h>
++#include <io.h>
++#include <errno.h>
++#include <malloc.h>
++#include <watchdog.h>
++
++#include "at91sam9_wdt.h"
++
++struct at91sam9_wdt {
++	struct watchdog wdt;
++	void __iomem *base;
++};
++
++#define to_at91sam9_wdt(h) container_of(h, struct at91sam9_wdt, wdt)
++
++#define wdt_read(at91wdt, field) \
++	__raw_readl(at91wdt->base + field)
++#define wdt_write(at91wdt, field, val) \
++	__raw_writel((val), at91wdt->base + field)
++
++static void at91sam9_wdt_keep_alive(struct watchdog *wdt)
++{
++	struct at91sam9_wdt *at91wdt = to_at91sam9_wdt(wdt);
++
++	wdt_write(at91wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
++}
++
++static int at91sam9_wdt_settimeout(struct watchdog *wdt, unsigned int timeout)
++{
++	struct at91sam9_wdt *at91wdt = to_at91sam9_wdt(wdt);
++	unsigned int reg;
++	unsigned int mr;
++
++	/* Check if disabled */
++	mr = wdt_read(at91wdt, AT91_WDT_MR);
++	if (mr & AT91_WDT_WDDIS) {
++		pr_err("sorry, watchdog is disabled\n");
++		return -EIO;
++	}
++
++	if (!timeout) {
++		wdt_write(at91wdt, AT91_WDT_MR, AT91_WDT_WDDIS);
++		return 0;
++	}
++
++	/*
++	 * All counting occurs at SLOW_CLOCK / 128 = 256 Hz
++	 *
++	 * Since WDV is a 12-bit counter, the maximum period is
++	 * 4096 / 256 = 16 seconds.
++	 */
++	reg = AT91_WDT_WDRSTEN	/* causes watchdog reset */
++		/* | AT91_WDT_WDRPROC	causes processor reset only */
++		| AT91_WDT_WDDBGHLT	/* disabled in debug mode */
++		| AT91_WDT_WDD		/* restart at any time */
++		| (timeout & AT91_WDT_WDV);  /* timer value */
++	wdt_write(at91wdt, AT91_WDT_MR, reg);
++
++	return 0;
++}
++
++static int at91sam9_wdt_probe(struct device_d *dev)
++{
++	struct at91sam9_wdt *priv;
++	struct watchdog *wdt;
++	int ret;
++	unsigned int mr;
++
++	priv = xzalloc(sizeof(struct at91sam9_wdt));
++	priv->base = dev_request_mem_region(dev, 0);
++	wdt = &priv->wdt;
++
++	wdt->set_timeout = at91sam9_wdt_settimeout;
++	wdt->keep_alive = at91sam9_wdt_keep_alive;
++
++	/* Check if disabled */
++	mr = wdt_read(priv, AT91_WDT_MR);
++	if (mr & AT91_WDT_WDDIS) {
++		dev_err(dev, "sorry, watchdog is disabled\n");
++		ret = -EIO;
++		goto err;
++	}
++
++	ret = watchdog_register(wdt);
++	if (ret != 0)
++		goto err;
++
++	dev->priv = priv;
++	return 0;
++
++err:
++	free(priv);
++	return ret;
++}
++
++static void at91sam9_wdt_remove(struct device_d *dev)
++{
++	struct at91sam9_wdt *priv= dev->priv;
++	watchdog_deregister(&priv->wdt);
++	free(priv);
++}
++
++static struct driver_d at91sam9_wdt_driver = {
++	.name	= "at91sam9_wdt",
++	.probe	= at91sam9_wdt_probe,
++	.remove = at91sam9_wdt_remove,
++};
++
++static int at91sam9_wdt_init(void)
++{
++	return platform_driver_register(&at91sam9_wdt_driver);
++}
++coredevice_initcall(at91sam9_wdt_init);
+diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
+new file mode 100644
+index 0000000..2b68c1a
+--- /dev/null
++++ b/drivers/watchdog/at91sam9_wdt.h
+@@ -0,0 +1,38 @@
++/*
++ * drivers/watchdog/at91sam9_wdt.h
++ *
++ * Copyright (C) 2007 Andrew Victor
++ * Copyright (C) 2007 Atmel Corporation.
++ *
++ * Watchdog Timer (WDT) - System peripherals regsters.
++ * Based on AT91SAM9261 datasheet revision D.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ */
++
++#ifndef AT91_WDT_H
++#define AT91_WDT_H
++
++#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
++#define		AT91_WDT_WDRSTT		(1    << 0)		/* Restart */
++#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
++
++#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
++#define		AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
++#define		AT91_WDT_WDFIEN		(1     << 12)		/* Fault Interrupt Enable */
++#define		AT91_WDT_WDRSTEN	(1     << 13)		/* Reset Processor */
++#define		AT91_WDT_WDRPROC	(1     << 14)		/* Timer Restart */
++#define		AT91_WDT_WDDIS		(1     << 15)		/* Watchdog Disable */
++#define		AT91_WDT_WDD		(0xfff << 16)		/* Delta Value */
++#define		AT91_WDT_WDDBGHLT	(1     << 28)		/* Debug Halt */
++#define		AT91_WDT_WDIDLEHLT	(1     << 29)		/* Idle Halt */
++
++#define AT91_WDT_SR		0x08			/* Watchdog Status Register */
++#define		AT91_WDT_WDUNF		(1 << 0)		/* Watchdog Underflow */
++#define		AT91_WDT_WDERR		(1 << 1)		/* Watchdog Error */
++
++
++#endif
+-- 
+1.8.1.4
+
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch b/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
new file mode 100644
index 0000000..bf97200
--- /dev/null
+++ b/board/telit/evk-pro3/barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch
@@ -0,0 +1,40 @@
+From 3338bcb05479f1149420d4a0ea3904cb9e42eef5 Mon Sep 17 00:00:00 2001
+From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Date: Wed, 14 Nov 2012 19:18:22 +0800
+Subject: [PATCH 3/5] at91sam9260/9g20: add wathdog support
+
+Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+---
+ arch/arm/mach-at91/at91sam9260_devices.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
+index 1c375ee..5885f91 100644
+--- a/arch/arm/mach-at91/at91sam9260_devices.c
++++ b/arch/arm/mach-at91/at91sam9260_devices.c
+@@ -10,6 +10,7 @@
+  *
+  */
+ #include <common.h>
++#include <init.h>
+ #include <sizes.h>
+ #include <asm/armlinux.h>
+ #include <asm/hardware.h>
+@@ -397,3 +398,14 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data)
+ #else
+ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
+ #endif
++
++#ifdef CONFIG_WATCHDOG_AT91SAM9X
++static int at91_add_device_watchdog(void)
++{
++	add_generic_device("at91sam9_wdt", DEVICE_ID_SINGLE, NULL,
++		AT91_WDT + AT91_BASE_SYS, 16, IORESOURCE_MEM, NULL);
++
++	return 0;
++}
++coredevice_initcall(at91_add_device_watchdog);
++#endif
+-- 
+1.8.1.4
+
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch b/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
new file mode 100644
index 0000000..cdfd026
--- /dev/null
+++ b/board/telit/evk-pro3/barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch
@@ -0,0 +1,26 @@
+From e03bf0e3ad24898019b89eb9a6935d159c60268f Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Thu, 17 Jan 2013 11:32:35 +0100
+Subject: [PATCH 4/5] at91sam9260/9g20: fix wathdog support
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ arch/arm/mach-at91/at91sam9260_devices.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
+index 5885f91..df675d2 100644
+--- a/arch/arm/mach-at91/at91sam9260_devices.c
++++ b/arch/arm/mach-at91/at91sam9260_devices.c
+@@ -403,7 +403,7 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
+ static int at91_add_device_watchdog(void)
+ {
+ 	add_generic_device("at91sam9_wdt", DEVICE_ID_SINGLE, NULL,
+-		AT91_WDT + AT91_BASE_SYS, 16, IORESOURCE_MEM, NULL);
++		AT91_BASE_WDT, 16, IORESOURCE_MEM, NULL);
+ 
+ 	return 0;
+ }
+-- 
+1.8.1.4
+
diff --git a/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch b/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
new file mode 100644
index 0000000..837e8c6
--- /dev/null
+++ b/board/telit/evk-pro3/barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch
@@ -0,0 +1,26 @@
+From 98c96ea36a4b3bb9b92dde849db5e8d6918b5168 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Thu, 17 Jan 2013 11:32:59 +0100
+Subject: [PATCH 5/5] watchdog: enable for evk-pro3
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ arch/arm/configs/telit_evk_pro3_defconfig | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/arch/arm/configs/telit_evk_pro3_defconfig b/arch/arm/configs/telit_evk_pro3_defconfig
+index 050d176..436cecf 100644
+--- a/arch/arm/configs/telit_evk_pro3_defconfig
++++ b/arch/arm/configs/telit_evk_pro3_defconfig
+@@ -68,6 +68,8 @@ CONFIG_MCI_ATMEL=y
+ CONFIG_LED=y
+ CONFIG_LED_GPIO=y
+ CONFIG_LED_TRIGGERS=y
++CONFIG_WATCHDOG=y
++CONFIG_WATCHDOG_AT91SAM9X=y
+ CONFIG_FS_TFTP=y
+ CONFIG_FS_FAT=y
+ CONFIG_FS_FAT_LFN=y
+-- 
+1.8.1.4
+
diff --git a/board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch b/board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
new file mode 100644
index 0000000..ef1c6d5
--- /dev/null
+++ b/board/telit/evk-pro3/linux-0001-ARM-at91-at91_dt_defconfig-update-for-evk-pro3.patch
@@ -0,0 +1,44 @@
+From fb5e64e2f3aae7189f6d40f1d24570c092f13afd Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <fabio.porcedda@gmail.com>
+Date: Tue, 25 Sep 2012 09:47:58 +0200
+Subject: [PATCH] ARM: at91: at91_dt_defconfig: update for evk-pro3
+
+- enable ubifs
+- enable /sys/class/gpio
+- choose lzo decompression
+
+Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
+---
+ arch/arm/configs/at91_dt_defconfig | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
+index 047f2a4..295aabe 100644
+--- a/arch/arm/configs/at91_dt_defconfig
++++ b/arch/arm/configs/at91_dt_defconfig
+@@ -1,5 +1,6 @@
+ CONFIG_EXPERIMENTAL=y
+ # CONFIG_LOCALVERSION_AUTO is not set
++CONFIG_KERNEL_LZO=y
+ # CONFIG_SWAP is not set
+ CONFIG_SYSVIPC=y
+ CONFIG_LOG_BUF_SHIFT=14
+@@ -113,6 +114,7 @@ CONFIG_I2C_GPIO=y
+ CONFIG_SPI=y
+ CONFIG_SPI_ATMEL=y
+ CONFIG_PINCTRL_AT91=y
++CONFIG_GPIO_SYSFS=y
+ # CONFIG_HWMON is not set
+ CONFIG_WATCHDOG=y
+ CONFIG_AT91SAM9X_WATCHDOG=y
+@@ -172,6 +174,7 @@ CONFIG_EXT2_FS=y
+ CONFIG_FANOTIFY=y
+ CONFIG_VFAT_FS=y
+ CONFIG_TMPFS=y
++CONFIG_UBIFS_FS=y
+ CONFIG_NFS_FS=y
+ CONFIG_NFS_V3=y
+ CONFIG_ROOT_NFS=y
+-- 
+1.8.1.4
+
diff --git a/board/telit/evk-pro3/readme.txt b/board/telit/evk-pro3/readme.txt
new file mode 100644
index 0000000..ace9dd4
--- /dev/null
+++ b/board/telit/evk-pro3/readme.txt
@@ -0,0 +1,28 @@
+Buildroot board support for Telit EVK-PRO3 with Telit GE863-PRO3
+
+Official site:
+  http://www.telit.com/en/products.php?p_id=3&p_ac=show&p=10
+
+Build images:
+    make telit_evk_pro3_defconfig
+    make
+
+  images built:
+  - output/images/barebox.bin
+  - output/images/zImage
+  - output/images/rootfs.ubi
+
+
+Flash built images:
+  The first time you need to bootstrap from Telit Official Release 221.07.1007,
+  at the U-Boot prompt type:
+    U-Boot> loadb
+  send buildroot/output/images/barebox.bin
+    U-Boot> go 0x20200000
+
+  flash updated images using barebox through tftp:
+    barebox:/ erase dev/self0; cp /mnt/tftp/barebox.bin /dev/self0
+    barebox:/ erase /dev/nand0.kernel.bb; cp /mnt/tftp/zImage /dev/nand0.kernel.bb
+    barebox:/ erase /dev/nand0.rootfs.bb; cp /mnt/tftp/rootfs.ubi /dev/nand0.rootfs.bb
+    barebox:/ erase dev/env0
+    barebox:/ reset
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
new file mode 100644
index 0000000..e7aa217
--- /dev/null
+++ b/configs/telit_evk_pro3_defconfig
@@ -0,0 +1,15 @@
+BR2_arm=y
+BR2_PREFER_STATIC_LIB=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+BR2_PACKAGE_BUSYBOX_WATCHDOG=y
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_2013_04=y
+BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR="board/telit/evk-pro3"
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="telit_evk_pro3"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/telit/evk-pro3"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="evk-pro3"
-- 
1.8.1.4
