Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2ADC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3EE41950;
	Thu, 10 Mar 2022 20:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cy1V-vteRkhA; Thu, 10 Mar 2022 20:47:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1D1041967;
	Thu, 10 Mar 2022 20:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D2DC91BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9CB240103
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Og-6KDb9PrwO for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:45:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B3814057F
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:45:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 20CAA83B75; Thu, 10 Mar 2022 20:37:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 21:39:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbca462131f7d8e40dcef47d12c57d741dc21648
X-Git-Newrev: 5bfc4002ed598189a92db1eb7797928e136a9883
X-Patchwork-Hint: ignore
Message-Id: <20220310203714.20CAA83B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/linksprite/pcduino: switch to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5bfc4002ed598189a92db1eb7797928e136a9883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/linksprite/pcduino/boot.cmd      |  8 -------
 board/linksprite/pcduino/genimage.cfg  | 43 ----------------------------------
 board/linksprite/pcduino/post-build.sh | 11 ---------
 board/linksprite/pcduino/post-image.sh | 16 -------------
 configs/linksprite_pcduino_defconfig   |  9 ++++---
 5 files changed, 4 insertions(+), 83 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
