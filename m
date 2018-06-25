From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 21:14:15 +0200
Subject: [Buildroot] [git commit] configs/solidrun_clearfog: bump kernel and
 bootloader
Message-ID: <20180625191138.CF05C8219B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9d47b20b55268e8f9897dd2f40325f6c907b2da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the kernel version to 4.17.2.

Update U-Boot version to 2018.05.

Migrate to U-Boot generic distro configuration which is easier than the
hand written boot script.

Improve the 'dd' command example in readme.txt.

Cc: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/solidrun/clearfog/boot.scr.txt  |  5 -----
 board/solidrun/clearfog/extlinux.conf |  4 ++++
 board/solidrun/clearfog/post-build.sh |  4 +++-
 board/solidrun/clearfog/readme.txt    |  2 +-
 configs/solidrun_clearfog_defconfig   | 10 ++++------
 5 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/board/solidrun/clearfog/boot.scr.txt b/board/solidrun/clearfog/boot.scr.txt
deleted file mode 100644
index a2332e3960..0000000000
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
index 0000000000..f35974e3ef
--- /dev/null
+++ b/board/solidrun/clearfog/extlinux.conf
@@ -0,0 +1,4 @@
+label Clearfog Linux
+  kernel /boot/zImage
+  devicetree /boot/armada-388-clearfog-base.dtb
+  append console=ttyS0,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/solidrun/clearfog/post-build.sh b/board/solidrun/clearfog/post-build.sh
index ff22ebd6e5..1f5ff6a611 100755
--- a/board/solidrun/clearfog/post-build.sh
+++ b/board/solidrun/clearfog/post-build.sh
@@ -1,3 +1,5 @@
 #!/bin/sh
 
-install -m 0644 -D $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/solidrun/clearfog/readme.txt b/board/solidrun/clearfog/readme.txt
index b56f0a9b49..6046836f01 100644
--- a/board/solidrun/clearfog/readme.txt
+++ b/board/solidrun/clearfog/readme.txt
@@ -47,7 +47,7 @@ Buildroot prepares a bootable "sdcard.img" image in the output/images/
 directory, ready to be dumped on a microSD card. Launch the following
 command as root:
 
-  dd if=./output/images/sdcard.img of=/dev/<your-microsd-device>
+  dd if=output/images/sdcard.img of=/dev/<your-microsd-device> conv=fdatasync
 
 *** WARNING! The script will destroy all the card content. Use with care! ***
 
diff --git a/configs/solidrun_clearfog_defconfig b/configs/solidrun_clearfog_defconfig
index 7c426e5ad9..8c6cb83a59 100644
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
