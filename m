From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Sun,  1 Jul 2018 19:30:25 +0530
Subject: [Buildroot] [PATCH v4 1/2] board: amarula: Add A64-Relic support
Message-ID: <20180701140026.2261-1-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add initial support for Amarula A64-Relic board
with below features:
- U-Boot 2018.07-rc1
- Linux 4.17.0-rc6
- Default packages from buildroot

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- remove sdcard.img image creation
- on readme 'cd output/images' not output/images
- add 'sudo' for fastboot commands on readme.txt 
Changes for v3:
- Use 4.17 kernel headers
- Add wiki link
- Add BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
- Update comments on readme.txt suggested by Thomas
Changes for v2:
- Use mainline U-Boot
- Drop uboot.fragment since the UMS used for developement,
  so note it on readme.txt how to use.
- format the 'Write eMMC' steps suggested by Arnout.
- fix fastboot steps in readme.txt
- add offset in genimage.cfg for boot partition instead of size

 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  1 +
 board/amarula/a64-relic/extlinux.conf |  4 ++
 board/amarula/a64-relic/genimage.cfg  | 10 ++++
 board/amarula/a64-relic/post-build.sh |  4 ++
 board/amarula/a64-relic/readme.txt    | 80 +++++++++++++++++++++++++++
 configs/amarula_a64_relic_defconfig   | 47 ++++++++++++++++
 7 files changed, 147 insertions(+)
 create mode 100644 board/amarula/a64-relic/extlinux.conf
 create mode 100644 board/amarula/a64-relic/genimage.cfg
 create mode 100755 board/amarula/a64-relic/post-build.sh
 create mode 100644 board/amarula/a64-relic/readme.txt
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
index c52a57c507..26f0012ad0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -895,6 +895,7 @@ F:	board/amarula/
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
index 0000000000..002b6bb4d1
--- /dev/null
+++ b/board/amarula/a64-relic/genimage.cfg
@@ -0,0 +1,10 @@
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
index 0000000000..55171b2408
--- /dev/null
+++ b/board/amarula/a64-relic/readme.txt
@@ -0,0 +1,80 @@
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
+Wiki link:
+https://openedev.amarulasolutions.com/display/ODWIKI/Amarual+A64-Relic
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
+  - rootfs.ext4
+
+Write eMMC
+=========
+
+The board comes with an operating system preloaded on the eMMC.
+To replace it with the Buildroot-built system, take the following
+steps
+
+1. Connect the board UART with host and open minicom(ttyUSBx/115200N8)
+
+2. Supply 12V DC for power-on the board.
+
+3. Interrupt U-Boot by pressing enter
+
+4. Create GPT partitions
+  => mmc dev 1
+  => gpt write mmc 1 $partitions
+
+5. Connect the board USB-OTG with USB slot on the host.
+
+6. Initiate fastboot
+  => fastboot 0
+
+7. Write images from host onto eMMC using fastboot
+
+  $ cd output/images
+  $ sudo fastboot -i 0x1f3a flash loader1 sunxi-spl.bin
+  $ sudo fastboot -i 0x1f3a flash loader2 u-boot.itb
+  $ sudo fastboot -i 0x1f3a flash esp boot.vfat
+  $ sudo fastboot -i 0x1f3a flash system rootfs.ext4
+
+Update eMMC during Development
+==============================
+
+During development, reflashing the entire filesystem image at every
+change is time consuming. A useful alternative is to directly access
+over USB the filesystem stored on the eMMC, using the USB Mass Storage
+capability of U-Boot. To achieve this:
+
+1. Build U-Boot with CONFIG_CMD_USB_MASS_STORAGE=y
+
+2. Follow all 6 steps from 'Write eMMC' and mount eMMC on host
+    => mmc dev 1
+    => ums 0 mmc 1
+
+--
+Jagan Teki <jagan@amarulasolutions.com>
+29-Jun-2018
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
new file mode 100644
index 0000000000..846275eadb
--- /dev/null
+++ b/configs/amarula_a64_relic_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
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
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="amarula_a64_relic"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
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
+BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/a64-relic/genimage.cfg"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/a64-relic/post-build.sh"
-- 
2.17.1
