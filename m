From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 23:53:14 +0100
Subject: [Buildroot] [git commit] configs/imx233_olinuxino: bump to the
	latest versions
Message-ID: <20131105231347.578957F922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27451eed521b433e123893bd9b72965820cd56d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also tweak the kernel and buildroot config for basic WiFi support.
And fetch the ASoC patches for builtin audio.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-01-mmc-mxs-mmc-add-cd-inverted-property.patch |   47 --------
 ...02-mmc-mxs-mmc-add-non-removable-property.patch |   53 ---------
 ...nux-03-mmc-mxs-mmc-add-broken-cd-property.patch |   50 ---------
 ...-imx23-olinuxino-mark-sdcard-cd-as-broken.patch |   28 -----
 .../{linux-3.9.config => linux-3.12.config}        |  111 +++++++++-----------
 .../mxs-bootlets/mxs-bootlets-01-olinuxino.patch   |    6 +-
 board/olimex/imx233_olinuxino/readme.txt           |    6 +-
 configs/olimex_imx233_olinuxino_defconfig          |   23 +++-
 8 files changed, 75 insertions(+), 249 deletions(-)

diff --git a/board/olimex/imx233_olinuxino/linux-01-mmc-mxs-mmc-add-cd-inverted-property.patch b/board/olimex/imx233_olinuxino/linux-01-mmc-mxs-mmc-add-cd-inverted-property.patch
deleted file mode 100644
index 6e58c8c..0000000
--- a/board/olimex/imx233_olinuxino/linux-01-mmc-mxs-mmc-add-cd-inverted-property.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 4c0c9be05004d1eb674b7586216b3d93cc04531c Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Wed, 10 Apr 2013 11:13:43 +0200
-Subject: [PATCH 1/3] mmc: mxs-mmc: add cd-inverted property
-
-The card-detect GPIO is inverted on some boards. Handle such case.
-
-Acked-by: Shawn Guo <shawn.guo@linaro.org>
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Signed-off-by: Chris Ball <cjb@laptop.org>
----
- drivers/mmc/host/mxs-mmc.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
-index 4efe302..0cdf1f6 100644
---- a/drivers/mmc/host/mxs-mmc.c
-+++ b/drivers/mmc/host/mxs-mmc.c
-@@ -72,6 +72,7 @@ struct mxs_mmc_host {
- 	int				sdio_irq_en;
- 	int				wp_gpio;
- 	bool				wp_inverted;
-+	bool				cd_inverted;
- };
-
- static int mxs_mmc_get_ro(struct mmc_host *mmc)
-@@ -96,7 +97,7 @@ static int mxs_mmc_get_cd(struct mmc_host *mmc)
- 	struct mxs_ssp *ssp = &host->ssp;
-
- 	return !(readl(ssp->base + HW_SSP_STATUS(ssp)) &
--		 BM_SSP_STATUS_CARD_DETECT);
-+		 BM_SSP_STATUS_CARD_DETECT)) ^ host->cd_inverted;
- }
-
- static void mxs_mmc_reset(struct mxs_mmc_host *host)
-@@ -691,6 +692,8 @@ static int mxs_mmc_probe(struct platform_device *pdev)
- 	if (flags & OF_GPIO_ACTIVE_LOW)
- 		host->wp_inverted = 1;
-
-+	host->cd_inverted = of_property_read_bool(np, "cd-inverted");
-+
- 	mmc->f_min = 400000;
- 	mmc->f_max = 288000000;
- 	mmc->ocr_avail = MMC_VDD_32_33 | MMC_VDD_33_34;
---
-1.8.1.5
-
diff --git a/board/olimex/imx233_olinuxino/linux-02-mmc-mxs-mmc-add-non-removable-property.patch b/board/olimex/imx233_olinuxino/linux-02-mmc-mxs-mmc-add-non-removable-property.patch
deleted file mode 100644
index f7446ca..0000000
--- a/board/olimex/imx233_olinuxino/linux-02-mmc-mxs-mmc-add-non-removable-property.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 5086e5f41fd107539911edf62f2d202753ed1980 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Wed, 10 Apr 2013 11:13:44 +0200
-Subject: [PATCH 2/3] mmc: mxs-mmc: add non-removable property
-
-Some boards have non removable cards like eMMC. Handle such case.
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Acked-by: Shawn Guo <shawn.guo@linaro.org>
-Signed-off-by: Chris Ball <cjb@laptop.org>
----
- drivers/mmc/host/mxs-mmc.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
-index 0cdf1f6..c231881 100644
---- a/drivers/mmc/host/mxs-mmc.c
-+++ b/drivers/mmc/host/mxs-mmc.c
-@@ -73,6 +73,7 @@ struct mxs_mmc_host {
- 	int				wp_gpio;
- 	bool				wp_inverted;
- 	bool				cd_inverted;
-+	bool				non_removable;
- };
-
- static int mxs_mmc_get_ro(struct mmc_host *mmc)
-@@ -96,8 +97,9 @@ static int mxs_mmc_get_cd(struct mmc_host *mmc)
- 	struct mxs_mmc_host *host = mmc_priv(mmc);
- 	struct mxs_ssp *ssp = &host->ssp;
-
--	return !(readl(ssp->base + HW_SSP_STATUS(ssp)) &
--		 BM_SSP_STATUS_CARD_DETECT)) ^ host->cd_inverted;
-+	return host->non_removable ||
-+		!(readl(ssp->base + HW_SSP_STATUS(ssp)) &
-+		  BM_SSP_STATUS_CARD_DETECT) ^ host->cd_inverted;
- }
-
- static void mxs_mmc_reset(struct mxs_mmc_host *host)
-@@ -687,8 +689,10 @@ static int mxs_mmc_probe(struct platform_device *pdev)
- 		mmc->caps |= MMC_CAP_4_BIT_DATA;
- 	else if (bus_width == 8)
- 		mmc->caps |= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA;
-+	host->non_removable = of_property_read_bool(np, "non-removable");
-+	if (host->non_removable)
-+		mmc->caps |= MMC_CAP_NONREMOVABLE;
- 	host->wp_gpio = of_get_named_gpio_flags(np, "wp-gpios", 0, &flags);
--
- 	if (flags & OF_GPIO_ACTIVE_LOW)
- 		host->wp_inverted = 1;
-
---
-1.8.1.5
-
diff --git a/board/olimex/imx233_olinuxino/linux-03-mmc-mxs-mmc-add-broken-cd-property.patch b/board/olimex/imx233_olinuxino/linux-03-mmc-mxs-mmc-add-broken-cd-property.patch
deleted file mode 100644
index b5ceb03..0000000
--- a/board/olimex/imx233_olinuxino/linux-03-mmc-mxs-mmc-add-broken-cd-property.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 1d53196a0d604fcf636203fac21e944b6a9cf275 Mon Sep 17 00:00:00 2001
-From: Hector Palacios <hector.palacios@digi.com>
-Date: Wed, 10 Apr 2013 11:13:45 +0200
-Subject: [PATCH 3/3] mmc: mxs-mmc: add broken-cd property
-
-According to bindings documentation for mmc, the property 'broken-cd'
-can be used to indicate card-detection is not available and polling
-must be used instead. This patch retrieves this property
-and sets a custom flag. On the get_cd() hook, it returns 1 if
-the flag is set, to always assume the card is present.
-
-Signed-off-by: Hector Palacios <hector.palacios@digi.com>
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Signed-off-by: Chris Ball <cjb@laptop.org>
----
- drivers/mmc/host/mxs-mmc.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
-index c231881..146a53b 100644
---- a/drivers/mmc/host/mxs-mmc.c
-+++ b/drivers/mmc/host/mxs-mmc.c
-@@ -73,6 +73,7 @@ struct mxs_mmc_host {
- 	int				wp_gpio;
- 	bool				wp_inverted;
- 	bool				cd_inverted;
-+	bool				broken_cd;
- 	bool				non_removable;
- };
-
-@@ -97,7 +98,7 @@ static int mxs_mmc_get_cd(struct mmc_host *mmc)
- 	struct mxs_mmc_host *host = mmc_priv(mmc);
- 	struct mxs_ssp *ssp = &host->ssp;
-
--	return host->non_removable ||
-+	return host->non_removable || host->broken_cd ||
- 		!(readl(ssp->base + HW_SSP_STATUS(ssp)) &
- 		  BM_SSP_STATUS_CARD_DETECT) ^ host->cd_inverted;
- }
-@@ -689,6 +690,7 @@ static int mxs_mmc_probe(struct platform_device *pdev)
- 		mmc->caps |= MMC_CAP_4_BIT_DATA;
- 	else if (bus_width == 8)
- 		mmc->caps |= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA;
-+	host->broken_cd = of_property_read_bool(np, "broken-cd");
- 	host->non_removable = of_property_read_bool(np, "non-removable");
- 	if (host->non_removable)
- 		mmc->caps |= MMC_CAP_NONREMOVABLE;
---
-1.8.1.5
-
diff --git a/board/olimex/imx233_olinuxino/linux-04-ARM-dts-imx23-olinuxino-mark-sdcard-cd-as-broken.patch b/board/olimex/imx233_olinuxino/linux-04-ARM-dts-imx23-olinuxino-mark-sdcard-cd-as-broken.patch
deleted file mode 100644
index 7ce42b9..0000000
--- a/board/olimex/imx233_olinuxino/linux-04-ARM-dts-imx23-olinuxino-mark-sdcard-cd-as-broken.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1897fda94190498573f9d1b72bc6b7b58c720957 Mon Sep 17 00:00:00 2001
-From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
-Date: Sat, 6 Apr 2013 10:42:10 -0300
-Subject: [PATCH 1/1] ARM: dts: imx23-olinuxino: mark sdcard cd as broken
-
-The imx23-olinuxino sdcard doesn't have card detect.
-
-Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
-Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
----
- arch/arm/boot/dts/imx23-olinuxino.dts | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm/boot/dts/imx23-olinuxino.dts b/arch/arm/boot/dts/imx23-olinuxino.dts
-index e7484e4..d107c4a 100644
---- a/arch/arm/boot/dts/imx23-olinuxino.dts
-+++ b/arch/arm/boot/dts/imx23-olinuxino.dts
-@@ -29,6 +29,7 @@
- 				pinctrl-names = "default";
- 				pinctrl-0 = <&mmc0_4bit_pins_a &mmc0_pins_fixup>;
- 				bus-width = <4>;
-+				broken-cd;
- 				status = "okay";
- 			};
-
---
-1.8.1.5
-
diff --git a/board/olimex/imx233_olinuxino/linux-3.9.config b/board/olimex/imx233_olinuxino/linux-3.12.config
similarity index 70%
rename from board/olimex/imx233_olinuxino/linux-3.9.config
rename to board/olimex/imx233_olinuxino/linux-3.12.config
index eceee98..f7b6aa6 100644
--- a/board/olimex/imx233_olinuxino/linux-3.9.config
+++ b/board/olimex/imx233_olinuxino/linux-3.12.config
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
@@ -12,6 +11,7 @@ CONFIG_IKCONFIG_PROC=y
 # CONFIG_IPC_NS is not set
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
+CONFIG_RELAY=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MODULES=y
@@ -22,15 +22,14 @@ CONFIG_MODVERSIONS=y
 CONFIG_BLK_DEV_INTEGRITY=y
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_MXS=y
-CONFIG_MACH_MXS_DT=y
-CONFIG_ARM_THUMB=y
+# CONFIG_ARM_THUMB is not set
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_AEABI=y
-CONFIG_ATAGS=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_CMDLINE="console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait"
-CONFIG_CMDLINE_FROM_BOOTLOADER=y
-CONFIG_AUTO_ZRELADDR=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -44,17 +43,14 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_INET_LRO is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
-CONFIG_CAN=m
-CONFIG_CAN_RAW=m
-CONFIG_CAN_BCM=m
-CONFIG_CAN_FLEXCAN=m
-# CONFIG_WIRELESS is not set
+CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
 CONFIG_MTD_M25P80=y
@@ -65,23 +61,30 @@ CONFIG_MTD_NAND_GPMI_NAND=y
 CONFIG_MTD_UBI=y
 # CONFIG_BLK_DEV is not set
 CONFIG_EEPROM_AT24=y
+CONFIG_EEPROM_93CX6=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
-CONFIG_ENC28J60=y
+# CONFIG_ETHERNET is not set
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
-CONFIG_SMSC_PHY=y
-CONFIG_ICPLUS_PHY=y
-CONFIG_REALTEK_PHY=y
-CONFIG_MICREL_PHY=y
-# CONFIG_WLAN is not set
+CONFIG_RTL8187=m
+CONFIG_ATH_CARDS=m
+CONFIG_ATH9K_HTC=m
+CONFIG_RT2X00=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+CONFIG_RT2800USB_UNKNOWN=y
+CONFIG_RTL_CARDS=m
+CONFIG_RTL8192CU=m
+# CONFIG_RTLWIFI_DEBUG is not set
+CONFIG_ZD1211RW=m
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_EVDEV=m
+CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_TSC2007=m
 # CONFIG_SERIO is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
@@ -98,9 +101,11 @@ CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_DEBUG_GPIO=y
+CONFIG_PTP_1588_CLOCK=y
 CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
+CONFIG_WATCHDOG=y
+CONFIG_STMP3XXX_RTC_WATCHDOG=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_FB=y
@@ -110,79 +115,63 @@ CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FONTS=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
+CONFIG_SND_HRTIMER=y
+# CONFIG_SND_SUPPORT_OLD_API is not set
+# CONFIG_SND_VERBOSE_PROCFS is not set
+# CONFIG_SND_DRIVERS is not set
+# CONFIG_SND_ARM is not set
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
-CONFIG_SND_MXS_SOC=y
-CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_MXS_SOC_BUILTIN=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_STORAGE=y
+CONFIG_USB_PHY=y
 CONFIG_USB_MXS_PHY=y
 CONFIG_MMC=y
+CONFIG_MMC_UNSAFE_RESUME=y
 CONFIG_MMC_MXS=y
-CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_ONESHOT=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_BACKLIGHT=y
 CONFIG_LEDS_TRIGGER_GPIO=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_STMP=y
 CONFIG_DMADEVICES=y
 CONFIG_MXS_DMA=y
 CONFIG_STAGING=y
 CONFIG_MXS_LRADC=y
-CONFIG_IIO_SYSFS_TRIGGER=y
-CONFIG_COMMON_CLK_DEBUG=y
 CONFIG_IIO=y
+CONFIG_IIO_SYSFS_TRIGGER=y
 CONFIG_PWM=y
 CONFIG_PWM_MXS=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT3_FS=y
 CONFIG_EXT4_FS=y
-# CONFIG_DNOTIFY is not set
-CONFIG_FSCACHE=m
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_JFFS2_FS=y
-CONFIG_JFFS2_COMPRESSION_OPTIONS=y
-CONFIG_JFFS2_LZO=y
-CONFIG_JFFS2_RUBIN=y
-CONFIG_UBIFS_FS=y
-CONFIG_UBIFS_FS_ADVANCED_COMPR=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_CODEPAGE_850=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_ISO8859_15=y
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_FRAME_WARN=2048
-CONFIG_MAGIC_SYSRQ=y
 CONFIG_UNUSED_SYMBOLS=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_LOCKUP_DETECTOR=y
-CONFIG_TIMER_STATS=y
-CONFIG_PROVE_LOCKING=y
-CONFIG_DEBUG_INFO=y
-CONFIG_BLK_DEV_IO_TRACE=y
+CONFIG_DEBUG_FS=y
 CONFIG_STRICT_DEVMEM=y
 CONFIG_DEBUG_USER=y
+CONFIG_KEYS=y
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_HW is not set
-CONFIG_CRC_ITU_T=m
+CONFIG_CRYPTO_DEV_DCP=y
+CONFIG_CRC_CCITT=y
+CONFIG_CRC_ITU_T=y
 CONFIG_CRC7=m
+CONFIG_FONTS=y
diff --git a/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch b/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
index 91b57c3..54c3ca0 100644
--- a/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
+++ b/board/olimex/imx233_olinuxino/mxs-bootlets/mxs-bootlets-01-olinuxino.patch
@@ -65,9 +65,9 @@ diff -Nura imx-bootlets-src-10.12.01/linux_prep/cmdlines/imx23_olinuxino_dev.txt
 --- imx-bootlets-src-10.12.01/linux_prep/cmdlines/imx23_olinuxino_dev.txt	1969-12-31 21:00:00.000000000 -0300
 +++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/cmdlines/imx23_olinuxino_dev.txt	2013-05-17 15:07:49.663496106 -0300
 @@ -0,0 +1,3 @@
-+noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait ssp1=mmc
-+noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait ssp1=mmc
-+noinitrd console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait ssp1=mmc
++console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait
++console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait
++console=ttyAMA0,115200 root=/dev/mmcblk0p2 rw rootwait
 diff -Nura imx-bootlets-src-10.12.01/linux_prep/core/setup.c imx-bootlets-src-10.12.01-olinuxino/linux_prep/core/setup.c
 --- imx-bootlets-src-10.12.01/linux_prep/core/setup.c	2010-11-04 04:35:38.000000000 -0300
 +++ imx-bootlets-src-10.12.01-olinuxino/linux_prep/core/setup.c	2013-05-17 15:08:39.246114205 -0300
diff --git a/board/olimex/imx233_olinuxino/readme.txt b/board/olimex/imx233_olinuxino/readme.txt
index fa3f9e1..1c36a61 100644
--- a/board/olimex/imx233_olinuxino/readme.txt
+++ b/board/olimex/imx233_olinuxino/readme.txt
@@ -1,5 +1,7 @@
-This configuration is intended as a base image, it doesn't have support
-for things like WiFi, either in the kernel or packages.
+This configuration is intended as a base image.
+It includes kernel and firmware support for the common USB WiFi hardware.
+Packages for WiFi support are up to the user, you'll probably want
+one or more of: hostapd, iw, wireless_tools and/or wpa_supplicant.
 
 It also pulls up the console on the serial port, not on TV output.
 
diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 206e468..e43ee08 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -13,8 +13,9 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.9 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_9=y
+# Lock headers version to match and avoid breakage
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.12"
 
 # Bootloader
 BR2_TARGET_MXS_BOOTLETS=y
@@ -25,9 +26,21 @@ BR2_TARGET_MXS_BOOTLETS_CUSTOM_BOARD_NAME="imx23_olinuxino_dev"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.9.config"
-BR2_LINUX_KERNEL_PATCH="board/olimex/imx233_olinuxino"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/imx233_olinuxino/linux-3.12.config"
+BR2_LINUX_KERNEL_PATCH="http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/101-soc-audio-dts.patch http://github.com/koliqi/imx23-olinuxino/raw/3.12-rc2/kernel/ASoC_driver_for_i.MX233.patch"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-olinuxino"
+
+# For automatic firmware loading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# Firmware for WiFi
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010=y
+BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT73=y
+BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
+BR2_PACKAGE_ZD1211_FIRMWARE=y
