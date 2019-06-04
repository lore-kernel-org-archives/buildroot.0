From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Tue,  4 Jun 2019 14:23:07 +0530
Subject: [Buildroot] [PATCH 3/3] board/pine64: Add support for Pine64
 RockPro64 board
In-Reply-To: <20190604085307.15756-1-shyam.saini@amarulasolutions.com>
References: <20190604085307.15756-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190604085307.15756-3-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This initial support includes:
            Linux 5.1
            Custom U-Boot
            Arm Trusted Firmware v2.0
            Buildroot default packages

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/pine64/rockpro64/extlinux.conf |  4 +++
 board/pine64/rockpro64/genimage.cfg  | 22 +++++++++++++++
 board/pine64/rockpro64/post-build.sh |  9 ++++++
 board/pine64/rockpro64/readme.txt    | 51 +++++++++++++++++++++++++++++++++
 configs/pine64_rockpro64_defconfig   | 55 ++++++++++++++++++++++++++++++++++++
 7 files changed, 144 insertions(+)
 create mode 100644 board/pine64/rockpro64/extlinux.conf
 create mode 100644 board/pine64/rockpro64/genimage.cfg
 create mode 100755 board/pine64/rockpro64/post-build.sh
 create mode 100644 board/pine64/rockpro64/readme.txt
 create mode 100644 configs/pine64_rockpro64_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e290d602ad..5c9e344f8c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -215,6 +215,7 @@ pandaboard_defconfig: { extends: .defconfig }
 pc_x86_64_bios_defconfig: { extends: .defconfig }
 pc_x86_64_efi_defconfig: { extends: .defconfig }
 pine64_defconfig: { extends: .defconfig }
+pine64_rockpro64_defconfig: { extends: .defconfig }
 pine64_sopine_defconfig: { extends: .defconfig }
 qemu_aarch64_virt_defconfig: { extends: .defconfig }
 qemu_arm_versatile_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 5cbf19fb1f..64b84a06a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2047,12 +2047,14 @@ F:	board/friendlyarm/nanopi-m4/
 F:	board/friendlyarm/nanopi-neo4/
 F:	board/olimex/a33_olinuxino/
 F:	board/orangepi/orangepi-rk3399/
+F:	board/pine64/rockpro64
 F:	board/radxa/
 F:	configs/nanopc_t4_defconfig
 F:	configs/nanopi_m4_defconfig
 F:	configs/nanopi_neo4_defconfig
 F:	configs/olimex_a33_olinuxino_defconfig
 F:	configs/orangepi_rk3399_defconfig
+F:	configs/pine64_rockpro64_defconfig
 F:	configs/radxa_rock_pi4_defconfig
 
 N:	Simon Dawson <spdawson@gmail.com>
diff --git a/board/pine64/rockpro64/extlinux.conf b/board/pine64/rockpro64/extlinux.conf
new file mode 100644
index 0000000000..ff196499b0
--- /dev/null
+++ b/board/pine64/rockpro64/extlinux.conf
@@ -0,0 +1,4 @@
+label RockPro64 linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-rockpro64.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p1 rootwait
diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
new file mode 100644
index 0000000000..b8c1cd5220
--- /dev/null
+++ b/board/pine64/rockpro64/genimage.cfg
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
diff --git a/board/pine64/rockpro64/post-build.sh b/board/pine64/rockpro64/post-build.sh
new file mode 100755
index 0000000000..e852ba6adf
--- /dev/null
+++ b/board/pine64/rockpro64/post-build.sh
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
diff --git a/board/pine64/rockpro64/readme.txt b/board/pine64/rockpro64/readme.txt
new file mode 100644
index 0000000000..2fa8be362f
--- /dev/null
+++ b/board/pine64/rockpro64/readme.txt
@@ -0,0 +1,51 @@
+Intro
+=====
+
+Pine64 RockPro64 is a RK3399 SoC based ARM64 board.
+
+Wiki: https://wiki.pine64.org/index.php/ROCKPro64_Main_Page
+
+Build
+=====
+
+Run Pine64 RockPro64 configuration
+
+  $ make pine64_rockpro64_defconfig
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
+??? rk3399-rockpro64.dtb
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
diff --git a/configs/pine64_rockpro64_defconfig b/configs/pine64_rockpro64_defconfig
new file mode 100644
index 0000000000..283d4331d5
--- /dev/null
+++ b/configs/pine64_rockpro64_defconfig
@@ -0,0 +1,55 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Linux headers same as kernel, a 5.1 series
+BR2_KERNEL_HEADERS_5_1=y
+
+# Firmware
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
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd2b180c457d35de195707dfa0b57a83b97fb275"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rockpro64-rk3399"
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rockpro64"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="RockPro 64"
+BR2_TARGET_GENERIC_ISSUE="Welcome to RockPro64!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rockpro64/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rockpro64/post-build.sh"
-- 
2.11.0
