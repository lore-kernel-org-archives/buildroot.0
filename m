Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B52DC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 17:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E181941E3B;
	Thu,  8 Feb 2024 17:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Bu9Hk_dFNOf; Thu,  8 Feb 2024 17:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5085241E45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5085241E45;
	Thu,  8 Feb 2024 17:15:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 447C01BF4E6
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 17:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EE2A84E21
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 17:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtXD5EsmSjHW for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 17:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1DA84D4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1DA84D4B
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 17:15:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D14F6875E7; Thu,  8 Feb 2024 17:15:28 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 8 Feb 2024 18:13:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 034c57b2e24acaa236ac5f6a23e6e42b0522b221
X-Git-Newrev: 35eb74c6343a9ec1407fb473271dda0516792391
X-Patchwork-Hint: ignore
Message-Id: <20240208171528.D14F6875E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/am574x_idk_defconfig: new defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=35eb74c6343a9ec1407fb473271dda0516792391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a basic support for AM574x Industrial Development Kit
[1].

Use multi_v7_defconfig as kernel configuration file instead of
the deprecated omap2plus_defconfig [2].

The main differences between upstream kernels and the TI vendor tree
(5.10.x based) are:

  - pru based 100M ethernet ports will not work with upstream kernels
  since the prueth driver for AM57 is not upstream yet (as of 6.8-rc2)
  [3].

  - The ARM/DSP examples provided by TI [4] will not work either since
  they requires an experimental patch [5] adding "remote-processor
  messaging sockets".

  - There is no support for the POWERVR GPU SGX544 that requires
  additional userpace vendor (closed source) libraries.

[1] https://www.ti.com/tool/TMDSIDK574
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cca9f6838bac3441a42fa906314bf5e3bff50ac5
[3] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?id=792b57aac224416f66175c15d60379a4cf581d0f
[4] https://git.ti.com/cgit/processor-sdk/big-data-ipc-examples
[5] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?id=f4b978a978c38149f712ddd137f12ed5fb914161

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/ti/am574x-idk/extlinux.conf |  4 ++++
 board/ti/am574x-idk/genimage.cfg  | 30 ++++++++++++++++++++++++++
 board/ti/am574x-idk/post-build.sh |  4 ++++
 board/ti/am574x-idk/readme.txt    | 28 ++++++++++++++++++++++++
 configs/am574x_idk_defconfig      | 45 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+)

diff --git a/board/ti/am574x-idk/extlinux.conf b/board/ti/am574x-idk/extlinux.conf
new file mode 100644
index 0000000000..29e0ecfa14
--- /dev/null
+++ b/board/ti/am574x-idk/extlinux.conf
@@ -0,0 +1,4 @@
+label am5749-idk-buildroot
+  kernel /zImage
+  fdtdir /
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
diff --git a/board/ti/am574x-idk/genimage.cfg b/board/ti/am574x-idk/genimage.cfg
new file mode 100644
index 0000000000..02a9ffe013
--- /dev/null
+++ b/board/ti/am574x-idk/genimage.cfg
@@ -0,0 +1,30 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"MLO",
+			"u-boot.img",
+			"zImage",
+			"am574x-idk.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+                image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 1G
+	}
+}
diff --git a/board/ti/am574x-idk/post-build.sh b/board/ti/am574x-idk/post-build.sh
new file mode 100755
index 0000000000..5dcdb352eb
--- /dev/null
+++ b/board/ti/am574x-idk/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
diff --git a/board/ti/am574x-idk/readme.txt b/board/ti/am574x-idk/readme.txt
new file mode 100644
index 0000000000..4869984cf1
--- /dev/null
+++ b/board/ti/am574x-idk/readme.txt
@@ -0,0 +1,28 @@
+Texas Instuments AM574x IDK Test and Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the TI AM574x IDK
+board: https://www.ti.com/tool/TMDSIDK574
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make am574x_idk_defconfig
+
+Compile everything and build the USB flash drive image:
+
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
new file mode 100644
index 0000000000..bbae73dff4
--- /dev/null
+++ b/configs/am574x_idk_defconfig
@@ -0,0 +1,45 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
