Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF4C433FE
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81DB461246;
	Fri, 25 Feb 2022 07:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wzp0PHKeuZ9j; Fri, 25 Feb 2022 07:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DFC36123F;
	Fri, 25 Feb 2022 07:26:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 747B21BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62EC74167C
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gd3s8uCPbVOi for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F090A41679
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id j15so7846779lfe.11
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3TL43bU1eqmAm4GWnIfWffybgPb63afyHfGY/UActc=;
 b=mMZQ07mlJtVZmNGz9eVYr2orD1lRvYGlQL8fYIadzuz2Cdcj0YyI61AUDLIsoFiuCl
 1/nZwyl9Y+tMVmAZ9scQ2ukpmgVahAr4QsZNAotYXV1+iVz/Xhm9I1C6qJ/aFll+ddb+
 tS76R3f4JKIhJ4RkG/4Ddwzkd6Rtfc+sYTdw0HjGVj7AkqHQb9LihGe7xVBTfM3xOC1i
 Z2aiz3JSX2O9HqSLVqa/u6AcjSfXqbb21e0eWhSs/pou2c5WhuRwxAWu9u/uc5/V2xs+
 PI+xdqGwEiLiXVwr+qSPhuMwigSa5ulzrx9wDaSN4pA8xpuX88DZHIy7B8YfjEndDZGz
 VPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3TL43bU1eqmAm4GWnIfWffybgPb63afyHfGY/UActc=;
 b=bTJxtLUuG8848OeAGKZgvsNmn1u2zTi8zM8APwhzUvB/KY8gYBlF8zIhcOUboJ/F1Q
 sw/f0hq8J3TVdp/WHYjEJ9pYilcuNuKPquXGEj73Ny3ZB73CmD3ei0brF2kh5JLwDZmt
 CRWNWuSyMu24IUmfPeYq+DaFLyrbIobTzwRiREl6TYuFq+1ZPDCdTbmW3HmKBIVOOWWY
 ZXCO6fkx26/JaWwlBUSUjxvzArvmObCOw9IaCgh+fpCvzkvdiTMa2RMfYsPsqdXVkXNN
 k28wNOJoJqHl6U6eTk/ML5uBcmN5+U5BuHKmz0bSqXMmevp7KL2nj95jgKgD+le96aXg
 UVwQ==
X-Gm-Message-State: AOAM533FFz5e0VAWvryHYkF4aAFdPY+he6/SV5cyAVahGtQZFwmd/P/e
 oZ5DmyNJrWXI8iMDL2238TjPKCfeJwo=
X-Google-Smtp-Source: ABdhPJycEqqAAzkDqnGC1EeSaP1EJlenkjzwnRrJD0U48/wxO6hGspOzwEIFXaFbo4tAUjWyuc3tSQ==
X-Received: by 2002:a19:550b:0:b0:443:e008:3e12 with SMTP id
 n11-20020a19550b000000b00443e0083e12mr4101994lfe.11.1645773985663; 
 Thu, 24 Feb 2022 23:26:25 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:25 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:18 +0300
Message-Id: <20220225072622.3584480-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
References: <20220225072622.3584480-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/6] board/orangepi/orangepi-pc-plus: switch
 to extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-pc-plus/boot.cmd     |  8 ----
 board/orangepi/orangepi-pc-plus/genimage.cfg | 43 --------------------
 configs/orangepi_pc_plus_defconfig           |  9 ++--
 3 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg

diff --git a/board/orangepi/orangepi-pc-plus/boot.cmd b/board/orangepi/orangepi-pc-plus/boot.cmd
deleted file mode 100644
index c91f77942f..0000000000
--- a/board/orangepi/orangepi-pc-plus/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc-plus.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
deleted file mode 100644
index 3812d785d5..0000000000
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ /dev/null
@@ -1,43 +0,0 @@
-# Minimal SD card image for the OrangePi PC Plus
-#
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun8i-h3-orangepi-pc-plus.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 10M
-}
-
-image sdcard.img {
-	hdimage {
-		# for root=PARTLABEL support
-		partition-table-type = "gpt"
-		# default GPT location conflicts with bootloaders, move it after
-		gpt-location = 1M
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
-		partition-type-uuid  = "F"
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	# 'rootfs' will be used as the partition label, used
-	# with root=PARTLABEL=rootfs kernel command line
-	partition rootfs {
-		partition-type-uuid = "L"
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index c3ff8bc417..ba946e5285 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
@@ -27,14 +28,10 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc-plus/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # wireless driver and firmware
 BR2_PACKAGE_RTL8189FS=y
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
