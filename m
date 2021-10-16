Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32971C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 09:59:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5AA600D4
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 09:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F5AA600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A9E88188D;
	Sat, 16 Oct 2021 09:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qS6kqEq7iD3w; Sat, 16 Oct 2021 09:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7CF81980;
	Sat, 16 Oct 2021 09:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 883EF1BF25F
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 09:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 778478188D
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 09:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3xnbsRAfRff for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 09:59:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5661080F8F
 for <buildroot@busybox.net>; Sat, 16 Oct 2021 09:59:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d9so47919503edh.5
 for <buildroot@busybox.net>; Sat, 16 Oct 2021 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEFpvk12VtGtmOIll3EfqWIExbtgooBRwys5cHS1quU=;
 b=qUD3K+926xC9a71ajxMD3np2nUEod7xczVXFtH3/QWVJ9qx0foANmhNa1VMjOpfnn0
 RWKuDERj2dZ+7qm7ylxSn7hxZsWnwMEGRnguQLJI3mXZD5cAlL0sbzm6vUx0QD8IzzkH
 jlrgTFTYnIs+kuogTc6KObcL1EFZLdfJqrbY+tTekg+P60aUGRIJ8Z3DnZPHSNF9NCUh
 jOUbfGQRga7NNHWISSPGE80iDCXOtuoH0FZkC6NPV6G+eknct1Vp6Gk3heMbMG+0b3YT
 k9NW0eJhfZ676jz4+rogOypoV4MpOgp+QP/R4ErNUR2WCftg1gUF803Xa3edYExdg2Pf
 xmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEFpvk12VtGtmOIll3EfqWIExbtgooBRwys5cHS1quU=;
 b=ex+GApIJEhb1FcIJzkqMlaMIIESI0fbv94RHAKvBhYHYuJ2Gko8dZKd/ZYdn59b4q2
 7yFqunRW1shE6lH2eGXSRH8M9EtTFgW8GA/EeO4sKb4DLXs0wJl9zgNuWoroQOg2FvN7
 ahtsEeGFU1JOPo5YOwKnA+rI7ZKsf/l7PKG4rsSUswx3CS0qK6VHASIfJRqkMh1F267i
 b63ppG5UCLcWJFy2TxCvdd/i+TNodDNRpFpwwhr2M7B6gyh2DFoCqB7UaM6CYeBZabRY
 kqhDCSrzapZ4sRj7W+coFRLqovWa23/t+C92ze8ZGRrWWOPqny3UyHQna2+OuSuS94j1
 Z0TA==
X-Gm-Message-State: AOAM530mw6KSNMoemLX+EHWg+Z7gZcdt8UJiQku/E1ZYRT5jdw2kHcQU
 Mq0pkOKcXiL2BTLIuSvcytfx3xYC5Rw=
X-Google-Smtp-Source: ABdhPJyBpB6ArH8JaWPXXy8383EKGt3A4GTLgq0W7QUgoP75BPmwnaN6NINEt3XrHzRhp2/Rbh4zyA==
X-Received: by 2002:a17:907:9694:: with SMTP id
 hd20mr13447122ejc.550.1634378352474; 
 Sat, 16 Oct 2021 02:59:12 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id fx4sm5941086ejb.113.2021.10.16.02.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 02:59:12 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 16 Oct 2021 11:59:00 +0200
Message-Id: <20211016095900.586722-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/olimex/stmp1_olinuxino: add
 STMP157-OLinuXino-LIME2 board support
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

kernel:
- the device tree is not yet mainline
- ITE IT66121 (HDMI) is mainline only since 5.14

u-boot:
- the device tree is not yet mainline
- this board uses AXP209 as PMIC instead of the STPMIC1,
  this use case of AXP209 is not mainline

arm-trusted-firmware:
at this time, there is no patch for this board,
so u-boot-spl is used as FSBL (basic boot chain)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/stmp1_olinuxino/genimage.cfg     |  25 +
 board/olimex/stmp1_olinuxino/linux.config     | 313 +++++++++
 .../patches/linux/0001-add-device-tree.patch  | 414 ++++++++++++
 .../patches/uboot/0001-add-device-tree.patch  | 609 ++++++++++++++++++
 .../uboot/0002-AXP-not-only-with-sunxi.patch  | 168 +++++
 .../uboot/0003-uses-AXP209-as-PMIC.patch      | 205 ++++++
 .../0004-add-ethaddr-in-u-boot-env.patch      |  25 +
 board/olimex/stmp1_olinuxino/readme.txt       |  53 ++
 .../boot/extlinux/extlinux.conf               |   4 +
 board/olimex/stmp1_olinuxino/uboot.fragment   |  16 +
 .../olimex_stmp157_olinuxino_lime_defconfig   |  47 ++
 11 files changed, 1879 insertions(+)
 create mode 100644 board/olimex/stmp1_olinuxino/genimage.cfg
 create mode 100644 board/olimex/stmp1_olinuxino/linux.config
 create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/0001-add-device-tree.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0001-add-device-tree.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0002-AXP-not-only-with-sunxi.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0003-uses-AXP209-as-PMIC.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0004-add-ethaddr-in-u-boot-env.patch
 create mode 100644 board/olimex/stmp1_olinuxino/readme.txt
 create mode 100644 board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/olimex/stmp1_olinuxino/uboot.fragment
 create mode 100644 configs/olimex_stmp157_olinuxino_lime_defconfig

diff --git a/board/olimex/stmp1_olinuxino/genimage.cfg b/board/olimex/stmp1_olinuxino/genimage.cfg
new file mode 100644
index 000000000..2f00ee979
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/genimage.cfg
@@ -0,0 +1,25 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "u-boot-spl.stm32"
+		size = 256K
+	}
+
+	partition fsbl2 {
+		image = "u-boot-spl.stm32"
+		size = 256K
+	}
+
+	partition ssbl {
+		image = "u-boot.img"
+		size = 2M
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		bootable = "yes"
+	}
+}
diff --git a/board/olimex/stmp1_olinuxino/linux.config b/board/olimex/stmp1_olinuxino/linux.config
new file mode 100644
index 000000000..f1b672aba
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/linux.config
@@ -0,0 +1,313 @@
+
+#
+# General setup
+#
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+
+#
+# System Type
+#
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_ERRATA_430973=y
+
+#
+# Kernel Features
+#
+CONFIG_SMP=y
+CONFIG_HIGHMEM=y
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=0
+CONFIG_ZBOOT_ROM_BSS=0
+
+#
+# Floating point emulation
+#
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+
+#
+# Firmware Drivers
+#
+CONFIG_FW_CFG_SYSFS=m
+
+#
+# General architecture-dependent options
+#
+CONFIG_JUMP_LABEL=y
+# CONFIG_GCC_PLUGINS is not set
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+
+#
+# Networking options
+#
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETFILTER=y
+CONFIG_VLAN_8021Q=y
+
+#
+# CAN Device Drivers
+#
+CONFIG_CAN=y
+CONFIG_CAN_M_CAN=y
+
+# CONFIG_WIRELESS is not set
+
+#
+# Generic Driver Options
+#
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_USER_HELPER=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+
+#
+# Block devices
+#
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_NBD=m
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+
+#
+# SCSI device support
+#
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=m
+CONFIG_CHR_DEV_SG=y
+CONFIG_CHR_DEV_SCH=m
+
+#
+# Serial ATA and Parallel ATA drivers
+#
+CONFIG_ATA=y
+CONFIG_SATA_AHCI_PLATFORM=y
+
+#
+# Network device support
+#
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_MICREL_PHY=y
+CONFIG_MDIO_BUS_MUX_MULTIPLEXER=m
+CONFIG_USB_NET_DRIVERS=m
+CONFIG_USB_CATC=m
+CONFIG_USB_KAWETH=m
+CONFIG_USB_PEGASUS=m
+CONFIG_USB_RTL8150=m
+CONFIG_USB_RTL8152=m
+
+# CONFIG_WLAN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_AXP20X_PEK=y
+
+#
+# Character devices
+#
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+
+#
+# I2C support
+#
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_STM32F7=y
+
+#
+# SPI support
+#
+CONFIG_SPI=y
+CONFIG_SPI_STM32=y
+
+# CONFIG_PTP_1588_CLOCK is not set
+
+#
+# Pin controllers
+#
+CONFIG_PINCTRL_AXP209=y
+
+#
+# Board level reset or power off
+#
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+
+# CONFIG_HWMON is not set
+
+#
+# Thermal drivers
+#
+CONFIG_THERMAL_WRITABLE_TRIPS=y
+CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
+CONFIG_THERMAL_GOV_STEP_WISE=y
+CONFIG_THERMAL_GOV_BANG_BANG=y
+CONFIG_CPU_THERMAL=y
+CONFIG_THERMAL_EMULATION=y
+
+#
+# Watchdog Timer Support
+#
+CONFIG_WATCHDOG=y
+CONFIG_GPIO_WATCHDOG=m
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STM32_TIMERS=y
+
+#
+# Voltage and Current Regulator Support
+#
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+
+#
+# HDMI CEC drivers
+#
+CONFIG_MEDIA_CEC_SUPPORT=y
+CONFIG_CEC_STM32=y
+
+#
+# Graphics support
+#
+CONFIG_DRM=y
+CONFIG_DRM_LOAD_EDID_FIRMWARE=y
+CONFIG_DRM_VKMS=m
+CONFIG_DRM_STM=m
+CONFIG_DRM_STM_DSI=m
+CONFIG_DRM_ITE_IT66121=m
+CONFIG_DRM_ETNAVIV=m
+CONFIG_FB=y
+CONFIG_FB_SIMPLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+
+#
+# HID support
+#
+CONFIG_HIDRAW=y
+CONFIG_UHID=m
+CONFIG_HID_PID=y
+CONFIG_USB_HIDDEV=y
+
+#
+# USB support
+#
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
+CONFIG_USB_SERIAL=m
+CONFIG_USB_SERIAL_GENERIC=y
+
+#
+# MMC/SD/SDIO card support
+#
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_SDHCI_OF_ARASAN=y
+CONFIG_MMC_SDHCI_OF_AT91=y
+CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_USHC=m
+CONFIG_MMC_SDHCI_OMAP=y
+
+#
+# LED drivers
+#
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+
+#
+# Real Time Clock
+#
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+
+#
+# DMA Devices
+#
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+
+# CONFIG_VIRTIO_MENU is not set
+
+# CONFIG_VHOST_MENU is not set
+
+#
+# Mailbox Hardware Support
+#
+CONFIG_STM32_IPCC=y
+
+#
+# Remoteproc drivers
+#
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+
+#
+# PWM Support
+#
+CONFIG_PWM=y
+CONFIG_PWM_STM32=y
+CONFIG_PWM_STM32_LP=y
+
+#
+# NVMEM Support
+#
+CONFIG_NVMEM_STM32_ROMEM=y
+
+#
+# File systems
+#
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_VFAT_FS=y
+CONFIG_CONFIGFS_FS=y
+# CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=y
diff --git a/board/olimex/stmp1_olinuxino/patches/linux/0001-add-device-tree.patch b/board/olimex/stmp1_olinuxino/patches/linux/0001-add-device-tree.patch
new file mode 100644
index 000000000..b24b68cae
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux/0001-add-device-tree.patch
@@ -0,0 +1,414 @@
+From 54690dac6f925b4da1a82b7085996405916867d1 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 13 Oct 2021 20:27:23 +0200
+Subject: [PATCH] add device tree
+
+fetched from https://github.com/OLIMEX/linux-olimex
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ arch/arm/boot/dts/Makefile                    |   1 +
+ .../boot/dts/stm32mp1xx-olinuxino-lime.dts    | 379 ++++++++++++++++++
+ 2 files changed, 380 insertions(+)
+ create mode 100644 arch/arm/boot/dts/stm32mp1xx-olinuxino-lime.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index 863347b6b..3aba3aeab 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -1078,6 +1078,7 @@ dtb-$(CONFIG_ARCH_STI) += \
+ 	stih410-b2260.dtb \
+ 	stih418-b2199.dtb
+ dtb-$(CONFIG_ARCH_STM32) += \
++	stm32mp1xx-olinuxino-lime.dtb \
+ 	stm32f429-disco.dtb \
+ 	stm32f469-disco.dtb \
+ 	stm32f746-disco.dtb \
+diff --git a/arch/arm/boot/dts/stm32mp1xx-olinuxino-lime.dts b/arch/arm/boot/dts/stm32mp1xx-olinuxino-lime.dts
+new file mode 100644
+index 000000000..aa6029272
+--- /dev/null
++++ b/arch/arm/boot/dts/stm32mp1xx-olinuxino-lime.dts
+@@ -0,0 +1,379 @@
++// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
++/*
++ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
++ * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
++ */
++/dts-v1/;
++
++#include "stm32mp157.dtsi"
++#include "stm32mp15xc.dtsi"
++#include "stm32mp15-pinctrl.dtsi"
++#include "stm32mp15xxaa-pinctrl.dtsi"
++
++#include <dt-bindings/gpio/gpio.h>
++#include <dt-bindings/mfd/st,stpmic1.h>
++
++/ {
++	model = "STM32MP1XX OLinuXino";
++	compatible = "olimex,stm32mp1xx-olinuxino-lime" , "st,stm32mp153";
++	aliases {
++		ethernet0 = &ethernet0;
++		serial0 = &uart4;
++	};
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++	};
++
++	memory@c0000000 {
++		device_type = "memory";
++		reg = <0xC0000000 0x40000000>;
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		mcuram2: mcuram2@10000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10000000 0x40000>;
++			no-map;
++		};
++
++		vdev0vring0: vdev0vring0@10040000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10040000 0x1000>;
++			no-map;
++		};
++
++		vdev0vring1: vdev0vring1@10041000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10041000 0x1000>;
++			no-map;
++		};
++
++		vdev0buffer: vdev0buffer@10042000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10042000 0x4000>;
++			no-map;
++		};
++
++		mcuram: mcuram@30000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x30000000 0x40000>;
++			no-map;
++		};
++
++		retram: retram@38000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x38000000 0x10000>;
++			no-map;
++		};
++
++		gpu_reserved: gpu@e8000000 {
++			reg = <0xe8000000 0x8000000>;
++			no-map;
++		};
++	};
++
++	vdd_sd3v3: regulator_vdd {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-sd";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	hdmi_3v3: regulator_hdmi {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-hdmi";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	hdmi_1v8: regulator_hdmi1v8 {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-hdmi1v8";
++		regulator-min-microvolt = <1800000>;
++		regulator-max-microvolt = <1800000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	hdmi_1v2: regulator_hdmi1v2 {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-hdmi1v2";
++		regulator-min-microvolt = <1200000>;
++		regulator-max-microvolt = <1200000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	vbus_otg: regulator_otg {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-otg";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
++		enable-active-high;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	vdd: vdd {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	vdd_usb: vdd-usb {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-usb";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++
++	panel {
++		compatible = "olimex,lcd-olinuxino-10";
++		status = "disabled";
++
++		enable-gpios = <&gpiof 13 GPIO_ACTIVE_HIGH>;
++		//backlight = <&backlight>;
++
++		port {
++			panel_in_tcon0: endpoint {
++				remote-endpoint = <&ltdc_ep0_out>;
++			};
++		};
++	};
++};
++
++&dts {
++	status = "okay";
++};
++
++&ltdc {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&ltdc_pins_b>;
++	pinctrl-1 = <&ltdc_sleep_pins_b>;
++	status = "okay";
++
++	port {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ltdc_ep0_out: endpoint@0 {
++			reg = <0>;
++			remote-endpoint = <&it66121_in>;
++		};
++	};
++};
++
++&ethernet0 {
++	status = "okay";
++	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
++	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
++	pinctrl-names = "default", "sleep";
++	phy-mode = "rgmii-id";
++	phy-handle = <&ethphy>;
++
++	mdio0 {
++		compatible = "snps,dwmac-mdio";
++		#address-cells = <1>;
++		#size-cells = <0>;
++		ethphy: ethernet-phy@1 {
++			reg = <1>;
++			reset-gpios = <&gpiod 10 GPIO_ACTIVE_LOW>; /* ETH_RST# */
++			reset-assert-us = <10000>;
++			reset-deassert-us = <300>;
++			micrel,force-master;
++		};
++	};
++};
++
++&gpu {
++	contiguous-area = <&gpu_reserved>;
++	status = "okay";
++};
++
++&m_can1 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&m_can1_pins_a>;
++	pinctrl-1 = <&m_can1_sleep_pins_a>;
++	status = "okay";
++};
++
++&i2c4 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&i2c4_pins_a>;
++	i2c-scl-rising-time-ns = <185>;
++	i2c-scl-falling-time-ns = <20>;
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++
++	it66121hdmitx: it66121hdmitx@4d {
++		compatible = "ite,it66121";
++		interrupts = <8 2>;
++		interrupt-parent = <&gpioi>;
++		vcn33-supply = <&hdmi_3v3>;
++		vcn18-supply = <&hdmi_1v8>;
++		vrf12-supply = <&hdmi_1v2>;
++		reset-gpios = <&gpiof 3  GPIO_ACTIVE_LOW >;
++		reg = <0x4d>;
++		pclk-dual-edge;
++
++		port {
++			it66121_in: endpoint {
++				remote-endpoint = <&ltdc_ep0_out>;
++			};
++		};
++	};
++};
++
++&ipcc {
++	status = "okay";
++};
++
++&iwdg2 {
++	timeout-sec = <32>;
++	status = "okay";
++};
++
++&m4_rproc {
++	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
++			<&vdev0vring1>, <&vdev0buffer>;
++	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
++	mbox-names = "vq0", "vq1", "shutdown";
++	interrupt-parent = <&exti>;
++	interrupts = <68 1>;
++	status = "disabled";
++};
++
++&pwr_regulators {
++	vdd-supply = <&vdd>;
++	vdd_3v3_usbfs-supply = <&vdd_usb>;
++};
++
++&rng1 {
++	status = "okay";
++};
++
++&rtc {
++	status = "okay";
++};
++
++&sdmmc1 {
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
++	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
++	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
++	broken-cd;
++	st,neg-edge;
++	bus-width = <4>;
++	vmmc-supply = <&vdd_sd3v3>;
++	vqmmc-supply = <&vdd_sd3v3>;
++	status = "okay";
++};
++
++&sdmmc2 {
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
++	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
++	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
++	non-removable;
++	st,neg-edge;
++	bus-width = <8>;
++	vmmc-supply = <&vdd_sd3v3>;
++	vqmmc-supply = <&vdd_sd3v3>;
++	status = "okay";
++};
++
++&qspi {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
++	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
++	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
++	#address-cells = <1>;
++	#size-cells = <0>;
++	status = "okay";
++
++	flash0: w25q128@0 {
++		compatible = "jedec,spi-nor", "winbond,w25q128";
++		reg = <0>;
++		spi-rx-bus-width = <4>;
++		spi-max-frequency = <108000000>;
++		#address-cells = <1>;
++		#size-cells = <1>;
++	};
++};
++
++&timers6 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	timer@5 {
++		status = "okay";
++	};
++};
++
++&uart4 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&uart4_pins_a>;
++	status = "okay";
++};
++
++&usbphyc {
++	status = "okay";
++};
++
++&usbphyc_port0 {
++	phy-supply = <&vdd_usb>;
++};
++
++&usbphyc_port1 {
++	phy-supply = <&vdd_usb>;
++};
++
++&usbh_ehci {
++	phys = <&usbphyc_port0>, <&usbphyc_port1 1>;
++	phy-names = "usb", "usb";
++	status = "okay";
++};
++
++&usbh_ohci {
++	phys = <&usbphyc_port0>, <&usbphyc_port1 1>;
++	phy-names = "usb", "usb";
++	status = "okay";
++};
++
++&usbotg_hs {
++	compatible = "st,stm32mp15-fsotg", "snps,dwc2";			/* Use full-speed integrated PHY */
++	pinctrl-names = "default";
++	pinctrl-0 = <&usbotg_hs_pins_a &usbotg_fs_dp_dm_pins_a>;	/* configure OTG ID and full-speed data pins */
++	vbus-supply = <&vbus_otg>;					/* voltage regulator to supply Vbus */
++	status = "okay";
++};
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0001-add-device-tree.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0001-add-device-tree.patch
new file mode 100644
index 000000000..1f99b6c74
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0001-add-device-tree.patch
@@ -0,0 +1,609 @@
+From c537b5799502b30af86ad410f2776d3b00cb20e3 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 10 Oct 2021 10:52:43 +0200
+Subject: [PATCH 1/4] add device tree
+
+fetched from https://github.com/OLIMEX/u-boot-olinuxino
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ arch/arm/dts/Makefile                         |   1 +
+ .../dts/stm32mp1-olinuxino-lime-u-boot.dtsi   | 198 ++++++++++
+ arch/arm/dts/stm32mp1-olinuxino-lime.dts      | 368 ++++++++++++++++++
+ 3 files changed, 567 insertions(+)
+ create mode 100644 arch/arm/dts/stm32mp1-olinuxino-lime-u-boot.dtsi
+ create mode 100644 arch/arm/dts/stm32mp1-olinuxino-lime.dts
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index fc16a57e60..b7053fc5ec 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -1075,6 +1075,7 @@ dtb-$(CONFIG_ASPEED_AST2600) += ast2600-evb.dtb
+ dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
+ 
+ dtb-$(CONFIG_STM32MP15x) += \
++	stm32mp1-olinuxino-lime.dtb \
+ 	stm32mp157a-dk1.dtb \
+ 	stm32mp157a-avenger96.dtb \
+ 	stm32mp157a-icore-stm32mp1-ctouch2.dtb \
+diff --git a/arch/arm/dts/stm32mp1-olinuxino-lime-u-boot.dtsi b/arch/arm/dts/stm32mp1-olinuxino-lime-u-boot.dtsi
+new file mode 100644
+index 0000000000..909530774d
+--- /dev/null
++++ b/arch/arm/dts/stm32mp1-olinuxino-lime-u-boot.dtsi
+@@ -0,0 +1,198 @@
++// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
++/*
++ * Copyright : STMicroelectronics 2018
++ */
++
++#include <dt-bindings/clock/stm32mp1-clksrc.h>
++#include "stm32mp15-u-boot.dtsi"
++#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
++
++/ {
++	aliases {
++		mmc0 = &sdmmc1;
++		usb0 = &usbotg_hs;
++	};
++	config {
++	};
++};
++
++&clk_hse {
++	st,digbypass;
++};
++
++&i2c4 {
++	u-boot,dm-pre-reloc;
++};
++
++&i2c4_pins_a {
++	u-boot,dm-pre-reloc;
++	pins {
++		u-boot,dm-pre-reloc;
++	};
++};
++
++/*
++&pmic {
++	u-boot,dm-pre-reloc;
++};
++*/
++
++&rcc {
++	st,clksrc = <
++		CLK_MPU_PLL1P
++		CLK_AXI_PLL2P
++		CLK_MCU_PLL3P
++		CLK_PLL12_HSE
++		CLK_PLL3_HSE
++		CLK_PLL4_HSE
++		CLK_RTC_LSE
++		CLK_MCO1_DISABLED
++		CLK_MCO2_DISABLED
++	>;
++
++	st,clkdiv = <
++		1 /*MPU*/
++		0 /*AXI*/
++		0 /*MCU*/
++		1 /*APB1*/
++		1 /*APB2*/
++		1 /*APB3*/
++		1 /*APB4*/
++		2 /*APB5*/
++		23 /*RTC*/
++		0 /*MCO1*/
++		0 /*MCO2*/
++	>;
++
++	st,pkcs = <
++		CLK_CKPER_HSE
++		CLK_FMC_ACLK
++		CLK_QSPI_ACLK
++		CLK_ETH_PLL4P
++		CLK_SDMMC12_PLL4P
++		CLK_DSI_DSIPLL
++		CLK_STGEN_HSE
++		CLK_USBPHY_HSE
++		CLK_SPI2S1_PLL3Q
++		CLK_SPI2S23_PLL3Q
++		CLK_SPI45_HSI
++		CLK_SPI6_HSI
++		CLK_I2C46_HSI
++		CLK_SDMMC3_PLL4P
++		CLK_USBO_USBPHY
++		CLK_ADC_CKPER
++		CLK_CEC_LSE
++		CLK_I2C12_HSI
++		CLK_I2C35_HSI
++		CLK_UART1_HSI
++		CLK_UART24_HSI
++		CLK_UART35_HSI
++		CLK_UART6_HSI
++		CLK_UART78_HSI
++		CLK_SPDIF_PLL4P
++		CLK_FDCAN_PLL4R
++		CLK_SAI1_PLL3Q
++		CLK_SAI2_PLL3Q
++		CLK_SAI3_PLL3Q
++		CLK_SAI4_PLL3Q
++		CLK_RNG1_LSI
++		CLK_RNG2_LSI
++		CLK_LPTIM1_PCLK1
++		CLK_LPTIM23_PCLK3
++		CLK_LPTIM45_LSE
++	>;
++
++	/* VCO = 1300.0 MHz => P = 650 (CPU) */
++	pll1: st,pll@0 {
++		compatible = "st,stm32mp1-pll";
++		reg = <0>;
++		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
++		frac = < 0x800 >;
++		u-boot,dm-pre-reloc;
++	};
++
++	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
++	pll2: st,pll@1 {
++		compatible = "st,stm32mp1-pll";
++		reg = <1>;
++		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
++		frac = < 0x1400 >;
++		u-boot,dm-pre-reloc;
++	};
++
++	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
++	pll3: st,pll@2 {
++		compatible = "st,stm32mp1-pll";
++		reg = <2>;
++		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
++		frac = < 0x1a04 >;
++		u-boot,dm-pre-reloc;
++	};
++
++	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
++	pll4: st,pll@3 {
++		compatible = "st,stm32mp1-pll";
++		reg = <3>;
++		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
++		u-boot,dm-pre-reloc;
++	};
++};
++
++&sdmmc1 {
++	u-boot,dm-spl;
++};
++
++&sdmmc1_b4_pins_a {
++	u-boot,dm-spl;
++	pins1 {
++		u-boot,dm-spl;
++	};
++	pins2 {
++		u-boot,dm-spl;
++	};
++};
++
++&sdmmc1_dir_pins_a {
++	u-boot,dm-spl;
++	pins1 {
++		u-boot,dm-spl;
++	};
++	pins2 {
++		u-boot,dm-spl;
++	};
++};
++
++&sdmmc2 {
++	u-boot,dm-spl;
++};
++
++&sdmmc2_b4_pins_a {
++	u-boot,dm-spl;
++	pins1 {
++		u-boot,dm-spl;
++	};
++	pins2 {
++		u-boot,dm-spl;
++	};
++};
++
++&sdmmc2_d47_pins_a {
++	u-boot,dm-spl;
++	pins {
++		u-boot,dm-spl;
++	};
++};
++
++&uart4 {
++	u-boot,dm-pre-reloc;
++};
++
++&uart4_pins_a {
++	u-boot,dm-pre-reloc;
++	pins1 {
++		u-boot,dm-pre-reloc;
++	};
++	pins2 {
++		u-boot,dm-pre-reloc;
++	};
++};
+diff --git a/arch/arm/dts/stm32mp1-olinuxino-lime.dts b/arch/arm/dts/stm32mp1-olinuxino-lime.dts
+new file mode 100644
+index 0000000000..fbac5d94fe
+--- /dev/null
++++ b/arch/arm/dts/stm32mp1-olinuxino-lime.dts
+@@ -0,0 +1,368 @@
++// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
++/*
++ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
++ * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
++ */
++/dts-v1/;
++
++#include "stm32mp157.dtsi"
++#include "stm32mp15xc.dtsi"
++#include "stm32mp15-pinctrl.dtsi"
++#include "stm32mp15xxaa-pinctrl.dtsi"
++#include <dt-bindings/gpio/gpio.h>
++#include <dt-bindings/mfd/st,stpmic1.h>
++
++/ {
++	model = "STM32MP1 OLinuXino-LIME";
++	compatible = "olimex,stm32mp1xx-olinuxino-lime", "st,stm32mp157";
++
++	chosen {
++		stdout-path = "serial0:115200n8";
++	};
++
++	memory@c0000000 {
++		device_type = "memory";
++		reg = <0xC0000000 0x40000000>;
++	};
++
++	reserved-memory {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		ranges;
++
++		mcuram2: mcuram2@10000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10000000 0x40000>;
++			no-map;
++		};
++
++		vdev0vring0: vdev0vring0@10040000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10040000 0x1000>;
++			no-map;
++		};
++
++		vdev0vring1: vdev0vring1@10041000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10041000 0x1000>;
++			no-map;
++		};
++
++		vdev0buffer: vdev0buffer@10042000 {
++			compatible = "shared-dma-pool";
++			reg = <0x10042000 0x4000>;
++			no-map;
++		};
++
++		mcuram: mcuram@30000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x30000000 0x40000>;
++			no-map;
++		};
++
++		retram: retram@38000000 {
++			compatible = "shared-dma-pool";
++			reg = <0x38000000 0x10000>;
++			no-map;
++		};
++
++		gpu_reserved: gpu@e8000000 {
++			reg = <0xe8000000 0x8000000>;
++			no-map;
++		};
++	};
++
++	aliases {
++		serial0 = &uart4;
++		ethernet0 = &ethernet0;
++	};
++
++	vdd_sd3v3: regulator_vdd {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-sd";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++	vbus_otg: regulator_otg {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-otg";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++	vdd: vdd {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++	vdd_usb: vdd-usb {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd-usb";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++	vdd11: vdd11 {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd11";
++		regulator-min-microvolt = <1100000>;
++		regulator-max-microvolt = <1100000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++	vdd18: vdd18 {
++		compatible = "regulator-fixed";
++		regulator-name = "vdd18";
++		regulator-min-microvolt = <1800000>;
++		regulator-max-microvolt = <1800000>;
++		enable-active-high;
++		regulator-always-on;
++		regulator-initial-mode = <0>;
++		//regulator-over-current-protection;
++	};
++	reg_usb0_vbus: usb0-vbus {
++		compatible = "regulator-fixed";
++		regulator-name = "usb0-vbus";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		enable-active-high;
++		regulator-always-on;
++		gpio = <&gpioc 6 GPIO_ACTIVE_HIGH>;
++		status = "disabled";
++	};
++	reg_usb1_vbus: usb1-vbus {
++		compatible = "regulator-fixed";
++		regulator-name = "usb1-vbus";
++		regulator-min-microvolt = <5000000>;
++		regulator-max-microvolt = <5000000>;
++		enable-active-high;
++		regulator-always-on;
++		gpio = <&gpiof 15 GPIO_ACTIVE_HIGH>;
++		status = "disabled";
++	};
++};
++
++&dac {
++	pinctrl-names = "default";
++	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
++	status = "disabled";
++};
++
++&dts {
++	status = "okay";
++};
++
++&gpu {
++	contiguous-area = <&gpu_reserved>;
++	status = "okay";
++};
++
++&reg_usb0_vbus {
++	status="okay";
++};
++
++&reg_usb1_vbus {
++	status="okay";
++};
++
++&i2c4 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&i2c4_pins_a>;
++//	i2c-scl-rising-time-ns = <185>;
++//	i2c-scl-falling-time-ns = <20>;
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++
++	pmic: stpmic@33 {
++		compatible = "st,stpmic1";
++		reg = <0x33>;
++		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
++		interrupt-controller;
++		#interrupt-cells = <2>;
++		status = "disabled";
++	};
++};
++
++&ipcc {
++	status = "okay";
++};
++
++&iwdg2 {
++	timeout-sec = <32>;
++	status = "okay";
++};
++
++&m4_rproc {
++	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
++			<&vdev0vring1>, <&vdev0buffer>;
++	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
++	mbox-names = "vq0", "vq1", "shutdown";
++	interrupt-parent = <&exti>;
++	interrupts = <68 1>;
++	status = "okay";
++};
++
++&pwr_regulators {
++	vdd-supply = <&vdd>;
++	vdd_3v3_usbfs-supply = <&vdd_usb>;
++};
++
++&rng1 {
++	status = "okay";
++};
++
++&rtc {
++	status = "okay";
++};
++
++&sdmmc1 {
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
++	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
++	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
++	broken-cd;
++	st,neg-edge;
++	bus-width = <4>;
++	vmmc-supply = <&vdd_sd3v3>;
++	/*vqmmc-supply = <&sd_switch>;*/
++	status = "okay";
++};
++
++&sdmmc2 {
++	pinctrl-names = "default", "opendrain", "sleep";
++	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
++	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
++	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
++	non-removable;
++	no-sd;
++	no-sdio;
++	st,neg-edge;
++	bus-width = <8>;
++	vmmc-supply = <&vdd_sd3v3>;
++	vqmmc-supply = <&vdd_sd3v3>;
++	mmc-ddr-3_3v;
++	status = "okay";
++};
++
++&timers6 {
++	status = "okay";
++	/* spare dmas for other usage */
++	/delete-property/dmas;
++	/delete-property/dma-names;
++	timer@5 {
++		status = "okay";
++	};
++};
++
++&ethernet0 {
++	status = "okay";
++	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
++	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
++	pinctrl-names = "default", "sleep";
++	phy-mode = "rgmii-id";
++	phy-handle = <&phy1>;
++	st,eth_ref_clk_sel;
++	phy-reset-gpios = <&gpiod 10 GPIO_ACTIVE_LOW>;
++
++	mdio0 {
++		compatible = "snps,dwmac-mdio";
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		phy1: ethernet-phy@1 {
++			reg = <1>;
++		};
++	};
++};
++
++&m_can1 {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&m_can1_pins_a>;
++	pinctrl-1 = <&m_can1_sleep_pins_a>;
++	status = "okay";
++};
++
++&qspi {
++	pinctrl-names = "default", "sleep";
++	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
++	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
++	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
++	#address-cells = <1>;
++	#size-cells = <0>;
++	status = "okay";
++
++	flash0: mx66l51235l@0 {
++		compatible = "jedec,spi-nor";
++		reg = <0>;
++		spi-rx-bus-width = <4>;
++		spi-max-frequency = <108000000>;
++		#address-cells = <1>;
++		#size-cells = <1>;
++	};
++};
++
++&spi1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&spi1_pins_a>;
++	status = "disabled";
++};
++
++
++&uart4 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&uart4_pins_a>;
++	status = "okay";
++};
++
++
++&usbh_ehci {
++	phys = <&usbphyc_port0>;
++	phy-names = "usb";
++	status = "okay";
++};
++
++
++&usbotg_hs {
++	dr_mode = "peripheral";
++	phys = <&usbphyc_port1 0>;
++	phy-names = "usb2-phy";
++	vbus-supply = <&vbus_otg>;
++	status = "okay";
++};
++
++&usbphyc {
++	status = "okay";
++};
++
++&usbphyc_port0 {
++	phy-supply = <&vdd_usb>;
++		vdda1v1-supply = <&vdd11>;
++	vdda1v8-supply = <&vdd18>;
++
++};
++
++&usbphyc_port1 {
++	phy-supply = <&vdd_usb>;
++	vdda1v1-supply = <&vdd11>;
++	vdda1v8-supply = <&vdd18>;
++
++};
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0002-AXP-not-only-with-sunxi.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0002-AXP-not-only-with-sunxi.patch
new file mode 100644
index 000000000..e8b77aa82
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0002-AXP-not-only-with-sunxi.patch
@@ -0,0 +1,168 @@
+From 240af8affb9037b25f41749542d7cf6598760934 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 10 Oct 2021 16:32:39 +0200
+Subject: [PATCH 2/4] AXP not only with sunxi
+
+just move declarations from specific arch/mach sunxi to power
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ arch/arm/mach-sunxi/Kconfig                                 | 6 ------
+ arch/arm/mach-sunxi/pmic_bus.c                              | 2 +-
+ drivers/gpio/axp_gpio.c                                     | 2 +-
+ drivers/power/Kconfig                                       | 6 ++++++
+ drivers/power/axp152.c                                      | 2 +-
+ drivers/power/axp209.c                                      | 2 +-
+ drivers/power/axp221.c                                      | 2 +-
+ drivers/power/axp305.c                                      | 2 +-
+ drivers/power/axp809.c                                      | 2 +-
+ drivers/power/axp818.c                                      | 2 +-
+ .../arm/include/asm/arch-sunxi => include/power}/pmic_bus.h | 0
+ 11 files changed, 14 insertions(+), 14 deletions(-)
+ rename {arch/arm/include/asm/arch-sunxi => include/power}/pmic_bus.h (100%)
+
+diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
+index 49f94f095c..a4f71469f8 100644
+--- a/arch/arm/mach-sunxi/Kconfig
++++ b/arch/arm/mach-sunxi/Kconfig
+@@ -105,12 +105,6 @@ config SUN6I_PRCM
+ 	  Support for the PRCM (Power/Reset/Clock Management) unit available
+ 	  in A31 SoC.
+ 
+-config AXP_PMIC_BUS
+-	bool "Sunxi AXP PMIC bus access helpers"
+-	help
+-	  Select this PMIC bus access helpers for Sunxi platform PRCM or other
+-	  AXP family PMIC devices.
+-
+ config SUN8I_RSB
+ 	bool "Allwinner sunXi Reduced Serial Bus Driver"
+ 	help
+diff --git a/arch/arm/mach-sunxi/pmic_bus.c b/arch/arm/mach-sunxi/pmic_bus.c
+index 0394ce8564..c8ebbf5ee8 100644
+--- a/arch/arm/mach-sunxi/pmic_bus.c
++++ b/arch/arm/mach-sunxi/pmic_bus.c
+@@ -12,7 +12,7 @@
+ #include <asm/arch/p2wi.h>
+ #include <asm/arch/rsb.h>
+ #include <i2c.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ 
+ #define AXP152_I2C_ADDR			0x30
+ 
+diff --git a/drivers/gpio/axp_gpio.c b/drivers/gpio/axp_gpio.c
+index 73058cf40b..90bf4b84ff 100644
+--- a/drivers/gpio/axp_gpio.c
++++ b/drivers/gpio/axp_gpio.c
+@@ -7,7 +7,7 @@
+ 
+ #include <common.h>
+ #include <asm/arch/gpio.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <asm/gpio.h>
+ #include <axp_pmic.h>
+ #include <dm.h>
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index c5fbf1f832..431e522771 100644
+--- a/drivers/power/Kconfig
++++ b/drivers/power/Kconfig
+@@ -8,6 +8,12 @@ source "drivers/power/pmic/Kconfig"
+ 
+ source "drivers/power/regulator/Kconfig"
+ 
++config AXP_PMIC_BUS
++	bool "Sunxi AXP PMIC bus access helpers"
++	help
++	  Select this PMIC bus access helpers for Sunxi platform PRCM or other
++	  AXP family PMIC devices.
++
+ choice
+ 	prompt "Select Sunxi PMIC Variant"
+ 	depends on ARCH_SUNXI
+diff --git a/drivers/power/axp152.c b/drivers/power/axp152.c
+index d6e36125c1..3eb60ce4ec 100644
+--- a/drivers/power/axp152.c
++++ b/drivers/power/axp152.c
+@@ -5,7 +5,7 @@
+  */
+ #include <common.h>
+ #include <command.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp152_mvolt_to_target(int mvolt, int min, int max, int div)
+diff --git a/drivers/power/axp209.c b/drivers/power/axp209.c
+index ade531940b..6ab7aa5bf8 100644
+--- a/drivers/power/axp209.c
++++ b/drivers/power/axp209.c
+@@ -6,7 +6,7 @@
+ 
+ #include <common.h>
+ #include <command.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ #include <linux/delay.h>
+ 
+diff --git a/drivers/power/axp221.c b/drivers/power/axp221.c
+index 3446fe7365..e35a876578 100644
+--- a/drivers/power/axp221.c
++++ b/drivers/power/axp221.c
+@@ -12,7 +12,7 @@
+ #include <common.h>
+ #include <command.h>
+ #include <errno.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp221_mvolt_to_cfg(int mvolt, int min, int max, int div)
+diff --git a/drivers/power/axp305.c b/drivers/power/axp305.c
+index 0191e4d427..bfadea6e00 100644
+--- a/drivers/power/axp305.c
++++ b/drivers/power/axp305.c
+@@ -12,7 +12,7 @@
+ #include <common.h>
+ #include <command.h>
+ #include <errno.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ #define AXP305_DCDC4_1600MV_OFFSET 46
+diff --git a/drivers/power/axp809.c b/drivers/power/axp809.c
+index 6323492b66..e438a13509 100644
+--- a/drivers/power/axp809.c
++++ b/drivers/power/axp809.c
+@@ -14,7 +14,7 @@
+ #include <command.h>
+ #include <errno.h>
+ #include <asm/arch/gpio.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp809_mvolt_to_cfg(int mvolt, int min, int max, int div)
+diff --git a/drivers/power/axp818.c b/drivers/power/axp818.c
+index 0531707c8a..df69927c84 100644
+--- a/drivers/power/axp818.c
++++ b/drivers/power/axp818.c
+@@ -14,7 +14,7 @@
+ #include <command.h>
+ #include <errno.h>
+ #include <asm/arch/gpio.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp818_mvolt_to_cfg(int mvolt, int min, int max, int div)
+diff --git a/arch/arm/include/asm/arch-sunxi/pmic_bus.h b/include/power/pmic_bus.h
+similarity index 100%
+rename from arch/arm/include/asm/arch-sunxi/pmic_bus.h
+rename to include/power/pmic_bus.h
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0003-uses-AXP209-as-PMIC.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0003-uses-AXP209-as-PMIC.patch
new file mode 100644
index 000000000..ada97835d
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0003-uses-AXP209-as-PMIC.patch
@@ -0,0 +1,205 @@
+From 76ea4a75aaea0640cf916d97df981d12b85772e5 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Tue, 12 Oct 2021 21:07:55 +0200
+Subject: [PATCH 3/4] uses AXP209 as PMIC
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ arch/arm/mach-stm32mp/Makefile        |  1 +
+ arch/arm/mach-stm32mp/pmic_bus.c      | 83 +++++++++++++++++++++++++++
+ arch/arm/mach-stm32mp/pwr_regulator.c |  3 +-
+ board/st/stm32mp1/spl.c               |  7 +++
+ drivers/phy/phy-stm32-usbphyc.c       |  2 +
+ drivers/power/Kconfig                 |  4 +-
+ 6 files changed, 97 insertions(+), 3 deletions(-)
+ create mode 100644 arch/arm/mach-stm32mp/pmic_bus.c
+
+diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
+index 391b47cf13..c582591b7c 100644
+--- a/arch/arm/mach-stm32mp/Makefile
++++ b/arch/arm/mach-stm32mp/Makefile
+@@ -21,3 +21,4 @@ endif
+ 
+ obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
+ obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
++obj-$(CONFIG_AXP_PMIC_BUS) += pmic_bus.o
+diff --git a/arch/arm/mach-stm32mp/pmic_bus.c b/arch/arm/mach-stm32mp/pmic_bus.c
+new file mode 100644
+index 0000000000..f52d619af3
+--- /dev/null
++++ b/arch/arm/mach-stm32mp/pmic_bus.c
+@@ -0,0 +1,83 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2015 Hans de Goede <hdegoede@redhat.com>
++ *
++ * Sunxi PMIC bus access helpers
++ *
++ * The axp152 & axp209 use an i2c bus, the axp221 uses the p2wi bus and the
++ * axp223 uses the rsb bus, these functions abstract this.
++ */
++
++#include <common.h>
++#include <command.h>
++#include <i2c.h>
++#include <dm.h>
++#include <power/pmic_bus.h>
++
++#define AXP209_I2C_ADDR			0x34
++
++	struct udevice *dev;
++
++int pmic_bus_init(void)
++{
++	/* This cannot be 0 because it is used in SPL before BSS is ready */
++	static int needs_init = 1;
++	__maybe_unused int ret;
++	struct udevice *bus;
++
++	if (!needs_init)
++		return 0;
++
++	ret = uclass_get_device_by_seq(UCLASS_I2C, 0, &bus);
++	if (ret)
++		return ret;
++
++	ret = dm_i2c_probe(bus, AXP209_I2C_ADDR, 0, &dev);
++	if (ret)
++		return ret;
++
++	needs_init = 0;
++	return 0;
++}
++
++int pmic_bus_read(u8 reg, u8 *data)
++{
++	return dm_i2c_read(dev, reg, data, 1);
++}
++
++int pmic_bus_write(u8 reg, u8 data)
++{
++	return dm_i2c_write(dev,reg, &data,1);
++}
++
++int pmic_bus_setbits(u8 reg, u8 bits)
++{
++	int ret;
++	u8 val;
++
++	ret = pmic_bus_read(reg, &val);
++	if (ret)
++		return ret;
++
++	if ((val & bits) == bits)
++		return 0;
++
++	val |= bits;
++	return pmic_bus_write(reg, val);
++}
++
++int pmic_bus_clrbits(u8 reg, u8 bits)
++{
++	int ret;
++	u8 val;
++
++	ret = pmic_bus_read(reg, &val);
++	if (ret)
++		return ret;
++
++	if (!(val & bits))
++		return 0;
++
++	val &= ~bits;
++	return pmic_bus_write(reg, val);
++}
+diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
+index 846637ab16..71b2776a92 100644
+--- a/arch/arm/mach-stm32mp/pwr_regulator.c
++++ b/arch/arm/mach-stm32mp/pwr_regulator.c
+@@ -81,12 +81,13 @@ static const struct pmic_child_info pwr_children_info[] = {
+ 
+ static int stm32mp_pwr_bind(struct udevice *dev)
+ {
++#if defined(CONFIG_PMIC_STPMIC1)
+ 	int children;
+ 
+ 	children = pmic_bind_children(dev, dev_ofnode(dev), pwr_children_info);
+ 	if (!children)
+ 		dev_dbg(dev, "no child found\n");
+-
++#endif
+ 	return 0;
+ }
+ 
+diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
+index 8e4549a1b3..5fe09bf048 100644
+--- a/board/st/stm32mp1/spl.c
++++ b/board/st/stm32mp1/spl.c
+@@ -10,6 +10,7 @@
+ #include <asm/arch/sys_proto.h>
+ #include <linux/bitops.h>
+ #include <linux/delay.h>
++#include <axp_pmic.h>
+ #include "../common/stpmic1.h"
+ 
+ /* board early initialisation in board_f: need to use global variable */
+@@ -23,8 +24,14 @@ void board_vddcore_init(u32 voltage_mv)
+ 
+ int board_early_init_f(void)
+ {
++#if defined(CONFIG_AXP209_POWER)
++	axp_init();
++	axp_set_aldo3(1200);
++	axp_set_aldo2(3300);
++#else
+ 	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER))
+ 		stpmic1_init(opp_voltage_mv);
++#endif
+ 
+ 	return 0;
+ }
+diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
+index 02d859a039..15e6e1dd2b 100644
+--- a/drivers/phy/phy-stm32-usbphyc.c
++++ b/drivers/phy/phy-stm32-usbphyc.c
+@@ -364,6 +364,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
+ 	}
+ 
+ 	/* get usbphyc regulator */
++#if defined(CONFIG_PMIC_STPMIC1)
+ 	ret = device_get_supply_regulator(dev, "vdda1v1-supply",
+ 					  &usbphyc->vdda1v1);
+ 	if (ret) {
+@@ -377,6 +378,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
+ 		dev_err(dev, "Can't get vdda1v8-supply regulator\n");
+ 		return ret;
+ 	}
++#endif
+ 
+ 	/*
+ 	 * parse all PHY subnodes in order to populate regulator associated
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index 431e522771..85f5bdb7aa 100644
+--- a/drivers/power/Kconfig
++++ b/drivers/power/Kconfig
+@@ -16,7 +16,7 @@ config AXP_PMIC_BUS
+ 
+ choice
+ 	prompt "Select Sunxi PMIC Variant"
+-	depends on ARCH_SUNXI
++	depends on ARCH_SUNXI || ARCH_STM32MP
+ 	default AXP209_POWER if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I
+ 	default AXP221_POWER if MACH_SUN6I || MACH_SUN8I_A23 || MACH_SUN8I_A33 || MACH_SUN8I_R40
+ 	default AXP305_POWER if MACH_SUN50I_H616
+@@ -39,7 +39,7 @@ config AXP152_POWER
+ 
+ config AXP209_POWER
+ 	bool "axp209 pmic support"
+-	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUN8I_V3S
++	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUN8I_V3S || TARGET_ST_STM32MP15x
+ 	select AXP_PMIC_BUS
+ 	select CMD_POWEROFF
+ 	---help---
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0004-add-ethaddr-in-u-boot-env.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0004-add-ethaddr-in-u-boot-env.patch
new file mode 100644
index 000000000..a7bdc8644
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0004-add-ethaddr-in-u-boot-env.patch
@@ -0,0 +1,25 @@
+From f48ca38e84dc18dd3427c6cf10ec13adcbd25a9d Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 13 Oct 2021 17:00:33 +0200
+Subject: [PATCH] add ethaddr in u-boot-env
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ include/configs/stm32mp1.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
+index b372838be8..fc6d39dec2 100644
+--- a/include/configs/stm32mp1.h
++++ b/include/configs/stm32mp1.h
+@@ -159,6 +159,7 @@
+  * and the ramdisk at the end.
+  */
+ #define CONFIG_EXTRA_ENV_SETTINGS \
++	"ethaddr=00:12:34:56:00:00\0" \
+ 	"kernel_addr_r=0xc2000000\0" \
+ 	"fdt_addr_r=0xc4000000\0" \
+ 	"scriptaddr=0xc4100000\0" \
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/readme.txt b/board/olimex/stmp1_olinuxino/readme.txt
new file mode 100644
index 000000000..8c641c6c8
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/readme.txt
@@ -0,0 +1,53 @@
+STMP157-OLinuXino-LIME2
+
+Intro
+=====
+
+These are open hardware boards, all based on the STmicro STMP157 SoC.
+
+for more details about the board see the following pages:
+ - https://www.olimex.com/Products/OLinuXino/open-source-hardware
+ - https://www.olimex.com/Products/OLinuXino/STMP1/STMP157-OLinuXino-LIME2/
+
+The following defconfigs are available:
+ - olimex_stmp157_olinuxino_lime_defconfig
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make <board>_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- stm32mp1xx-olinuxino-lime.dtb
+    +-- u-boot-spl.stm32
+    +-- u-boot.img
+    `-- zImage
+
+
+How to write the SD card
+========================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a uSD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD.
+
+Eject the SD card, insert it in the STMP1-OLinuXino board, and power it up.
+
diff --git a/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000..edb601c7c
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stmp1-olinuxino-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp1xx-olinuxino-lime.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/olimex/stmp1_olinuxino/uboot.fragment b/board/olimex/stmp1_olinuxino/uboot.fragment
new file mode 100644
index 000000000..2a97e6d9b
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/uboot.fragment
@@ -0,0 +1,16 @@
+
+# CONFIG_PMIC_STPMIC1 is not set
+# CONFIG_DM_REGULATOR_STPMIC1 is not set
+# CONFIG_SYSRESET_CMD_POWEROFF is not set
+CONFIG_AXP_PMIC_BUS=y
+CONFIG_AXP209_POWER=y
+
+# CONFIG_TYPEC_STUSB160X is not set
+
+# CONFIG_PHY_REALTEK is not set
+CONFIG_DM_MDIO=y
+CONFIG_PHY_MICREL=y
+CONFIG_PHY_MICREL_KSZ90X1=y
+
+# CONFIG_VIDEO_LCD_ORISETECH_OTM8009A is not set
+# CONFIG_VIDEO_LCD_RAYDIUM_RM68200 is not set
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
new file mode 100644
index 000000000..ec0fb36ba
--- /dev/null
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -0,0 +1,47 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 5.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_ROOTFS_OVERLAY="board/olimex/stmp1_olinuxino/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
+BR2_GLOBAL_PATCH_DIR="board/olimex/stmp1_olinuxino/patches"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.9"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp1xx-olinuxino-lime"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/olimex/stmp1_olinuxino/uboot.fragment"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp1-olinuxino-lime"
+
+# Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.30.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

