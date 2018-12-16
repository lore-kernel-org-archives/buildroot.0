From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 15:56:17 +0100
Subject: [Buildroot] [git commit] configs/orangepi_lite2: new defconfig
Message-ID: <20181216145417.A63A78B670@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=753052090ffb03c0a34d9a79ec4652d8914e58b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for Orangepi Lite2 board with below features:

- U-Boot 2018.09
- Linux 4.19.0-rc8
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                              |  1 +
 DEVELOPERS                                  |  2 ++
 board/orangepi/orangepi-lite2/extlinux.conf |  4 +++
 board/orangepi/orangepi-lite2/genimage.cfg  | 33 ++++++++++++++++++++
 board/orangepi/orangepi-lite2/post-build.sh |  4 +++
 board/orangepi/orangepi-lite2/readme.txt    | 35 +++++++++++++++++++++
 configs/orangepi_lite2_defconfig            | 47 +++++++++++++++++++++++++++++
 7 files changed, 126 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index cb44dcc60b..d3ac5026da 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -190,6 +190,7 @@ olimex_a64_olinuxino_defconfig: *defconfig
 olimex_imx233_olinuxino_defconfig: *defconfig
 openblocks_a6_defconfig: *defconfig
 orangepi_lite_defconfig: *defconfig
+orangepi_lite2_defconfig: *defconfig
 orangepi_one_defconfig: *defconfig
 orangepi_one_plus_defconfig: *defconfig
 orangepi_pc2_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index eda93ecab3..59b549e0f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -970,6 +970,7 @@ F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
+F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
 F:	board/orangepi/orangepi-pc2/
 F:	board/orangepi/orangepi-prime/
@@ -989,6 +990,7 @@ F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
+F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
 F:	configs/orangepi_pc2_defconfig
 F:	configs/orangepi_prime_defconfig
diff --git a/board/orangepi/orangepi-lite2/extlinux.conf b/board/orangepi/orangepi-lite2/extlinux.conf
new file mode 100644
index 0000000000..1966186a20
--- /dev/null
+++ b/board/orangepi/orangepi-lite2/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /sun50i-h6-orangepi-lite2.dtb
+  append console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/orangepi/orangepi-lite2/genimage.cfg b/board/orangepi/orangepi-lite2/genimage.cfg
new file mode 100644
index 0000000000..97251b483f
--- /dev/null
+++ b/board/orangepi/orangepi-lite2/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h6-orangepi-lite2.dtb",
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
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8192
+		size = 1040384 # 1MB - 8192
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
diff --git a/board/orangepi/orangepi-lite2/post-build.sh b/board/orangepi/orangepi-lite2/post-build.sh
new file mode 100755
index 0000000000..ec20fca7d9
--- /dev/null
+++ b/board/orangepi/orangepi-lite2/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/extlinux/extlinux.conf
diff --git a/board/orangepi/orangepi-lite2/readme.txt b/board/orangepi/orangepi-lite2/readme.txt
new file mode 100644
index 0000000000..abca9da6da
--- /dev/null
+++ b/board/orangepi/orangepi-lite2/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi Lite2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi Lite2 link:
+http://www.orangepi.org/Orange%20Pi%20Lite%202/
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Lite2
+
+How to build
+============
+
+    $ make orangepi_lite2_defconfig
+    $ make
+
+Note: you will need access to the internet to download the required
+sources.
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Orangepi Lite2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
new file mode 100644
index 0000000000..29e648c9b0
--- /dev/null
+++ b/configs/orangepi_lite2_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.18 series
+BR2_KERNEL_HEADERS_4_18=y
+
+# Firmware
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_h6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="h6-v1.0a"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,amarula,linux-amarula,h6-v1.0b)/linux-amarula_h6-v1.0b.tar.gz"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h6-orangepi-lite2"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Lite2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-lite2/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-lite2/post-build.sh"
