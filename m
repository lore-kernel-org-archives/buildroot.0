From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 18:03:22 +0100
Subject: [Buildroot] [git commit] configs: update cubieboard2 defconfig
Message-ID: <20151229170349.8C86B826EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53c1dadbcc4891d619b4efd067747ecd57810272
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the Cubieboard2 board defconfig to use newer u-boot
and linux versions, along with a few other improvements.
The other improvements were mostly backported from the recent Orange Pi
defconfig inclusion and are related to image generation.
linux-sunxi.org was used as a reference for both linux and u-boot
defconfig names.

In detail:
- Update linux to vanilla upstream -- currently 4.3.3 is the most
up-to-date. Although it lacks some features present only in the
linux-sunxi 3.4 branch, upstream support appears to be relatively mature
and is already being deployed by default by distributions such as Arch
Linux ARM.
- Update u-boot to vanilla upstream 2015.10. According to
linux-sunxi.org, upstream fully supports major functions (except NAND)
since 2015.07.
- Change image format to zImage and drop custom image generation script
in favour of genimage, as pointed out by reviewers in the Orange Pi
defconfig submission.

This was tested in a Cubieboard2 board with boot from mmc and it boots
fine to login prompt.

This has not been tested in a Cubieboard (A10) as I don't own any; the
version bumps probably apply to it although there are some differences
(lack of VFPv4 support, Cortex-A8 instead of Cortex-A7), so I have kept
the current Cubieboard defconfig and its scripts. This one has been only
build-tested.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/cubietech/cubieboard2/boot.cmd      |  5 +++
 board/cubietech/cubieboard2/genimage.cfg  | 36 +++++++++++++++++++++
 board/cubietech/cubieboard2/post-build.sh | 11 +++++++
 board/cubietech/cubieboard2/post-image.sh | 16 +++++++++
 configs/cubieboard2_defconfig             | 54 +++++++++++++------------------
 5 files changed, 90 insertions(+), 32 deletions(-)

diff --git a/board/cubietech/cubieboard2/boot.cmd b/board/cubietech/cubieboard2/boot.cmd
new file mode 100644
index 0000000..a9ae0e2
--- /dev/null
+++ b/board/cubietech/cubieboard2/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun7i-a20-cubieboard2.dtb
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
new file mode 100644
index 0000000..8929a72
--- /dev/null
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -0,0 +1,36 @@
+# Minimal SD card image for the Cubieboard2
+# Based in the Orange Pi genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun7i-a20-cubieboard2.dtb",
+			"boot.scr"
+		}
+	}
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/cubietech/cubieboard2/post-build.sh b/board/cubietech/cubieboard2/post-build.sh
new file mode 100755
index 0000000..465d493
--- /dev/null
+++ b/board/cubietech/cubieboard2/post-build.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+# post-build.sh for Cubieboard2
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/cubietech/cubieboard2/post-image.sh b/board/cubietech/cubieboard2/post-image.sh
new file mode 100755
index 0000000..9cca1b1
--- /dev/null
+++ b/board/cubietech/cubieboard2/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index f85760d..f277b72 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,40 +1,30 @@
-# Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-
-# System configuration
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.3.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
-BR2_TARGET_GENERIC_ISSUE="Welcome to use Cubieboard!"
-BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard/post-build.sh"
-
-# Additional tools
-BR2_PACKAGE_HOST_SUNXI_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_BOARDS=y
-BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a20/cubieboard2.fex"
-
-# Kernel headers
-BR2_KERNEL_HEADERS_3_4=y
-
-# Kernel
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/cubietech/cubieboard2/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5dda5145c877335e17bd9ca48954841acc0f785a"
-BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/cubietech/cubieboard/linux-cubieboard2.config"
-
-# Bootloaders
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.3"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="cubieboard2"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_VERSION="sunxi"
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b4bca5e0651b460a4511582f07a935cb48f74948"
-BR2_TARGET_UBOOT_FORMAT_BIN=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
