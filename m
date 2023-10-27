Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142F7C25B67
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 11:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 971B243460;
	Fri, 27 Oct 2023 11:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971B243460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VlEAm22_-LE; Fri, 27 Oct 2023 11:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3721343463;
	Fri, 27 Oct 2023 11:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3721343463
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D50B61BF33F
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 11:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE46841EA7
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 11:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE46841EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsF7hvbnigW4 for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 11:47:36 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6110741DE0
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 11:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6110741DE0
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so29452011fa.1
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 04:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698407254; x=1699012054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8xnDQxC6l0e4Rj6cifsVS781N0tgvADBQ0a5qgPMgM=;
 b=TeLAfyEYtcMMjuTKr+nlcUoohbOlrvqpcG+6TxT5AbQbvMFZWJA1gmi9SAq0v8Gcdb
 ib8BKviuy2m5pyDCc89HjGZE9Ldbkwdch9/zVLaf/TyoT0BlbHNDANIAKDuob8+0yL5g
 FwrReuBhLMwihTXuCHSGxRXIzQiMnsrz7GRzhAmNCnqE3fM/Uf2I0EcuuATNHaOCcrxE
 5dXbx3ByYgANibMiTHfV1J4f+ZwcS6t46zAuKB4UMh5hH9bLQbJpGSvpgaFvPpNI/iI/
 Kd4ufxoaNT4FkU7qZOWCI53hVi85fi3SGzJsmfbT/0q/Ly8B6+mhRz9aN25zS98tz4nh
 Si6Q==
X-Gm-Message-State: AOJu0YwleUINXmyHCcbnAx0w/BF6HunirIXvDKEdCyEqB5waccObZmoW
 GpXsHJOYhmALGsam1cUfoz+1blalk+Q=
X-Google-Smtp-Source: AGHT+IE7YvzB+f00OcIgyX7Xz0F093AbwVmQ/Q+0+dh8IwwqMOjJmurgl2elJD56PVI5L9S4MPp5xA==
X-Received: by 2002:a2e:7e0e:0:b0:2c0:34ed:b5ea with SMTP id
 z14-20020a2e7e0e000000b002c034edb5eamr1851608ljc.45.1698407253940; 
 Fri, 27 Oct 2023 04:47:33 -0700 (PDT)
Received: from comet.lan (adijon-658-1-12-16.w86-223.abo.wanadoo.fr.
 [86.223.115.16]) by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c471100b00407460234f9sm1437713wmo.21.2023.10.27.04.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 04:47:33 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 13:47:00 +0200
Message-Id: <20231027114700.1904-2-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
References: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698407254; x=1699012054; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8xnDQxC6l0e4Rj6cifsVS781N0tgvADBQ0a5qgPMgM=;
 b=bA2+rwaRwc/RM9nqix+qleT+gwwSf3Dunx1KG1bA8Y4ZpAgM6GkwOjVDFf58fox1KY
 7FJwl2MmdvnD18dO1iqDefDpgSep/l+vJTsSPbtv6VDxoBoJkXs1ieFc3Ky0gJbvIBaC
 moG0/zV2L8WNR+sYicfX1ddI0/V/qLfT3GlreeHYoCWV6MDq0E2NWBQg7kIu6sKCrXPd
 zUkG1gqFAuKP6PUS7BUq8M8O3vXiM4vvtc7ArwNeEGPDvavaZvOYXNwoFH4VCs6js/na
 fAjCG1NFCjJK5kd8NdRBR0DJDoHA4qsjz/8JUxl0ByXmK+3xw2PyKS5FpZdVYBkf8BK+
 5SWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bA2+rwaR
Subject: [Buildroot] [PATCH 2/2] board/licheepi/licheepi_nano: new board
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the LicheePi Nano with:
- U-Boot 2023.04
- Linux current latest version

Board homepage: https://linux-sunxi.org/LicheePi_Nano

linux.fragment is required to disable some features in order
to keep the kernel size small, otherwise the board does not
boot due to limited memory. See note in readme.txt.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/licheepi/licheepi_nano/genimage.cfg   | 33 ++++++++
 board/licheepi/licheepi_nano/linux.fragment | 11 +++
 board/licheepi/licheepi_nano/readme.txt     | 84 +++++++++++++++++++++
 board/licheepi/licheepi_nano/uboot.fragment |  3 +
 configs/licheepi_nano_defconfig             | 43 +++++++++++
 5 files changed, 174 insertions(+)
 create mode 100644 board/licheepi/licheepi_nano/genimage.cfg
 create mode 100644 board/licheepi/licheepi_nano/linux.fragment
 create mode 100644 board/licheepi/licheepi_nano/readme.txt
 create mode 100644 board/licheepi/licheepi_nano/uboot.fragment
 create mode 100644 configs/licheepi_nano_defconfig

diff --git a/board/licheepi/licheepi_nano/genimage.cfg b/board/licheepi/licheepi_nano/genimage.cfg
new file mode 100644
index 0000000000..5e398eeb21
--- /dev/null
+++ b/board/licheepi/licheepi_nano/genimage.cfg
@@ -0,0 +1,33 @@
+flash w25q128 {
+	pebsize = 65536
+	numpebs = 256
+	minimum-io-unit-size = 1
+	sub-page-size = 1
+	vid-header-offset = 64
+}
+
+image flash.bin {
+	flash {}
+	flashtype = w25q128
+
+	partition uboot {
+		image = "u-boot-sunxi-with-spl.bin"
+		size = 512K
+	}
+
+	partition dtb {
+		image = "suniv-f1c100s-licheepi-nano.dtb"
+		size = 64K
+	}
+
+	partition zimage {
+		image = "zImage"
+		size = 5M
+	}
+
+	partition rootfs {
+		image = "rootfs.jffs2"
+		size = 0
+	}
+}
+
diff --git a/board/licheepi/licheepi_nano/linux.fragment b/board/licheepi/licheepi_nano/linux.fragment
new file mode 100644
index 0000000000..af68f28167
--- /dev/null
+++ b/board/licheepi/licheepi_nano/linux.fragment
@@ -0,0 +1,11 @@
+# CONFIG_NET is not set
+# CONFIG_DRM is not set
+# CONFIG_CMA is not set
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_UEVENT_HELPER=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NOR=y
+# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_JFFS2_FS=y
diff --git a/board/licheepi/licheepi_nano/readme.txt b/board/licheepi/licheepi_nano/readme.txt
new file mode 100644
index 0000000000..55aa602777
--- /dev/null
+++ b/board/licheepi/licheepi_nano/readme.txt
@@ -0,0 +1,84 @@
+Intro
+=====
+
+This directory contains a buildroot configuration for building a
+LicheePi Nano image which can be flashed into the board.
+
+This frees the MMC port which can be used for an additional SD
+card of for a WiFi adapter.
+
+How to build it
+===============
+
+Configure Buildroot
+-------------------
+
+  $ make licheepi_nano_defconfig
+
+Build the rootfs
+----------------
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+You may now build your rootfs with:
+
+  $ make
+
+(This may take a while, consider getting yourself a coffee ;-) )
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+    output/images/
+    +-- flash.bin
+    +-- rootfs.jffs2
+    +-- rootfs.tar
+    +-- suniv-f1c100s-licheepi-nano.dtb
+    +-- u-boot.bin
+    +-- u-boot-sunxi-with-spl.bin
+    `-- zImage
+
+How to flash
+============
+
+Once the build process is finished you will have an image called
+"flash.bin" in the output/images/ directory. It contains the
+bootloader, the device tree, the kernel and the root file system.
+
+The device can be flashed when it is in special mode called "FEL
+mode". There are multiple ways to enter this mode described here:
+https://linux-sunxi.org/FEL#Entering_FEL_mode
+
+One way is to write one file from sunxi-tools to a SD card with:
+
+  $ sudo dd if=./output/build/host-sunxi-tools-*/bin/fel-sdboot.sunxi of=/dev/sdX bs=1024 seek=8
+
+Once the SD card is burned, insert it into your LicheePi Nano board,
+and plug the USB cable. A new USB device should be visible with
+lsusb:
+
+  1f3a:efe8 Allwinner Technology sunxi SoC OTG connector in FEL/flashing mode
+
+The image can be flashed with:
+
+  $ sudo ./output/host/bin/sunxi-fel -p spiflash-write 0 output/images/flash.bin
+
+Once this completes, remove the SD card and power the board. Your
+new system should come up now and start a console on the UART0
+serial port.
+
+Note
+====
+
+Some standard kernel features are disabled using the fragment in
+order to reduce the size. They can be enabled again if other
+features are disabled instead.
+
+For U-Boot, the upstream repository is preferred and the system
+boots, but loading the image from the flash takes a long time. It
+is much faster when using the branch "licheepi-nano-v2020.01" of
+this fork:
+https://github.com/florpor/u-boot
diff --git a/board/licheepi/licheepi_nano/uboot.fragment b/board/licheepi/licheepi_nano/uboot.fragment
new file mode 100644
index 0000000000..39f2bfe742
--- /dev/null
+++ b/board/licheepi/licheepi_nano/uboot.fragment
@@ -0,0 +1,3 @@
+CONFIG_USE_BOOTARGS=y
+CONFIG_BOOTARGS="console=tty0 console=ttyS0,115200 panic=5 rootwait root=/dev/mtdblock3 rw rootfstype=jffs2 mtdparts=spi0.0:512k(uboot)ro,64k(dtb),5M(kernel)ro,-(rootfs)"
+CONFIG_BOOTCOMMAND="sf probe 0 50000000; sf read 0x80C00000 0x80000 0x4000; sf read 0x80008000 0x90000 0x500000; bootz 0x80008000 - 0x80C00000"
diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
new file mode 100644
index 0000000000..3dbd29241f
--- /dev/null
+++ b/configs/licheepi_nano_defconfig
@@ -0,0 +1,43 @@
+# Target options
+BR2_arm=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="licheepi-nano"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Nano"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/licheepi_nano/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/licheepi/licheepi_nano/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/suniv-f1c100s-licheepi-nano"
+
+# Filesystem images
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_FLASH_64=y
+BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
+BR2_TARGET_ROOTFS_JFFS2_PAD=y
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="licheepi_nano"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/licheepi/licheepi_nano/uboot.fragment"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required host utilities
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_SUNXI_TOOLS=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
