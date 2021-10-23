Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC2DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:13:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5125460FBF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5125460FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AE9B403F3;
	Sat, 23 Oct 2021 07:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUWALPh6Kc05; Sat, 23 Oct 2021 07:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F421403F7;
	Sat, 23 Oct 2021 07:13:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B93DA1BF349
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9865E81A29
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEnjYtnoqVXB for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 07:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4AD181CE9
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 07:12:35 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s19so1992140wra.2
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 00:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lmeIt7huN4h9R01nTiGzQbpamPXdpyE7D7qmdRfEJb0=;
 b=HDe5ndk4NLRvg+ICoTwWEn+0D++2+1s3Q5FZNvks36wzdUVxms4IFr1SFPDSizGYCU
 apbd+jeoIH+VTQnPxyvSBHBCS94/yCCa1cBQDlyFJL1KuUv/8kb6vyaEME9GHy/6MtGP
 FfKtmwQhJsrGzWW1HoN1NzKInzFPgKwL/JysQrLjfM+zoOWDPYvKv58NSZDsjbBC/ZcC
 gUpH7Puph7lMz8MyY35SGcjqvj51aXfDURy0LKtjOYwWz0GW+b9aGf9HLmz4B1IuDrQ3
 h/V2tg4DHPbKtvGGQSHMw9+SnSJ58j09NdVVS27tv0mxE+Kg9176ZwxlcPRgzcGv4rrp
 hfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmeIt7huN4h9R01nTiGzQbpamPXdpyE7D7qmdRfEJb0=;
 b=lrQSRW6rnzIF2wclNqOPx60VJCDq5OgpZItL3Y/AFaghFc3rPAVK5xMbfrzF1j4Tq2
 oIQ402u7pZdJ9dPiojwSnYWP6nGRmUE/j47BkgamULZna217TsM3gt0uO4ZBVH3Q5uxV
 W2Il0sh9wcnZV41UvUjyno1LnSlLEPYuygHSpIDwGROett2KYwXtgsSXDhC6J1N9amL4
 iy0K2/oifV1xQf3zrRRcOak5Qw1RdQfxzrhLEDj6OiFOA8UVx8OLoop6pV9cebA4sirg
 Qm/cWSBEBg1Z1tYn3DTTwufBOdnVSmONAmfRxRy+fxaiok2Hc8StUIYy2BRxLTePmnxQ
 C2AQ==
X-Gm-Message-State: AOAM532jsUmX6X0Z9bnhzNSioL1lFxJBseL6iCS7CcpMnG45ay7K+U5X
 TaWTCkC00i5YED/TTPW5PbmDKcd9TDc=
X-Google-Smtp-Source: ABdhPJyUbOX6ZX9ziGUIQYZJygsICKYl1qXOJicQDmx9/iGyV11gAXNsKY0tmoDDUEB5kDMGRfpq8w==
X-Received: by 2002:a5d:564d:: with SMTP id j13mr5775886wrw.402.1634973154058; 
 Sat, 23 Oct 2021 00:12:34 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o1sm1211223wru.91.2021.10.23.00.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 00:12:33 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Oct 2021 09:12:01 +0200
Message-Id: <20211023071201.1016688-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211023071201.1016688-1-francois.perrad@gadz.org>
References: <20211023071201.1016688-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] board/stmicroelectronics/stm32mp157*-dk*:
 cleanup linux config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../stm32mp157a-dk1/linux.config              | 209 ++++++++++++------
 .../stm32mp157c-dk2/linux-dk2.fragment        |   6 +
 2 files changed, 150 insertions(+), 65 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
index eed6ba034..8b474650d 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/linux.config
+++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
@@ -1,3 +1,7 @@
+
+#
+# General setup
+#
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_USELIB=y
@@ -6,109 +10,149 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
+
+#
+# System Type
+#
 CONFIG_ARCH_STM32=y
 CONFIG_ARM_THUMBEE=y
-# CONFIG_CACHE_L2X0 is not set
 CONFIG_ARM_ERRATA_430973=y
-CONFIG_ARM_ERRATA_720789=y
-CONFIG_ARM_ERRATA_754322=y
-CONFIG_ARM_ERRATA_754327=y
-CONFIG_ARM_ERRATA_764369=y
-CONFIG_ARM_ERRATA_775420=y
-CONFIG_ARM_ERRATA_798181=y
+
+#
+# Kernel Features
+#
 CONFIG_SMP=y
-CONFIG_MCPM=y
-CONFIG_HIGHMEM=y
-CONFIG_FORCE_MAX_ZONEORDER=12
-CONFIG_SECCOMP=y
-# CONFIG_ATAGS is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_ARM_APPENDED_DTB=y
-CONFIG_ARM_ATAG_DTB_COMPAT=y
+
+#
+# Floating point emulation
+#
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
+
+#
+# Cryptographic API
+#
 CONFIG_ARM_CRYPTO=y
+
+#
+# General architecture-dependent options
+#
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_CMDLINE_PARTITION=y
-CONFIG_CMA=y
+
+#
+# Networking options
+#
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+
+#
+# CAN Device Drivers
+#
 CONFIG_CAN=y
 CONFIG_CAN_M_CAN=y
+
+#
+# Generic Driver Options
+#
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_DMA_CMA=y
-CONFIG_CMA_SIZE_MBYTES=128
-CONFIG_SIMPLE_PM_BUS=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_STM32_FMC2=y
-CONFIG_MTD_SPI_NOR=y
-# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
-CONFIG_MTD_UBI=y
+
+#
+# Block devices
+#
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_BLK_DEV_RAM_COUNT=4
+
+#
+# Misc devices
+#
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
+
+#
+# Network device support
+#
 CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_KS8851=y
-CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
-CONFIG_DWMAC_DWC_QOS_ETH=y
-CONFIG_MDIO_BITBANG=y
-CONFIG_INPUT_JOYDEV=y
+
+#
+# Input device support
+#
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_STPMIC1_ONKEY=y
+
+#
+# Character devices
+#
 CONFIG_SERIAL_STM32=y
 CONFIG_SERIAL_STM32_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
+
+#
+# I2C support
+#
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_STM32F7=y
+
+#
+# SPI support
+#
 CONFIG_SPI=y
 CONFIG_SPI_STM32=y
 CONFIG_SPI_STM32_QSPI=y
+
+#
+# Pin controllers
+#
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_PINCTRL_STMFX=y
+
+#
+# Board level reset or power off
+#
 CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_GPIO=y
-CONFIG_POWER_RESET_GPIO_RESTART=y
-CONFIG_POWER_RESET_SYSCON=y
-CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_SYSCON_REBOOT_MODE=y
+
+#
+# Watchdog Timer Support
+#
 CONFIG_WATCHDOG=y
 CONFIG_STPMIC1_WATCHDOG=y
+
+#
+# Multifunction device drivers
+#
 CONFIG_MFD_STM32_LPTIMER=y
 CONFIG_MFD_STPMIC1=y
+
+#
+# Voltage and Current Regulator Support
+#
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_STM32_VREFBUF=y
 CONFIG_REGULATOR_STM32_PWR=y
 CONFIG_REGULATOR_STPMIC1=y
+
+#
+# Graphics support
+#
 CONFIG_DRM=y
 CONFIG_DRM_STM=y
 CONFIG_DRM_STM_DSI=y
 CONFIG_DRM_SII902X=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_DYNAMIC_MINORS=y
+
+#
+# USB support
+#
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
@@ -117,58 +161,93 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_DWC2=y
-CONFIG_USB_CHIPIDEA=y
-CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_ISP1760=y
-CONFIG_USB_HSIC_USB3503=y
-CONFIG_USB_GPIO_VBUS=y
-CONFIG_USB_ISP1301=y
-CONFIG_USB_ULPI=y
 CONFIG_TYPEC=y
-CONFIG_TYPEC_STUSB=y
+CONFIG_TYPEC_STUSB160X=y
+
+#
+# MMC/SD/SDIO card support
+#
 CONFIG_MMC=y
-CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_DW=y
+
+#
+# LED drivers
+#
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
+
+#
+# Real Time Clock
+#
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_STM32=y
+
+#
+# DMA Devices
+#
 CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
 CONFIG_STM32_DMAMUX=y
 CONFIG_STM32_MDMA=y
+
+#
+# Hardware Spinlock drivers
+#
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
+
+#
+# Mailbox Hardware Support
+#
 CONFIG_STM32_IPCC=y
+
+#
+# Remoteproc drivers
+#
 CONFIG_REMOTEPROC=y
 CONFIG_STM32_RPROC=y
-CONFIG_RPMSG_VIRTIO=y
-CONFIG_RPMSG_TTY=y
+
+#
+# Industrial I/O support
+#
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
 CONFIG_SD_ADC_MODULATOR=y
 CONFIG_STM32_ADC_CORE=y
 CONFIG_STM32_ADC=y
-CONFIG_STM32_ADC_TEMP=y
 CONFIG_STM32_DFSDM_ADC=y
-CONFIG_STM32_LPTIMER_CNT=y
 CONFIG_STM32_DAC=y
 CONFIG_IIO_HRTIMER_TRIGGER=y
 CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+
+#
+# PWM Support
+#
 CONFIG_PWM=y
 CONFIG_PWM_STM32=y
 CONFIG_PWM_STM32_LP=y
+
+#
+# NVMEM Support
+#
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_NVMEM_STM32_ROMEM=y
+
+#
+# File systems
+#
 CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+
+#
+# Kernel hacking
+#
 CONFIG_PRINTK_TIME=y
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment b/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment
index 44c494436..b60283c48 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment
+++ b/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment
@@ -1,7 +1,13 @@
 
+#
+# Input device support
+#
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 
+#
+# Graphics support
+#
 CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
