Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F86CA0EED
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 10:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086D04029B;
	Tue, 19 Aug 2025 10:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLTPKPnH72Wz; Tue, 19 Aug 2025 10:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039EF40312
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 039EF40312;
	Tue, 19 Aug 2025 10:07:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4D2E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50F6740312
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7FiRTfQzwwNN for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 10:07:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 187264029B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 187264029B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 187264029B
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:07:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 54ECB4E40C05;
 Tue, 19 Aug 2025 10:07:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A6C960697;
 Tue, 19 Aug 2025 10:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4E56B1C22C6C8; 
 Tue, 19 Aug 2025 12:07:04 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 19 Aug 2025 12:07:02 +0200
Message-ID: <20250819100702.3316421-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755598027; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=7P+08GFX7DG3Y4Ly6+GhH+1BiIwxa/qvj7MPFaZ6gB8=;
 b=NRVcqnUO7sn03C/Av0yNzNtTD/MGGZZahwAp78n3oBY4QNyNAuqsJBiCW8ZqDR7CycDOBf
 O859hHXZB73sUApslGz1kv8aqoMM2ASEnGbTTgg0Ix7cThCnxzWT0BZcNxCYBrwjQT81yE
 X2aozjeiPEqLLA3ZoTMnWNd5iMQBsBvJ9INL3z/qCLez+Fwl424+R4Mdb/s0XlfVy1BlEs
 Jh6t+FwxMXqdzxVwJcVxCHNlPNEGftVveyo4meIGHtdUesAyXiip0R43RbqqPdAC4NvA1e
 nOKJNEI4faHiAqlOry5Kq5rqKbvujOtZTUXP6Uhd6ONJNOxXRsey1tlDXyCxkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=NRVcqnUO
Subject: [Buildroot] [PATCH] configs/orangepi_one_plus: remove defconfig,
 broken
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Meena Murthy <meena.murthy@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274055

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dorangepi_one_plus&kind=BUILD

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274055

Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  2 -
 DEVELOPERS                                    |  2 -
 .../orangepi/orangepi-one-plus/extlinux.conf  |  4 --
 board/orangepi/orangepi-one-plus/genimage.cfg | 34 -----------------
 .../orangepi/orangepi-one-plus/post-build.sh  |  4 --
 board/orangepi/orangepi-one-plus/readme.txt   | 37 -------------------
 configs/orangepi_one_plus_defconfig           | 34 -----------------
 7 files changed, 117 deletions(-)
 delete mode 100644 board/orangepi/orangepi-one-plus/extlinux.conf
 delete mode 100644 board/orangepi/orangepi-one-plus/genimage.cfg
 delete mode 100755 board/orangepi/orangepi-one-plus/post-build.sh
 delete mode 100644 board/orangepi/orangepi-one-plus/readme.txt
 delete mode 100644 configs/orangepi_one_plus_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 554f828c76..ccc58d0be8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -40,7 +40,6 @@ board/olimex/a20_olinuxino/post-build.sh Shellcheck
 board/olimex/a33_olinuxino/post-build.sh Shellcheck
 board/olpc/post-build.sh Shellcheck
 board/orangepi/common/post-build.sh Shellcheck
-board/orangepi/orangepi-one-plus/post-build.sh Shellcheck
 board/orangepi/orangepi-zero/patches/linux/0001-ARM-dts-orange-pi-zero-interrupt-triggering-xr819.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch lib_patch.Upstream
 board/orangepi/orangepi-zero/patches/linux/0003-ARM-dts-orange-pi-zero-enable-spidev.patch lib_patch.Upstream
@@ -161,7 +160,6 @@ configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
-configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index f3e3edf91d..242179d803 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1490,14 +1490,12 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
-F:	board/orangepi/orangepi-one-plus
 F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
-F:	configs/orangepi_one_plus_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
diff --git a/board/orangepi/orangepi-one-plus/extlinux.conf b/board/orangepi/orangepi-one-plus/extlinux.conf
deleted file mode 100644
index f573aa17d0..0000000000
--- a/board/orangepi/orangepi-one-plus/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label linux
-  kernel /Image
-  devicetree /sun50i-h6-orangepi-one-plus.dtb
-  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/orangepi/orangepi-one-plus/genimage.cfg b/board/orangepi/orangepi-one-plus/genimage.cfg
deleted file mode 100644
index 80b83b0215..0000000000
--- a/board/orangepi/orangepi-one-plus/genimage.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-h6-orangepi-one-plus.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 64M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8K
-		size = 1016K # 1MB - 8KB
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/orangepi/orangepi-one-plus/post-build.sh b/board/orangepi/orangepi-one-plus/post-build.sh
deleted file mode 100755
index ec20fca7d9..0000000000
--- a/board/orangepi/orangepi-one-plus/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/orangepi/orangepi-one-plus/readme.txt b/board/orangepi/orangepi-one-plus/readme.txt
deleted file mode 100644
index 547f874288..0000000000
--- a/board/orangepi/orangepi-one-plus/readme.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Orangepi One Plus. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-Orangepi One Plus link:
-http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-One-Plus.html
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+One+Plus
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make orangepi_one_plus_defconfig
-    $ make
-
-Note: you will need access to the internet to download the required
-sources.
-
-How to write the SD card
-========================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-  $ sudo sync
-
-Insert the micro SDcard in your Orangepi One Plus and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_one_plus_defconfig b/configs/orangepi_one_plus_defconfig
deleted file mode 100644
index 8de158b0b1..0000000000
--- a/configs/orangepi_one_plus_defconfig
+++ /dev/null
@@ -1,34 +0,0 @@
-BR2_aarch64=y
-BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi One+"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-one-plus/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-one-plus/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,amarula,linux-amarula,h6-v1.0b)/linux-amarula_h6-v1.0b.tar.gz"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-orangepi-one-plus"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one_plus"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
