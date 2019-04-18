From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Thu, 18 Apr 2019 21:08:11 +0530
Subject: [Buildroot] [PATCH] configs/oceanic_5205_5inmfd: Add Oceanic 5205
 5inMFD board support
Message-ID: <20190418153811.27299-1-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This board is from sunx50i A64 SOC family.
This initial support has following features:
    - Mainline U-Boot
    - Linux 5.0
    - Default packages from buildroot

Tested-by: Tamas Papp <tamas@osukl.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
---
 .gitlab-ci.yml                         |  1 +
 DEVELOPERS                             |  2 ++
 board/oceanic/5205-5inmfd/boot.cmd     |  6 ++++
 board/oceanic/5205-5inmfd/genimage.cfg | 39 ++++++++++++++++++++++++++
 board/oceanic/5205-5inmfd/readme.txt   | 35 ++++++++++++++++++++++++
 configs/oceanic_5205_5inmfd_defconfig  | 50 ++++++++++++++++++++++++++++++++++
 6 files changed, 133 insertions(+)
 create mode 100644 board/oceanic/5205-5inmfd/boot.cmd
 create mode 100644 board/oceanic/5205-5inmfd/genimage.cfg
 create mode 100644 board/oceanic/5205-5inmfd/readme.txt
 create mode 100644 configs/oceanic_5205_5inmfd_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef16b73bfb..02d6f6c0cc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -181,6 +181,7 @@ nitrogen6sx_defconfig: { extends: .defconfig }
 nitrogen6x_defconfig: { extends: .defconfig }
 nitrogen7_defconfig: { extends: .defconfig }
 nitrogen8m_defconfig: { extends: .defconfig }
+oceanic_5205_5inmfd_defconfig: { extends: .defconfig }
 odroidc2_defconfig: { extends: .defconfig }
 odroidxu4_defconfig: { extends: .defconfig }
 olimex_a10_olinuxino_lime_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index 3e0ac08e11..f23479703b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1000,6 +1000,7 @@ F:	board/bananapi/
 F:	board/engicam/
 F:	board/friendlyarm/nanopi-a64/
 F:	board/friendlyarm/nanopi-neo2/
+F:	board/oceanic/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-lite2/
 F:	board/orangepi/orangepi-one-plus
@@ -1020,6 +1021,7 @@ F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
 F:	configs/friendlyarm_nanopi_a64_defconfig
 F:	configs/friendlyarm_nanopi_neo2_defconfig
+F:	configs/oceanic_5205_5inmfd_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_lite2_defconfig
 F:	configs/orangepi_one_plus_defconfig
diff --git a/board/oceanic/5205-5inmfd/boot.cmd b/board/oceanic/5205-5inmfd/boot.cmd
new file mode 100644
index 0000000000..b9c5f0e829
--- /dev/null
+++ b/board/oceanic/5205-5inmfd/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-a64-oceanic-5205-5inmfd.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/oceanic/5205-5inmfd/genimage.cfg b/board/oceanic/5205-5inmfd/genimage.cfg
new file mode 100644
index 0000000000..047fa488a3
--- /dev/null
+++ b/board/oceanic/5205-5inmfd/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-a64-oceanic-5205-5inmfd.dtb",
+			"boot.scr"
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
diff --git a/board/oceanic/5205-5inmfd/readme.txt b/board/oceanic/5205-5inmfd/readme.txt
new file mode 100644
index 0000000000..d9cd08c9d8
--- /dev/null
+++ b/board/oceanic/5205-5inmfd/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the SoPine. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/SoPine
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make pine64_sopine_defconfig
+
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
+Insert the micro SDcard in your SoPine and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
new file mode 100644
index 0000000000..cd43677862
--- /dev/null
+++ b/configs/oceanic_5205_5inmfd_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 5.0 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
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
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1692c73ccb39fb790d7ba1a43ca2f14a0f9f1f32"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="oceanic_5205_5inmfd"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/oceanic/5205-5inmfd/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/amarula/linux-amarula"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="504a49ae70efd2ef936f6850dcdd71a250c4cb54"
+BR2_LINUX_KERNEL_VERSION="504a49ae70efd2ef936f6850dcdd71a250c4cb54"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-oceanic-5205-5inmfd"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Oceanic 5205 5inMFD"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/oceanic/5205-5inmfd/genimage.cfg"
-- 
2.11.0
