Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2528FC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 06:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 007E1406DC;
	Sat, 15 Jun 2024 06:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xix5uDDf1XUD; Sat, 15 Jun 2024 06:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC90406DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EC90406DD;
	Sat, 15 Jun 2024 06:46:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8C2311BF30D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 06:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F112842AE
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 06:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlWzvZmafbEG for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 06:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF52E842A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF52E842A5
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF52E842A5
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 06:46:43 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebdfe26242so31818831fa.0
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 23:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718434001; x=1719038801;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9DWOfty6SVYL4/UlV+vmH7B3uxYNYNpePAUakc4xAlY=;
 b=SoYYO6JXfMVLI1UZyxWP3EvdJIjV202AuRqMmMSgdWE5a0S2WU24z4isVGaNWaUTD0
 cSyDxoefUSRbh/XQWnhr77i7auLC+UMj5bzhx5QtvqErasIgs+K9YPQUV6VC4RKLAyHW
 u1At/uNaMCHC9yMFKAmhsFK6O2p/fnQ/OhoGh7X0K2gIrDN9G8u4DFriP5ctHb1S/v2Q
 N6eq9SB4b6f/Qhv4D/bzoESfJWdataXKAxjZBiD1cUvuHGlfP8Im80oQLJWSz2+3EOAc
 D6mhP15PT+j9S5yKRps+h1qk1fOgrX1+oHDXU2tpbwvGotaI7CFL23ZGIZY6SZtSRHQA
 Fv6A==
X-Gm-Message-State: AOJu0Yxv0u05kM411p+G7e7M5BofwDS4Xw3WtYe9ssoEQ8//5uEiYPnR
 xrUCqao+BFp/w8qIJjinVeYizLEAZF3Fw5DozCLaxsVzJknRBFDv7dEaJw==
X-Google-Smtp-Source: AGHT+IHCtz2+bCunnsxvfU2HgOXv1p1qYkBPQ/2A5GAxx0a+X8w6pi35SbOfq4ywi3QAtSSAAqy9XQ==
X-Received: by 2002:a2e:9244:0:b0:2eb:e405:dc with SMTP id
 38308e7fff4ca-2ec0e46db18mr31248671fa.14.1718434000698; 
 Fri, 14 Jun 2024 23:46:40 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f61277fesm88251085e9.21.2024.06.14.23.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 23:46:40 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 08:46:32 +0200
Message-Id: <20240615064632.1708859-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718434001; x=1719038801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9DWOfty6SVYL4/UlV+vmH7B3uxYNYNpePAUakc4xAlY=;
 b=SzKt44o+zITKkAh1nimUBI/p6etq3eoTKEbraMdDjiugsuhAjuNJDUn90/akd8xiD+
 q56Lk68VtI8Tb6tcCDQKyeK6fvFWinq4WPtk6byl2O2TxuFfwW6G4QZLOP+VNvC4iQMH
 sTQJKJcQqaw/PXaHMOYeqCNXhC6y3pB0NO8n4ZYIfB4VvyeqS0/a7zda4/ZvOztVsP8i
 p/xc5uykUwz5gkY+TD34CJUThI6guzlyKfDUsHX6HUKEq6WId3fuU8GdwNNS5AFwWqrD
 u/PiyT8J9zOtmjZDG0WFdhRxMWtkcHiwQaTB46F8ABDpK1w3F2Lnh3U2rAbboGRfJd5Q
 BJUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SzKt44o+
Subject: [Buildroot] [PATCH 1/1] configs/hifive_unmatched: new board
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for the HiFive Unmatched with mainline components:
 - U-Boot 2023.04
 - Linux 6.8

Board homepage:
 - https://www.sifive.com/boards/hifive-unmatched

The configuration for the HiFive Unmatched is based on the existing
configuration for the HiFive Unleashed. The files which can be shared
between the two are moved to a common directory under board/sifive.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .../genimage_sdcard.cfg                       |  0
 .../genimage_spi-nor.cfg                      |  0
 .../linux.config.fragment                     |  0
 .../post-build.sh                             |  0
 board/sifive/hifive-unmatched/boot.cmd        |  4 ++
 board/sifive/hifive-unmatched/readme.txt      | 71 +++++++++++++++++++
 configs/hifive_unleashed_defconfig            |  6 +-
 configs/hifive_unmatched_defconfig            | 58 +++++++++++++++
 8 files changed, 136 insertions(+), 3 deletions(-)
 rename board/sifive/{hifive-unleashed => common}/genimage_sdcard.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/genimage_spi-nor.cfg (100%)
 rename board/sifive/{hifive-unleashed => common}/linux.config.fragment (100%)
 rename board/sifive/{hifive-unleashed => common}/post-build.sh (100%)
 create mode 100644 board/sifive/hifive-unmatched/boot.cmd
 create mode 100644 board/sifive/hifive-unmatched/readme.txt
 create mode 100644 configs/hifive_unmatched_defconfig

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/common/genimage_sdcard.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_sdcard.cfg
rename to board/sifive/common/genimage_sdcard.cfg
diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/common/genimage_spi-nor.cfg
similarity index 100%
rename from board/sifive/hifive-unleashed/genimage_spi-nor.cfg
rename to board/sifive/common/genimage_spi-nor.cfg
diff --git a/board/sifive/hifive-unleashed/linux.config.fragment b/board/sifive/common/linux.config.fragment
similarity index 100%
rename from board/sifive/hifive-unleashed/linux.config.fragment
rename to board/sifive/common/linux.config.fragment
diff --git a/board/sifive/hifive-unleashed/post-build.sh b/board/sifive/common/post-build.sh
similarity index 100%
rename from board/sifive/hifive-unleashed/post-build.sh
rename to board/sifive/common/post-build.sh
diff --git a/board/sifive/hifive-unmatched/boot.cmd b/board/sifive/hifive-unmatched/boot.cmd
new file mode 100644
index 0000000000..3f7b1d9ce3
--- /dev/null
+++ b/board/sifive/hifive-unmatched/boot.cmd
@@ -0,0 +1,4 @@
+setenv bootargs earlycon=sbi root=/dev/mmcblk0p3 rootwait
+load mmc 0:3 ${kernel_addr_r} boot/Image
+load mmc 0:3 ${fdt_addr_r} boot/hifive-unmatched-a00.dtb
+booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/sifive/hifive-unmatched/readme.txt b/board/sifive/hifive-unmatched/readme.txt
new file mode 100644
index 0000000000..d77847dc3c
--- /dev/null
+++ b/board/sifive/hifive-unmatched/readme.txt
@@ -0,0 +1,71 @@
+SiFive HiFive Unmatched
+=======================
+
+This file describes how to use the pre-defined Buildroot
+configuration for the SiFive HiFive Unmatched board.
+
+Further information about the HiFive Unmatched board can be found
+at https://www.sifive.com/boards/hifive-unmatched.
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  $ make hifive_unmatched_defconfig
+
+Customise the build as necessary:
+
+  $ make menuconfig
+
+Start the build:
+
+  $ make
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- boot.scr
+    +-- fw_dynamic.bin
+    +-- fw_dynamic.elf
+    +-- fw_jump.bin
+    +-- fw_jump.elf
+    +-- hifive-unmatched-a00.dtb
+    +-- Image
+    +-- rootfs.cpio
+    +-- rootfs.ext2
+    +-- rootfs.ext4
+    +-- rootfs.tar
+    +-- sdcard.img
+    +-- u-boot.bin
+    +-- u-boot.itb
+    +-- u-boot-spl.bin
+
+
+Creating a bootable SD card with genimage
+=========================================
+
+By default Buildroot builds a SD card image for you. All you need to do
+is dd the image to your SD card, which can be done with the following
+command on your development host:
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdb bs=4096
+
+The above example command assumes the SD card is accessed via a USB card
+reader and shows up as /dev/sdb on the host. Adjust it accordingly per
+your actual setup.
+
+Booting the SD card on the board
+================================
+
+Make sure that the all DIP switches are set to the off position for
+default boot mode (MSEL mode = 1011), insert the SD card and power
+up the board.
+
+Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
+
+See the 'SiFive HiFive Unmatched Getting Started Guide' for
+more details (https://www.sifive.com/documentation).
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 1aa06f59e7..dabd1aefd4 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -13,9 +13,9 @@ BR2_RISCV_ABI_LP64D=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/hifive-unleashed/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/hifive-unleashed/genimage_sdcard.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
 
 # Filesystem
 BR2_TARGET_ROOTFS_CPIO=y
@@ -30,7 +30,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
 BR2_LINUX_KERNEL_IMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unleashed-a00"
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
new file mode 100644
index 0000000000..ddda96e35d
--- /dev/null
+++ b/configs/hifive_unmatched_defconfig
@@ -0,0 +1,58 @@
+# Architecture
+BR2_riscv=y
+BR2_riscv_custom=y
+BR2_RISCV_ISA_RVM=y
+BR2_RISCV_ISA_RVA=y
+BR2_RISCV_ISA_RVF=y
+BR2_RISCV_ISA_RVD=y
+BR2_RISCV_ISA_RVC=y
+BR2_RISCV_64=y
+BR2_RISCV_ABI_LP64D=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/common/linux.config.fragment"
+BR2_LINUX_KERNEL_IMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sifive/hifive-unmatched-a00"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Bootloader
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
+BR2_TARGET_OPENSBI_PLAT="generic"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unmatched"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+
+# Host tools
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/sifive/hifive-unmatched/boot.cmd"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
