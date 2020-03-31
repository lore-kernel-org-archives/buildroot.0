From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Tue, 31 Mar 2020 08:51:58 +0200
Subject: [Buildroot] [PATCH v3] configs/nenopi_neo4: new updated defconfig
Message-ID: <1585637518-9836-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch revert 8af7b11bd8a95bc41e4de46f727f3b0afde465a4 and
add extra options to have build working

Updates:
- enable BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
- bump kernel to 5.4
- increase default rootfs size to 70M

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 board/friendlyarm/nanopi-neo4/extlinux.conf |  4 +++
 board/friendlyarm/nanopi-neo4/genimage.cfg  | 22 ++++++++++++
 board/friendlyarm/nanopi-neo4/post-build.sh |  9 +++++
 board/friendlyarm/nanopi-neo4/readme.txt    | 53 +++++++++++++++++++++++++++
 configs/nanopi_neo4_defconfig               | 56 +++++++++++++++++++++++++++++
 5 files changed, 144 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-neo4/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-neo4/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-neo4/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-neo4/readme.txt
 create mode 100644 configs/nanopi_neo4_defconfig

diff --git a/board/friendlyarm/nanopi-neo4/extlinux.conf b/board/friendlyarm/nanopi-neo4/extlinux.conf
new file mode 100644
index 0000000..91eef67
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi Neo4 linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-nanopi-neo4.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/friendlyarm/nanopi-neo4/genimage.cfg b/board/friendlyarm/nanopi-neo4/genimage.cfg
new file mode 100644
index 0000000..b8c1cd5
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-tpl-spl-dtb.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 8M
+		size = 30M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/friendlyarm/nanopi-neo4/post-build.sh b/board/friendlyarm/nanopi-neo4/post-build.sh
new file mode 100755
index 0000000..e852ba6
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3399 -T rksd -d $BINARIES_DIR/u-boot-tpl-dtb.bin $BINARIES_DIR/u-boot-tpl-dtb.img
+cat $BINARIES_DIR/u-boot-tpl-dtb.img $BINARIES_DIR/u-boot-spl-dtb.bin > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-neo4/readme.txt b/board/friendlyarm/nanopi-neo4/readme.txt
new file mode 100644
index 0000000..07e3491
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/readme.txt
@@ -0,0 +1,53 @@
+Intro
+=====
+
+NanoPi Neo4 is a RK3399 SoC based ARM64 board.
+
+
+Official wiki: http://wiki.friendlyarm.com/wiki/index.php/NanoPi_NEO4
+Mainline wiki: https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/neo4.html
+
+Build
+=====
+
+Run NanoPi Neo4 configuration
+
+  $ make nanopi_neo4_defconfig
+
+To build, run make comamnd.
+
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+
+??? bl31.bin
+??? bl31.elf
+??? Image
+??? rk3399-nanopi-neo4.dtb
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.bin
+??? u-boot.itb
+??? u-boot-spl-dtb.bin
+??? u-boot-tpl-dtb.bin
+??? u-boot-tpl-dtb.img
+??? u-boot-tpl-spl-dtb.img
+
+Creating bootable SD card:
+=========================
+
+Simply invoke (as root)
+
+  # dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device
+
+Serial console
+--------------
+
+Baudrate for this board is 1500000
diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
new file mode 100644
index 0000000..8cc9bb4
--- /dev/null
+++ b/configs/nanopi_neo4_defconfig
@@ -0,0 +1,56 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd2b180c457d35de195707dfa0b57a83b97fb275"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-neo4-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl-dtb.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopi-neo4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="NanoPi Neo4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPi Neo4!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="70M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo4/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo4/post-build.sh"
-- 
2.7.4
