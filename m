From: Suniel Mahesh <sunil@amarulasolutions.com>
Date: Sun,  5 Jul 2020 01:46:44 +0530
Subject: [Buildroot] [PATCH v3 1/2] configs/rock_pi_n10: new defconfig
In-Reply-To: <1593893805-8430-1-git-send-email-sunil@amarulasolutions.com>
References: <1593893805-8430-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1593893805-8430-2-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for RK3399PRO SOM based rockpi-n10 target
with below features:

	- Custom U-Boot 2020.07-rc4
	  https://github.com/amarula/u-boot-amarula.git
	  branch rock-pi
	- Linux 5.7.2
	- GPT partition layout is being used
	- Default packages from buildroot

Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
---
Changes for v3:
- updated readme for rockpi_n10

Changes for v2:
- renamed defconfig from rockpi_n10 to rock_pi_n10
- updated gitlab-ci.yml
- updated DEVELOPERS
- updated readme
- updated extlinux.conf
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/radxa/rockpi-n10/extlinux.conf |  4 +++
 board/radxa/rockpi-n10/genimage.cfg  | 39 +++++++++++++++++++++++
 board/radxa/rockpi-n10/post-build.sh |  5 +++
 board/radxa/rockpi-n10/readme.txt    | 61 ++++++++++++++++++++++++++++++++++++
 configs/rock_pi_n10_defconfig        | 57 +++++++++++++++++++++++++++++++++
 7 files changed, 169 insertions(+)
 create mode 100644 board/radxa/rockpi-n10/extlinux.conf
 create mode 100644 board/radxa/rockpi-n10/genimage.cfg
 create mode 100755 board/radxa/rockpi-n10/post-build.sh
 create mode 100644 board/radxa/rockpi-n10/readme.txt
 create mode 100644 configs/rock_pi_n10_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 626d1e0..e271770 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -323,6 +323,7 @@ riotboard_defconfig: { extends: .defconfig }
 roc_pc_rk3399_defconfig: { extends: .defconfig }
 rock64_defconfig: { extends: .defconfig }
 rockpro64_defconfig: { extends: .defconfig }
+rock_pi_n10_defconfig: { extends: .defconfig }
 roseapplepi_defconfig: { extends: .defconfig }
 s6lx9_microboard_defconfig: { extends: .defconfig }
 sheevaplug_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 742a1f6..05e435d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2403,11 +2403,13 @@ F:	board/firefly/
 F:	board/friendlyarm/nanopc-t4
 F:	board/friendlyarm/nanopi-m4
 F:	board/orangepi/orangepi-rk3399
+F:	board/radxa/rockpi-n10
 F:	board/pine64/rockpro64
 F: 	configs/nanopc_t4_defconfig
 F: 	configs/nanopi_m4_defconfig
 F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
+F:	configs/rock_pi_n10_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-a-toolchain/
 
diff --git a/board/radxa/rockpi-n10/extlinux.conf b/board/radxa/rockpi-n10/extlinux.conf
new file mode 100644
index 0000000..b6a4c97
--- /dev/null
+++ b/board/radxa/rockpi-n10/extlinux.conf
@@ -0,0 +1,4 @@
+label RK3399_ROCK_PI_N10 linux
+  kernel /Image
+  devicetree /rk3399pro-rock-pi-n10.dtb
+  append earlycon=uart8250,mmio32,0xff1a0000 root=/dev/mmcblk0p4 rw rootwait
diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
new file mode 100644
index 0000000..8fbf562
--- /dev/null
+++ b/board/radxa/rockpi-n10/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"rk3399pro-rock-pi-n10.dtb",
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
diff --git a/board/radxa/rockpi-n10/post-build.sh b/board/radxa/rockpi-n10/post-build.sh
new file mode 100755
index 0000000..ba29375
--- /dev/null
+++ b/board/radxa/rockpi-n10/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/radxa/rockpi-n10/readme.txt b/board/radxa/rockpi-n10/readme.txt
new file mode 100644
index 0000000..49decbb
--- /dev/null
+++ b/board/radxa/rockpi-n10/readme.txt
@@ -0,0 +1,61 @@
+RADXA ROCKPI-N10
+================
+https://wiki.radxa.com/RockpiN10
+
+Build:
+======
+  $ make rock_pi_n10_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+.
+????????? bl31.elf
+????????? boot.vfat
+????????? extlinux
+????????? idbloader.img
+????????? Image
+????????? rk3399pro-rock-pi-n10.dtb
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
+
+Serial console:
+---------------
+RockPi-N10 has a 40-pin GPIO header. The pin layout is as follows:
+
+pin 6:  gnd
+pin 8:  tx
+pin 10: rx
+
+Baudrate for this board is 1500000.
+
+The boot order on rockpi-n10 is emmc, sd. If emmc contains a valid Image, the board
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
+https://wiki.amarulasolutions.com/bsp/rockchip/rk3399pro/rock-pi-n10.html
diff --git a/configs/rock_pi_n10_defconfig b/configs/rock_pi_n10_defconfig
new file mode 100644
index 0000000..96b14bb
--- /dev/null
+++ b/configs/rock_pi_n10_defconfig
@@ -0,0 +1,57 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+
+# Linux headers same as kernel, a 5.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
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
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cf2747360fdd1eb0d51dd01a984c7c62c7f714fe"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-n10-rk3399pro"
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.2"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399pro-rock-pi-n10"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_HOSTNAME="rockpi-n10"
+BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPI-N10..!!"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="160M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rockpi-n10/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rockpi-n10/post-build.sh"
-- 
2.7.4
