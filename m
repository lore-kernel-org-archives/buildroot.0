From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Sun, 14 Jun 2020 00:02:32 +0530
Subject: [Buildroot] [PATCH 2/4] configs/orangepi_rk3399: new defconfig
In-Reply-To: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
References: <1592073154-13731-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1592073154-13731-3-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Suniel Mahesh <sunil@amarulasolutions.com>

Add initial support for Orangepi RK3399 target with below features:

  - U-Boot 2020.04
  - Linux 5.4.46
  - Default packages from buildroot

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
NOTE:
- This patch is a resend. earlier patch is at:
https://patchwork.ozlabs.org/project/buildroot/list/?series=174279
- bumped linux version from 5.4.36 to 5.4.46
- As suggested by Thomas Pettazzoni, rk3399 targets does not need
  pylibfdt or pyelftools, but only a host Python interpreter. Remove
  them and add python, python3 in defconfig.
---
 .gitlab-ci.yml                               |  1 +
 DEVELOPERS                                   |  2 +
 board/orangepi/orangepi-rk3399/extlinux.conf |  4 ++
 board/orangepi/orangepi-rk3399/genimage.cfg  | 39 +++++++++++++++++++
 board/orangepi/orangepi-rk3399/post-build.sh |  5 +++
 board/orangepi/orangepi-rk3399/readme.txt    | 56 ++++++++++++++++++++++++++++
 configs/orangepi_rk3399_defconfig            | 56 ++++++++++++++++++++++++++++
 7 files changed, 163 insertions(+)
 create mode 100644 board/orangepi/orangepi-rk3399/extlinux.conf
 create mode 100644 board/orangepi/orangepi-rk3399/genimage.cfg
 create mode 100755 board/orangepi/orangepi-rk3399/post-build.sh
 create mode 100644 board/orangepi/orangepi-rk3399/readme.txt
 create mode 100644 configs/orangepi_rk3399_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6825862..66c7b72 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -259,6 +259,7 @@ orangepi_pc_plus_defconfig: { extends: .defconfig }
 orangepi_plus_defconfig: { extends: .defconfig }
 orangepi_prime_defconfig: { extends: .defconfig }
 orangepi_r1_defconfig: { extends: .defconfig }
+orangepi_rk3399_defconfig: { extends: .defconfig }
 orangepi_win_defconfig: { extends: .defconfig }
 orangepi_zero_defconfig: { extends: .defconfig }
 orangepi_zero_plus2_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 337135b..6b7421a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2392,7 +2392,9 @@ F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
 F:	board/firefly/
+F:	board/orangepi/orangepi-rk3399
 F:	board/pine64/rockpro64
+F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
diff --git a/board/orangepi/orangepi-rk3399/extlinux.conf b/board/orangepi/orangepi-rk3399/extlinux.conf
new file mode 100644
index 0000000..5109625
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/extlinux.conf
@@ -0,0 +1,4 @@
+label RK3399_ROCKPRO64 linux
+  kernel /Image
+  devicetree /rk3399-orangepi.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p4 rw rootwait
diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
new file mode 100644
index 0000000..9d63e30
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"rk3399-orangepi.dtb",
+			"extlinux"
+		}
+	}
+	size = 112M
+}
+
+image sdcard.img {
+
+	hdimage {
+		gpt = true
+	}
+
+	partition loader1 {
+		image = "idbloader.img"
+		offset = 32K
+	}
+
+	partition loader2 {
+		image = "u-boot.itb"
+		offset = 8M
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 16M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/orangepi/orangepi-rk3399/post-build.sh b/board/orangepi/orangepi-rk3399/post-build.sh
new file mode 100755
index 0000000..ba29375
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/orangepi/orangepi-rk3399/readme.txt b/board/orangepi/orangepi-rk3399/readme.txt
new file mode 100644
index 0000000..197e1fb
--- /dev/null
+++ b/board/orangepi/orangepi-rk3399/readme.txt
@@ -0,0 +1,56 @@
+Orangepi Rk3399
+================
+http://www.orangepi.org/Orange%20Pi%20RK3399/
+
+Build:
+======
+  $ make orangepi_rk3399_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+
+????????? bl31.elf
+????????? boot.vfat
+????????? extlinux
+????????? idbloader.img
+????????? Image
+????????? rk3399-orangepi.dtb
+????????? rootfs.ext2
+????????? rootfs.ext4 -> rootfs.ext2
+????????? rootfs.tar
+????????? sdcard.img
+????????? u-boot.bin
+????????? u-boot.itb
+
+Creating bootable SD card:
+==========================
+
+Simply invoke (as root)
+
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device.
+
+Booting:
+========
+Orangepi-RK3399 by default boots from emmc. For SD card boot to
+happen, emmc should be empty. If emmc happens to have any bootable
+image then erase emmc so that bootrom will look for a proper image in SD.
+
+emmc can be erased once after booted into linux as shown in below link.
+
+https://wiki.amarulasolutions.com/bsp/setup/rockchip/rk3399_emmc.html
+
+Serial console:
+---------------
+
+Baudrate for this board is 1500000.
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
+
+https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/orangepi.html
diff --git a/configs/orangepi_rk3399_defconfig b/configs/orangepi_rk3399_defconfig
new file mode 100644
index 0000000..5b9ce2f
--- /dev/null
+++ b/configs/orangepi_rk3399_defconfig
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.46"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-orangepi"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="orangepi-rk3399"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ORANGEPI-RK3399..!!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="96M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-rk3399/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-rk3399/post-build.sh"
-- 
2.7.4
