From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon, 22 Apr 2019 23:34:33 +0530
Subject: [Buildroot] [PATCH 2/2] board/orangepi: Add support for OrangePi
 Rk3399 board
In-Reply-To: <20190422180433.15886-1-shyam.saini@amarulasolutions.com>
References: <20190422180433.15886-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190422180433.15886-2-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This initial support includes:
        Custom u-boot
        Linux next
        ATF v2.0
        Buildroot default packages

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 .gitlab-ci.yml                               |  1 +
 DEVELOPERS                                   |  2 +
 board/orangepi/orangepi-rk3399/extlinux.conf |  4 ++
 board/orangepi/orangepi-rk3399/genimage.cfg  | 22 +++++++++++
 board/orangepi/orangepi-rk3399/post-build.sh |  8 ++++
 board/orangepi/orangepi-rk3399/readme.txt    | 49 ++++++++++++++++++++++++
 configs/orangepi_rk3399_defconfig            | 56 ++++++++++++++++++++++++++++
 7 files changed, 142 insertions(+)
 create mode 100644 board/orangepi/orangepi-rk3399/extlinux.conf
 create mode 100644 board/orangepi/orangepi-rk3399/genimage.cfg
 create mode 100755 board/orangepi/orangepi-rk3399/post-build.sh
 create mode 100644 board/orangepi/orangepi-rk3399/readme.txt
 create mode 100644 configs/orangepi_rk3399_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0ac94059f9..966c1417fc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -202,6 +202,7 @@ orangepi_pc_defconfig: { extends: .defconfig }
 orangepi_pc_plus_defconfig: { extends: .defconfig }
 orangepi_plus_defconfig: { extends: .defconfig }
 orangepi_prime_defconfig: { extends: .defconfig }
+orangepi_rk3399_defconfig: { extends: .defconfig }
 orangepi_win_defconfig: { extends: .defconfig }
 orangepi_zero_defconfig: { extends: .defconfig }
 orangepi_zero_plus2_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index c15333ab78..b72733734d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2004,6 +2004,8 @@ F:	package/wolfssl/
 N:	Shyam Saini <shyam.saini@amarulasolutions.com>
 F:	board/friendlyarm/nanopi-m4/
 F:	configs/nanopi_m4_defconfig
+F:	board/orangepi/orangepi-rk3399/
+F:	configs/orangepi_rk3399_defconfig
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/board/orangepi/orangepi-rk3399/extlinux.conf b/board/orangepi/orangepi-rk3399/extlinux.conf
new file mode 100644
index 0000000000..fb6c015c4b
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/extlinux.conf
@@ -0,0 +1,4 @@
+label OrangePi RK3399
+  kernel /boot/Image
+  devicetree /boot/rk3399-orangepi.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
new file mode 100644
index 0000000000..6404b0ad3b
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
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
diff --git a/board/orangepi/orangepi-rk3399/post-build.sh b/board/orangepi/orangepi-rk3399/post-build.sh
new file mode 100755
index 0000000000..9b0c4ecc83
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3399 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/orangepi/orangepi-rk3399/readme.txt b/board/orangepi/orangepi-rk3399/readme.txt
new file mode 100644
index 0000000000..3a6d3ccc32
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/readme.txt
@@ -0,0 +1,49 @@
+Intro
+=====
+
+OrangePi RK3399 is an open source single board computer, it is RK3399 SOC
+based ARM64 board.
+
+Official Page: http://www.orangepi.org/Orange%20Pi%20RK3399/
+Wiki: https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/orangepi.html
+
+Build
+=====
+
+Run OrangePi RK3399 configuration
+
+  $ make orangepi_rk3399_defconfig
+
+To build, run make command.
+
+  $ make
+
+Files created in output directory
+=================================
+output/images/
+??? bl31.bin
+??? bl31.elf
+??? Image
+??? rk3399-nanopi-m4.dtb
+??? rk3399-orangepi.dtb
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
diff --git a/configs/orangepi_rk3399_defconfig b/configs/orangepi_rk3399_defconfig
new file mode 100644
index 0000000000..348f630750
--- /dev/null
+++ b/configs/orangepi_rk3399_defconfig
@@ -0,0 +1,56 @@
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
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi-rk3399"
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
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="08b64bd2c681ab8bd67fbf1d34d092d1bb72ede4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-orangepi"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="OrangePi RK3399"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OrangePi RK3399!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-rk3399/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-rk3399/post-build.sh"
-- 
2.11.0
