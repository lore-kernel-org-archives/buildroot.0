From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 15:09:48 +0200
Subject: [Buildroot] [git commit] configs/roc_rk3399_pc: new defconfig
Message-ID: <20200329125649.05F238895B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80ae1aedcb3ac45e4be35d9536b8179ac2cb293c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This initial support includes:
Linux 5.4
U-Boot 2020.01
Arm Trusted Firmware v2.2
Buildroot default packages.

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                            |  1 +
 DEVELOPERS                                |  2 ++
 board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
 board/firefly/roc-rk3399-pc/genimage.cfg  | 22 ++++++++++++
 board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
 board/firefly/roc-rk3399-pc/readme.txt    | 40 ++++++++++++++++++++++
 configs/roc_pc_rk3399_defconfig           | 56 +++++++++++++++++++++++++++++++
 7 files changed, 130 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 72e2068ec2..cc67fc1b67 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -303,6 +303,7 @@ raspberrypi4_64_defconfig: { extends: .defconfig }
 raspberrypi4_defconfig: { extends: .defconfig }
 raspberrypi_defconfig: { extends: .defconfig }
 riotboard_defconfig: { extends: .defconfig }
+roc_pc_rk3399_defconfig: { extends: .defconfig }
 rock64_defconfig: { extends: .defconfig }
 roseapplepi_defconfig: { extends: .defconfig }
 s6lx9_microboard_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 2378264e7d..f67ef86e6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2390,6 +2390,8 @@ F:	package/hwloc/
 F:	package/powertop/
 
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
+F:	board/firefly/
+F:	configs/roc_pc_rk3399_defconfig
 F:	package/arm-gnu-a-toolchain/
 
 N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
diff --git a/board/firefly/roc-rk3399-pc/extlinux.conf b/board/firefly/roc-rk3399-pc/extlinux.conf
new file mode 100644
index 0000000000..50a358fadc
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/extlinux.conf
@@ -0,0 +1,4 @@
+label RK3399RocPC linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-roc-pc.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p1 rootwait
diff --git a/board/firefly/roc-rk3399-pc/genimage.cfg b/board/firefly/roc-rk3399-pc/genimage.cfg
new file mode 100644
index 0000000000..966c869273
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "idbloader.img"
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
diff --git a/board/firefly/roc-rk3399-pc/post-build.sh b/board/firefly/roc-rk3399-pc/post-build.sh
new file mode 100755
index 0000000000..1f5ff6a611
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/firefly/roc-rk3399-pc/readme.txt b/board/firefly/roc-rk3399-pc/readme.txt
new file mode 100644
index 0000000000..8a6f1cdee6
--- /dev/null
+++ b/board/firefly/roc-rk3399-pc/readme.txt
@@ -0,0 +1,40 @@
+Libre Computer Board ROC-RK3399-PC
+===================================
+
+Build:
+
+  $ make roc_pc_rk3399_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+
+????????? bl31.elf
+????????? idbloader.img
+????????? Image
+????????? rk3399-roc-pc.dtb
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
+Where X is your SD card device
+
+Serial console
+--------------
+
+Baudrate for this board is 1500000
+
+Wiki link:
+https://wiki.amarulasolutions.com/bsp/rockchip/rk3399/roc-rk3399-pc.html
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
new file mode 100644
index 0000000000..114b0e8c95
--- /dev/null
+++ b/configs/roc_pc_rk3399_defconfig
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
