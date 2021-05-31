From: Diego Lozano <diego.lofer@gmail.com>
Date: Tue,  1 Jun 2021 01:02:32 +0200
Subject: [Buildroot] [PATCH 1/1] board/altera: added Terasic de0nano board
 support
Message-ID: <20210531230232.866757-1-diego.lofer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

de0nano board (also known as atlas soc) is currently not
supported by buildroot. With this patch a new defconfig is
added for this target. It can generate a .img to be flashed
directly in a SD card and boot it.

Note that configs/ folder is also modified in this patch, as the
new board defconfig is created.

Signed-off-by: Diego Lozano <diego.lofer@gmail.com>
---
 board/altera/de0nano_cyclone5/boot.scr      |  9 +++
 board/altera/de0nano_cyclone5/genimage.cfg  | 66 +++++++++++++++++++++
 board/altera/de0nano_cyclone5/post-image.sh | 20 +++++++
 board/altera/de0nano_cyclone5/uboot-env.txt |  1 +
 configs/de0nano_cyclone5_defconfig          | 42 +++++++++++++
 5 files changed, 138 insertions(+)
 create mode 100644 board/altera/de0nano_cyclone5/boot.scr
 create mode 100644 board/altera/de0nano_cyclone5/genimage.cfg
 create mode 100755 board/altera/de0nano_cyclone5/post-image.sh
 create mode 100644 board/altera/de0nano_cyclone5/uboot-env.txt
 create mode 100644 configs/de0nano_cyclone5_defconfig

diff --git a/board/altera/de0nano_cyclone5/boot.scr b/board/altera/de0nano_cyclone5/boot.scr
new file mode 100644
index 0000000000..38965fce90
--- /dev/null
+++ b/board/altera/de0nano_cyclone5/boot.scr
@@ -0,0 +1,9 @@
+echo === Setting bootargs ===
+setenv bootargs console=ttyS0,115200n8 root=PARTUUID=00000000-03 rw rootfstype=ext4 rootwait
+
+echo === Loadding elements ===
+fatload mmc 0:2 ${loadaddr} zImage
+fatload mmc 0:2 ${fdt_addr_r} socfpga_cyclone5_de0_nano_soc.dtb
+
+echo === Starting out ===
+bootz ${loadaddr} - ${fdt_addr_r}
diff --git a/board/altera/de0nano_cyclone5/genimage.cfg b/board/altera/de0nano_cyclone5/genimage.cfg
new file mode 100644
index 0000000000..20e3f89b80
--- /dev/null
+++ b/board/altera/de0nano_cyclone5/genimage.cfg
@@ -0,0 +1,66 @@
+# Image of the partition with:
+# - Kernel zImage
+# - Flattened device tree
+# - Startup u-boot script
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"socfpga_cyclone5_de0_nano_soc.dtb",
+			"boot.scr.uimg",
+		}
+	}
+	size = 16M
+}
+
+# Bootloader image
+image uboot.img {
+	hdimage {
+		partition-table = "no"
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "u-boot-with-spl.sfp"
+		offset = 0
+		size = 900k
+	}
+
+	size = 1M
+}
+
+# Main image
+image sdcard.img {
+	hdimage {
+	}
+
+	# Optional: set env variables through env image
+	# using mkvenv.
+	# U-Boot CONFIG_ENV_OFFSET variable is 0x4400
+	# Sector size is 512 bytes
+	# 0x4400 is 17408 bytes
+	# 17408 / 512 = 34 sectors offset
+	#partition uboot-env {
+	#	in-partition-table = "no"
+	#	image = "uboot-env.bin"
+	#	offset = 17408
+	#}
+	partition uboot {
+		partition-type = 0xa2
+		image = "uboot.img"
+		offset = 1M
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
+		size = 30M
+	}
+
+}
diff --git a/board/altera/de0nano_cyclone5/post-image.sh b/board/altera/de0nano_cyclone5/post-image.sh
new file mode 100755
index 0000000000..c3642789e9
--- /dev/null
+++ b/board/altera/de0nano_cyclone5/post-image.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# Store current directory
+BOARD_DIR="$(dirname $0)"
+
+# Generate the boot script boot.scr.img
+${HOST_DIR}/bin/mkimage -T script -C none -n 'BootLinux' -d ${BOARD_DIR}/boot.scr ${BINARIES_DIR}/boot.scr.uimg
+
+# Generate the SD Card image
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+${HOST_DIR}/bin/genimage		\
+	--config "${GENIMAGE_CFG}"	\
+	--rootpath "${TARGET_DIR}"	\
+	--inputpath "${BINARIES_DIR}"	\
+        --outputpath "${BINARIES_DIR}"	\
+	--tmppath "${GENIMAGE_TMP}"
diff --git a/board/altera/de0nano_cyclone5/uboot-env.txt b/board/altera/de0nano_cyclone5/uboot-env.txt
new file mode 100644
index 0000000000..4091b3dbe0
--- /dev/null
+++ b/board/altera/de0nano_cyclone5/uboot-env.txt
@@ -0,0 +1 @@
+test=1
diff --git a/configs/de0nano_cyclone5_defconfig b/configs/de0nano_cyclone5_defconfig
new file mode 100644
index 0000000000..321f24b67b
--- /dev/null
+++ b/configs/de0nano_cyclone5_defconfig
@@ -0,0 +1,42 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_CCACHE=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_KERNEL_HEADERS_5_4=y
+BR2_GCC_VERSION_10_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="de0nano"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/de0nano_cyclone5/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="socfpga-5.4.104-lts"
+BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_de0_nano_soc"
+BR2_PACKAGE_UBOOT_TOOLS=y
+BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE=y
+# BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="30M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_de0_nano_soc"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-with-spl.sfp"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/altera/de0nano_cyclone5/uboot-env.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x2000"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/altera/de0nano_cyclone5/boot.scr"
-- 
2.30.2
