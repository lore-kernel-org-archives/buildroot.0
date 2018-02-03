From: Pierre CROKAERT <pct@crookies.net>
Date: Sat,  3 Feb 2018 12:02:02 +0100
Subject: [Buildroot] [PATCH 1/1] Odroid XU4: Hardkernel new board support
Message-ID: <1517655722-20132-1-git-send-email-pct@crookies.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides support for the board Odroid XU4
This version is using the latest 4.9 kernel released by Hardkernel,
and the current u-boot 2017.05 also from Hardkernel.
The support was implemented based on comments about Andi's patch (https://patchwork.ozlabs.org/patch/640695/).

Signed-off-by: Pierre CROKAERT <pct@crookies.net>
---
 board/hardkernel/odroidxu4/boot.cmd                | 10 +++
 board/hardkernel/odroidxu4/boot.ini                |  5 ++
 board/hardkernel/odroidxu4/genimage.cfg            | 28 ++++++++
 .../odroidxu4/genimage_bootloader_fragment.cfg     | 29 +++++++++
 board/hardkernel/odroidxu4/post-image.sh           | 50 ++++++++++++++
 board/hardkernel/odroidxu4/readme.txt              | 76 ++++++++++++++++++++++
 configs/odroidxu4_defconfig                        | 28 ++++++++
 7 files changed, 226 insertions(+)
 create mode 100644 board/hardkernel/odroidxu4/boot.cmd
 create mode 100644 board/hardkernel/odroidxu4/boot.ini
 create mode 100644 board/hardkernel/odroidxu4/genimage.cfg
 create mode 100644 board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
 create mode 100755 board/hardkernel/odroidxu4/post-image.sh
 create mode 100644 board/hardkernel/odroidxu4/readme.txt
 create mode 100644 configs/odroidxu4_defconfig

diff --git a/board/hardkernel/odroidxu4/boot.cmd b/board/hardkernel/odroidxu4/boot.cmd
new file mode 100644
index 0000000..2fb4c16
--- /dev/null
+++ b/board/hardkernel/odroidxu4/boot.cmd
@@ -0,0 +1,10 @@
+setenv kernelname zImage;
+setenv boot_kernel "setenv bootargs \"${console} root=/dev/mmcblk${mmcrootdev}p${mmcrootpart} rootfstype=${rootfstype} rootwait ${opts}\";
+load mmc ${mmcbootdev}:${mmcbootpart} 0x40007FC0 '${kernelname}';
+if load mmc ${mmcbootdev}:${mmcbootpart} 40800000 ${fdtfile}; then
+	bootz 0x40007FC0 - 40800000;
+else
+	echo Warning! Booting without DTB: '${fdtfile}'!;
+	bootz 0x40007FC0 -;
+fi;"
+run boot_kernel;
\ No newline at end of file
diff --git a/board/hardkernel/odroidxu4/boot.ini b/board/hardkernel/odroidxu4/boot.ini
new file mode 100644
index 0000000..8a83a1a
--- /dev/null
+++ b/board/hardkernel/odroidxu4/boot.ini
@@ -0,0 +1,5 @@
+ODROIDXU-UBOOT-CONFIG
+ 
+load mmc 0:1 0x44000000 'boot.scr'
+source 0x44000000
+
diff --git a/board/hardkernel/odroidxu4/genimage.cfg b/board/hardkernel/odroidxu4/genimage.cfg
new file mode 100644
index 0000000..13d71cc
--- /dev/null
+++ b/board/hardkernel/odroidxu4/genimage.cfg
@@ -0,0 +1,28 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"boot.ini",
+			"boot.scr",
+			"zImage",
+			"exynos5422-odroidxu4.dtb"
+		}
+	}
+	size = 129M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition vfat {
+		partition-type = 0xC
+		image = "boot.vfat"
+		offset = 2097152
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 1024M
+	}
+}
diff --git a/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg b/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
new file mode 100644
index 0000000..a8e8379
--- /dev/null
+++ b/board/hardkernel/odroidxu4/genimage_bootloader_fragment.cfg
@@ -0,0 +1,29 @@
+	partition bl1 {
+		in-partition-table = "no"
+		image = "bl1.bin.hardkernel"
+		offset = 512
+		size = 15358
+	}
+
+	partition bl2 {
+		in-partition-table = "no"
+		image = "bl2.bin.hardkernel.720k_uboot"
+		offset = 15872
+		size = 16384
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-dtb.bin"
+		offset = 32256
+		size = 720k
+	}
+
+	partition tzsw {
+		in-partition-table = "no"
+		image = "tzsw.bin.hardkernel"
+		offset = 769536
+		size = 256k
+	}
+
+
diff --git a/board/hardkernel/odroidxu4/post-image.sh b/board/hardkernel/odroidxu4/post-image.sh
new file mode 100755
index 0000000..1722c4b
--- /dev/null
+++ b/board/hardkernel/odroidxu4/post-image.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
+#dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc
+
+signed_bl1_position=0
+bl2_position=30
+uboot_position=62
+tzsw_position=1502
+device="${BINARIES_DIR}/sdcard.img"
+uboot="${BINARIES_DIR}/u-boot-dtb.bin"
+
+env_position=2015
+
+#<BL1 fusing>
+echo "BL1 fusing"
+dd if=${BINARIES_DIR}/bl1.bin.hardkernel of=$device seek=$signed_bl1_position conv=fsync,notrunc
+
+#<BL2 fusing>
+echo "BL2 fusing"
+dd if=${BINARIES_DIR}/bl2.bin.hardkernel.720k_uboot of=$device seek=$bl2_position conv=fsync,notrunc
+
+#<u-boot fusing>
+echo "u-boot fusing"
+dd if=$uboot of=$device seek=$uboot_position conv=fsync,notrunc
+
+#<TrustZone S/W fusing>
+echo "TrustZone S/W fusing"
+dd if=${BINARIES_DIR}/tzsw.bin.hardkernel of=$device seek=$tzsw_position conv=fsync,notrunc
+
+#<u-boot env erase>
+echo "u-boot env erase..."
+dd if=/dev/zero of=$device seek=$env_position bs=512 count=32 conv=fsync,notrunc
+
+
diff --git a/board/hardkernel/odroidxu4/readme.txt b/board/hardkernel/odroidxu4/readme.txt
new file mode 100644
index 0000000..24a0184
--- /dev/null
+++ b/board/hardkernel/odroidxu4/readme.txt
@@ -0,0 +1,76 @@
+Odroid XU-4 board with Samsung Exynos 5422 SoC
+
+Introduction
+------------
+
+The Odroid XU 4 board is developed and shipped by Hrdkernel (hardkernel.com). It
+uses the Samsung Exynos 5422 Soc.
+
+Odroid boot process
+-------------------
+
+The odroid boot process requires three stages of boot plus trust zone:
+
+    boot level 1
+
+        |
+        V
+
+    boot level 2
+
+        |
+        V
+
+     u-boot
+
+and they need to be raw copied to the SD card in the following order:
+
+    +----------------+----------------+
+    | boot level 1   | 1 block        |
+    +----------------+----------------+
+    | boot level 2   | 31 block       |
+    +----------------+----------------+
+    | u-boot         | 63 block       |
+    +----------------+----------------+
+    | trust zone     | 2111 block     |
+    +----------------+----------------+
+    | boot partition | 4096 block     |
+    +----------------+----------------+
+    | rootfs         |                |
+    +----------------+----------------+
+
+
+How to build it
+===============
+
+  $ make odroidxu4_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
+
+Result of the build
+-------------------
+
+After building, you should obtain all output files in output/images/
+
+
+How to write the SD card or eMMC
+================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the SDcard into your ODROID-XU4, and power it up. Your new system
+should come up now.
diff --git a/configs/odroidxu4_defconfig b/configs/odroidxu4_defconfig
new file mode 100644
index 0000000..9feef3e
--- /dev/null
+++ b/configs/odroidxu4_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidxu4/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/hardkernel/linux/archive/jenkins-deb_kernel_5422_4.9-73.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="odroidxu4"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="88af53fbcef8386cb4d5f04c19f4b2bcb69e90ca"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="odroid-xu4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="sd_fuse/bl1.bin.hardkernel sd_fuse/bl2.bin.hardkernel.720k_uboot sd_fuse/tzsw.bin.hardkernel "
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidxu4/boot.cmd"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
