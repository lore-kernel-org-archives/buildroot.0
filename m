Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB2CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 10:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0360F811F9;
	Tue, 19 Aug 2025 10:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zuc9UPuajMu; Tue, 19 Aug 2025 10:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAD37811FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD37811FB;
	Tue, 19 Aug 2025 10:11:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F2C7E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80DEE4014F
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAVcjrgwSzkq for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 10:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7D913400AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D913400AD
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D913400AD
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:11:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4F9DDC6B390
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:11:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C954960697;
 Tue, 19 Aug 2025 10:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5D801C22C74C; 
 Tue, 19 Aug 2025 12:11:29 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 19 Aug 2025 12:11:27 +0200
Message-ID: <20250819101128.3318447-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755598291; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=D9AhMDqyryMa0fwPibu/Zk0OiuoTh3Rcaa0A7nE1K2c=;
 b=ITGvPREMbshMwjnAuehlawSDhNDuu3nC+ra6pP2s04Z2XWiiL1ln1tqKTs6Oxc9fxX2Cws
 egXuS6rxDGndIA+mtzcKasfVunqRYRrcnBpcwRSqJvJzkHdD9ecqFsjZknR8BBnA5Itf7c
 mKHo0yF2aa5KNoh9H6cJ3I04Xl6Tgkv1pPQpD50ov1C8oravjZEvDDUJfdGjx0+pG7Wo5/
 NNZtC9ngqXgMw1Pg43Oj0zFlgXVrSDVFmyUnW4/4HylMwoQrdJgLpbdCQeVUDSycIUJ/bg
 BFly3lykDlUG512jtUSXInoSXL1fax0Ei2rHg6w9s7sOpK6P0Iury33nFuyLnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=ITGvPREM
Subject: [Buildroot] [PATCH] configs/pine64_sopine: remove defconfig, broken
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

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147

It has been broken for at least 2 months:

  https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dpine64_sopine&kind=BUILD

Unless a fix is provided, this defconfig will be removed.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274147

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore              |  1 -
 DEVELOPERS                       |  1 -
 board/pine64/sopine/boot.cmd     |  6 -----
 board/pine64/sopine/genimage.cfg | 40 --------------------------------
 board/pine64/sopine/readme.txt   | 38 ------------------------------
 configs/pine64_sopine_defconfig  | 37 -----------------------------
 6 files changed, 123 deletions(-)
 delete mode 100644 board/pine64/sopine/boot.cmd
 delete mode 100644 board/pine64/sopine/genimage.cfg
 delete mode 100644 board/pine64/sopine/readme.txt
 delete mode 100644 configs/pine64_sopine_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 93f36640b3..9f0db52969 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -166,7 +166,6 @@ configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
 configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_sopine_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
 configs/riotboard_defconfig lib_defconfig.ForceCheckHash
 configs/rock64_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index 38dc7ab074..d2f36e5465 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1496,7 +1496,6 @@ F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
-F:	configs/pine64_sopine_defconfig
 F:	package/python-scipy/
 F:	support/testing/tests/package/sample_python_scipy.py
 F:	support/testing/tests/package/test_python_scipy.py
diff --git a/board/pine64/sopine/boot.cmd b/board/pine64/sopine/boot.cmd
deleted file mode 100644
index 2eab642370..0000000000
--- a/board/pine64/sopine/boot.cmd
+++ /dev/null
@@ -1,6 +0,0 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
-
-fatload mmc 0 $kernel_addr_r Image
-fatload mmc 0 $fdt_addr_r sun50i-a64-sopine-baseboard.dtb
-
-booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/pine64/sopine/genimage.cfg b/board/pine64/sopine/genimage.cfg
deleted file mode 100644
index 9300f3d601..0000000000
--- a/board/pine64/sopine/genimage.cfg
+++ /dev/null
@@ -1,40 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"Image",
-			"sun50i-a64-sopine-baseboard.dtb",
-			"boot.scr"
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
-	partition spl {
-		in-partition-table = "no"
-		image = "sunxi-spl.bin"
-		offset = 8K
-	}
-
-	partition u-boot {
-		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40KB
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
diff --git a/board/pine64/sopine/readme.txt b/board/pine64/sopine/readme.txt
deleted file mode 100644
index 08cb380b46..0000000000
--- a/board/pine64/sopine/readme.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the SoPine. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-SoPINE link:
-https://www.pine64.org/?page_id=1491
-
-Wiki link:
-https://openedev.amarulasolutions.com/display/ODWIKI/SoPine
-
-This configuration uses U-Boot mainline and kernel mainline.
-
-How to build
-============
-
-    $ make pine64_sopine_defconfig
-
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
-Insert the micro SDcard in your SoPine and power it up. The console
-is on the serial line, 115200 8N1.
diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
deleted file mode 100644
index 845775338b..0000000000
--- a/configs/pine64_sopine_defconfig
+++ /dev/null
@@ -1,37 +0,0 @@
-BR2_aarch64=y
-BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64 SOPINE"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/sopine/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-sopine-baseboard"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sopine_baseboard"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/sopine/boot.cmd"
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
