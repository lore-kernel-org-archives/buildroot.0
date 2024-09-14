Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298FCC02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26AC81B60;
	Sat, 14 Sep 2024 09:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvOYWtHnktoI; Sat, 14 Sep 2024 09:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A331781BC5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A331781BC5;
	Sat, 14 Sep 2024 09:37:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFD731BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA27E4037C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEuIyT4QrB_2 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E3CC40179
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E3CC40179
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:35:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BC1581E16; Sat, 14 Sep 2024 09:35:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:34:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 629c6254ce158f3a15f11149a65066473c17fbd9
X-Git-Newrev: 49258bc3b27f84dd587aee3eb25dbd0a76f38dc0
X-Patchwork-Hint: ignore
Message-Id: <20240914093534.7BC1581E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/canaan/k210-soc: use tinyinit as
 Linux init process
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

commit: https://git.buildroot.net/buildroot/commit/?id=49258bc3b27f84dd587aee3eb25dbd0a76f38dc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The initialization script provided by the tinyinit package is the same
as the one contained in board/canaan/k210-soc/rootfs_overlay/sbin/init
except for the Linux logo, which has been removed. The patch reworks
the configurations that use this overlay directory by replacing the
initialization process contained within it with the one provided by
the tinyinit package.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                            |  1 -
 board/canaan/k210-soc/rootfs_overlay/init      |  1 -
 board/canaan/k210-soc/rootfs_overlay/sbin/init | 41 --------------------------
 configs/canaan_kd233_defconfig                 |  3 +-
 configs/sipeed_maix_bit_defconfig              |  3 +-
 configs/sipeed_maix_bit_sdcard_defconfig       |  3 +-
 configs/sipeed_maix_dock_defconfig             |  3 +-
 configs/sipeed_maix_dock_sdcard_defconfig      |  3 +-
 configs/sipeed_maix_go_defconfig               |  3 +-
 configs/sipeed_maix_go_sdcard_defconfig        |  3 +-
 configs/sipeed_maixduino_defconfig             |  3 +-
 configs/sipeed_maixduino_sdcard_defconfig      |  3 +-
 12 files changed, 9 insertions(+), 61 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3b564578e0..49e47af4c1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -22,7 +22,6 @@ board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh Shellcheck
 board/bsh/imx8mn-bsh-smm-s2/flash.sh Shellcheck lib_shellscript.EmptyLastLine
 board/bsh/imx8mn-bsh-smm-s2/post-build.sh Shellcheck
 board/canaan/k210-soc/post-build.sh Shellcheck
-board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
 board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
 board/chromebook/snow/sign.sh Shellcheck
diff --git a/board/canaan/k210-soc/rootfs_overlay/init b/board/canaan/k210-soc/rootfs_overlay/init
deleted file mode 120000
index a0b71977c0..0000000000
--- a/board/canaan/k210-soc/rootfs_overlay/init
+++ /dev/null
@@ -1 +0,0 @@
-/sbin/init
\ No newline at end of file
diff --git a/board/canaan/k210-soc/rootfs_overlay/sbin/init b/board/canaan/k210-soc/rootfs_overlay/sbin/init
deleted file mode 100755
index d4bf53d452..0000000000
--- a/board/canaan/k210-soc/rootfs_overlay/sbin/init
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/bin/sh
-
-# This script replaces the default busybox init process to avoid having that
-# process staying alive and sleeping in the background, (uselessly) consuming
-# precious memory.
-
-# Mount procfs and sysfs
-/bin/mount -t proc proc /proc
-/bin/mount -t sysfs sysfs /sys
-
-# When the kernel is directly booted, devtmpfs is not automatically mounted.
-# Manually mount it if needed.
-devmnt=$(mount | grep -c devtmpfs)
-if [ ${devmnt} -eq 0 ]; then
-    /bin/mount -t devtmpfs devtmpfs /dev
-fi
-
-# Use the /dev/console device node from devtmpfs if possible to not
-# confuse glibc's ttyname_r().
-# This may fail (E.G. booted with console=), and errors from exec will
-# terminate the shell, so use a subshell for the test
-if (exec 0</dev/console) 2>/dev/null; then
-    exec 0</dev/console
-    exec 1>/dev/console
-    exec 2>/dev/console
-fi
-
-# Clear memory to reduce page fragmentation
-echo 3 > /proc/sys/vm/drop_caches
-
-# Print a fun logo :)
-echo "          __  _"
-echo "         / / (_) ____   _   _ __  __"
-echo "        / /  | ||  _ \\ | | | |\\ \\/ /"
-echo "       / /___| || | | || |_| | >  < "
-echo "      /_____/|_||_| |_| \\____|/_/\\_\\"
-echo "    64-bits RISC-V Kendryte K210 NOMMU"
-echo ""
-
-# Finally, let's start an interactive shell
-exec /bin/sh
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
index 832f8363a7..27624aff4a 100644
--- a/configs/canaan_kd233_defconfig
+++ b/configs/canaan_kd233_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_bit_defconfig b/configs/sipeed_maix_bit_defconfig
index 238e082a3d..5119307330 100644
--- a/configs/sipeed_maix_bit_defconfig
+++ b/configs/sipeed_maix_bit_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 28aa143583..4047da1592 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_bit"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maix_dock_defconfig b/configs/sipeed_maix_dock_defconfig
index ee1b0d8372..0caa4d4e3a 100644
--- a/configs/sipeed_maix_dock_defconfig
+++ b/configs/sipeed_maix_dock_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index 41a062c7a1..ecb640a47b 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_dock"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maix_go_defconfig b/configs/sipeed_maix_go_defconfig
index a5b09e17ac..21075a9ed0 100644
--- a/configs/sipeed_maix_go_defconfig
+++ b/configs/sipeed_maix_go_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 0e80d9c83a..5448bd0ce3 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maix_go"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
diff --git a/configs/sipeed_maixduino_defconfig b/configs/sipeed_maixduino_defconfig
index 7ba7653e8d..6c93b29b43 100644
--- a/configs/sipeed_maixduino_defconfig
+++ b/configs/sipeed_maixduino_defconfig
@@ -32,6 +32,5 @@ BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES="board/canaan/k210-soc/busybox-tiny.co
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index 7bdd36e1d0..0b42cae45d 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -33,10 +33,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="canaan/sipeed_maixduino"
 # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 
 # Filesystem
-BR2_INIT_NONE=y
+BR2_INIT_TINYINIT=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
-BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/canaan/k210-soc/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
