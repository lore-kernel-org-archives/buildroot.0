Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D78C2BB85
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38CA260B12;
	Mon, 17 Jun 2024 20:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ku0PT0fyDN04; Mon, 17 Jun 2024 20:12:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEC7E60AFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEC7E60AFB;
	Mon, 17 Jun 2024 20:12:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0263F1BF290
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 20:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC0D4409D8
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 20:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqmVa9MEZFxJ for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 20:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 238F2414B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 238F2414B8
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 238F2414B8
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 20:12:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-36181b9bb16so35094f8f.2
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 13:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718655166; x=1719259966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7lHSEiux7bQ/m/9NBZ1cQdPuwjMGXRPHwCnGpKQ0Bj8=;
 b=UFUernLBJW227ID4oEPMAp+ec1NsG+qWdoeTRfhR4w25KaRW6HKXITdEiJZtDwmM7Y
 Nz0/IwI5YNaeefmb26kYQqJLt+YpPjXccqX4M1Tq/PZugYFDj3mAVsUOQjD+Og0NsEmR
 0TrF7HPcgw1+C445X9ierB7UT8VxrBMr++bE+ArFLdpLT6SY+YQi4wOf8mlFGpZHMmp4
 uhiYBsIBJxpyqDx1V0u0UdMNDe5klgC4nUuefJcwPA/WBMKMJkxA/hAIny+rkN+FUV+b
 AHuzJI0axfcbY8WOwwItA14Q60t/TOxq0dQPr1q28T+4hJ/r22MhBozqDKSQdQQjv2iB
 7y8g==
X-Gm-Message-State: AOJu0YwhVmRlkXfhvzf4v/OkiodmS7dZEnLgc+cZM1Hf3ajwjQR1mmBS
 mha6F+pZo/6eifzaCkel4b7nAGTRZRBps0NKdCwN2TmH//SSziB8jwkP0A==
X-Google-Smtp-Source: AGHT+IGJwkGHEkpZJOxPawEE8uguTMgY7WpjOIWdENEcMaeTJ+s4NOs3ketUOuobk7aQKiwul3EeUQ==
X-Received: by 2002:a5d:4f0d:0:b0:360:9a40:3dd8 with SMTP id
 ffacd0b85a97d-3609a403e35mr2792474f8f.65.1718655165872; 
 Mon, 17 Jun 2024 13:12:45 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f23cdsm12636048f8f.77.2024.06.17.13.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 13:12:45 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 22:12:32 +0200
Message-Id: <20240617201232.1804524-3-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240617201232.1804524-1-francois.dugast.foss@gmail.com>
References: <20240617201232.1804524-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718655166; x=1719259966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lHSEiux7bQ/m/9NBZ1cQdPuwjMGXRPHwCnGpKQ0Bj8=;
 b=AWz7vjp4IJsKRW2BIcv1CI9Bd1JCFDbucyZBjnt7bj+01z33MNloIJeo8cN3MY2VV/
 5oLhfjO2FiishN0krfneoo27cr1/GVXyRhM56pr8QbDVOxO5KCVoFzBr5Fqng4GH4vqc
 LBbx+85Gs3JnJHrsTHeI57qJHne95tYA+8o+7Z9LYz8y+QuhBUZyFYpi6Co4VanJGDOz
 Av3LjqszTw+HMdwr2F2wNoUY/Q/am8jH1GdzrL0DiYCd8sqbLQKFvvEjsZzaRq7/aeDA
 CfIEVgSd+dQRG9QD7+0Do9fecdkmU28tlGIPsyhYjA5laXYKxOXNWeCZ1ZK2Bl22FCLD
 RAkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AWz7vjp4
Subject: [Buildroot] [PATCH 3/3] configs/hifive_unmatched: new board
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
configuration for the HiFive Unleashed.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/sifive/hifive-unmatched/boot.cmd        |  4 ++
 .../patches/linux-headers/linux-headers.hash  |  2 +
 .../hifive-unmatched/patches/linux/linux.hash |  2 +
 .../patches/opensbi/opensbi.hash              |  2 +
 .../hifive-unmatched/patches/uboot/uboot.hash |  2 +
 board/sifive/hifive-unmatched/readme.txt      | 71 +++++++++++++++++++
 configs/hifive_unmatched_defconfig            | 60 ++++++++++++++++
 7 files changed, 143 insertions(+)
 create mode 100644 board/sifive/hifive-unmatched/boot.cmd
 create mode 100644 board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/linux/linux.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
 create mode 100644 board/sifive/hifive-unmatched/patches/uboot/uboot.hash
 create mode 100644 board/sifive/hifive-unmatched/readme.txt
 create mode 100644 configs/hifive_unmatched_defconfig

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
diff --git a/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash b/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..2b6769d4d1
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c969dea4e8bb6be991bbf7c010ba0e0a5643a3a8d8fb0a2aaa053406f1e965f3  linux-6.8.tar.xz
diff --git a/board/sifive/hifive-unmatched/patches/linux/linux.hash b/board/sifive/hifive-unmatched/patches/linux/linux.hash
new file mode 100644
index 0000000000..2b6769d4d1
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	c969dea4e8bb6be991bbf7c010ba0e0a5643a3a8d8fb0a2aaa053406f1e965f3  linux-6.8.tar.xz
diff --git a/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash b/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..c0fc3f683c
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
diff --git a/board/sifive/hifive-unmatched/patches/uboot/uboot.hash b/board/sifive/hifive-unmatched/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..57451c7afe
--- /dev/null
+++ b/board/sifive/hifive-unmatched/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
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
diff --git a/configs/hifive_unmatched_defconfig b/configs/hifive_unmatched_defconfig
new file mode 100644
index 0000000000..a9afaada45
--- /dev/null
+++ b/configs/hifive_unmatched_defconfig
@@ -0,0 +1,60 @@
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
+BR2_GLOBAL_PATCH_DIR="board/sifive/hifive-unmatched/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
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
