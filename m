Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8902ED3C536
	for <buildroot@archiver.kernel.org>; Thu, 17 Oct 2024 21:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBCF760736;
	Thu, 17 Oct 2024 21:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBFyILX4d10T; Thu, 17 Oct 2024 21:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BE460730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BE460730;
	Thu, 17 Oct 2024 21:29:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BE1727DD
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 21:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66FC060722
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 21:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-MVYATWamJ0 for <buildroot@buildroot.org>;
 Thu, 17 Oct 2024 21:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05C096072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05C096072B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05C096072B
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 21:29:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43124843b04so13967575e9.2
 for <buildroot@buildroot.org>; Thu, 17 Oct 2024 14:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729200548; x=1729805348;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33rfuKFREwtjilpXA+zFq69v/7xKvFdeWDx15YCRf1w=;
 b=dVNkho3xmsIcZjuj1voStAePlV2g4aNN+a02QvMllFcVRE7AhW8JqMlnu5ceUgYVpG
 5zCLRXDKSHc3H+yI6Lp2okDi2+3be3JG5dJ6bDf1HwP+xXvNM3dsSeCMWWPvHBfRnSGe
 E4Z79TWF7AL593CEjZ+HG6uUaDFxnjuxQPoOyQv/DmEB9Cvei5rzUlncklYLqy4tPBEr
 xr7K+1ECpDRuskgKgX57MJK9xOiylMwZiCH3EPKiL8SJbVu5ijs//3+IFdB/N07at9eL
 BtVSUb4VIqbytFg9GkCHX8jES9S3eXl0AZV2QmS+88UaxgsdEazdv+iOYw13AAsRjtGH
 VNLA==
X-Gm-Message-State: AOJu0YwH6AP9JUFhgI+BIvemkMtALCeMkpXM6Zr1JefktBUKkLiKD3nw
 PehRDwadzdzSfCa2F2/5PWwHyIDxq0Cm3b2y3/1XKp1xSjGh+hax
X-Google-Smtp-Source: AGHT+IHyWQj2UvS4a77uy9mF7Jb8iVc9eDBeOwckgI+N1o/2CErYeexrK7fqTn7sYSWWRHO1CqFSTg==
X-Received: by 2002:a05:600c:35d3:b0:431:5459:33c2 with SMTP id
 5b1f17b1804b1-4316164edd8mr780815e9.17.1729200547562; 
 Thu, 17 Oct 2024 14:29:07 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43160e443a4sm4149715e9.37.2024.10.17.14.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 14:29:07 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Thu, 17 Oct 2024 23:28:58 +0200
MIME-Version: 1.0
Message-Id: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJmBEWcC/1XMSwqDMBSF4a1Ixk3Ji5p01H0UB/Hmqhfqg0SkR
 dx7o7TQDs/h51tZwkiY2LVYWcSFEo1DHupUMOj80CKnkDdTQhlRKsd7n2aMXPsSHNQO3KVmOZ4
 iNvQ8oHuVd0dpHuPrcBe5vx9Ciy+xSC64Bm+tA2nQm1vbe3qcYex38citNH95abVpdMAQoP7Jq
 23b3vP9HRbLAAAA
X-Change-ID: 20240729-master-3a7c9cb9c96b
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729200548; x=1729805348; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33rfuKFREwtjilpXA+zFq69v/7xKvFdeWDx15YCRf1w=;
 b=P4l+labh0TbO7ZBJs8yRhXjia62mIQAWYSzSYixmLqHkXx1I6P1yjAPD3NEJM/DSoh
 VR2BF2g2VnNqOa8XOZSUgTNraaQoy1P8k34T1D7PYNRReEC7+vIOyXRrs5c5c7vKh/3p
 2rHTIL/PRt7vj1yvC6dG46Gqh33OoKSMa4hatmbtKos4kwMn27ZMaY6yedz09vGdTyWN
 1GszMIAxFEHg472p/QsGxn9FyBcUcsfxOpDHeyjbGGGefUVUgWbr95Igyquy+hJWkhfx
 x/y11tBIzM6xTZjHLjc5ZE/EjDogvsLe86I5WISIwNmj8vhyFHek+ThXPGOxcm3xQj5S
 bH5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P4l+labh
Subject: [Buildroot] [PATCH v2] configs/stm32mp135f-dk: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new defconfig for STMicroelectronics board STM32MP135F-DK.

STM32MP135F-DK features can be found here:
  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
This commit series is a first attempt to improve the organization and
functionality of the STM32 platform in Buildroot. It comes with two
patches:

1. Reorder common ST folder:
   - Rename the common ST folder from stm32mp157 to stm32mp1xx.
   - Update references and paths in related configuration files.
   - Prepare to receive new stm32mp13 board.

2. Add new defconfig for STM32MP13:
   - Introduce a new defconfig file (stm32mp13_dk).
   - Boot following the TF-A/OP-TEE/U-Boot/Linux chain.
   v1:
   - Include generic "multi_v7" defconfig for Linux configuration.
   v2:
   - Include a minimalistic defconfig for Linux configuration.

Since this is a RFC, please feel free to discuss how those changes can
be improved.
---
Changes in v2:
- Removed merged patch:
https://gitlab.com/buildroot.org/buildroot/-/commit/f21db2bd83bf3073a50b8bcd79af6e7aed6fb000
- Include a minimalistic defconfig for Linux configuration
- Removed BR2_PACKAGE_HOST_BMAP_TOOLS option.
- Move BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL to the according section.
- Hardcode OP-TEE version using tarball link.
- Use BR2_GLOBAL_PATCH_DIR and add OP-TEE hash to common folder.
- Link to v1: https://lore.kernel.org/r/20240814-master-v1-0-7834f3deddcb@gmail.com
---
 .../stm32mp1xx/patches/optee-os/optee-os.hash      |   2 +
 .../stmicroelectronics/stm32mp135f-dk/linux.config | 190 +++++++++++++++++++++
 .../overlay/boot/extlinux/extlinux.conf            |   4 +
 board/stmicroelectronics/stm32mp135f-dk/readme.txt |  38 +++++
 configs/stm32mp135f_dk_defconfig                   |  64 +++++++
 5 files changed, 298 insertions(+)

diff --git a/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000000000000000000000000000000000..c87851fc6b0a52f135da449495527d26259929f9
--- /dev/null
+++ b/board/stmicroelectronics/common/stm32mp1xx/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  390b271905c828d6def9fa6a77bbaa425f3b434d733c8eb18f582ccbc6896096  4.3.0.tar.gz
diff --git a/board/stmicroelectronics/stm32mp135f-dk/linux.config b/board/stmicroelectronics/stm32mp135f-dk/linux.config
new file mode 100644
index 0000000000000000000000000000000000000000..533f22345b0c6fe69edf7fc901996809377f6162
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/linux.config
@@ -0,0 +1,190 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_USELIB=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+# CONFIG_CACHE_L2X0 is not set
+CONFIG_ARM_ERRATA_430973=y
+CONFIG_ARM_ERRATA_720789=y
+CONFIG_ARM_ERRATA_754322=y
+CONFIG_ARM_ERRATA_754327=y
+CONFIG_ARM_ERRATA_764369=y
+CONFIG_ARM_ERRATA_775420=y
+CONFIG_ARM_ERRATA_798181=y
+CONFIG_SMP=y
+CONFIG_MCPM=y
+CONFIG_HIGHMEM=y
+CONFIG_FORCE_MAX_ZONEORDER=12
+CONFIG_SECCOMP=y
+# CONFIG_ATAGS is not set
+CONFIG_ZBOOT_ROM_TEXT=0x0
+CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_ARM_ATAG_DTB_COMPAT=y
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_CMDLINE_PARTITION=y
+CONFIG_CMA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CAN=y
+CONFIG_CAN_M_CAN=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DMA_CMA=y
+CONFIG_CMA_SIZE_MBYTES=128
+CONFIG_SIMPLE_PM_BUS=y
+CONFIG_ARM_SCMI_PROTOCOL=y
+CONFIG_MTD=y
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_STM32_FMC2=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_UBI=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_SRAM=y
+CONFIG_EEPROM_AT24=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_KS8851=y
+CONFIG_SMSC911X=y
+CONFIG_STMMAC_ETH=y
+CONFIG_DWMAC_DWC_QOS_ETH=y
+CONFIG_MDIO_BITBANG=y
+CONFIG_INPUT_JOYDEV=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_EDT_FT5X06=y
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_STPMIC1_ONKEY=y
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_HW_RANDOM=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_STM32F7=y
+CONFIG_SPI=y
+CONFIG_SPI_STM32=y
+CONFIG_SPI_STM32_QSPI=y
+CONFIG_PINCTRL_MCP23S08=m
+CONFIG_PINCTRL_SINGLE=y
+CONFIG_PINCTRL_STMFX=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
+CONFIG_SYSCON_REBOOT_MODE=y
+CONFIG_WATCHDOG=y
+CONFIG_STPMIC1_WATCHDOG=y
+CONFIG_MFD_STM32_LPTIMER=y
+CONFIG_MFD_STPMIC1=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ARM_SCMI=y
+CONFIG_REGULATOR_STM32_BOOSTER=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+CONFIG_REGULATOR_STPMIC1=y
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_DRM_SII902X=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+# CONFIG_BACKLIGHT_GENERIC is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_USB=y
+CONFIG_USB_OTG=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_CHIPIDEA=y
+CONFIG_USB_CHIPIDEA_HOST=y
+CONFIG_USB_ISP1760=y
+CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_GPIO_VBUS=y
+CONFIG_USB_ISP1301=y
+CONFIG_USB_ULPI=y
+CONFIG_TYPEC=y
+CONFIG_TYPEC_STUSB=y
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK_MINORS=16
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+CONFIG_MMC_DW=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PWM=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+CONFIG_COMMON_CLK_SCMI=y
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+CONFIG_STM32_IPCC=y
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+CONFIG_RPMSG_VIRTIO=y
+CONFIG_RPMSG_TTY=y
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_ADC_TEMP=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_LPTIMER_CNT=y
+CONFIG_STM32_DAC=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+CONFIG_PWM=y
+CONFIG_PWM_STM32=y
+CONFIG_PWM_STM32_LP=y
+CONFIG_RESET_SCMI=y
+CONFIG_PHY_STM32_USBPHYC=y
+CONFIG_NVMEM_STM32_ROMEM=y
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+CONFIG_COUNTER=m
+CONFIG_STM32_LPTIMER_CNT=m
+CONFIG_STM32_TIMER_CNT=m
+CONFIG_EXT4_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_PRINTK_TIME=y
diff --git a/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000000000000000000000000000000000..0cc49d6a560a90846ead993ff02d38cc7cadc7e7
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp135f-dk-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp135f-dk.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp135f-dk/readme.txt b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
new file mode 100644
index 0000000000000000000000000000000000000000..46879f88cf00d501966181624ca9a318d2ce94d2
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
@@ -0,0 +1,38 @@
+STM32MP135F Discovery Kit
+
+Intro
+=====
+
+This configuration supports the STM32MP135F Discovery Kit (DK)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html
+
+How to build
+============
+
+ $ make stm32mp135f_dk_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Insert the microSD card in connector CN15
+
+ (2) Plug a micro-USB cable in connector CN11 and run your serial
+     communication program on /dev/ttyACM0.
+
+ (3) Plug a USB-C cable in CN6 to power-up the board.
+
+ (4) The system will start, with the console on UART, but also visible
+     on the screen.
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
new file mode 100644
index 0000000000000000000000000000000000000000..d41821bdaf6e94c255e38f468752dcd28abb6bbb
--- /dev/null
+++ b/configs/stm32mp135f_dk_defconfig
@@ -0,0 +1,64 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 6.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
+
+# System configuration
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp135f-dk/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 DTB_FILE_NAME=stm32mp135f-dk.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="https://github.com/OP-TEE/optee_os/archive/refs/tags/4.3.0.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp1"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp135f-dk"
+
+# Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y

---
base-commit: e3f464778945d3e7ed31c50d07de02fb2cd85464
change-id: 20240729-master-3a7c9cb9c96b

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
