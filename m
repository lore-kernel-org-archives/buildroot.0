From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 28 May 2018 22:42:26 +0530
Subject: [Buildroot] [PATCH 1/2] board: amarula: Add A64-Relic support
Message-ID: <20180528171227.8352-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for Amarula A64-Relic board
with below features:
- U-Boot 2018.05
- Linux 4.17.0-rc6
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  1 +
 board/amarula/a64-relic/extlinux.conf  |  4 +++
 board/amarula/a64-relic/genimage.cfg   | 39 ++++++++++++++++++++++
 board/amarula/a64-relic/post-build.sh  |  4 +++
 board/amarula/a64-relic/readme.txt     | 60 ++++++++++++++++++++++++++++++++++
 board/amarula/a64-relic/uboot.fragment |  3 ++
 configs/amarula_a64_relic_defconfig    | 47 ++++++++++++++++++++++++++
 8 files changed, 159 insertions(+)
 create mode 100644 board/amarula/a64-relic/extlinux.conf
 create mode 100644 board/amarula/a64-relic/genimage.cfg
 create mode 100755 board/amarula/a64-relic/post-build.sh
 create mode 100644 board/amarula/a64-relic/readme.txt
 create mode 100644 board/amarula/a64-relic/uboot.fragment
 create mode 100644 configs/amarula_a64_relic_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e80491cdde..9663105462 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -79,6 +79,7 @@ acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
 acmesystems_arietta_g25_256mb_defconfig: *defconfig
+amarula_a64_relic_defconfig: *defconfig
 amarula_vyasa_rk3288_defconfig: *defconfig
 arcturus_ucls1012a_defconfig: *defconfig
 arcturus_ucp1020_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index f24ef2752e..1a893bda9d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -863,6 +863,7 @@ F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
 F:	board/engicam/
+F:	configs/amarula_a64_relic_defconfig
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	board/friendlyarm/nanopi-a64/
diff --git a/board/amarula/a64-relic/extlinux.conf b/board/amarula/a64-relic/extlinux.conf
new file mode 100644
index 0000000000..9f469846bc
--- /dev/null
+++ b/board/amarula/a64-relic/extlinux.conf
@@ -0,0 +1,4 @@
+label linux-4.17.0-rc3
+  kernel /Image
+  devicetree /sun50i-a64-amarula-relic.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk1p4 rootwait
diff --git a/board/amarula/a64-relic/genimage.cfg b/board/amarula/a64-relic/genimage.cfg
new file mode 100644
index 0000000000..259c269e54
--- /dev/null
+++ b/board/amarula/a64-relic/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-amarula-relic.dtb",
+			"extlinux"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "sunxi-spl.bin"
+		offset = 8192
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 40K
+		size = 1M # 1MB - 40K
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/amarula/a64-relic/post-build.sh b/board/amarula/a64-relic/post-build.sh
new file mode 100755
index 0000000000..ec20fca7d9
--- /dev/null
+++ b/board/amarula/a64-relic/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/amarula/a64-relic/readme.txt b/board/amarula/a64-relic/readme.txt
new file mode 100644
index 0000000000..534ed32e7b
--- /dev/null
+++ b/board/amarula/a64-relic/readme.txt
@@ -0,0 +1,60 @@
+Amarula A64 Relic
+================
+
+Amarula A64-Relic is A64 based IoT device, which support
+- Allwinner A64 Cortex-A53
+- Mali-400MP2 GPU
+- AXP803 PMIC
+- 1GB DDR3 RAM
+- 8GB eMMC
+- AP6330 Wifi/BLE
+- MIPI-DSI
+- CSI: OV5640 sensor
+- USB OTG
+- 12V DC power supply
+
+Build
+=====
+
+  $ make amarula_a64_relic_defconfig
+
+  $ make
+
+build files at output/images/:
+  - sunxi-spl.bin
+  - u-boot.itb
+  - Image
+  - sun50i-a64-amarula-relic.dtb
+  - boot.vfat
+  - rootfs.ext2
+  - sdcard.img
+
+Write eMMC
+=========
+
+Open minicom with ttyUSBx with 115200N8 and power-on board.
+
+Stay in U-Boot and write images on eMMC
+
+DOS:
+
+  => mmc dev 1
+  => ums 0 mmc 1
+
+  host
+  $ dd if=sdcard.img of=/dev/sdx
+  $ sync
+
+GPT:
+
+  => mmc dev 1
+  => gpt write mmc 1 $partitions
+  => fastboot 0
+
+  host
+  $ fastboot -i 0x1f3a flash loader1 spl/sunxi-spl.bin
+  $ fastboot -i 0x1f3a flash loader2 u-boot.itb
+  $ fastboot -i 0x1f3a flash esp boot.vfat
+  $ fastboot -i 0x1f3a flash system rootfs.ext2
+
+Enjoy!
diff --git a/board/amarula/a64-relic/uboot.fragment b/board/amarula/a64-relic/uboot.fragment
new file mode 100644
index 0000000000..7b204598bc
--- /dev/null
+++ b/board/amarula/a64-relic/uboot.fragment
@@ -0,0 +1,3 @@
+# A64-Relic need few user-defined configs enable on top of
+# uboot mainline default defconfig
+CONFIG_CMD_USB_MASS_STORAGE=y
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
new file mode 100644
index 0000000000..07f1a72363
--- /dev/null
+++ b/configs/amarula_a64_relic_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.16 series
+BR2_KERNEL_HEADERS_4_16=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,amarula,u-boot-amarula,a64-relic)/u-boot-amarula_a64-relic.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amarula_a64_relic"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/amarula/a64-relic/uboot.fragment"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,amarula,linux-amarula,a64-relic)/linux-amarula_a64-relic.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-amarula-relic"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Amarula A64-Relic"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/a64-relic/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/a64-relic/post-build.sh"
-- 
2.14.3
