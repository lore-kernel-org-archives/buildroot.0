Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D8EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4130D83EE3;
	Fri, 25 Feb 2022 07:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doAH9n8D9liA; Fri, 25 Feb 2022 07:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A8183ED8;
	Fri, 25 Feb 2022 07:27:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 859091BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B6A611F4
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9l1f25Brew1 for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CA366061B
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id o6so6224624ljp.3
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wen1dfMbilQMCh7bMDb2Deu3I2qz3G4hVjZrDablMBc=;
 b=Abye1rA05byDjXz1VqbntKiRLsUTk2FuojFcktz/x8S0J56Sl5MStcelWbU9+6eW/J
 g65U9BhY64vq5T685jMoVSvxTE45bYTiiKucy9zE+gCVftBem9TwHmWKmeVWcBTHyvxr
 9yH2At+ob/pvu14AkB51wO31I4AIArrDVfRdx8Rn4HK31iw5CxAp9ATCCK+ZRWTcX51n
 pLFi4sZ0QEkLYR5RW7PtTMeOigvgP91lXyGGyzKaammmdI24Ds/+FDcKGTKvcuMj2v0+
 r/AWbhgyQLXgqtJGnF8JqEYjNOW1vejNM1Vuwotg4AEs6YmqNdHPgpggNNY/fykUHTzd
 gz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wen1dfMbilQMCh7bMDb2Deu3I2qz3G4hVjZrDablMBc=;
 b=ozAMUQEIL0hP1GH1MbVEAFUSWB4ux9g7uoUT2pEryy4vC0blWUwjvmnGrw4snjN3a7
 gJRSTwcak/oagzfFR8VexBinetecPMMWWdHPJkr+8x0VA9iDXz0vwGSKbnsXkLhYz/Xr
 klqAjxTUdKhLwR2qSdxUcT7ekO3PImfQPwukkcuLzV77DdudQ1FFaSvwye3vfbXFlz7e
 /YZDCtUtA6ZGwUh/YR9X9pDN5a05WGCylm+TdbUfSTdgb04RIm3bRuC++RMMrNCZuOCM
 QyiTkNR0Sbbbkc5J6SeFjyrWQU6O9bwx5dr5057EeSSO8Y/Ql6pU9HjUQSDXmFpUw70B
 vTAA==
X-Gm-Message-State: AOAM5337zCbdreFpYaBAdNAizAlGsddSHQnfpKKvW23pMfgZCt2W2n0a
 0v+7bngv4tXVTpzfzF/l/dXjbaE3dMA=
X-Google-Smtp-Source: ABdhPJy3OvqY43CvR7lTSo8ZhgUBUEBQuw+CNLoYAuSdYxLyRnxLfUgWj0Rv7iMskEDWaNsA/s52BQ==
X-Received: by 2002:a2e:b525:0:b0:246:204c:3392 with SMTP id
 z5-20020a2eb525000000b00246204c3392mr4402157ljm.179.1645773987286; 
 Thu, 24 Feb 2022 23:26:27 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:26 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:20 +0300
Message-Id: <20220225072622.3584480-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
References: <20220225072622.3584480-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/6] board/linksprite/pcduino: switch to
 extlinux
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
 board/linksprite/pcduino/boot.cmd      |  8 -----
 board/linksprite/pcduino/genimage.cfg  | 43 --------------------------
 board/linksprite/pcduino/post-build.sh | 11 -------
 board/linksprite/pcduino/post-image.sh | 16 ----------
 configs/linksprite_pcduino_defconfig   |  9 +++---
 5 files changed, 4 insertions(+), 83 deletions(-)
 delete mode 100644 board/linksprite/pcduino/boot.cmd
 delete mode 100644 board/linksprite/pcduino/genimage.cfg
 delete mode 100755 board/linksprite/pcduino/post-build.sh
 delete mode 100755 board/linksprite/pcduino/post-image.sh

diff --git a/board/linksprite/pcduino/boot.cmd b/board/linksprite/pcduino/boot.cmd
deleted file mode 100644
index 0db8363599..0000000000
--- a/board/linksprite/pcduino/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-setenv fdt_high ffffffff
-
-setenv bootargs console=ttyS0,115200 console=tty1 earlyprintk root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
-
-fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun4i-a10-pcduino.dtb
-
-bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/linksprite/pcduino/genimage.cfg b/board/linksprite/pcduino/genimage.cfg
deleted file mode 100644
index db33322118..0000000000
--- a/board/linksprite/pcduino/genimage.cfg
+++ /dev/null
@@ -1,43 +0,0 @@
-#
-# Minimal SD card image for the pcDuino
-#
-
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"sun4i-a10-pcduino.dtb",
-			"boot.scr"
-		}
-	}
-
-	size = 16M
-}
-
-#
-# Note: u-boot environment is stored between u-boot and boot partitions
-#
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
-		offset = 1M
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/linksprite/pcduino/post-build.sh b/board/linksprite/pcduino/post-build.sh
deleted file mode 100755
index e1e1877671..0000000000
--- a/board/linksprite/pcduino/post-build.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# post-build.sh for pcDuino taken from OrangePi post-build.sh
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-
-BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOOT_CMD=$BOARD_DIR/boot.cmd
-BOOT_CMD_H=$BINARIES_DIR/boot.scr
-
-# U-Boot script
-$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/linksprite/pcduino/post-image.sh b/board/linksprite/pcduino/post-image.sh
deleted file mode 100755
index c82b189f9c..0000000000
--- a/board/linksprite/pcduino/post-image.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index b58f970493..05b25aede4 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -11,8 +11,9 @@ BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # SD image scripts
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/linksprite/pcduino/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/linksprite/pcduino/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 
 # For kernel modules autoloading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
@@ -29,6 +30,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -49,10 +51,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
 # Host packages
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # Target packages: wireless support for pcduino-lite-wifi
 BR2_PACKAGE_IW=y
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
