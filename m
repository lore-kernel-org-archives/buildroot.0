From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:36 -0000
Subject: [Buildroot] [git commit] configs/rock_pi_n8: new defconfig
Message-ID: <20200902161634.8200585EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cd652c26ebb6ac1424251f0717fa69d7d9e32eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for RK3288 SOM based radxa rockpi-n8
target with below features:

- Custom U-Boot 2020.07-rc4
  https://github.com/amarula/u-boot-amarula.git
  commit: "ba120841bf40ebaed049d64bb4f980083a1cf6b7"
- Custom Linux 5.7.0-rc1
  https://github.com/amarula/linux-amarula.git
  commit: "5dcb0132685b07beb82065c5d7521e6c555c55b6"
- GPT partition layout is being used
- Default packages from buildroot

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                          |  2 ++
 board/radxa/rockpi-n8/extlinux.conf |  4 +++
 board/radxa/rockpi-n8/genimage.cfg  | 39 ++++++++++++++++++++++++
 board/radxa/rockpi-n8/post-build.sh |  5 +++
 board/radxa/rockpi-n8/readme.txt    | 61 +++++++++++++++++++++++++++++++++++++
 configs/rock_pi_n8_defconfig        | 45 +++++++++++++++++++++++++++
 6 files changed, 156 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eb6df1ae7e..b962607f38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2436,9 +2436,11 @@ F:	package/powertop/
 N:	Suniel Mahesh <sunil@amarulasolutions.com>
 F:	board/firefly/
 F:	board/radxa/rockpi-4
+F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
 F:	configs/roc_pc_rk3399_defconfig
 F:	configs/rock_pi_4_defconfig
+F:	configs/rock_pi_n8_defconfig
 F:	configs/rock_pi_n10_defconfig
 F:	package/arm-gnu-a-toolchain/
 
diff --git a/board/radxa/rockpi-n8/extlinux.conf b/board/radxa/rockpi-n8/extlinux.conf
new file mode 100644
index 0000000000..c323fe10ef
--- /dev/null
+++ b/board/radxa/rockpi-n8/extlinux.conf
@@ -0,0 +1,4 @@
+label RK3288_ROCKPI_N8 linux
+  kernel /zImage
+  devicetree /rk3288-rock-pi-n8.dtb
+  append console=ttyS2,115200n8 root=/dev/mmcblk0p4 rw rootwait
diff --git a/board/radxa/rockpi-n8/genimage.cfg b/board/radxa/rockpi-n8/genimage.cfg
new file mode 100644
index 0000000000..88b55de376
--- /dev/null
+++ b/board/radxa/rockpi-n8/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"rk3288-rock-pi-n8.dtb",
+			"extlinux"
+		}
+	}
+	size = 16M
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
+		image = "u-boot-dtb.img"
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
diff --git a/board/radxa/rockpi-n8/post-build.sh b/board/radxa/rockpi-n8/post-build.sh
new file mode 100755
index 0000000000..ba29375c05
--- /dev/null
+++ b/board/radxa/rockpi-n8/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/radxa/rockpi-n8/readme.txt b/board/radxa/rockpi-n8/readme.txt
new file mode 100644
index 0000000000..ac83d5c8c6
--- /dev/null
+++ b/board/radxa/rockpi-n8/readme.txt
@@ -0,0 +1,61 @@
+RADXA ROCKPI-N8
+================
+https://wiki.radxa.com/RockpiN8
+
+Build:
+======
+  $ make rock_pi_n8_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+.
+????????? boot.vfat
+????????? extlinux
+????????? idbloader.img
+????????? rk3288-rock-pi-n8.dtb
+????????? rootfs.ext2
+????????? rootfs.ext4 -> rootfs.ext2
+????????? rootfs.tar
+????????? sdcard.img
+????????? u-boot.bin
+????????? u-boot-dtb.bin
+????????? u-boot-dtb.img
+????????? zImage
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
+
+Serial console:
+---------------
+RockPi-N8 has a 40-pin GPIO header. The pin layout is as follows:
+
+pin 6:  gnd
+pin 8:  tx
+pin 10: rx
+
+Baudrate for this board is 115200.
+
+The boot order on rockpi-n8 is emmc, sd. If emmc contains a valid Image, the board
+always boots from emmc. To boot from SD, erase emmc as per the guide:
+
+https://wiki.amarulasolutions.com/bsp/setup/rockchip/rk3399_emmc.html
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
+
+wiki link:
+----------
+https://wiki.amarulasolutions.com/bsp/rockchip/rk3288/rock-pi-n8.html
diff --git a/configs/rock_pi_n8_defconfig b/configs/rock_pi_n8_defconfig
new file mode 100644
index 0000000000..9c671d416e
--- /dev/null
+++ b/configs/rock_pi_n8_defconfig
@@ -0,0 +1,45 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a17=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 5.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ba120841bf40ebaed049d64bb4f980083a1cf6b7"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-n8-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/amarula/linux-amarula.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5dcb0132685b07beb82065c5d7521e6c555c55b6"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-rock-pi-n8"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="rockpi-n8"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPI-N8"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rockpi-n8/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rockpi-n8/post-build.sh"
