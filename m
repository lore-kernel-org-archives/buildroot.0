Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F5CCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 17:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C64381489;
	Tue, 19 Aug 2025 17:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oonfsu9kGeAG; Tue, 19 Aug 2025 17:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3608181490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3608181490;
	Tue, 19 Aug 2025 17:28:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC74BDE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1FE040CEE
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o836QdeXw1AJ for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 17:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 72D6840CE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D6840CE9
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72D6840CE9
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:28:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A25B01A0D18
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 17:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6DFBE60697;
 Tue, 19 Aug 2025 17:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8794D1C22C041; 
 Tue, 19 Aug 2025 19:28:31 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Damien Le Moal <dlemoal@kernel.org>
Date: Tue, 19 Aug 2025 19:28:29 +0200
Message-ID: <20250819172830.3350159-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755624512; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=TogTY8wKp0D1a6Ixd+B6WCQNd2oKKVm/4uw/qrCPwtQ=;
 b=ROF6eiHES6tmnT98LysyPOj1pnlxPD0W7eImWDc889fa35BBRWxwo+AOR79BRN5bFbWOkr
 6GFvOgO+mQd2MoPmsXVSiHKJQBc1cq7GUavbraCcY6SjNhO2h6s/NZzrc4leZWOSWQ/bqY
 +UuivbU0tl9rBI9m/R0JvHlVEb7neSmuTQTZ0B5nLirRLFuYPuBsBJDOn7n/csVqHjd0VZ
 v4aJQU4TRcQrdelIWGaUcjZZJfZT5MjtBpEVZfuRCYslgWjRxNpiVXAJv666ziNkxuTZu3
 OL/f+f5HV3Ny+fUy9x8OyqIH2OHG2FiZURRBrjxnQ8DhyYnHKUFxpegBNbE+sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ROF6eiHE
Subject: [Buildroot] [PATCH] configs/sipeed_licheepi_zero: remove defconfig,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001

It has been broken for over 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dsipeed_licheepi_zero&kind=BUILD

It uses Linux 5.8.3, which is not even an LTS maintained kernel.

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771001

Cc: Michel Stempin <michel.stempin@wanadoo.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                     |  1 -
 DEVELOPERS                              |  4 --
 board/sipeed/licheepi_zero/boot.cmd     |  4 --
 board/sipeed/licheepi_zero/genimage.cfg | 36 --------------
 board/sipeed/licheepi_zero/readme.txt   | 62 -------------------------
 configs/sipeed_licheepi_zero_defconfig  | 38 ---------------
 6 files changed, 145 deletions(-)
 delete mode 100644 board/sipeed/licheepi_zero/boot.cmd
 delete mode 100644 board/sipeed/licheepi_zero/genimage.cfg
 delete mode 100644 board/sipeed/licheepi_zero/readme.txt
 delete mode 100644 configs/sipeed_licheepi_zero_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 8720dcb9a8..e075426313 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -169,7 +169,6 @@ configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_licheepi_nano_defconfig lib_defconfig.ForceCheckHash
-configs/sipeed_licheepi_zero_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_bit_sdcard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_maix_dock_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 6d17d1464a..a8bb88b917 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2459,10 +2459,6 @@ F:	package/netifrc/
 F:	package/openrc/
 F:	package/skeleton-init-openrc/
 
-N:	Michel Stempin <michel.stempin@wanadoo.fr>
-F:	board/sipeed/licheepi_zero/
-F:	configs/sipeed_licheepi_zero_defconfig
-
 N:	Mika Westerberg <mika.westerberg@linux.intel.com>
 F:	package/tbtools/
 
diff --git a/board/sipeed/licheepi_zero/boot.cmd b/board/sipeed/licheepi_zero/boot.cmd
deleted file mode 100644
index 383b3473ed..0000000000
--- a/board/sipeed/licheepi_zero/boot.cmd
+++ /dev/null
@@ -1,4 +0,0 @@
-setenv bootargs console=ttyS0,115200 panic=5 console=tty0 rootwait root=/dev/mmcblk0p2 earlyprintk rw
-load mmc 0:1 0x41000000 zImage
-load mmc 0:1 0x41800000 sun8i-v3s-licheepi-zero-dock.dtb
-bootz 0x41000000 - 0x41800000
diff --git a/board/sipeed/licheepi_zero/genimage.cfg b/board/sipeed/licheepi_zero/genimage.cfg
deleted file mode 100644
index 8dcb2e708e..0000000000
--- a/board/sipeed/licheepi_zero/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-v3s-licheepi-zero-dock.dtb",
-			"sun8i-v3s-licheepi-zero.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 8M
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
-		size = 504K # 512KB - 8KB
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
-		size = 0
-	}
-}
diff --git a/board/sipeed/licheepi_zero/readme.txt b/board/sipeed/licheepi_zero/readme.txt
deleted file mode 100644
index 2f122125b7..0000000000
--- a/board/sipeed/licheepi_zero/readme.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-Intro
-=====
-
-This directory contains a buildroot configuration for building a
-LicheePi Zero.
-
-How to build it
-===============
-
-Configure Buildroot
--------------------
-
-  $ make sipeed_licheepi_zero_defconfig
-
-Build the rootfs
-----------------
-
-Note: you will need to have access to the network, since Buildroot
-will download the packages' sources.
-
-You may now build your rootfs with:
-
-  $ make
-
-(This may take a while, consider getting yourself a coffee ;-) )
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-    output/images/
-    +-- boot.scr
-    +-- boot.vfat
-    +-- rootfs.ext2
-    +-- rootfs.ext4 -> rootfs.ext2
-    +-- rootfs.tar
-    +-- sdcard.img
-    +-- sun8i-v3s-licheepi-zero-dock.dtb
-    +-- sun8i-v3s-licheepi-zero.dtb
-    +-- u-boot.bin
-    +-- u-boot-sunxi-with-spl.bin
-    `-- zImage
-
-How to write the SD card
-========================
-
-Once the build process is finished you will have an image called
-"sdcard.img" in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Alternatively, you can use the Etcher graphical tool to burn the image
-to the SD card safely and on any platform:
-
-https://etcher.io/
-
-Once the SD card is burned, insert it into your LicheePi Zero board,
-and power it up. Your new system should come up now and start a
-console on the UART0 serial port.
diff --git a/configs/sipeed_licheepi_zero_defconfig b/configs/sipeed_licheepi_zero_defconfig
deleted file mode 100644
index e92c1d854e..0000000000
--- a/configs/sipeed_licheepi_zero_defconfig
+++ /dev/null
@@ -1,38 +0,0 @@
-BR2_arm=y
-BR2_cortex_a7=y
-BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
-BR2_TARGET_GENERIC_HOSTNAME="licheepi-zero"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sipeed/licheepi_zero/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.5"
-BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-v3s-licheepi-zero sun8i-v3s-licheepi-zero-dock"
-BR2_PACKAGE_LINUX_FIRMWARE=y
-BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX=y
-BR2_PACKAGE_WPA_SUPPLICANT=y
-BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sipeed/licheepi_zero/boot.cmd"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
