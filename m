Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D23EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 17:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9886023B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 17:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD9886023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832E9607F1;
	Mon, 25 Oct 2021 17:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3Wa266PFT6R; Mon, 25 Oct 2021 17:05:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD59607F2;
	Mon, 25 Oct 2021 17:05:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47FC31BF334
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 17:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3622680A06
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 17:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQVUIl1xIqOH for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 17:05:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 370F0801DE
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 17:05:38 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r4so1995202edi.5
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkZbCvmFTL/vsHmfUDxhi0aTqKCuwmPG7aJyU1CgZAY=;
 b=WWlR/1GxV7F3BvBOeCPOkqOzvOWBUWyy317AIU/S8o+sgjm9fyUZvYz1A1epr/in4x
 rWk4qLCE+F/tUnQNeOy5UFcwOQB9OxZ/B65mBa6MOc7R3//xsODk12BKMS3t02BNNs2o
 WlehiR23XLm0QrXiQLpPaufzHCEY1cTaKusy67A9SrnH6m1F0yGDFEqndax/TgZeAm/6
 /zsHlufYuqUTFsaDDU05P0FNLrK2tPbvdSp0BVWRIEXx1WCWgjnInqI4Lysb6eu62kQm
 qdCmH2eoBiTnajq7rCoS6Cv0PKMatkqnWCDFGzNFjhBahoo2Bh5e8KVab87D4qiTWX5Q
 w/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkZbCvmFTL/vsHmfUDxhi0aTqKCuwmPG7aJyU1CgZAY=;
 b=mHUI0sBWXJOMggJAgiPKHy2bfjGieYCZUyRNvInbaBxKJdvWKHPIDI5tnXMUSs3G80
 9h4PZNOoI9BW9TApIVzlrNRAQRxl7cS2vzj4Ux4i+PBVtxxS+DgBNmVkK58AIKAzIuP+
 MOu9mgQlnPmoa4Gb+JmFQyZdMKpy0HqOY4g+G1XQYL4DBrt/1//bJNBoPQjYXiv2AqUo
 1+K+sauJdIBWS5sVUqLDU1gKwTOkZcXuqY8SBO2u/5WKpTWOuyn19fLWpXIyaimzrf4u
 V0LFOLRnTIg1VzhUFNdqb/P2N1NDJd+HeN39EXNnnVWLYstQSj2jtRmmOWLse1dTAQxs
 VOcA==
X-Gm-Message-State: AOAM530Ekp4UlAaW2EI8gP7uGGSNE/S5XuPfTWLO1BH+zsNvHqaD1gaB
 ZnMEuIUWC3nTroyOtb9n/UvwPfX5V58=
X-Google-Smtp-Source: ABdhPJxKPEfRw1qIAhEEBT2hosePpqJbJS1GPChBgibegLN/nARDKeokXqlPjmIaaNHRujWvhutAXg==
X-Received: by 2002:a50:ec06:: with SMTP id g6mr18440854edr.144.1635181535299; 
 Mon, 25 Oct 2021 10:05:35 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id qf38sm1439325ejc.116.2021.10.25.10.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:05:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 19:05:20 +0200
Message-Id: <20211025170520.1086081-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] board/stmicroelectronics/stm32mp157*-dk*:
 cleanup linux.config
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

note:
- AFAIK, the HDMI ouput never works on DK1 & DK2
- AFAIK, the status of BT & Wifi on DK2 is unknown

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../stm32mp157a-dk1/linux.config              | 75 +------------------
 .../stm32mp157c-dk2/linux.config              | 69 +----------------
 2 files changed, 8 insertions(+), 136 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
index 95c834e43..6bec8d73d 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/linux.config
+++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
@@ -6,39 +6,20 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
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
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_ARM_CRYPTO=y
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_CMDLINE_PARTITION=y
-CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -47,34 +28,13 @@ CONFIG_CAN=y
 CONFIG_CAN_M_CAN=y
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
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
 CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_KS8851=y
-CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
-CONFIG_DWMAC_DWC_QOS_ETH=y
-CONFIG_MDIO_BITBANG=y
-CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_STPMIC1_ONKEY=y
 CONFIG_SERIAL_STM32=y
@@ -82,19 +42,12 @@ CONFIG_SERIAL_STM32_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_STM32F7=y
 CONFIG_SPI=y
 CONFIG_SPI_STM32=y
 CONFIG_SPI_STM32_QSPI=y
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_PINCTRL_STMFX=y
 CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_GPIO=y
-CONFIG_POWER_RESET_GPIO_RESTART=y
-CONFIG_POWER_RESET_SYSCON=y
-CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_SYSCON_REBOOT_MODE=y
 CONFIG_WATCHDOG=y
 CONFIG_STPMIC1_WATCHDOG=y
 CONFIG_MFD_STM32_LPTIMER=y
@@ -107,13 +60,6 @@ CONFIG_REGULATOR_STPMIC1=y
 CONFIG_DRM=y
 CONFIG_DRM_STM=y
 CONFIG_DRM_STM_DSI=y
-# CONFIG_DRM_PANEL_ORISETECH_OTM8009A is not set
-# CONFIG_DRM_SII902X is not set
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
-# CONFIG_LCD_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
-# CONFIG_BACKLIGHT_GENERIC is not set
-# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_DYNAMIC_MINORS=y
@@ -125,18 +71,9 @@ CONFIG_USB_EHCI_HCD=y
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
 CONFIG_MMC=y
-CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
@@ -156,16 +93,12 @@ CONFIG_HWSPINLOCK_STM32=y
 CONFIG_STM32_IPCC=y
 CONFIG_REMOTEPROC=y
 CONFIG_STM32_RPROC=y
-CONFIG_RPMSG_VIRTIO=y
-CONFIG_RPMSG_TTY=y
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
@@ -175,7 +108,7 @@ CONFIG_PWM_STM32_LP=y
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_NVMEM_STM32_ROMEM=y
 CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux.config b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
index 878a0c39f..d640195b8 100644
--- a/board/stmicroelectronics/stm32mp157c-dk2/linux.config
+++ b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
@@ -6,39 +6,20 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
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
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_ARM_CRYPTO=y
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_CMDLINE_PARTITION=y
-CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -47,31 +28,12 @@ CONFIG_CAN=y
 CONFIG_CAN_M_CAN=y
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
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
 CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_KS8851=y
-CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
-CONFIG_DWMAC_DWC_QOS_ETH=y
-CONFIG_MDIO_BITBANG=y
-CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
@@ -82,19 +44,12 @@ CONFIG_SERIAL_STM32_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_STM32F7=y
 CONFIG_SPI=y
 CONFIG_SPI_STM32=y
 CONFIG_SPI_STM32_QSPI=y
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_PINCTRL_STMFX=y
 CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_GPIO=y
-CONFIG_POWER_RESET_GPIO_RESTART=y
-CONFIG_POWER_RESET_SYSCON=y
-CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_SYSCON_REBOOT_MODE=y
 CONFIG_WATCHDOG=y
 CONFIG_STPMIC1_WATCHDOG=y
 CONFIG_MFD_STM32_LPTIMER=y
@@ -109,10 +64,7 @@ CONFIG_DRM_STM=y
 CONFIG_DRM_STM_DSI=y
 CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
 CONFIG_DRM_SII902X=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_SOUND=y
 CONFIG_SND=y
@@ -125,18 +77,9 @@ CONFIG_USB_EHCI_HCD=y
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
 CONFIG_MMC=y
-CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
@@ -156,16 +99,12 @@ CONFIG_HWSPINLOCK_STM32=y
 CONFIG_STM32_IPCC=y
 CONFIG_REMOTEPROC=y
 CONFIG_STM32_RPROC=y
-CONFIG_RPMSG_VIRTIO=y
-CONFIG_RPMSG_TTY=y
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
@@ -175,7 +114,7 @@ CONFIG_PWM_STM32_LP=y
 CONFIG_PHY_STM32_USBPHYC=y
 CONFIG_NVMEM_STM32_ROMEM=y
 CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
