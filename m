From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Jun 2018 19:20:17 +0300
Subject: [Buildroot] [PATCH] clearfog: bump kernel and bootloader
Message-ID: <1bec88e7569685006a9476d3698fcea0d2f8bf85.1529943617.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the kernel version to 4.17.2.

Update U-Boot version to 2018.05.

Migrate to U-Boot generic distro configuration which is easier than the
hand written boot script.

Improve the 'dd' command example in readme.txt.

Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/solidrun/clearfog/boot.scr.txt  |  5 -----
 board/solidrun/clearfog/extlinux.conf |  4 ++++
 board/solidrun/clearfog/post-build.sh |  4 +++-
 board/solidrun/clearfog/readme.txt    |  2 +-
 configs/solidrun_clearfog_defconfig   | 10 ++++------
 5 files changed, 12 insertions(+), 13 deletions(-)
 delete mode 100644 board/solidrun/clearfog/boot.scr.txt
 create mode 100644 board/solidrun/clearfog/extlinux.conf

diff --git a/board/solidrun/clearfog/boot.scr.txt b/board/solidrun/clearfog/boot.scr.txt
deleted file mode 100644
index a2332e39606c..000000000000
--- a/board/solidrun/clearfog/boot.scr.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv fdtfile armada-388-clearfog-base.dtb
-setenv bootargs root=/dev/mmcblk0p1
-load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr_r} ${prefix}/${fdtfile}
-load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} ${prefix}/zImage
-bootz ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/solidrun/clearfog/extlinux.conf b/board/solidrun/clearfog/extlinux.conf
new file mode 100644
index 000000000000..f35974e3efa3
--- /dev/null
+++ b/board/solidrun/clearfog/extlinux.conf
@@ -0,0 +1,4 @@
+label Clearfog Linux
+  kernel /boot/zImage
+  devicetree /boot/armada-388-clearfog-base.dtb
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/solidrun/clearfog/post-build.sh b/board/solidrun/clearfog/post-build.sh
index ff22ebd6e5fb..1f5ff6a6113d 100755
--- a/board/solidrun/clearfog/post-build.sh
+++ b/board/solidrun/clearfog/post-build.sh
@@ -1,3 +1,5 @@
 #!/bin/sh
 
-install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/solidrun/clearfog/readme.txt b/board/solidrun/clearfog/readme.txt
index b56f0a9b49ed..6046836f01a0 100644
--- a/board/solidrun/clearfog/readme.txt
+++ b/board/solidrun/clearfog/readme.txt
@@ -47,7 +47,7 @@ Buildroot prepares a bootable "sdcard.img" image in the output/images/
 directory, ready to be dumped on a microSD card. Launch the following
 command as root:
 
-  dd if=./output/images/sdcard.img of=/dev/<your-microsd-device>
+  dd if=output/images/sdcard.img of=/dev/<your-microsd-device> conv=fdatasync
 
 *** WARNING! The script will destroy all the card content. Use with care! ***
 
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 7c426e5ad990..8c6cb83a59f4 100644
--- a/configs/solidrun_clearfog_defconfig
+++ b/configs/solidrun_clearfog_defconfig
@@ -5,8 +5,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_NEON=y
 
-# Linux headers same as kernel, a 4.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
 
 # System configuration
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/clearfog/post-build.sh"
@@ -16,7 +16,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/clearfog/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v7"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/clearfog/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -33,12 +33,10 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="clearfog"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-spl.kwb"
-BR2_TARGET_UBOOT_BOOT_SCRIPT=y
-BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/solidrun/clearfog/boot.scr.txt"
-- 
2.18.0
