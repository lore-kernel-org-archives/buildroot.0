Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25402E732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8CB4139E;
	Sat, 30 Sep 2023 19:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8CB4139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgebzsHc6tVX; Sat, 30 Sep 2023 19:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E95FA4010B;
	Sat, 30 Sep 2023 19:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E95FA4010B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98DCD1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C03782C38
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C03782C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vd1Z8hCe_WQA for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:39:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34535820B5
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34535820B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22EEE83CDD; Sat, 30 Sep 2023 19:39:33 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:38:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ca8e5a4a771ed540245ee3a277ac8127c92c008
X-Git-Newrev: 379a21b4f445d55466af0d035c6e423fa5bc310c
X-Patchwork-Hint: ignore
Message-Id: <20230930193933.22EEE83CDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/khadas_vim3_defconfig: new
 defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=379a21b4f445d55466af0d035c6e423fa5bc310c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add defconfig for the Khadas VIM3 board which uses a A311D SoC with a 4x
ARM Cortex-A73 + 2x ARM Cortex-A53 big.LITTLE architecture.

This defconfig includes the Linux mainline kernel version 6.3 as well as
mainline uboot version 2023.04 with an in-tree .dts and uboot-defconfig.
It also includes the host-tool amlogic-boot-fip which is necessary for
signing the bootloader. This host tool is used in the post-image.sh script
in order to generate the signed binary.

This binary is then flashed to the final sdcard.img after it is
generated using genimage. It is done in this way because the bootloader
image needs to be flashed in 2 steps. First the first 444 bytes need to
be flashed to the beginning of the sdcard.img, then we need to skip 68 bytes
in the source and the destination and then write the remaining
bootloader image to the sdcard.img.
Ref: http://docs.khadas.com/products/sbc/vim3/development/create-bootable-tf-card

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
[Romain:
  add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3=y
  add BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
  add BR2_PACKAGE_HOST_DOSFSTOOLS=y for genimage vfat support
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/khadas/vim3/extlinux.conf |  4 +++
 board/khadas/vim3/genimage.cfg  | 33 +++++++++++++++++++
 board/khadas/vim3/post-build.sh |  5 +++
 board/khadas/vim3/post-image.sh | 23 +++++++++++++
 board/khadas/vim3/readme.txt    | 71 +++++++++++++++++++++++++++++++++++++++++
 configs/khadas_vim3_defconfig   | 47 +++++++++++++++++++++++++++
 6 files changed, 183 insertions(+)

diff --git a/board/khadas/vim3/extlinux.conf b/board/khadas/vim3/extlinux.conf
new file mode 100644
index 0000000000..fede99b502
--- /dev/null
+++ b/board/khadas/vim3/extlinux.conf
@@ -0,0 +1,4 @@
+default buildroot
+label buildroot
+   kernel /Image
+append root=/dev/mmcblk0p2 rootwait console=ttyAML0,115200
diff --git a/board/khadas/vim3/genimage.cfg b/board/khadas/vim3/genimage.cfg
new file mode 100644
index 0000000000..79d7f9ca07
--- /dev/null
+++ b/board/khadas/vim3/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"meson-g12b-a311d-khadas-vim3.dtb",
+			"extlinux"
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
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image="boot.vfat"
+		size = 64M
+		offset = 2M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 128M
+		offset = 0
+	}
+}
diff --git a/board/khadas/vim3/post-build.sh b/board/khadas/vim3/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/khadas/vim3/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/khadas/vim3/post-image.sh b/board/khadas/vim3/post-image.sh
new file mode 100755
index 0000000000..db38421494
--- /dev/null
+++ b/board/khadas/vim3/post-image.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
+
+AMLOGIC_DIR=${BINARIES_DIR}/amlogic-boot-fip
+FIP_DIR=${BINARIES_DIR}/fip
+
+mkdir -p "${FIP_DIR}"
+
+(cd "${AMLOGIC_DIR}" && \
+	./build-fip.sh khadas-vim3 \
+	"${BINARIES_DIR}"/u-boot.bin \
+	"${FIP_DIR}")
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=1 count=444
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=512 skip=1 seek=1
diff --git a/board/khadas/vim3/readme.txt b/board/khadas/vim3/readme.txt
new file mode 100644
index 0000000000..cc9b513644
--- /dev/null
+++ b/board/khadas/vim3/readme.txt
@@ -0,0 +1,71 @@
+Khadas VIM3
+
+Description
+===========
+
+This configuration builds a complete image for the Khadas VIM3 to be flashed
+on an SD-card.
+
+How to build it
+===============
+
+Select the default configuration for the target:
+$ make khadas_vim3_defconfig
+
+Optional: modify the configuration:
+$ make menuconfig
+
+Build:
+$ make
+
+Result of the build
+===================
+output/images/
++-- amlogic-boot-fip
++   +-- build-fip.sh
++   +-- g12a.inc
++   `-- khadas-vim3
++       +-- acs.bin
++       +-- acs_tool.py
++       +-- aml_ddr.fw
++       +-- aml_encrypt_g12b
++       +-- bl2.bin
++       +-- bl301.bin
++       +-- bl30.bin
++       +-- bl31.bin
++       +-- bl31.img
++       +-- blx_fix.sh
++       +-- ddr3_1d.fw
++       +-- ddr4_1d.fw
++       +-- ddr4_2d.fw
++       +-- diag_lpddr4.fw
++       +-- lpddr3_1d.fw
++       +-- lpddr4_1d.fw
++       +-- lpddr4_2d.fw
++       +-- Makefile
++       `-- piei.fw
++-- boot.vfat
++-- extlinux
++   `-- extlinux.conf
++-- fip
++   +-- u-boot.bin
++   +-- u-boot.bin.sd.bin
++   +-- u-boot.bin.usb.bl2
++   `-- u-boot.bin.usb.tpl
++-- Image
++-- meson-g12b-a311d-khadas-vim3.dtb
++-- rootfs.ext2
++-- rootfs.ext4 -> rootfs.ext2
++-- rootfs.tar
++-- sdcard.img
+`-- u-boot.bin
+
+The post-image script uses the files in the amlogic-boot-fip folder to sign
+the bootloader image before integrating it into the sdcard image.
+
+To copy the image file to the sdcard use dd:
+$ dd if=output/images/sdcard.img of=/dev/sdX
+
+Tested hardware
+===============
+Khadas vim3 (rev. 14)
diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
new file mode 100644
index 0000000000..0a83883334
--- /dev/null
+++ b/configs/khadas_vim3_defconfig
@@ -0,0 +1,47 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a73_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.3"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-g12b-a311d-khadas-vim3"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Linux headers same as kernel, a 6.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_3=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="khadas-vim3"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tool to sign the bootloader image
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP=y
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE="khadas-vim3"
+
+# Required tools to create the SD image
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+
+# Supporting host tools to build FIT image
+# BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+# BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
