From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 18:56:19 +0100
Subject: [Buildroot] [git commit] board: Add Orangepi Zero Plus2 support
Message-ID: <20171220175918.98577835B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc21f8957d91e6e4204c636b9cd1b6ba6d1dcb99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for Orangepi Zero Plus2
board with below features:
- U-Boot 2017.11
- Linux 4.14
- Default packages from buildroot

Cc: zhaoyifan <zhao_steven@263.net>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  2 +
 board/orangepi/orangepi-zero-plus2/boot.cmd        |  6 +++
 board/orangepi/orangepi-zero-plus2/genimage.cfg    | 39 +++++++++++++++++
 ...ts-orange-pi-zero-plus2-fix-sdcard-detect.patch | 30 +++++++++++++
 board/orangepi/orangepi-zero-plus2/readme.txt      | 37 ++++++++++++++++
 configs/orangepi_zero_plus2_defconfig              | 50 ++++++++++++++++++++++
 7 files changed, 165 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6595e21..d442c0c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -172,6 +172,7 @@ orangepi_plus_defconfig: *defconfig
 orangepi_prime_defconfig: *defconfig
 orangepi_win_defconfig: *defconfig
 orangepi_zero_defconfig: *defconfig
+orangepi_zero_plus2_defconfig: *defconfig
 pandaboard_defconfig: *defconfig
 pc_x86_64_bios_defconfig: *defconfig
 pc_x86_64_efi_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 4351c3b..936f797 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -777,6 +777,7 @@ F:	board/friendlyarm/nanopi-neo2/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-prime/
 F:	board/orangepi/orangepi-win/
+F:	board/orangepi/orangepi-zero-plus2/
 F:	board/pine64/
 F:	configs/bananapi_m1_defconfig
 F:	configs/bananapi_m64_defconfig
@@ -785,6 +786,7 @@ F:	configs/friendlyarm_nanopi_neo2_defconfig
 F:	configs/olimex_a64_olinuxino_defconfig
 F:	configs/orangepi_prime_defconfig
 F:	configs/orangepi_win_defconfig
+F:	configs/orangepi_zero_plus2_defconfig
 F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 F:	configs/engicam_imx6qdl_icore_defconfig
diff --git a/board/orangepi/orangepi-zero-plus2/boot.cmd b/board/orangepi/orangepi-zero-plus2/boot.cmd
new file mode 100644
index 0000000..4772a9b
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r sun50i-h5-orangepi-zero-plus2.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
new file mode 100644
index 0000000..8091eda
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -0,0 +1,39 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"sun50i-h5-orangepi-zero-plus2.dtb",
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
diff --git a/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch b/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch
new file mode 100644
index 0000000..2034029
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/patches/linux/linux-0001-arm64-dts-orange-pi-zero-plus2-fix-sdcard-detect.patch
@@ -0,0 +1,30 @@
+From f88e9301948173dd35afad4a6939092c7f269aed Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Fri, 3 Nov 2017 22:58:54 +0300
+Subject: [PATCH] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
+
+The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
+Fix cd-gpio description to enable sdcard detect.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+---
+ arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+index b6b7a56..a42fd79 100644
+--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
++++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+@@ -71,7 +71,7 @@
+ 	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin>;
+ 	vmmc-supply = <&reg_vcc3v3>;
+ 	bus-width = <4>;
+-	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
++	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
+ 	status = "okay";
+ };
+ 
+-- 
+1.9.1
+
diff --git a/board/orangepi/orangepi-zero-plus2/readme.txt b/board/orangepi/orangepi-zero-plus2/readme.txt
new file mode 100644
index 0000000..322ba0e
--- /dev/null
+++ b/board/orangepi/orangepi-zero-plus2/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Orangepi Zero Plus2. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Orangepi Zero Plus2 link:
+http://www.orangepi.org/OrangePiZeroPlus2/
+
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Zero+Plus2
+
+This configuration uses U-Boot mainline and kernel mainline.
+
+How to build
+============
+
+    $ make orangepi_zero_plus2_defconfig
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
+Insert the micro SDcard in your Orangepi Zero Plus2 and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
new file mode 100644
index 0000000..5b1ff35
--- /dev/null
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.14 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+
+# Patch dir
+BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero-plus2/patches"
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-zero-plus2/genimage.cfg"
