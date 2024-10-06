Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE5ECFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 14:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8B7160764;
	Sun,  6 Oct 2024 14:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r76X0d2ZCqf8; Sun,  6 Oct 2024 14:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3395F60744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3395F60744;
	Sun,  6 Oct 2024 14:04:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 355131BF4DA
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236BF400D9
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 14:04:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBQ2ZRd8CyHr for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 14:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C32CE40004
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C32CE40004
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 14:04:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD72485061; Sun,  6 Oct 2024 14:04:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Oct 2024 16:04:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cac410a49e2750a621a5726b3c92507414cf4b51
X-Git-Newrev: 9fd8131dcb3939fba67a34626addb3260a733cb6
X-Patchwork-Hint: ignore
Message-Id: <20241006140426.AD72485061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/stm32f769-disco: move kernel and DTB
 to rootfs partition
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9fd8131dcb3939fba67a34626addb3260a733cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch, following the suggestion expressed in the review [1] for the
stm32f746-disco board support, moves the Linux kernel and the related
device tree to the ext4 rootfs partition. By doing so, the vfat partition,
improperly called u-boot, no longer makes sense and can therefore be
removed. From now on, U-Boot will load the kernel and the device tree
from the ext4 rootfs partition.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240822183742.3550055-3-dario.binacchi@amarulasolutions.com/

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/stmicroelectronics/stm32f769-disco/extlinux.conf |  6 +++---
 board/stmicroelectronics/stm32f769-disco/genimage.cfg  | 17 -----------------
 board/stmicroelectronics/stm32f769-disco/post-build.sh |  2 +-
 configs/stm32f769_disco_sd_defconfig                   |  3 +--
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/extlinux.conf b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
index 48483a01fc..edc1582615 100644
--- a/board/stmicroelectronics/stm32f769-disco/extlinux.conf
+++ b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32f769-disco-buildroot
-  kernel /zImage
-  devicetree /stm32f769-disco.dtb
-  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
+  kernel /boot/zImage
+  devicetree /boot/stm32f769-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f769-disco/genimage.cfg b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
index 41f9da5124..e911a94e46 100644
--- a/board/stmicroelectronics/stm32f769-disco/genimage.cfg
+++ b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
@@ -1,24 +1,7 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"zImage",
-			"stm32f769-disco.dtb",
-			"extlinux"
-		}
-	}
-
-	size = 16M
-}
-
 image sdcard.img {
 	hdimage {
 	}
 
-	partition u-boot {
-		partition-type = 0xC
-		image = "boot.vfat"
-	}
-
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext2"
diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
index c8cca3de8c..4510050941 100755
--- a/board/stmicroelectronics/stm32f769-disco/post-build.sh
+++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
@@ -4,4 +4,4 @@ BOARD_DIR="$(dirname "$0")"
 # Kernel is built without devpts support
 sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
 
-install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 2ec2687334..386a5d68e8 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
@@ -25,7 +26,5 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_OPENOCD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
