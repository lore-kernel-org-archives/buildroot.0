From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 07:46:36 +0200
Subject: [Buildroot] [git commit] configs/nenopi_neo4: new defconfig
Message-ID: <20190803054931.626378898A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1cd9cdf269488d6adeb0cc6d2250cf6ffe1b3ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This initial support includes:
        Linux v5.2
        Custom U-Boot
        Arm Trusted Firmware v2.0
        Buildroot default packages

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
[Thomas:
 - Use the kernel headers from the kernel, by using
   BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
 - Use the final 5.2 kernel instead of rc1.
 - Use the default ext2 rootfs size]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  4 +++
 board/friendlyarm/nanopi-neo4/extlinux.conf |  4 +++
 board/friendlyarm/nanopi-neo4/genimage.cfg  | 22 ++++++++++++
 board/friendlyarm/nanopi-neo4/post-build.sh |  9 +++++
 board/friendlyarm/nanopi-neo4/readme.txt    | 53 ++++++++++++++++++++++++++++
 configs/nanopi_neo4_defconfig               | 54 +++++++++++++++++++++++++++++
 7 files changed, 147 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 09c979fe7f..067a2ad73e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -213,6 +213,7 @@ mx6udoo_defconfig: { extends: .defconfig }
 nanopi_m1_defconfig: { extends: .defconfig }
 nanopi_m1_plus_defconfig: { extends: .defconfig }
 nanopi_neo_defconfig: { extends: .defconfig }
+nanopi_neo4_defconfig: { extends: .defconfig }
 nexbox_a95x_defconfig: { extends: .defconfig }
 nitrogen6sx_defconfig: { extends: .defconfig }
 nitrogen6x_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index b50b2ad30f..8941882fc2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2063,6 +2063,10 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shyam Saini <shyam.saini@amarulasolutions.com>
+F:	board/friendlyarm/nanopi-neo4/
+F:	configs/nanopi_neo4_defconfig
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
diff --git a/board/friendlyarm/nanopi-neo4/extlinux.conf b/board/friendlyarm/nanopi-neo4/extlinux.conf
new file mode 100644
index 0000000000..91eef67fb9
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/extlinux.conf
@@ -0,0 +1,4 @@
+label NanoPi Neo4 linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-nanopi-neo4.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk1p1 rootwait
diff --git a/board/friendlyarm/nanopi-neo4/genimage.cfg b/board/friendlyarm/nanopi-neo4/genimage.cfg
new file mode 100644
index 0000000000..b8c1cd5220
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
index 0000000000..e852ba6adf
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
index 0000000000..07e3491459
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
+????????? bl31.bin
+????????? bl31.elf
+????????? Image
+????????? rk3399-nanopi-neo4.dtb
+????????? rootfs.ext2
+????????? rootfs.ext4 -> rootfs.ext2
+????????? rootfs.tar
+????????? sdcard.img
+????????? u-boot.bin
+????????? u-boot.itb
+????????? u-boot-spl-dtb.bin
+????????? u-boot-tpl-dtb.bin
+????????? u-boot-tpl-dtb.img
+????????? u-boot-tpl-spl-dtb.img
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
index 0000000000..0e58aeac3f
--- /dev/null
+++ b/configs/nanopi_neo4_defconfig
@@ -0,0 +1,54 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Linux headers same as kernel, a 5.2 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2"
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
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo4/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo4/post-build.sh"
