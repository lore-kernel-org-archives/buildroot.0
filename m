Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AF0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E828479B;
	Thu, 10 Mar 2022 20:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPlJI4FZrIlh; Thu, 10 Mar 2022 20:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FD40841EC;
	Thu, 10 Mar 2022 20:47:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44FF71BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7701416B7
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPtd4YtX8AXL for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:45:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89D90416BF
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:45:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0EFC683B75; Thu, 10 Mar 2022 20:37:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 21:39:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce73d0a1d2b5abec972cd2bf9a5945b0853eb035
X-Git-Newrev: 8497e2a3ce8632ef57d0af5c7a482ba6978e6e9a
X-Patchwork-Hint: ignore
Message-Id: <20220310203714.0EFC683B75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-pc-plus: switch to
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

commit: https://git.buildroot.net/buildroot/commit/?id=8497e2a3ce8632ef57d0af5c7a482ba6978e6e9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to extlinux instead of U-Boot boot script. Drop custom
boot script and genimage config. Instead use common orangepi
files from board/orangepi/common.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/orangepi/orangepi-pc-plus/boot.cmd     |  8 ------
 board/orangepi/orangepi-pc-plus/genimage.cfg | 43 ----------------------------
 configs/orangepi_pc_plus_defconfig           |  9 ++----
 3 files changed, 3 insertions(+), 57 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
