Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F22E7C4F1
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C296D419E7;
	Wed,  4 Oct 2023 20:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C296D419E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TmgK4gIS-roF; Wed,  4 Oct 2023 20:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7C5D40C99;
	Wed,  4 Oct 2023 20:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7C5D40C99
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B25A1BF3F4
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 20:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12124605B5
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 20:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12124605B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrT-gE8ZakIs for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 20:07:48 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1914605A9
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 20:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1914605A9
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3231dff4343so164484f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 13:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696450066; x=1697054866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MBPM5EBsXt/gWyUrwVv01Hwks7dTE2BJ5ZPJnvzs2LA=;
 b=McY8kxX89xM/mbfSYBfrop8mChapu6GWRCcGt7dVykfEdLtezc0G1SflsN+i9ZoJ56
 iWF9kAWaC7HZDPWczFP7zAtgBKCjppPhb1mxorUx2+H3zJ7zLS3AEND6Eb4BtryTeSZr
 Wk8wvw1ylOWQ+UXpbqdQqFJvthNjHm379hCKxYJ/j1jRqm31vZcni1rC7IoMseFwiiEM
 h/cgCRtxFm8xERSszY1TWtCiJL7scsUGKxFz7l7Uf9WkrUtyBxGxrSGdZVeaG8djCxbM
 m3hQUQxRyAmFkV+fE5hns1DXw/qOr2F4hmgOBPGaLtEPRZc1Zg5Cqb8WRRlzMt4tf/J8
 G7zA==
X-Gm-Message-State: AOJu0Yx/UvN9IW6etZCmOZb7kqlvoKME/MW22ZVOTnI2VeJ8tHq7ZkZV
 mKtXwlB+/q+kPfYIM2Ud/hoKOHbu0+poeQ==
X-Google-Smtp-Source: AGHT+IFv/OfP/QxvzShCYpQmdZouxCACfqIa3BFcpCt3O+xvUj55+xNJQxqQxUmUqvSpuUdyeOVUdQ==
X-Received: by 2002:adf:f78a:0:b0:316:fc03:3c66 with SMTP id
 q10-20020adff78a000000b00316fc033c66mr504280wrp.3.1696450065799; 
 Wed, 04 Oct 2023 13:07:45 -0700 (PDT)
Received: from comet.lan (adijon-658-1-12-16.w86-223.abo.wanadoo.fr.
 [86.223.115.16]) by smtp.gmail.com with ESMTPSA id
 o16-20020adfead0000000b003266ece0fe2sm4710412wrn.98.2023.10.04.13.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 13:07:45 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 22:07:25 +0200
Message-Id: <20231004200725.1952143-2-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231004200725.1952143-1-francois.dugast.foss@gmail.com>
References: <20231004200725.1952143-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696450066; x=1697054866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBPM5EBsXt/gWyUrwVv01Hwks7dTE2BJ5ZPJnvzs2LA=;
 b=f1EX2ewh7leuzzzQ5C1TS5ZKHiBQzuZ9JD1zyAc7osG+5XHKPxrdOR0EcbLVmsfAEz
 G3X9BH1hiTyLafoqByW1bcpHaQ3wBps6/8iTVKmpVDagIllIUb9RdVnl5lWPHHbViv/O
 mv5o92pdahdZO6706Ewfyf/V0RkOiLnu/AXRymKmM8H7DJhJTZnLiBKwb561yp9QZggE
 t0oIXyypd4kI4Dx9cyDRGEqcEJGrnh5wRWUPO6kJFumwSeLBiBBolxqaUgNrsIPICuRB
 gSgvqlpJv1ue69dZ1drWyqrgtDzvCMVz6fssCJAUC7bxoq5wO61/tZ6pd1SwSDOfmS/m
 5Akg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f1EX2ewh
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

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/licheepi/licheepi_nano/genimage.cfg   | 33 ++++++++++
 board/licheepi/licheepi_nano/linux.fragment | 11 ++++
 board/licheepi/licheepi_nano/readme.txt     | 68 +++++++++++++++++++++
 board/licheepi/licheepi_nano/uboot.fragment |  3 +
 configs/licheepi_nano_defconfig             | 43 +++++++++++++
 5 files changed, 158 insertions(+)
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
index 0000000000..131d46a9d1
--- /dev/null
+++ b/board/licheepi/licheepi_nano/readme.txt
@@ -0,0 +1,68 @@
+Intro
+=====
+
+This directory contains a buildroot configuration for building a
+LicheePi Nano.
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
+    +-- boot.scr
+    +-- boot.vfat
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- sun8i-v3s-licheepi-zero-dock.dtb
+    +-- sun8i-v3s-licheepi-zero.dtb
+    +-- u-boot.bin
+    +-- u-boot-sunxi-with-spl.bin
+    `-- zImage
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Alternatively, you can use the Etcher graphical tool to burn the image
+to the SD card safely and on any platform:
+
+https://etcher.io/
+
+Once the SD card is burned, insert it into your LicheePi Zero board,
+and power it up. Your new system should come up now and start a
+console on the UART0 serial port.
+--
+sudo ./output/host/bin/sunxi-fel -p spiflash-write 0 output/images/flash.bin
+--
+some kernel features are disabled to keep the size small but those are arbitrary tradeoffs, if you remove other stuff you can re enable them
+--
+use internal flash to free MMC for sdio wifi like the *** provided with lichee zero
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
