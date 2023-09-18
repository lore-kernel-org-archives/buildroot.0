Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E902ECD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D46D40C0E;
	Mon, 18 Sep 2023 06:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D46D40C0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hK0dn3XjKDYw; Mon, 18 Sep 2023 06:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19CC41486;
	Mon, 18 Sep 2023 06:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19CC41486
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31A9C1BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0802740992
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0802740992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BgfTm_Mlnmeh for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:47:21 +0000 (UTC)
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C3F140955
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3F140955
X-Virus-Scanned: by amavisd-new using ClamAV (7)
Received: from zm.lan (pub-46.182.29.194.multiplay.pl [194.29.182.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id EBD051BC06E;
 Mon, 18 Sep 2023 08:47:17 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 08:47:11 +0200
Message-ID: <20230918064711.1379428-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] board: add Orangepi Zero3 support
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
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add initial support for Orangepi Zero3 board:
- U-Boot 2021.07 fork by Orangepi
- Linux 6.1.31 fork by Orangepi
- Default packages from buildroot

Enable CONFIG_MFD_AC200 as it is used directly by other module,
resulting in build failure when disabled.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
v1 -> v2:
 * use 'linux_sunxi64' instead of default arch defconfig, which fixes
   ethernet networking (suggested by Sergey)
 * disabled rootfs.tar generation (suggested by Sergey)
 * increased ext2 fs size to 180M to fit more kernel modules
 * added DEVELOPERS entries for board files

 DEVELOPERS                                 |  2 +
 board/orangepi/orangepi-zero3/linux.config |  1 +
 board/orangepi/orangepi-zero3/readme.txt   | 34 +++++++++++++
 configs/orangepi_zero3_defconfig           | 57 ++++++++++++++++++++++
 4 files changed, 94 insertions(+)
 create mode 100644 board/orangepi/orangepi-zero3/linux.config
 create mode 100644 board/orangepi/orangepi-zero3/readme.txt
 create mode 100644 configs/orangepi_zero3_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..66abc39e16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1953,8 +1953,10 @@ F:	package/ecryptfs-utils/
 N:	Marcin Niestroj <m.niestroj@grinn-global.com>
 F:	board/grinn/
 F:	board/orangepi/orangepi-zero-plus/
+F:	board/orangepi/orangepi-zero3/
 F:	configs/grinn_*
 F:	configs/orangepi_zero_plus_defconfig
+F:	configs/orangepi_zero3_defconfig
 F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
diff --git a/board/orangepi/orangepi-zero3/linux.config b/board/orangepi/orangepi-zero3/linux.config
new file mode 100644
index 0000000000..09b7a93a5a
--- /dev/null
+++ b/board/orangepi/orangepi-zero3/linux.config
@@ -0,0 +1 @@
+CONFIG_MFD_AC200=y
diff --git a/board/orangepi/orangepi-zero3/readme.txt b/board/orangepi/orangepi-zero3/readme.txt
new file mode 100644
index 0000000000..4872a363e7
--- /dev/null
+++ b/board/orangepi/orangepi-zero3/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi Zero3. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi Zero3 link:
+http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-3.html
+
+This configuration uses Orangepi's fork of U-Boot and Linux kernel.
+
+How to build
+============
+
+    $ make orangepi_zero3_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
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
+  $ sudo sync
+
+Insert the micro SDcard in your Orangepi Zero3 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_zero3_defconfig b/configs/orangepi_zero3_defconfig
new file mode 100644
index 0000000000..51a6efd3ed
--- /dev/null
+++ b/configs/orangepi_zero3_defconfig
@@ -0,0 +1,57 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h616"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,orangepi-xunlong,u-boot-orangepi,6fe17fac388aad17490cf386578b7532975e567f)/u-boot-orangepi-6fe17fac388aad17490cf386578b7532975e567f.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero3"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,orangepi-xunlong,linux-orangepi,3495b5ee0594566c9fed930b96b1cae90600412e)/linux-orangepi-3495b5ee0594566c9fed930b96b1cae90600412e.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="linux_sunxi64"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h616-orangepi-zero3"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero3/linux.config"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero3"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="180M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# host tools
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+
+# image scripts
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
