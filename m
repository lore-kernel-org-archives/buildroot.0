Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF46C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 19:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D662161080;
	Fri, 11 Jul 2025 19:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-_9rgCVVHtO; Fri, 11 Jul 2025 19:43:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759E060ACF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759E060ACF;
	Fri, 11 Jul 2025 19:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A88A0114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E28C80D77
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9z-w0_1SKCt for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 19:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C0E80D16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94C0E80D16
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 19:43:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83685863E3; Fri, 11 Jul 2025 19:43:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 21:41:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4c5cfe80db563fc9d380d68e2b201f8bd4a9c1e
X-Git-Newrev: 6c0a713c66bc5b7712f2077947e5b90312127827
X-Patchwork-Hint: ignore
Message-Id: <20250711194312.83685863E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagley_ai_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c0a713c66bc5b7712f2077947e5b90312127827
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for BeagleY-AI board by introducing the
beagley_ai_defconfig file and related support files.

The BeagleY-AI uses the TI J722S SoC, also known as AM67A, also
known as TDA4VEN or TDA4AEN.

Retrieve BSP settings from meta-ti (may be useful for other TI boards):

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"

- Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
  to ATF bl31.bin to the U-Boot build process [1].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
  secure payload. meta-ti set "SPD=opteed" to build ATF [2].

- Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-am62x".
  meta-ti uses the OPTEEMACHINE to set optee-os platform [3].
  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"

- Use am67a_beagley_ai_a53 and am67a_beagley_ai_r5 u-boot
  defconfigs introduced in u-boot v2025.07 [4]

- u-boot distroboot (bootflow) detect extlinux.conf file from the first
  SDcard partition, so we have to install the kernel and its dtb file.
  Use devicetreedir instead of devicetree in extlinux.conf file to
  avoid hardcoding the devicetree file name. TI boards are able to
  retrieve dtb file name from an EEPROM (see TI_I2C_BOARD_DETECT in
  uboot).

- Use 6.15.6 stable release instead of the latest 6.12 LTS since the
  k3-j722s support was only introduced in 6.11 kernels.

- Provide a hash file for all custom package version
  (arm-trusted-firmware, linux, ti-k3-r5-loader, uboot) to enable
  BR2_DOWNLOAD_FORCE_CHECK_HASHES.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
[2] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
[3] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23
[4] https://source.denx.de/u-boot/u-boot/-/commit/b27c94958b976213e3f21e53943a699ffa53f16e

More information about the board can be found at:
https://www.beagleboard.org/boards/beagley-ai

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 board/beagleboard/beagley-ai/extlinux.conf         |  5 +++
 board/beagleboard/beagley-ai/genimage.cfg          | 32 ++++++++++++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 .../beagley-ai/patches/linux/linux.hash            |  2 +
 .../patches/ti-k3-r5-loader/ti-k3-r5-loader.hash   |  2 +
 .../beagley-ai/patches/uboot/uboot.hash            |  2 +
 board/beagleboard/beagley-ai/post-build.sh         |  5 +++
 board/beagleboard/beagley-ai/readme.txt            | 38 +++++++++++++++++
 configs/beagley_ai_defconfig                       | 49 ++++++++++++++++++++++
 10 files changed, 138 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 824585094e..6029cf9858 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2923,11 +2923,13 @@ F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/beagleboard/beagleboneai64/
+F:	board/beagleboard/beagley-ai/
 F:	board/qemu/
 F:	board/ti/am574x-idk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
+F:	configs/beagley_ai_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
diff --git a/board/beagleboard/beagley-ai/extlinux.conf b/board/beagleboard/beagley-ai/extlinux.conf
new file mode 100644
index 0000000000..582d510b5d
--- /dev/null
+++ b/board/beagleboard/beagley-ai/extlinux.conf
@@ -0,0 +1,5 @@
+default buildroot
+label buildroot
+   kernel /Image
+   devicetreedir /
+append root=/dev/mmcblk1p2 rootwait rw console=ttyS2,115200n8
diff --git a/board/beagleboard/beagley-ai/genimage.cfg b/board/beagleboard/beagley-ai/genimage.cfg
new file mode 100644
index 0000000000..3965b9388e
--- /dev/null
+++ b/board/beagleboard/beagley-ai/genimage.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"Image",
+			"ti",
+			"extlinux",
+		}
+
+		label = "boot"
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagley-ai/patches/linux/linux.hash b/board/beagleboard/beagley-ai/patches/linux/linux.hash
new file mode 100644
index 0000000000..794837b285
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
diff --git a/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/board/beagleboard/beagley-ai/patches/uboot/uboot.hash b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/board/beagleboard/beagley-ai/post-build.sh b/board/beagleboard/beagley-ai/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/beagleboard/beagley-ai/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/beagleboard/beagley-ai/readme.txt b/board/beagleboard/beagley-ai/readme.txt
new file mode 100644
index 0000000000..6d16e5e172
--- /dev/null
+++ b/board/beagleboard/beagley-ai/readme.txt
@@ -0,0 +1,38 @@
+BeagleBoard.org BeagleY-AI Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the BeagleBoard.org
+BeagleY-AI. For more details about the board, visit:
+
+https://www.beagleboard.org/boards/beagley-ai
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make beagley_ai_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+Build:
+
+$ make
+
+To copy the resulting output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the BeagleY-AI board, and power it up
+through the USB Type-C connector. The system should come up.
+You can use a USB to serial adapter to connect to the connector
+labeled UART0 (J13) to communicate with the board.
+
+https://docs.beagle.cc/boards/beagley/ai/02-quick-start.html
diff --git a/configs/beagley_ai_defconfig b/configs/beagley_ai_defconfig
new file mode 100644
index 0000000000..67516d8681
--- /dev/null
+++ b/configs/beagley_ai_defconfig
@@ -0,0 +1,49 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagley-ai/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagley-ai/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagley-ai/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.15.6"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am67a-beagley-ai"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am67a_beagley_ai_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am67a_beagley_ai_a53"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
