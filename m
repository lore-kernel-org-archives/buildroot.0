Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D0BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:12:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5766960FBF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5766960FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDF1403F8;
	Sat, 23 Oct 2021 07:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y-WDy2ARsg53; Sat, 23 Oct 2021 07:12:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FE240407;
	Sat, 23 Oct 2021 07:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD661BF349
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F20C81A29
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPvbhZImIg9o for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 07:12:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42DA681CA0
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 07:12:34 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a16so822681wrh.12
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GpCs5K1o5YVlwMVTZ7sXCbMN5/cw94lmgTDi08trVgY=;
 b=Af4y3SfEN4VBSq3HxCddtp4xIRbZkSUChh+ezxXUO84RzaSXOTrn+2O8V2D35XUmrU
 TSYgT06xBPf07gJiE+XcPLbdQUwxEDETUMjK8LO7wUPIMm8YODiEFNZZlEZ6HSpLCS7a
 xvpv4hzFBXwKYxXmg8Pfb3yE2/fQrYkTVLrm6YqG/+SqwA2nrmvzSfZnfUd25yR422Xp
 BdwmAax/HOxnXlTixYv1xkyg+9Dr+MIU9gjWVGxQIj/xqxrdiaVoqG3f0TAy/XKrKSx8
 bCGXaofJu1EpWGgv9e6wBmy1BWG+4OWCBMSD/kNxCBYJKUqQE22o0dhTWlqW2OZh4Oyq
 QCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpCs5K1o5YVlwMVTZ7sXCbMN5/cw94lmgTDi08trVgY=;
 b=K+NkaLnfDS7AyQPTE7+kk5GVkJYR+sQICAihR7x2C4tEFHftGn/CW+v/z9tktaD5kt
 y6e3+tz/tXBlN0P4K7x7HiifNJ3WJkJskqMNgWz95jjR/6bb7A2rjoZGJWuuH1Frfzp3
 Nu20mQzVnKolhtMPKytSg67YQbTQBEOKNurTr20sQ+B2eyQX4qhRL2YqT3Rq9Ss23ooO
 I0j36Kl6rw/HUe3Vaxcqxvw9iLojLD9FUF/oIqUKROvoTMlTIh1uNbXPcx9nhMjZvrlT
 zUIti+g+DffZpfAnaO/kQ644FRTqccmChVav2EmxCUuQISSvLKwzMKjEYs3CnLNP1A1m
 s4Uw==
X-Gm-Message-State: AOAM532E/MI5xFY5SYe26tiM8TqbdEToOBecZ64QmDjEMTNKur+Gpw51
 foPo2of6hTGN1+8/77GK5dAuOAoNxMU=
X-Google-Smtp-Source: ABdhPJwj3ykq/TQAQnRX80vcSBoqBJXe/5oedceaYWVXNq4ZJtQ+NXtsFnZq8ah74fS82XEGsaErDQ==
X-Received: by 2002:adf:d1ea:: with SMTP id g10mr5753759wrd.205.1634973152370; 
 Sat, 23 Oct 2021 00:12:32 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o1sm1211223wru.91.2021.10.23.00.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 00:12:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Oct 2021 09:11:59 +0200
Message-Id: <20211023071201.1016688-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211023071201.1016688-1-francois.perrad@gadz.org>
References: <20211023071201.1016688-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] configs/stm32mp157*_dk*: dk2 is a superset
 of dk1
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

the daughter board (DK2) contains a 4" LCD with backlight and touchscreen.

the SII9022 (HDMI bridge) is on the common mother board.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../stm32mp157a-dk1/linux.config              |  10 +-
 .../stm32mp157c-dk2/linux-dk2.fragment        |   8 +
 .../stm32mp157c-dk2/linux.config              | 182 ------------------
 configs/stm32mp157c_dk2_defconfig             |   3 +-
 4 files changed, 11 insertions(+), 192 deletions(-)
 create mode 100644 board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment
 delete mode 100644 board/stmicroelectronics/stm32mp157c-dk2/linux.config

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
index 95c834e43..eed6ba034 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/linux.config
+++ b/board/stmicroelectronics/stm32mp157a-dk1/linux.config
@@ -73,8 +73,6 @@ CONFIG_DWMAC_DWC_QOS_ETH=y
 CONFIG_MDIO_BITBANG=y
 CONFIG_INPUT_JOYDEV=y
 CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_EDT_FT5X06=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_STPMIC1_ONKEY=y
 CONFIG_SERIAL_STM32=y
@@ -107,13 +105,7 @@ CONFIG_REGULATOR_STPMIC1=y
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
+CONFIG_DRM_SII902X=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_DYNAMIC_MINORS=y
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment b/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment
new file mode 100644
index 000000000..44c494436
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment
@@ -0,0 +1,8 @@
+
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux.config b/board/stmicroelectronics/stm32mp157c-dk2/linux.config
deleted file mode 100644
index 878a0c39f..000000000
--- a/board/stmicroelectronics/stm32mp157c-dk2/linux.config
+++ /dev/null
@@ -1,182 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_USELIB=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_PREEMPT=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_ARCH_STM32=y
-CONFIG_ARM_THUMBEE=y
-# CONFIG_CACHE_L2X0 is not set
-CONFIG_ARM_ERRATA_430973=y
-CONFIG_ARM_ERRATA_720789=y
-CONFIG_ARM_ERRATA_754322=y
-CONFIG_ARM_ERRATA_754327=y
-CONFIG_ARM_ERRATA_764369=y
-CONFIG_ARM_ERRATA_775420=y
-CONFIG_ARM_ERRATA_798181=y
-CONFIG_SMP=y
-CONFIG_MCPM=y
-CONFIG_HIGHMEM=y
-CONFIG_FORCE_MAX_ZONEORDER=12
-CONFIG_SECCOMP=y
-# CONFIG_ATAGS is not set
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_ARM_APPENDED_DTB=y
-CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_VFP=y
-CONFIG_NEON=y
-CONFIG_KERNEL_MODE_NEON=y
-CONFIG_ARM_CRYPTO=y
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_CMDLINE_PARTITION=y
-CONFIG_CMA=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_CAN=y
-CONFIG_CAN_M_CAN=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
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
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
-CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_KS8851=y
-CONFIG_SMSC911X=y
-CONFIG_STMMAC_ETH=y
-CONFIG_DWMAC_DWC_QOS_ETH=y
-CONFIG_MDIO_BITBANG=y
-CONFIG_INPUT_JOYDEV=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_EDT_FT5X06=y
-CONFIG_INPUT_MISC=y
-CONFIG_INPUT_STPMIC1_ONKEY=y
-CONFIG_SERIAL_STM32=y
-CONFIG_SERIAL_STM32_CONSOLE=y
-CONFIG_SERIAL_DEV_BUS=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
-CONFIG_I2C_STM32F7=y
-CONFIG_SPI=y
-CONFIG_SPI_STM32=y
-CONFIG_SPI_STM32_QSPI=y
-CONFIG_PINCTRL_SINGLE=y
-CONFIG_PINCTRL_STMFX=y
-CONFIG_POWER_RESET=y
-CONFIG_POWER_RESET_GPIO=y
-CONFIG_POWER_RESET_GPIO_RESTART=y
-CONFIG_POWER_RESET_SYSCON=y
-CONFIG_POWER_RESET_SYSCON_POWEROFF=y
-CONFIG_SYSCON_REBOOT_MODE=y
-CONFIG_WATCHDOG=y
-CONFIG_STPMIC1_WATCHDOG=y
-CONFIG_MFD_STM32_LPTIMER=y
-CONFIG_MFD_STPMIC1=y
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_REGULATOR_STM32_VREFBUF=y
-CONFIG_REGULATOR_STM32_PWR=y
-CONFIG_REGULATOR_STPMIC1=y
-CONFIG_DRM=y
-CONFIG_DRM_STM=y
-CONFIG_DRM_STM_DSI=y
-CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
-CONFIG_DRM_SII902X=y
-CONFIG_BACKLIGHT_LCD_SUPPORT=y
-# CONFIG_LCD_CLASS_DEVICE is not set
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_BACKLIGHT_GENERIC is not set
-CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_DYNAMIC_MINORS=y
-CONFIG_USB=y
-CONFIG_USB_OTG=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_PLATFORM=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_HCD_PLATFORM=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_HCD_PLATFORM=y
-CONFIG_USB_DWC2=y
-CONFIG_USB_CHIPIDEA=y
-CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_ISP1760=y
-CONFIG_USB_HSIC_USB3503=y
-CONFIG_USB_GPIO_VBUS=y
-CONFIG_USB_ISP1301=y
-CONFIG_USB_ULPI=y
-CONFIG_TYPEC=y
-CONFIG_TYPEC_STUSB=y
-CONFIG_MMC=y
-CONFIG_MMC_BLOCK_MINORS=16
-CONFIG_MMC_ARMMMCI=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_DW=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_PWM=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_STM32=y
-CONFIG_DMADEVICES=y
-CONFIG_STM32_DMA=y
-CONFIG_STM32_DMAMUX=y
-CONFIG_STM32_MDMA=y
-CONFIG_HWSPINLOCK=y
-CONFIG_HWSPINLOCK_STM32=y
-CONFIG_STM32_IPCC=y
-CONFIG_REMOTEPROC=y
-CONFIG_STM32_RPROC=y
-CONFIG_RPMSG_VIRTIO=y
-CONFIG_RPMSG_TTY=y
-CONFIG_IIO=y
-CONFIG_IIO_SW_TRIGGER=y
-CONFIG_SD_ADC_MODULATOR=y
-CONFIG_STM32_ADC_CORE=y
-CONFIG_STM32_ADC=y
-CONFIG_STM32_ADC_TEMP=y
-CONFIG_STM32_DFSDM_ADC=y
-CONFIG_STM32_LPTIMER_CNT=y
-CONFIG_STM32_DAC=y
-CONFIG_IIO_HRTIMER_TRIGGER=y
-CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
-CONFIG_PWM=y
-CONFIG_PWM_STM32=y
-CONFIG_PWM_STM32_LP=y
-CONFIG_PHY_STM32_USBPHYC=y
-CONFIG_NVMEM_STM32_ROMEM=y
-CONFIG_EXT4_FS=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_PRINTK_TIME=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index a75c2329a..1d426f28d 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -14,7 +14,8 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/linux-dk2.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
