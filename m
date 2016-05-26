From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 10:35:55 +0200
Subject: [Buildroot] [git commit branch/next] boards: add roseapple pi board
	support
Message-ID: <20160526083658.EADFA7FEEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cacb5be8449f9033ade3b3336b81cac20ae94db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add basic support for the roseapple pi board, a SBC in a RPI form factor
with an Actions Semiconductor S500 SoC. For details, see:

http://roseapplepi.org/

The vendor kernel unfortunately needs a minor patch to build the XHCI
driver, so include it here.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/roseapplepi/genimage.cfg                     | 43 ++++++++++++++++++++++
 .../patches/linux/0001-unbreak-xhci-trace.patch    | 31 ++++++++++++++++
 board/roseapplepi/post-image.sh                    | 18 +++++++++
 board/roseapplepi/uEnv.txt                         |  3 ++
 configs/roseapplepi_defconfig                      | 40 ++++++++++++++++++++
 5 files changed, 135 insertions(+)

diff --git a/board/roseapplepi/genimage.cfg b/board/roseapplepi/genimage.cfg
new file mode 100644
index 0000000..4d40e65
--- /dev/null
+++ b/board/roseapplepi/genimage.cfg
@@ -0,0 +1,43 @@
+# Minimal SD card image for the Roseapple Pi
+#
+image boot.vfat {
+	vfat {
+		files = {
+		     "uEnv.txt",
+		     "uImage"
+		}
+		file kernel.dtb {
+		     image = "actduino_bubble_gum_sdboot_linux.dtb"
+		}
+	}
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition s500-bootloader {
+		in-partition-table = "no"
+		image = "s500-bootloader.bin"
+		offset = 0x200200
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-dtb.img"
+		offset = 0x300000
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
+		size = 512M
+	}
+}
diff --git a/board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch b/board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch
new file mode 100644
index 0000000..79e8c80
--- /dev/null
+++ b/board/roseapplepi/patches/linux/0001-unbreak-xhci-trace.patch
@@ -0,0 +1,31 @@
+[PATCH] unbreak xhci-trace compilation
+
+When commit 84a99f6fc5d4 (xhci: add traces for debug messages in
+xhci_address_device) was backported to the owl tree as part of commit
+5b2ea66f15396 (usb: add owl usb driver), the specific CFLAGS needed for
+xhci-trace.c were missed, causing build breakage:
+
+  CC      drivers/usb/host/xhci-trace.o
+In file included from drivers/usb/host/xhci-trace.h:151:0,
+                 from drivers/usb/host/xhci-trace.c:15:
+include/trace/define_trace.h:79:43: fatal error: ./xhci-trace.h: No such file or directory
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ drivers/usb/host/Makefile |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b/drivers/usb/host/Makefile
+===================================================================
+--- linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b.orig/drivers/usb/host/Makefile
++++ linux-59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b/drivers/usb/host/Makefile
+@@ -4,6 +4,9 @@
+ 
+ ccflags-$(CONFIG_USB_DEBUG) := -DDEBUG
+ 
++# tell define_trace.h where to find the xhci trace header
++CFLAGS_xhci-trace.o := -I$(src)
++
+ isp1760-y := isp1760-hcd.o isp1760-if.o
+ 
+ fhci-y := fhci-hcd.o fhci-hub.o fhci-q.o
diff --git a/board/roseapplepi/post-image.sh b/board/roseapplepi/post-image.sh
new file mode 100755
index 0000000..e8f2df2
--- /dev/null
+++ b/board/roseapplepi/post-image.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/roseapplepi/uEnv.txt b/board/roseapplepi/uEnv.txt
new file mode 100755
index 0000000..f9646e4
--- /dev/null
+++ b/board/roseapplepi/uEnv.txt
@@ -0,0 +1,3 @@
+# no ramdisk
+ramdisk_addr_r=-
+bootargs=clk_ignore_unused root=/dev/mmcblk0p2
diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
new file mode 100644
index 0000000..6627ff4
--- /dev/null
+++ b/configs/roseapplepi_defconfig
@@ -0,0 +1,40 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+
+BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
+# Linux headers same as kernel, a 3.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/roseapplepi/post-image.sh"
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/xapp-le/kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="59dbf6a4998e967eb9c6bdcc9b506c0d96acb26b"
+BR2_LINUX_KERNEL_DEFCONFIG="actduino_bubble_gum_linux"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="actduino_bubble_gum_sdboot_linux"
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_S500_BOOTLOADER=y
+BR2_TARGET_S500_BOOTLOADER_BOARD="linux/bubble_gum_sd"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/xapp-le/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a035d2673a90143a1a74557503b2e137b1447ae6"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="actduino_bubble_gum_v10"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
