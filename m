From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 20:37:53 +0200
Subject: [Buildroot] [git commit branch/next] configs: add sample for olimex
	mx233 olinuxino
Message-ID: <20130529185743.77B609A65B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ca4ff63f295090eb68afcd4dc0a6d695a89b0a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...x-01-mmc-mxs-mmc-add-cd-inverted-property.patch |   47 +++++
 ...02-mmc-mxs-mmc-add-non-removable-property.patch |   53 ++++++
 ...nux-03-mmc-mxs-mmc-add-broken-cd-property.patch |   50 +++++
 ...-imx23-olinuxino-mark-sdcard-cd-as-broken.patch |   28 +++
 board/olimex/imx233_olinuxino/linux-3.9.config     |  188 ++++++++++++++++++++
 .../mxs-bootlets/mxs-bootlets-01-olinuxino.patch   |  122 +++++++++++++
 board/olimex/imx233_olinuxino/readme.txt           |   55 ++++++
 configs/olimex_imx233_olinuxino_defconfig          |   33 ++++
 8 files changed, 576 insertions(+), 0 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/linux-01-mmc-mxs-mmc-add-cd-inverted-property.patch b/board/olimex/imx233_olinuxino/linux-01-mmc-mxs-mmc-add-cd-inverted-property.patch
new file mode 100644
index 0000000..6e58c8c
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/linux-01-mmc-mxs-mmc-add-cd-inverted-property.patch
@@ -0,0 +1,47 @@
+From 4c0c9be05004d1eb674b7586216b3d93cc04531c Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Wed, 10 Apr 2013 11:13:43 +0200
+Subject: [PATCH 1/3] mmc: mxs-mmc: add cd-inverted property
+
+The card-detect GPIO is inverted on some boards. Handle such case.
+
+Acked-by: Shawn Guo <shawn.guo@linaro.org>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+---
+ drivers/mmc/host/mxs-mmc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
+index 4efe302..0cdf1f6 100644
+--- a/drivers/mmc/host/mxs-mmc.c
++++ b/drivers/mmc/host/mxs-mmc.c
+@@ -72,6 +72,7 @@ struct mxs_mmc_host {
+ 	int				sdio_irq_en;
+ 	int				wp_gpio;
+ 	bool				wp_inverted;
++	bool				cd_inverted;
+ };
+
+ static int mxs_mmc_get_ro(struct mmc_host *mmc)
+@@ -96,7 +97,7 @@ static int mxs_mmc_get_cd(struct mmc_host *mmc)
+ 	struct mxs_ssp *ssp = &host->ssp;
+
+ 	return !(readl(ssp->base + HW_SSP_STATUS(ssp)) &
+-		 BM_SSP_STATUS_CARD_DETECT);
++		 BM_SSP_STATUS_CARD_DETECT)) ^ host->cd_inverted;
+ }
+
+ static void mxs_mmc_reset(struct mxs_mmc_host *host)
+@@ -691,6 +692,8 @@ static int mxs_mmc_probe(struct platform_device *pdev)
+ 	if (flags & OF_GPIO_ACTIVE_LOW)
+ 		host->wp_inverted = 1;
+
++	host->cd_inverted = of_property_read_bool(np, "cd-inverted");
++
+ 	mmc->f_min = 400000;
+ 	mmc->f_max = 288000000;
+ 	mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
+--
+1.8.1.5
+
diff --git a/board/olimex/imx233_olinuxino/linux-02-mmc-mxs-mmc-add-non-removable-property.patch b/board/olimex/imx233_olinuxino/linux-02-mmc-mxs-mmc-add-non-removable-property.patch
new file mode 100644
index 0000000..f7446ca
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/linux-02-mmc-mxs-mmc-add-non-removable-property.patch
@@ -0,0 +1,53 @@
+From 5086e5f41fd107539911edf62f2d202753ed1980 Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Wed, 10 Apr 2013 11:13:44 +0200
+Subject: [PATCH 2/3] mmc: mxs-mmc: add non-removable property
+
+Some boards have non removable cards like eMMC. Handle such case.
+
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Acked-by: Shawn Guo <shawn.guo@linaro.org>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+---
+ drivers/mmc/host/mxs-mmc.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
+index 0cdf1f6..c231881 100644
+--- a/drivers/mmc/host/mxs-mmc.c
++++ b/drivers/mmc/host/mxs-mmc.c
+@@ -73,6 +73,7 @@ struct mxs_mmc_host {
+ 	int				wp_gpio;
+ 	bool				wp_inverted;
+ 	bool				cd_inverted;
++	bool				non_removable;
+ };
+
+ static int mxs_mmc_get_ro(struct mmc_host *mmc)
+@@ -96,8 +97,9 @@ static int mxs_mmc_get_cd(struct mmc_host *mmc)
+ 	struct mxs_mmc_host *host = mmc_priv(mmc);
+ 	struct mxs_ssp *ssp = &host->ssp;
+
+-	return !(readl(ssp->base + HW_SSP_STATUS(ssp)) &
+-		 BM_SSP_STATUS_CARD_DETECT)) ^ host->cd_inverted;
++	return host->non_removable ||
++		!(readl(ssp->base + HW_SSP_STATUS(ssp)) &
++		  BM_SSP_STATUS_CARD_DETECT) ^ host->cd_inverted;
+ }
+
+ static void mxs_mmc_reset(struct mxs_mmc_host *host)
+@@ -687,8 +689,10 @@ static int mxs_mmc_probe(struct platform_device *pdev)
+ 		mmc->caps |= MMC_CAP_4_BIT_DATA;
+ 	else if (bus_width == 8)
+ 		mmc->caps |= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA;
++	host->non_removable = of_property_read_bool(np, "non-removable");
++	if (host->non_removable)
++		mmc->caps |= MMC_CAP_NONREMOVABLE;
+ 	host->wp_gpio = of_get_named_gpio_flags(np, "wp-gpios", 0, &flags);
+-
+ 	if (flags & OF_GPIO_ACTIVE_LOW)
+ 		host->wp_inverted = 1;
+
+--
+1.8.1.5
+
diff --git a/board/olimex/imx233_olinuxino/linux-03-mmc-mxs-mmc-add-broken-cd-property.patch b/board/olimex/imx233_olinuxino/linux-03-mmc-mxs-mmc-add-broken-cd-property.patch
new file mode 100644
index 0000000..b5ceb03
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/linux-03-mmc-mxs-mmc-add-broken-cd-property.patch
@@ -0,0 +1,50 @@
+From 1d53196a0d604fcf636203fac21e944b6a9cf275 Mon Sep 17 00:00:00 2001
+From: Hector Palacios <hector.palacios@digi.com>
+Date: Wed, 10 Apr 2013 11:13:45 +0200
+Subject: [PATCH 3/3] mmc: mxs-mmc: add broken-cd property
+
+According to bindings documentation for mmc, the property 'broken-cd'
+can be used to indicate card-detection is not available and polling
+must be used instead. This patch retrieves this property
+and sets a custom flag. On the get_cd() hook, it returns 1 if
+the flag is set, to always assume the card is present.
+
+Signed-off-by: Hector Palacios <hector.palacios@digi.com>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+---
+ drivers/mmc/host/mxs-mmc.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
+index c231881..146a53b 100644
+--- a/drivers/mmc/host/mxs-mmc.c
++++ b/drivers/mmc/host/mxs-mmc.c
+@@ -73,6 +73,7 @@ struct mxs_mmc_host {
+ 	int				wp_gpio;
+ 	bool				wp_inverted;
+ 	bool				cd_inverted;
++	bool				broken_cd;
+ 	bool				non_removable;
+ };
+
+@@ -97,7 +98,7 @@ static int mxs_mmc_get_cd(struct mmc_host *mmc)
+ 	struct mxs_mmc_host *host = mmc_priv(mmc);
+ 	struct mxs_ssp *ssp = &host->ssp;
+
+-	return host->non_removable ||
++	return host->non_removable || host->broken_cd ||
+ 		!(readl(ssp->base + HW_SSP_STATUS(ssp)) &
+ 		  BM_SSP_STATUS_CARD_DETECT) ^ host->cd_inverted;
+ }
+@@ -689,6 +690,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
+ 		mmc->caps |= MMC_CAP_4_BIT_DATA;
+ 	else if (bus_width == 8)
+ 		mmc->caps |= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA;
++	host->broken_cd = of_property_read_bool(np, "broken-cd");
+ 	host->non_removable = of_property_read_bool(np, "non-removable");
+ 	if (host->non_removable)
+ 		mmc->caps |= MMC_CAP_NONREMOVABLE;
+--
+1.8.1.5
+
diff --git a/board/olimex/imx233_olinuxino/linux-04-ARM-dts-imx23-olinuxino-mark-sdcard-cd-as-broken.patch b/board/olimex/imx233_olinuxino/linux-04-ARM-dts-imx23-olinuxino-mark-sdcard-cd-as-broken.patch
new file mode 100644
index 0000000..7ce42b9
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/linux-04-ARM-dts-imx23-olinuxino-mark-sdcard-cd-as-broken.patch
@@ -0,0 +1,28 @@
+From 1897fda94190498573f9d1b72bc6b7b58c720957 Mon Sep 17 00:00:00 2001
+From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
+Date: Sat, 6 Apr 2013 10:42:10 -0300
+Subject: [PATCH 1/1] ARM: dts: imx23-olinuxino: mark sdcard cd as broken
+
+The imx23-olinuxino sdcard doesn't have card detect.
+
+Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
+Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
+---
+ arch/arm/boot/dts/imx23-olinuxino.dts | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/boot/dts/imx23-olinuxino.dts b/arch/arm/boot/dts/imx23-olinuxino.dts
+index e7484e4..d107c4a 100644
+--- a/arch/arm/boot/dts/imx23-olinuxino.dts
++++ b/arch/arm/boot/dts/imx23-olinuxino.dts
+@@ -29,6 +29,7 @@
+ 				pinctrl-names = "default";
+ 				pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_pins_fixup>;
+ 				bus-width = <4>;
++				broken-cd;
+ 				status = "okay";
+ 			};
+
+--
+1.8.1.5
+
diff --git a/board/olimex/imx233_olinuxino/linux-3.9.config b/board/olimex/imx233_olinuxino/linux-3.9.config
new file mode 100644
index 0000000..eceee98
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/linux-3.9.config
@@ -0,0 +1,188 @@
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_PERF_EVENTS=y
+# CONFIG_COMPAT_BRK is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_BLK_DEV_INTEGRITY=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_ARCH_MXS=y
+CONFIG_MACH_MXS_DT=y
+CONFIG_ARM_THUMB=y
+CONFIG_PREEMPT_VOLUNTARY=y
+CONFIG_AEABI=y
+CONFIG_ATAGS=y
+CONFIG_CMDLINE="console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait"
+CONFIG_CMDLINE_FROM_BOOTLOADER=y
+CONFIG_AUTO_ZRELADDR=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_SYN_COOKIES=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+CONFIG_CAN=m
+CONFIG_CAN_RAW=m
+CONFIG_CAN_BCM=m
+CONFIG_CAN_FLEXCAN=m
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_DATAFLASH=y
+CONFIG_MTD_M25P80=y
+# CONFIG_M25PXX_USE_FAST_READ is not set
+CONFIG_MTD_SST25L=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_GPMI_NAND=y
+CONFIG_MTD_UBI=y
+# CONFIG_BLK_DEV is not set
+CONFIG_EEPROM_AT24=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_NETDEVICES=y
+CONFIG_ENC28J60=y
+CONFIG_USB_USBNET=y
+CONFIG_USB_NET_SMSC95XX=y
+CONFIG_SMSC_PHY=y
+CONFIG_ICPLUS_PHY=y
+CONFIG_REALTEK_PHY=y
+CONFIG_MICREL_PHY=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_EVDEV=m
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_TSC2007=m
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_DEVKMEM is not set
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_MXS_AUART=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
+# CONFIG_I2C_COMPAT is not set
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MXS=y
+CONFIG_SPI=y
+CONFIG_SPI_GPIO=m
+CONFIG_SPI_MXS=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_GPIO_SYSFS=y
+# CONFIG_HWMON is not set
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_FB=y
+CONFIG_FB_MXS=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FONTS=y
+CONFIG_LOGO=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y
+CONFIG_SND_MXS_SOC=y
+CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_MXS_PHY=y
+CONFIG_MMC=y
+CONFIG_MMC_MXS=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_DS1307=m
+CONFIG_RTC_DRV_STMP=y
+CONFIG_DMADEVICES=y
+CONFIG_MXS_DMA=y
+CONFIG_STAGING=y
+CONFIG_MXS_LRADC=y
+CONFIG_IIO_SYSFS_TRIGGER=y
+CONFIG_COMMON_CLK_DEBUG=y
+CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_MXS=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_FSCACHE=m
+CONFIG_FSCACHE_STATS=y
+CONFIG_CACHEFILES=m
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_JFFS2_FS=y
+CONFIG_JFFS2_COMPRESSION_OPTIONS=y
+CONFIG_JFFS2_LZO=y
+CONFIG_JFFS2_RUBIN=y
+CONFIG_UBIFS_FS=y
+CONFIG_UBIFS_FS_ADVANCED_COMPR=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_CODEPAGE_850=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_ISO8859_15=y
+CONFIG_PRINTK_TIME=y
+CONFIG_FRAME_WARN=2048
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_UNUSED_SYMBOLS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_TIMER_STATS=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_DEBUG_INFO=y
+CONFIG_BLK_DEV_IO_TRACE=y
+CONFIG_STRICT_DEVMEM=y
+CONFIG_DEBUG_USER=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_HW is not set
+CONFIG_CRC_ITU_T=m
+CONFIG_CRC7=m
diff --git a/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch b/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
new file mode 100644
index 0000000..91b57c3
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
@@ -0,0 +1,122 @@
+Forward-ported patch from https://github.com/koliqi/imx23-olinuxino
+for mxs-bootlets-10.12.01
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura imx-bootlets-src-10.12.01/linux_prep/board/imx23_olinuxino_dev.c imx-bootlets-src-10.12.01-olinuxino/linux_prep/board/imx23_olinuxino_dev.c
+--- imx-bootlets-src-10.12.01/linux_prep/board/imx23_olinuxino_dev.c	1969-12-31 21:00:00.000000000 -0300
++++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/board/imx23_olinuxino_dev.c	2013-05-17 15:07:33.282961551 -0300
+@@ -0,0 +1,54 @@
++/*
++ * Platform specific data for the IMX23_OLINUXINO development board
++ *
++ * Fadil Berisha <fadil.r.berisha@gmail.com>
++ *
++ * Copyright 2008 SigmaTel, Inc
++ * Copyright 2008 Embedded Alley Solutions, Inc
++ * Copyright 2009-2010 Freescale Semiconductor, Inc. All Rights Reserved.
++ *
++ * This file is licensed under the terms of the GNU General Public License
++ * version 2. This program is licensed "as is" without any warranty of any
++ * kind, whether express or implied.
++ *
++ * http://www.opensource.org/licenses/gpl-license.html
++ * http://www.gnu.org/copyleft/gpl.html
++ */
++#include <setup.h>
++#include <keys.h>
++#include <lradc_buttons.h>
++
++/************************************************
++ * LRADC keyboard data *
++ ************************************************/
++int lradc_keypad_ch = LRADC_CH0;
++int lradc_vddio_ch = LRADC_CH6;
++
++struct lradc_keycode lradc_keycodes[] = {
++ { 100, KEY4 },
++ { 306, KEY5 },
++ { 601, KEY6 },
++ { 932, KEY7 },
++ { 1260, KEY8 },
++ { 1424, KEY9 },
++ { 1707, KEY10 },
++ { 2207, KEY11 },
++ { 2525, KEY12 },
++ { 2831, KEY13 },
++ { 3134, KEY14 },
++ { -1, 0 },
++};
++
++/************************************************
++ * Magic key combinations for Armadillo *
++ ************************************************/
++u32 magic_keys[MAGIC_KEY_NR] = {
++ [MAGIC_KEY1] = KEY4,
++ [MAGIC_KEY2] = KEY6,
++ [MAGIC_KEY3] = KEY10,
++};
++
++/************************************************
++ * Default command line *
++ ************************************************/
++char cmdline_def[] = "console=ttyAMA0,115200";
+diff -Nura imx-bootlets-src-10.12.01/linux_prep/cmdlines/imx23_olinuxino_dev.txt imx-bootlets-src-10.12.01-olinuxino/linux_prep/cmdlines/imx23_olinuxino_dev.txt
+--- imx-bootlets-src-10.12.01/linux_prep/cmdlines/imx23_olinuxino_dev.txt	1969-12-31 21:00:00.000000000 -0300
++++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/cmdlines/imx23_olinuxino_dev.txt	2013-05-17 15:07:49.663496106 -0300
+@@ -0,0 +1,3 @@
++noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait ssp1=mmc
++noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait ssp1=mmc
++noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait ssp1=mmc
+diff -Nura imx-bootlets-src-10.12.01/linux_prep/core/setup.c imx-bootlets-src-10.12.01-olinuxino/linux_prep/core/setup.c
+--- imx-bootlets-src-10.12.01/linux_prep/core/setup.c	2010-11-04 04:35:38.000000000 -0300
++++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/core/setup.c	2013-05-17 15:08:39.246114205 -0300
+@@ -84,6 +84,8 @@
+ #include "../../mach-mx28/includes/registers/regsrtc.h"
+ #elif defined(STMP378X)
+ #include "../../mach-mx23/includes/registers/regsrtc.h"
++#elif defined(IMX23_OLINUXINO)
++#include "../../mach-mx23/includes/registers/regsrtc.h"
+ #endif
+
+ #define NAND_SECONDARY_BOOT          0x00000002
+diff -Nura imx-bootlets-src-10.12.01/linux_prep/include/mx23/platform.h imx-bootlets-src-10.12.01-olinuxino/linux_prep/include/mx23/platform.h
+--- imx-bootlets-src-10.12.01/linux_prep/include/mx23/platform.h	2010-11-04 04:35:38.000000000 -0300
++++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/include/mx23/platform.h	2013-05-17 15:09:21.006476997 -0300
+@@ -19,6 +19,8 @@
+
+ #if defined (BOARD_STMP378X_DEV)
+ #define	MACHINE_ID	0xa45
++#elif defined (BOARD_IMX23_OLINUXINO_DEV)
++#define MACHINE_ID	0x1009
+ #else
+ #error "Allocate a machine ID for your board"
+ #endif
+diff -Nura imx-bootlets-src-10.12.01/linux_prep/Makefile imx-bootlets-src-10.12.01-olinuxino/linux_prep/Makefile
+--- imx-bootlets-src-10.12.01/linux_prep/Makefile	2010-11-04 04:35:38.000000000 -0300
++++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/Makefile	2013-05-17 15:09:53.554539143 -0300
+@@ -69,6 +69,11 @@
+ HW_OBJS = $(LRADC_OBJS)
+ CFLAGS += -DMX28 -DBOARD_MX28_EVK
+ endif
++ifeq ($(BOARD), imx23_olinuxino_dev)
++ARCH = mx23
++HW_OBJS = $(LRADC_OBJS)
++CFLAGS += -DIMX23_OLINUXINO -DBOARD_IMX23_OLINUXINO_DEV
++endif
+
+ # Generic code
+ CORE_OBJS = entry.o resume.o cmdlines.o setup.o keys.o
+diff -Nura imx-bootlets-src-10.12.01/Makefile imx-bootlets-src-10.12.01-olinuxino/Makefile
+--- imx-bootlets-src-10.12.01/Makefile	2010-11-04 04:35:38.000000000 -0300
++++ imx-bootlets-src-10.12.01-olinuxino/Makefile	2013-05-17 15:23:53.709956619 -0300
+@@ -16,6 +16,9 @@
+ ifeq ($(BOARD), iMX28_EVK)
+ ARCH = mx28
+ endif
++ifeq ($(BOARD), imx23_olinuxino_dev)
++ARCH = mx23
++endif
+
+ all: build_prep gen_bootstream
+
diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
new file mode 100644
index 0000000..fa3f9e1
--- /dev/null
+++ b/board/olimex/imx233_olinuxino/readme.txt
@@ -0,0 +1,55 @@
+This configuration is intended as a base image, it doesn't have support
+for things like WiFi, either in the kernel or packages.
+
+It also pulls up the console on the serial port, not on TV output.
+
+You'll need a spare MicroSD card with Freescale's special partition layout.
+This is basically two partitions:
+
+1) Type 53, the bootstrap + bootloader/kernel partition, should be 16MB.
+2) Anything you like, for this example an ext2 partition, type 83 (linux).
+
+Assuming you see your MicroSD card as /dev/sdc you'd need to do, as root
+and from the buildroot project top level directory:
+(remember to replace /dev/sdc* with the appropiate device name!)
+
+***** WARNING: Double check that /dev/sdc is your MicroSD card *****
+*****      It might be /dev/sdb or some other device name      *****
+***** Failure to do so may result in you wiping your hard disk *****
+
+1. Unmount the filesystem(s) if they're already mounted, usually...
+
+   # for fs in `grep /dev/sdc /proc/mounts|cut -d ' ' -f 1`;do umount $fs;done
+
+   ...should work
+
+2. Blank the partition table out
+
+   # dd if=/dev/zero of=/dev/sdc bs=1024 count=1024
+
+3. Set up the partitions
+
+   # fdisk /dev/sdc
+   n
+   p
+   1
+   <ENTER>
+   +16MB
+   t
+   53
+   n
+   p
+   2
+   <ENTER>
+   <ENTER>
+   w
+
+4. Fill up the first (bootstrap + kernel) partition
+   # dd if=output/images/imx23_olinuxino_dev_linux.sb bs=512 of=/dev/sdc1 seek=4
+
+5. Fill up the second (filesystem) partition
+   # dd if=output/images/rootfs.ext2 of=/dev/sdc2 bs=512
+
+6. Remove the MicroSD card from your linux PC and put it into your olinuxino.
+
+7. Boot! You're done!
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
new file mode 100644
index 0000000..206e468
--- /dev/null
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -0,0 +1,33 @@
+# Architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# Patches (mxs-bootlets)
+BR2_GLOBAL_PATCH_DIR="board/olimex/imx233_olinuxino"
+
+# System
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
+
+# Bootloader
+BR2_TARGET_MXS_BOOTLETS=y
+BR2_TARGET_MXS_BOOTLETS_CUSTOM_PATCH_DIR="board/olimex/imx233_olinuxino"
+BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD=y
+BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.4"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.9.config"
+BR2_LINUX_KERNEL_PATCH="board/olimex/imx233_olinuxino"
+BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
