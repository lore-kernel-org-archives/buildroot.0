From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon, 22 Apr 2019 23:34:32 +0530
Subject: [Buildroot] [PATCH 1/2] board/friendlyarm: Add support for RK3399
 NanoPi M4 board
Message-ID: <20190422180433.15886-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This initial support includes:
	Custom u-boot
	Linux v5.1-rc1
	ATF v2.0
	Buildroot default packages

Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
Changelog:

V1->V2:
        Fix extra white space and extra new line
        Remove wrong uboot patch
        Rename uboot patch appropriately
        Add NanoPi M4 official wiki
        Improve commit message

V2->V3: Fix build bl31.elf issue
	Use update u-boot repo with build fix patches
	Remove the patch directory
	Use git commit hash instead of branch name
---
 .gitlab-ci.yml                            |  1 +
 DEVELOPERS                                |  4 +++
 board/friendlyarm/nanopi-m4/extlinux.conf |  4 +++
 board/friendlyarm/nanopi-m4/genimage.cfg  | 22 +++++++++++++
 board/friendlyarm/nanopi-m4/post-build.sh |  8 +++++
 board/friendlyarm/nanopi-m4/readme.txt    | 45 +++++++++++++++++++++++++
 configs/nanopi_m4_defconfig               | 55 +++++++++++++++++++++++++++++++
 7 files changed, 139 insertions(+)
 create mode 100644 board/friendlyarm/nanopi-m4/extlinux.conf
 create mode 100644 board/friendlyarm/nanopi-m4/genimage.cfg
 create mode 100755 board/friendlyarm/nanopi-m4/post-build.sh
 create mode 100644 board/friendlyarm/nanopi-m4/readme.txt
 create mode 100644 configs/nanopi_m4_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 02d6f6c0cc..0ac94059f9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -175,6 +175,7 @@ mx6sx_udoo_neo_defconfig: { extends: .defconfig }
 mx6udoo_defconfig: { extends: .defconfig }
 nanopi_m1_defconfig: { extends: .defconfig }
 nanopi_m1_plus_defconfig: { extends: .defconfig }
+nanopi_m4_defconfig: {extends: .defconfig}
 nanopi_neo_defconfig: { extends: .defconfig }
 nexbox_a95x_defconfig: { extends: .defconfig }
 nitrogen6sx_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index f23479703b..c15333ab78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2001,6 +2001,10 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shyam Saini <shyam.saini@amarulasolutions.com>
+F:	board/friendlyarm/nanopi-m4/
+F:	configs/nanopi_m4_defconfig
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
diff --git a/board/friendlyarm/nanopi-m4/extlinux.conf b/board/friendlyarm/nanopi-m4/extlinux.conf
new file mode 100644
index 0000000000..e5861cdcbe
--- /dev/null
+++ b/board/friendlyarm/nanopi-m4/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi M4 5.1-rc1
+  kernel /boot/Image
+  devicetree /boot/rk3399-nanopi-m4.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
new file mode 100644
index 0000000000..6404b0ad3b
--- /dev/null
+++ b/board/friendlyarm/nanopi-m4/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-spl-dtb {
+		in-partition-table = "no"
+		image = "u-boot-spl-dtb.img"
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
diff --git a/board/friendlyarm/nanopi-m4/post-build.sh b/board/friendlyarm/nanopi-m4/post-build.sh
new file mode 100755
index 0000000000..9b0c4ecc83
--- /dev/null
+++ b/board/friendlyarm/nanopi-m4/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3399 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/friendlyarm/nanopi-m4/readme.txt b/board/friendlyarm/nanopi-m4/readme.txt
new file mode 100644
index 0000000000..af12ee8aae
--- /dev/null
+++ b/board/friendlyarm/nanopi-m4/readme.txt
@@ -0,0 +1,45 @@
+Intro
+=====
+
+NanoPi M4 is a RK3399 SoC based ARM board.
+
+Wiki: https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/nanopi_m4.html
+
+Build
+=====
+
+Run NanoPi M4 configuration
+
+  $ make nanopi_m4_defconfig
+
+To build, run make command.
+
+  $ make
+
+Files created in output directory
+=================================
+output/images/
+??? bl31.bin
+??? Image
+??? rk3399-nanopi-m4.dtb
+??? rootfs.ext2
+??? rootfs.ext4 -> rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.bin
+??? u-boot.itb
+??? u-boot-spl-dtb.bin
+??? u-boot-spl-dtb.img
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
+Baudrate for this board is 1500000
diff --git a/configs/nanopi_m4_defconfig b/configs/nanopi_m4_defconfig
new file mode 100644
index 0000000000..2ef0f19cba
--- /dev/null
+++ b/configs/nanopi_m4_defconfig
@@ -0,0 +1,55 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Linux headers same as kernel, a 5.0 series
+BR2_KERNEL_HEADERS_5_0=y
+
+#Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="980ca75ae0438b4a1847d044605c492f3c844f88"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-m4-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="v5.1-rc1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-nanopi-m4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="NanoPi M4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to NanoPi M4!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-m4/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-m4/post-build.sh"
-- 
2.11.0
