From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  7 Mar 2018 21:53:23 +0100
Subject: [Buildroot] [PATCH] configs/teliv_evk_pro3: remove defconfig
Message-ID: <20180307205323.14440-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig fails to build with gcc 6.x, even though we switched to
using gcc 6.x as the default gcc version in May 2017.

It hasn't been updated since April 2017, and the original submitter,
Fabio Porcedda said:

  Unfortunately a newer kernel doesn't boot and I don't have the time
  to fix the issue. If having a defconfig that doesn't build on gcc
  6.x is unacceptable feel free to remove it.

So, let's get rid of this defconfig, which will remove the following
build error:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306952

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |   1 -
 board/telit/evk-pro3/barebox.fragment              |   2 -
 board/telit/evk-pro3/linux.fragment                |   3 -
 .../0001-watchdog-add-keep-alive-support.patch     |  99 ---------
 ...02-watchdog-add-at91sam9-watchdog-support.patch | 237 ---------------------
 ...0003-at91sam9260-9g20-add-wathdog-support.patch |  36 ----
 ...0004-at91sam9260-9g20-fix-wathdog-support.patch |  26 ---
 .../linux/0001-kernel-add-support-for-gcc-5.patch  |  97 ---------
 ...LLVMLinux-use-static-inline-in-ARM-ftrace.patch |  52 -----
 board/telit/evk-pro3/readme.txt                    |  28 ---
 configs/telit_evk_pro3_defconfig                   |  32 ---
 11 files changed, 613 deletions(-)
 delete mode 100644 board/telit/evk-pro3/barebox.fragment
 delete mode 100644 board/telit/evk-pro3/linux.fragment
 delete mode 100644 board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch
 delete mode 100644 board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch
 delete mode 100644 board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch
 delete mode 100644 board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch
 delete mode 100644 board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
 delete mode 100644 board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
 delete mode 100644 board/telit/evk-pro3/readme.txt
 delete mode 100644 configs/telit_evk_pro3_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 15e84d3360..4cdaa09da5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -227,7 +227,6 @@ solidrun_macchiatobin_mainline_defconfig: *defconfig
 solidrun_macchiatobin_marvell_defconfig: *defconfig
 stm32f429_disco_defconfig: *defconfig
 stm32f469_disco_defconfig: *defconfig
-telit_evk_pro3_defconfig: *defconfig
 toradex_apalis_imx6_defconfig: *defconfig
 ts4800_defconfig: *defconfig
 ts4900_defconfig: *defconfig
diff --git a/board/telit/evk-pro3/barebox.fragment b/board/telit/evk-pro3/barebox.fragment
deleted file mode 100644
index 750ad19cd8..0000000000
--- a/board/telit/evk-pro3/barebox.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_WATCHDOG=y
-CONFIG_WATCHDOG_AT91SAM9X=y
diff --git a/board/telit/evk-pro3/linux.fragment b/board/telit/evk-pro3/linux.fragment
deleted file mode 100644
index d22fe8f4e4..0000000000
--- a/board/telit/evk-pro3/linux.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_KERNEL_LZO=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_UBIFS_FS=y
diff --git a/board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch b/board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch
deleted file mode 100644
index 80bd459b56..0000000000
--- a/board/telit/evk-pro3/patches/barebox/0001-watchdog-add-keep-alive-support.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 76e2b190803484db033153fe8a97b381a567ed25 Mon Sep 17 00:00:00 2001
-From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Date: Wed, 14 Nov 2012 19:16:35 +0800
-Subject: [PATCH 1/4] watchdog: add keep alive support
-
-this will allow to ping the watchdog via poller
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
----
- drivers/watchdog/Kconfig   |  1 +
- drivers/watchdog/wd_core.c | 25 +++++++++++++++++++++++++
- include/watchdog.h         |  2 ++
- 3 files changed, 28 insertions(+)
-
-diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
-index 63fb1a8c5..7ebff89b9 100644
---- a/drivers/watchdog/Kconfig
-+++ b/drivers/watchdog/Kconfig
-@@ -4,6 +4,7 @@ config WATCHDOG_IMX_RESET_SOURCE
- 
- menuconfig WATCHDOG
- 	bool "Watchdog support"
-+	select GENERIC_POLLER
- 	help
- 	  Many platforms support a watchdog to keep track of a working machine.
- 	  This framework provides routines to handle these watchdogs.
-diff --git a/drivers/watchdog/wd_core.c b/drivers/watchdog/wd_core.c
-index 3a3f51964..52537afef 100644
---- a/drivers/watchdog/wd_core.c
-+++ b/drivers/watchdog/wd_core.c
-@@ -18,6 +18,7 @@
- #include <errno.h>
- #include <linux/ctype.h>
- #include <watchdog.h>
-+#include <poller.h>
- 
- static LIST_HEAD(watchdog_list);
- 
-@@ -31,6 +32,20 @@ static const char *watchdog_name(struct watchdog *wd)
- 	return "unknown";
- }
- 
-+static struct watchdog *watchdog_get_default(void);
-+
-+static void watchdog_poller_func(struct poller_struct *poller)
-+{
-+	struct watchdog *wd = watchdog_get_default();
-+
-+	if (wd)
-+                wd->keep_alive(wd);
-+}
-+
-+static struct poller_struct watchdog_poller = {
-+	.func = watchdog_poller_func,
-+};
-+
- int watchdog_register(struct watchdog *wd)
- {
- 	if (!wd->priority)
-@@ -41,6 +56,16 @@ int watchdog_register(struct watchdog *wd)
- 	pr_debug("registering watchdog %s with priority %d\n", watchdog_name(wd),
- 			wd->priority);
- 
-+
-+	if (wd->keep_alive) {
-+		int ret;
-+
-+		ret = poller_register(&watchdog_poller);
-+		if (ret) {
-+			return ret;
-+		}
-+	}
-+
- 	return 0;
- }
- EXPORT_SYMBOL(watchdog_register);
-diff --git a/include/watchdog.h b/include/watchdog.h
-index 3e8a487a4..a2660c2e0 100644
---- a/include/watchdog.h
-+++ b/include/watchdog.h
-@@ -13,12 +13,14 @@
- #ifndef INCLUDE_WATCHDOG_H
- # define INCLUDE_WATCHDOG_H
- 
-+
- struct watchdog {
- 	int (*set_timeout)(struct watchdog *, unsigned);
- 	const char *name;
- 	struct device_d *dev;
- 	unsigned int priority;
- 	struct list_head list;
-+	void (*keep_alive)(struct watchdog *);
- };
- 
- #ifdef CONFIG_WATCHDOG
--- 
-2.12.0
-
diff --git a/board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch b/board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch
deleted file mode 100644
index b97c126954..0000000000
--- a/board/telit/evk-pro3/patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From 24d99ffc4b22e45721e74bfc10717cc5bacdbfc4 Mon Sep 17 00:00:00 2001
-From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Date: Wed, 14 Nov 2012 19:17:47 +0800
-Subject: [PATCH 2/4] watchdog: add at91sam9 watchdog support
-
-with keep alive support
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
----
- drivers/watchdog/Kconfig        |   8 +++
- drivers/watchdog/Makefile       |   1 +
- drivers/watchdog/at91sam9_wdt.c | 131 ++++++++++++++++++++++++++++++++++++++++
- drivers/watchdog/at91sam9_wdt.h |  38 ++++++++++++
- 4 files changed, 178 insertions(+)
- create mode 100644 drivers/watchdog/at91sam9_wdt.c
- create mode 100644 drivers/watchdog/at91sam9_wdt.h
-
-diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
-index 7ebff89b9..479e737f0 100644
---- a/drivers/watchdog/Kconfig
-+++ b/drivers/watchdog/Kconfig
-@@ -11,12 +11,20 @@ menuconfig WATCHDOG
- 
- if WATCHDOG
- 
-+config WATCHDOG_AT91SAM9X
-+	tristate "AT91SAM9X / AT91CAP9 watchdog"
-+	depends on ARCH_AT91
-+	help
-+	  Watchdog timer embedded into AT91SAM9X and AT91CAP9 chips. This will
-+	  reboot your system when the timeout is reached.
-+
- config WATCHDOG_DAVINCI
- 	bool "TI Davinci"
- 	depends on ARCH_DAVINCI
- 	help
- 	  Add support for watchdog on the TI Davinci SoC.
- 
-+
- config WATCHDOG_DW
- 	bool "Synopsys DesignWare watchdog"
- 	select RESET_CONTROLLER
-diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
-index 5fca4c368..245a5c84a 100644
---- a/drivers/watchdog/Makefile
-+++ b/drivers/watchdog/Makefile
-@@ -1,4 +1,5 @@
- obj-$(CONFIG_WATCHDOG) += wd_core.o
-+obj-$(CONFIG_WATCHDOG_AT91SAM9X) += at91sam9_wdt.o
- obj-$(CONFIG_WATCHDOG_DAVINCI) += davinci_wdt.o
- obj-$(CONFIG_WATCHDOG_OMAP) += omap_wdt.o
- obj-$(CONFIG_WATCHDOG_MXS28) += im28wd.o
-diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9_wdt.c
-new file mode 100644
-index 000000000..203d83aff
---- /dev/null
-+++ b/drivers/watchdog/at91sam9_wdt.c
-@@ -0,0 +1,131 @@
-+/*
-+ * (c) 2012 Juergen Beisert <kernel@pengutronix.de>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * Note: this driver works for the i.MX28 SoC. It might work for the
-+ * i.MX23 Soc as well, but is not tested yet.
-+ */
-+
-+#include <common.h>
-+#include <init.h>
-+#include <io.h>
-+#include <errno.h>
-+#include <malloc.h>
-+#include <watchdog.h>
-+
-+#include "at91sam9_wdt.h"
-+
-+struct at91sam9_wdt {
-+	struct watchdog wdt;
-+	void __iomem *base;
-+};
-+
-+#define to_at91sam9_wdt(h) container_of(h, struct at91sam9_wdt, wdt)
-+
-+#define wdt_read(at91wdt, field) \
-+	__raw_readl(at91wdt->base + field)
-+#define wdt_write(at91wdt, field, val) \
-+	__raw_writel((val), at91wdt->base + field)
-+
-+static void at91sam9_wdt_keep_alive(struct watchdog *wdt)
-+{
-+	struct at91sam9_wdt *at91wdt = to_at91sam9_wdt(wdt);
-+
-+	wdt_write(at91wdt, AT91_WDT_CR, AT91_WDT_KEY | AT91_WDT_WDRSTT);
-+}
-+
-+static int at91sam9_wdt_settimeout(struct watchdog *wdt, unsigned int timeout)
-+{
-+	struct at91sam9_wdt *at91wdt = to_at91sam9_wdt(wdt);
-+	unsigned int reg;
-+	unsigned int mr;
-+
-+	/* Check if disabled */
-+	mr = wdt_read(at91wdt, AT91_WDT_MR);
-+	if (mr & AT91_WDT_WDDIS) {
-+		pr_err("sorry, watchdog is disabled\n");
-+		return -EIO;
-+	}
-+
-+	if (!timeout) {
-+		wdt_write(at91wdt, AT91_WDT_MR, AT91_WDT_WDDIS);
-+		return 0;
-+	}
-+
-+	/*
-+	 * All counting occurs at SLOW_CLOCK / 128 = 256 Hz
-+	 *
-+	 * Since WDV is a 12-bit counter, the maximum period is
-+	 * 4096 / 256 = 16 seconds.
-+	 */
-+	reg = AT91_WDT_WDRSTEN	/* causes watchdog reset */
-+		/* | AT91_WDT_WDRPROC	causes processor reset only */
-+		| AT91_WDT_WDDBGHLT	/* disabled in debug mode */
-+		| AT91_WDT_WDD		/* restart at any time */
-+		| (timeout & AT91_WDT_WDV);  /* timer value */
-+	wdt_write(at91wdt, AT91_WDT_MR, reg);
-+
-+	return 0;
-+}
-+
-+static int at91sam9_wdt_probe(struct device_d *dev)
-+{
-+	struct at91sam9_wdt *priv;
-+	struct watchdog *wdt;
-+	int ret;
-+	unsigned int mr;
-+
-+	priv = xzalloc(sizeof(struct at91sam9_wdt));
-+	priv->base = dev_request_mem_region(dev, 0);
-+	wdt = &priv->wdt;
-+
-+	wdt->set_timeout = at91sam9_wdt_settimeout;
-+	wdt->keep_alive = at91sam9_wdt_keep_alive;
-+
-+	/* Check if disabled */
-+	mr = wdt_read(priv, AT91_WDT_MR);
-+	if (mr & AT91_WDT_WDDIS) {
-+		dev_err(dev, "sorry, watchdog is disabled\n");
-+		ret = -EIO;
-+		goto err;
-+	}
-+
-+	ret = watchdog_register(wdt);
-+	if (ret != 0)
-+		goto err;
-+
-+	dev->priv = priv;
-+	return 0;
-+
-+err:
-+	free(priv);
-+	return ret;
-+}
-+
-+static void at91sam9_wdt_remove(struct device_d *dev)
-+{
-+	struct at91sam9_wdt *priv= dev->priv;
-+	watchdog_deregister(&priv->wdt);
-+	free(priv);
-+}
-+
-+static struct driver_d at91sam9_wdt_driver = {
-+	.name	= "at91sam9_wdt",
-+	.probe	= at91sam9_wdt_probe,
-+	.remove = at91sam9_wdt_remove,
-+};
-+
-+static int at91sam9_wdt_init(void)
-+{
-+	return platform_driver_register(&at91sam9_wdt_driver);
-+}
-+coredevice_initcall(at91sam9_wdt_init);
-diff --git a/drivers/watchdog/at91sam9_wdt.h b/drivers/watchdog/at91sam9_wdt.h
-new file mode 100644
-index 000000000..2b68c1a2a
---- /dev/null
-+++ b/drivers/watchdog/at91sam9_wdt.h
-@@ -0,0 +1,38 @@
-+/*
-+ * drivers/watchdog/at91sam9_wdt.h
-+ *
-+ * Copyright (C) 2007 Andrew Victor
-+ * Copyright (C) 2007 Atmel Corporation.
-+ *
-+ * Watchdog Timer (WDT) - System peripherals regsters.
-+ * Based on AT91SAM9261 datasheet revision D.
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ */
-+
-+#ifndef AT91_WDT_H
-+#define AT91_WDT_H
-+
-+#define AT91_WDT_CR		0x00			/* Watchdog Control Register */
-+#define		AT91_WDT_WDRSTT		(1    << 0)		/* Restart */
-+#define		AT91_WDT_KEY		(0xa5 << 24)		/* KEY Password */
-+
-+#define AT91_WDT_MR		0x04			/* Watchdog Mode Register */
-+#define		AT91_WDT_WDV		(0xfff << 0)		/* Counter Value */
-+#define		AT91_WDT_WDFIEN		(1     << 12)		/* Fault Interrupt Enable */
-+#define		AT91_WDT_WDRSTEN	(1     << 13)		/* Reset Processor */
-+#define		AT91_WDT_WDRPROC	(1     << 14)		/* Timer Restart */
-+#define		AT91_WDT_WDDIS		(1     << 15)		/* Watchdog Disable */
-+#define		AT91_WDT_WDD		(0xfff << 16)		/* Delta Value */
-+#define		AT91_WDT_WDDBGHLT	(1     << 28)		/* Debug Halt */
-+#define		AT91_WDT_WDIDLEHLT	(1     << 29)		/* Idle Halt */
-+
-+#define AT91_WDT_SR		0x08			/* Watchdog Status Register */
-+#define		AT91_WDT_WDUNF		(1 << 0)		/* Watchdog Underflow */
-+#define		AT91_WDT_WDERR		(1 << 1)		/* Watchdog Error */
-+
-+
-+#endif
--- 
-2.12.0
-
diff --git a/board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch b/board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch
deleted file mode 100644
index 6f4efaba1e..0000000000
--- a/board/telit/evk-pro3/patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 60110b93a5cbc6ec3d92035d9daf86a30a7fd791 Mon Sep 17 00:00:00 2001
-From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Date: Wed, 14 Nov 2012 19:18:22 +0800
-Subject: [PATCH 3/4] at91sam9260/9g20: add wathdog support
-
-Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
-Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
----
- arch/arm/mach-at91/at91sam9260_devices.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
-index 67c4ea860..51852a9a8 100644
---- a/arch/arm/mach-at91/at91sam9260_devices.c
-+++ b/arch/arm/mach-at91/at91sam9260_devices.c
-@@ -400,6 +400,17 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data)
- void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
- #endif
- 
-+#ifdef CONFIG_WATCHDOG_AT91SAM9X
-+static int at91_add_device_watchdog(void)
-+{
-+	add_generic_device("at91sam9_wdt", DEVICE_ID_SINGLE, NULL,
-+		AT91_WDT + AT91_BASE_SYS, 16, IORESOURCE_MEM, NULL);
-+
-+	return 0;
-+}
-+coredevice_initcall(at91_add_device_watchdog);
-+#endif
-+
- static int at91_fixup_device(void)
- {
- 	at91_rtt_irq_fixup(IOMEM(AT91SAM9260_BASE_RTT));
--- 
-2.12.0
-
diff --git a/board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch b/board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch
deleted file mode 100644
index edc1ea4d5b..0000000000
--- a/board/telit/evk-pro3/patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d8231b1726a020733d87c2685ec1631403e050cf Mon Sep 17 00:00:00 2001
-From: Fabio Porcedda <fabio.porcedda@gmail.com>
-Date: Thu, 17 Jan 2013 11:32:35 +0100
-Subject: [PATCH 4/4] at91sam9260/9g20: fix wathdog support
-
-Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
----
- arch/arm/mach-at91/at91sam9260_devices.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
-index 51852a9a8..20c8cac9d 100644
---- a/arch/arm/mach-at91/at91sam9260_devices.c
-+++ b/arch/arm/mach-at91/at91sam9260_devices.c
-@@ -404,7 +404,7 @@ void at91_add_device_mci(short mmc_id, struct atmel_mci_platform_data *data) {}
- static int at91_add_device_watchdog(void)
- {
- 	add_generic_device("at91sam9_wdt", DEVICE_ID_SINGLE, NULL,
--		AT91_WDT + AT91_BASE_SYS, 16, IORESOURCE_MEM, NULL);
-+		AT91_BASE_WDT, 16, IORESOURCE_MEM, NULL);
- 
- 	return 0;
- }
--- 
-2.12.0
-
diff --git a/board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch b/board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
deleted file mode 100644
index 3aba910f8b..0000000000
--- a/board/telit/evk-pro3/patches/linux/0001-kernel-add-support-for-gcc-5.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 71458cfc782eafe4b27656e078d379a34e472adf Mon Sep 17 00:00:00 2001
-From: Sasha Levin <sasha.levin@oracle.com>
-Date: Mon, 13 Oct 2014 15:51:05 -0700
-Subject: [PATCH] kernel: add support for gcc 5
-
-We're missing include/linux/compiler-gcc5.h which is required now
-because gcc branched off to v5 in trunk.
-
-Just copy the relevant bits out of include/linux/compiler-gcc4.h,
-no new code is added as of now.
-
-This fixes a build error when using gcc 5.
-
-Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
-Cc: <stable@vger.kernel.org>
-Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
-Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
----
- include/linux/compiler-gcc5.h | 66 +++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 66 insertions(+)
- create mode 100644 include/linux/compiler-gcc5.h
-
-diff --git a/include/linux/compiler-gcc5.h b/include/linux/compiler-gcc5.h
-new file mode 100644
-index 000000000000..cdd1cc202d51
---- /dev/null
-+++ b/include/linux/compiler-gcc5.h
-@@ -0,0 +1,66 @@
-+#ifndef __LINUX_COMPILER_H
-+#error "Please don't include <linux/compiler-gcc5.h> directly, include <linux/compiler.h> instead."
-+#endif
-+
-+#define __used				__attribute__((__used__))
-+#define __must_check			__attribute__((warn_unused_result))
-+#define __compiler_offsetof(a, b)	__builtin_offsetof(a, b)
-+
-+/* Mark functions as cold. gcc will assume any path leading to a call
-+   to them will be unlikely.  This means a lot of manual unlikely()s
-+   are unnecessary now for any paths leading to the usual suspects
-+   like BUG(), printk(), panic() etc. [but let's keep them for now for
-+   older compilers]
-+
-+   Early snapshots of gcc 4.3 don't support this and we can't detect this
-+   in the preprocessor, but we can live with this because they're unreleased.
-+   Maketime probing would be overkill here.
-+
-+   gcc also has a __attribute__((__hot__)) to move hot functions into
-+   a special section, but I don't see any sense in this right now in
-+   the kernel context */
-+#define __cold			__attribute__((__cold__))
-+
-+#define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
-+
-+#ifndef __CHECKER__
-+# define __compiletime_warning(message) __attribute__((warning(message)))
-+# define __compiletime_error(message) __attribute__((error(message)))
-+#endif /* __CHECKER__ */
-+
-+/*
-+ * Mark a position in code as unreachable.  This can be used to
-+ * suppress control flow warnings after asm blocks that transfer
-+ * control elsewhere.
-+ *
-+ * Early snapshots of gcc 4.5 don't support this and we can't detect
-+ * this in the preprocessor, but we can live with this because they're
-+ * unreleased.  Really, we need to have autoconf for the kernel.
-+ */
-+#define unreachable() __builtin_unreachable()
-+
-+/* Mark a function definition as prohibited from being cloned. */
-+#define __noclone	__attribute__((__noclone__))
-+
-+/*
-+ * Tell the optimizer that something else uses this function or variable.
-+ */
-+#define __visible __attribute__((externally_visible))
-+
-+/*
-+ * GCC 'asm goto' miscompiles certain code sequences:
-+ *
-+ *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58670
-+ *
-+ * Work it around via a compiler barrier quirk suggested by Jakub Jelinek.
-+ * Fixed in GCC 4.8.2 and later versions.
-+ *
-+ * (asm goto is automatically volatile - the naming reflects this.)
-+ */
-+#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
-+
-+#ifdef CONFIG_ARCH_USE_BUILTIN_BSWAP
-+#define __HAVE_BUILTIN_BSWAP32__
-+#define __HAVE_BUILTIN_BSWAP64__
-+#define __HAVE_BUILTIN_BSWAP16__
-+#endif /* CONFIG_ARCH_USE_BUILTIN_BSWAP */
--- 
-2.12.2
-
diff --git a/board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch b/board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
deleted file mode 100644
index 00de10988b..0000000000
--- a/board/telit/evk-pro3/patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From aeea3592a13bf12861943e44fc48f1f270941f8d Mon Sep 17 00:00:00 2001
-From: Behan Webster <behanw@converseincode.com>
-Date: Wed, 24 Sep 2014 01:06:46 +0100
-Subject: [PATCH] ARM: 8158/1: LLVMLinux: use static inline in ARM ftrace.h
-
-With compilers which follow the C99 standard (like modern versions of gcc and
-clang), "extern inline" does the wrong thing (emits code for an externally
-linkable version of the inline function). In this case using static inline
-and removing the NULL version of return_address in return_address.c does
-the right thing.
-
-Signed-off-by: Behan Webster <behanw@converseincode.com>
-Reviewed-by: Mark Charlebois <charlebm@gmail.com>
-Acked-by: Steven Rostedt <rostedt@goodmis.org>
-Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
----
- arch/arm/include/asm/ftrace.h    | 2 +-
- arch/arm/kernel/return_address.c | 5 -----
- 2 files changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/arch/arm/include/asm/ftrace.h b/arch/arm/include/asm/ftrace.h
-index 39eb16b0066f..bfe2a2f5a644 100644
---- a/arch/arm/include/asm/ftrace.h
-+++ b/arch/arm/include/asm/ftrace.h
-@@ -45,7 +45,7 @@ void *return_address(unsigned int);
- 
- #else
- 
--extern inline void *return_address(unsigned int level)
-+static inline void *return_address(unsigned int level)
- {
- 	return NULL;
- }
-diff --git a/arch/arm/kernel/return_address.c b/arch/arm/kernel/return_address.c
-index fafedd86885d..f6aa84d5b93c 100644
---- a/arch/arm/kernel/return_address.c
-+++ b/arch/arm/kernel/return_address.c
-@@ -63,11 +63,6 @@ void *return_address(unsigned int level)
- #warning "TODO: return_address should use unwind tables"
- #endif
- 
--void *return_address(unsigned int level)
--{
--	return NULL;
--}
--
- #endif /* if defined(CONFIG_FRAME_POINTER) && !defined(CONFIG_ARM_UNWIND) / else */
- 
- EXPORT_SYMBOL_GPL(return_address);
--- 
-2.12.2
-
diff --git a/board/telit/evk-pro3/readme.txt b/board/telit/evk-pro3/readme.txt
deleted file mode 100644
index ace9dd4c17..0000000000
--- a/board/telit/evk-pro3/readme.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Buildroot board support for Telit EVK-PRO3 with Telit GE863-PRO3
-
-Official site:
-  http://www.telit.com/en/products.php?p_id=3&p_ac=show&p=10
-
-Build images:
-    make telit_evk_pro3_defconfig
-    make
-
-  images built:
-  - output/images/barebox.bin
-  - output/images/zImage
-  - output/images/rootfs.ubi
-
-
-Flash built images:
-  The first time you need to bootstrap from Telit Official Release 221.07.1007,
-  at the U-Boot prompt type:
-    U-Boot> loadb
-  send buildroot/output/images/barebox.bin
-    U-Boot> go 0x20200000
-
-  flash updated images using barebox through tftp:
-    barebox:/ erase dev/self0; cp /mnt/tftp/barebox.bin /dev/self0
-    barebox:/ erase /dev/nand0.kernel.bb; cp /mnt/tftp/zImage /dev/nand0.kernel.bb
-    barebox:/ erase /dev/nand0.rootfs.bb; cp /mnt/tftp/rootfs.ubi /dev/nand0.rootfs.bb
-    barebox:/ erase dev/env0
-    barebox:/ reset
diff --git a/configs/telit_evk_pro3_defconfig b/configs/telit_evk_pro3_defconfig
deleted file mode 100644
index 12ce470293..0000000000
--- a/configs/telit_evk_pro3_defconfig
+++ /dev/null
@@ -1,32 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/telit/evk-pro3/patches"
-
-# Linux headers same as kernel, a 3.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
-
-# Watchdog is armed by the first stage bootloader
-BR2_PACKAGE_BUSYBOX_WATCHDOG=y
-
-# Filesystem
-BR2_TARGET_ROOTFS_UBIFS=y
-BR2_TARGET_ROOTFS_UBI=y
-
-# Bootloader
-BR2_TARGET_BAREBOX=y
-BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
-BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2017.01.0"
-BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="telit_evk_pro3"
-BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES="board/telit/evk-pro3/barebox.fragment"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.11"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/telit/evk-pro3/linux.fragment"
-BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="evk-pro3"
-- 
2.14.3
