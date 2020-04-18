From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 18:16:27 +0200
Subject: [Buildroot] [git commit] configs/nanopi_neo4: new defconfig
Message-ID: <20200418160254.917D48F105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84ba2e8bf5f1e3a9d0d01a577f72cfd51f88a7b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A defconfig for the nanopi_neo4 was added in
d1cd9cdf269488d6adeb0cc6d2250cf6ffe1b3ed, but then removed in
8af7b11bd8a95bc41e4de46f727f3b0afde465a4 because an ARM32 compiler was
needed to build ATF, and this was not supported back then.

Thanks to the addition of package/arm-gnu-a-toolchain/, we can now
re-introduce this defconfig.

Compared to the previous defconfig, the following changes were done:

- enable BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
- bump kernel to 5.4
- increase default rootfs size to 70M
- use mainline u-boot
- switch to Marek Belisko as maintainer

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  2 ++
 board/friendlyarm/nanopi-neo4/extlinux.conf |  4 +++
 board/friendlyarm/nanopi-neo4/genimage.cfg  | 22 ++++++++++++
 board/friendlyarm/nanopi-neo4/post-build.sh |  5 +++
 board/friendlyarm/nanopi-neo4/readme.txt    | 53 +++++++++++++++++++++++++++
 configs/nanopi_neo4_defconfig               | 56 +++++++++++++++++++++++++++++
 7 files changed, 143 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 43423e543a..91b4972109 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -226,6 +226,7 @@ mx6sx_udoo_neo_defconfig: { extends: .defconfig }
 mx6udoo_defconfig: { extends: .defconfig }
 nanopi_m1_defconfig: { extends: .defconfig }
 nanopi_m1_plus_defconfig: { extends: .defconfig }
+nanopi_neo4_defconfig: { extends: .defconfig }
 nanopi_neo_defconfig: { extends: .defconfig }
 nanopi_r1_defconfig: { extends: .defconfig }
 nexbox_a95x_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index f94d3e4faf..c831d9d2d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1606,6 +1606,8 @@ F:	utils/config
 F:	utils/diffconfig
 
 N:	Marek Belisko <marek.belisko@open-nandra.com>
+F:	board/friendlyarm/nanopi-m4/
+F:	configs/nanopi_neo4_defconfig
 F:	package/libatasmart/
 F:	package/polkit/
 F:	package/sg3_utils/
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
index 0000000000..966c869273
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/genimage.cfg
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
diff --git a/board/friendlyarm/nanopi-neo4/post-build.sh b/board/friendlyarm/nanopi-neo4/post-build.sh
new file mode 100755
index 0000000000..1f5ff6a611
--- /dev/null
+++ b/board/friendlyarm/nanopi-neo4/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
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
index 0000000000..6e507235cf
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
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-neo4-rk3399"
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
