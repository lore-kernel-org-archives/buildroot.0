From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:10:36 +0200
Subject: [Buildroot] [git commit] configs/bananapi_m2_ultra: new defconfig
Message-ID: <20181014080947.490A983692@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0f0b540136ef37030dde0a9d0740beeea5daa05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add intial support for Bananapi M2 Ultra board based on the Allwinner
R40 SoC.

- U-Boot 2018.07
- Linux 4.18.12

Board specifications: http://www.banana-pi.org/m2u.html

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                |  1 +
 board/bananapi/bananapi-m2-ultra/boot.cmd     |  7 ++++++
 board/bananapi/bananapi-m2-ultra/genimage.cfg | 33 +++++++++++++++++++++++++
 board/bananapi/bananapi-m2-ultra/readme.txt   | 35 +++++++++++++++++++++++++++
 configs/bananapi_m2_ultra_defconfig           | 28 +++++++++++++++++++++
 5 files changed, 104 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4b8fee5f23..769583b6b9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -109,6 +109,7 @@ atmel_sama5d4_xplained_mmc_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
 bananapi_m1_defconfig: *defconfig
 bananapi_m2_plus_defconfig: *defconfig
+bananapi_m2_ultra_defconfig: *defconfig
 bananapi_m64_defconfig: *defconfig
 bananapro_defconfig: *defconfig
 beagleboardx15_defconfig: *defconfig
diff --git a/board/bananapi/bananapi-m2-ultra/boot.cmd b/board/bananapi/bananapi-m2-ultra/boot.cmd
new file mode 100644
index 0000000000..9c24eabff6
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/boot.cmd
@@ -0,0 +1,7 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+mmc dev 0
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun8i-r40-bananapi-m2-ultra.dtb
+
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/bananapi/bananapi-m2-ultra/genimage.cfg b/board/bananapi/bananapi-m2-ultra/genimage.cfg
new file mode 100644
index 0000000000..675253af23
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun8i-r40-bananapi-m2-ultra.dtb",
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
diff --git a/board/bananapi/bananapi-m2-ultra/readme.txt b/board/bananapi/bananapi-m2-ultra/readme.txt
new file mode 100644
index 0000000000..c3de84f5b8
--- /dev/null
+++ b/board/bananapi/bananapi-m2-ultra/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Bananapi M2 ULtra. With the current
+configuration it will bring-up the board, and allow access through the
+serial console.
+
+Bananapi M2 Ultra link:
+http://www.banana-pi.org/m2u.html
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make bananapi_m2_ultra_defconfig
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
+Insert the micro SDcard in your Bananapi M2 Ultra and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
new file mode 100644
index 0000000000..5dd3edd664
--- /dev/null
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.12"
+BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
