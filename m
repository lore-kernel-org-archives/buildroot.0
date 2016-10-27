From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 26 Oct 2016 20:08:06 -0400
Subject: [Buildroot] [PATCH 1/2] configs: add defconfig for TS-4600
In-Reply-To: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
References: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20161027000807.20206-2-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TS-4600 is a TS-SOCKET macrocontroller board based on the Freescale
i.MX28 ARM CPU.

The TS-4600 uses a custom Linux 2.6.35 from Technologic Systems:
https://github.com/embeddedarm/linux-2.6.35.3-imx28.git

The i.MX28 internal ROM loader supports a special image data that
Freescale calls "bootstream".
This bootstream contains a stream of boot commands and a boot image
which here combines a TS custom version of Freescale imx-bootlets
v10.12.01 and the Linux kernel.
The custom imx-bootlets and its toolchain comes as a part of the Linux
repository and the package ts4600-bootrom has been introduced to handle
the bootstream generation.

The ts4600-bootrom-sign tool has also been introduced to prepare the
bootable partition image which prepends the TS Bootrom with a signature
and the Boot Control Block required by the i.MX28 SoC when using the
SD/MMC boot mode.

A post-image script is provided to generate an image that can be
directly written to an SD card.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 board/technologic/ts4600/genimage.cfg   |  18 +++++
 board/technologic/ts4600/linux.fragment |   2 +
 board/technologic/ts4600/post-image.sh  |  18 +++++
 board/technologic/ts4600/readme.txt     |  57 +++++++++++++++
 boot/Config.in                          |   1 +
 boot/ts4600-bootrom/Config.in           |   6 ++
 boot/ts4600-bootrom/ts4600-bootrom-sign | 124 ++++++++++++++++++++++++++++++++
 boot/ts4600-bootrom/ts4600-bootrom.mk   |  33 +++++++++
 configs/ts4600_defconfig                |  20 ++++++
 9 files changed, 279 insertions(+)
 create mode 100644 board/technologic/ts4600/genimage.cfg
 create mode 100644 board/technologic/ts4600/linux.fragment
 create mode 100755 board/technologic/ts4600/post-image.sh
 create mode 100644 board/technologic/ts4600/readme.txt
 create mode 100644 boot/ts4600-bootrom/Config.in
 create mode 100755 boot/ts4600-bootrom/ts4600-bootrom-sign
 create mode 100644 boot/ts4600-bootrom/ts4600-bootrom.mk
 create mode 100644 configs/ts4600_defconfig

diff --git a/board/technologic/ts4600/genimage.cfg b/board/technologic/ts4600/genimage.cfg
new file mode 100644
index 0000000..59dff27
--- /dev/null
+++ b/board/technologic/ts4600/genimage.cfg
@@ -0,0 +1,18 @@
+image sdcard.img {
+  hdimage {
+  }
+
+  # Boot partition
+  partition ts4600-bootrom {
+    partition-type = 0x53
+    image = "ts4600-bootrom.sign"
+    offset = 1M
+    size = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+    size = 256M
+  }
+}
diff --git a/board/technologic/ts4600/linux.fragment b/board/technologic/ts4600/linux.fragment
new file mode 100644
index 0000000..a669d1f
--- /dev/null
+++ b/board/technologic/ts4600/linux.fragment
@@ -0,0 +1,2 @@
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_CMDLINE="console=ttyAM0,115200 root=/dev/mmcblk0p2 rootwait lpj=1130496"
diff --git a/board/technologic/ts4600/post-image.sh b/board/technologic/ts4600/post-image.sh
new file mode 100755
index 0000000..45f1ec6
--- /dev/null
+++ b/board/technologic/ts4600/post-image.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+#
+# Copyright (C) 2016 Savoir-Faire Linux
+# Post image generation script.
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG=$BOARD_DIR/genimage.cfg
+GENIMAGE_TMP=$BUILD_DIR/.genimage_tmp
+
+rm -rf $GENIMAGE_TMP
+
+echo "* Generating sd-card image..."
+${HOST_DIR}/usr/bin/genimage \
+        --config ${GENIMAGE_CFG} \
+        --rootpath $TARGET_DIR \
+        --tmppath $GENIMAGE_TMP \
+        --inputpath $BINARIES_DIR \
+        --outputpath $BINARIES_DIR
diff --git a/board/technologic/ts4600/readme.txt b/board/technologic/ts4600/readme.txt
new file mode 100644
index 0000000..9ad6422
--- /dev/null
+++ b/board/technologic/ts4600/readme.txt
@@ -0,0 +1,57 @@
+Technologic Systems TS-4600
+===========================
+
+This document explains how to set up a basic Buildroot system for the
+Technologic Systems TS-4600 System on Module.
+
+The TS-4800 is a TS-SOCKET macrocontroller board based on the Freescale
+i.MX282 ARM9 CPU running at 454MHz. The TS-4600 features 10/100
+Ethernet, high speed USB host and device (OTG), and 2 microSD card.
+More details on the board here:
+	http://wiki.embeddedarm.com/wiki/TS-4600
+
+The TS-4600 is not currently supported by mainline Linux, so a
+Technologic Systems Linux is used base on Linux 2.6.35.
+
+The i.MX28 internal ROM loader supports a special image data that Freescale
+calls "bootstream".
+This bootstream contains a stream of boot commands and a boot image which here
+combines a TS custom version of Freescale imx-bootlets v10.12.01 and the Linux
+kernel.
+The custom imx-bootlets and its toolchain comes as a part of the Linux
+repository.
+More details on the TS-BOOTROM here:
+	http://wiki.embeddedarm.com/wiki/TS-Bootrom
+
+The final generated image is signed and contain an i.MX28 boot control block
+to work.
+
+To build the default configuration you only have to:
+
+	$ make ts4600_defconfig
+	$ make
+
+The ouput looks like:
+	output/images/
+	??? rootfs.ext2
+	??? rootfs.tar
+	??? sdcard.img
+	??? ts4600-bootrom.sign
+	??? sdcard.img
+	??? zImage
+
+The provided post-image script generates an image file containing 2
+partitions for the Linux kernel packed with the bootstream and rootfs
+respectively:
+	$ fdisk output/images/sdcard.img
+	                   Device Boot Start    End Blocks Id  System
+	output/images/sdcard.img1       2048  18431   16384    8M 53 OnTrack DM6 Aux3
+	output/images/sdcard.img2      18432 542719  524288  256M 83 Linux
+
+This image can be directly written to an SD card.
+
+	$ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0
+
+In order to test the image on TS-4600 board, a TS baseboard, such as
+TS-8xxx the serie, is needed to provide power, console header, RJ45
+connector etc.
diff --git a/boot/Config.in b/boot/Config.in
index 273c1c7..a7025bb 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -14,6 +14,7 @@ source "boot/lpc32xxcdl/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/ts4600-bootrom/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/ts4600-bootrom/Config.in b/boot/ts4600-bootrom/Config.in
new file mode 100644
index 0000000..d039bda
--- /dev/null
+++ b/boot/ts4600-bootrom/Config.in
@@ -0,0 +1,6 @@
+config BR2_TARGET_TS4600_BOOTROM
+	bool "ts4600-bootrom"
+	depends on BR2_arm
+	depends on BR2_LINUX_KERNEL
+	help
+	  Technologic System bootstream for TS4600 board
diff --git a/boot/ts4600-bootrom/ts4600-bootrom-sign b/boot/ts4600-bootrom/ts4600-bootrom-sign
new file mode 100755
index 0000000..d91c10f
--- /dev/null
+++ b/boot/ts4600-bootrom/ts4600-bootrom-sign
@@ -0,0 +1,124 @@
+#!/bin/bash
+#
+# Copyright (C) 2016 Savoir-Faire Linux, Inc
+# Copyright (C) 2013 Technologic System, Inc
+# Author: ts-kris <https://github.com/ts-kris>
+# Author: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
+#
+# This tool signs a bootstream and add a BCB (Boot Control Block) to be used on i.MX28 SoC.
+# It is based on the install_bootstream tool from Technologic System:
+# https://github.com/embeddedarm/linux-2.6.35.3-imx28/blob/master/install_bootstream
+
+
+# This function writes the binary value to stdout of each argument in the order given
+# i.e. out_byte 0 1 2 3 will echo "\x00\x01\x02\x03" to stdout (w/o terminating null)
+#
+# usage: out_byte <args>
+#
+# arg1: the byte value to output
+function out_byte() {
+    for val in $*
+        do
+        echo -en "\\x$(printf %02x $val)"
+    done
+}
+
+# This function converts a big endian value into little endian
+#
+# usage: out_u32_le <value>
+#
+# arg1: the 32 bits value to convert
+function out_u32_le()
+{
+    for val32 in $*
+    do
+        val=$(($val32))
+        b0=$((val % (2**8)))
+        val=$((val / (2**8)))
+        b1=$((val % (2**8)))
+        val=$((val / (2**8)))
+        b2=$((val % (2**8)))
+        val=$((val / (2**8)))
+        b3=$((val % (2**8)))
+
+        # Output the bytes in binary form
+        out_byte $b0 $b1 $b2 $b3
+    done
+}
+
+# This function generates the ConfigBlock part of the boot control bloc (BCB) for i.MX28:
+# chapter 12.11.1 of the i.MX28 Applications Processor Reference Manual, Rev. 1, 2010
+#
+# usage: out_bcb <primary_tag> <secondary_tag> <num_bsb>
+#
+# arg1: the primary partition to boot (i.e. 0 in mmcblk1p0)
+# arg2: the secondary partition to boot if primary failed
+# arg3: the number of firmware copies
+function out_bcb()
+{
+    signature=0x00112233
+    primary_tag=$1
+    secondary_tag=$2
+    num_bsb=$3
+    out_u32_le signature primary_tag secondary_tag num_bsb
+}
+
+# This function generates the DriveInfo part of the boot control bloc (BCB) for i.MX28:
+# chapter 12.11.1 of the i.MX28 Applications Processor Reference Manual, Rev. 1, 2010
+#
+# usage: out_bsb <tag> <base_sector>
+#
+# arg1: drive tag (i.e. the drive number like 0 in mmcblk0)
+# arg2: the absolute base sector relative to the partition (i.e. if partition
+# starts on lba 63 & first boot stream, base_sector = 1, not 64)
+function out_bsb()
+{
+    abs_sector=$(($2 + $base_sector))
+    # unused0
+    out_u32_le 0
+    # unused1
+    out_u32_le 0
+    # tag boot stream tag
+    out_u32_le $1
+    # boot stream base sector (absolute)
+    out_u32_le $abs_sector
+    # unused2
+    out_u32_le 0
+}
+
+# This function extracts the generated boot control block (BCB) for i.MX28
+# to std out
+#
+# usage:  mk_hdr <base_sector> <num_sb_files>
+#
+# arg1: the first sector of the boot stream partition (i.e. mmcblk0p1, mmcblk1p1...)
+# arg2: the number of boot stream blocks (currently only 1 supported)
+function mk_hdr()
+{
+    base_sector=$1
+    numbootstreams=$2
+    primary=0
+    secondary=0
+
+    # output boot stream signature & info (e.g. the ConfigBlock)
+    out_bcb primary secondary numbootstreams
+
+    # output .sb starting sector info (e.g. the DriveInfo)
+    out_bsb primary 1
+}
+
+if [ $# -ne 2 ]; then
+    echo "Usage: $0 <boostream> <image>"
+    echo "Where:"
+    echo "   <boostream> is the name of .sb file to use"
+    echo "   <image> is the name of the image to load the boostream on to"
+    exit 1
+fi
+
+echo -e "\nSign and add BCB to the TS-BOOTROM on $2..."
+mk_hdr 2048 1 > temp.bin
+dd if=temp.bin of=$2 ibs=512 conv=sync
+dd if=$1 of=$2 ibs=512 obs=512 seek=1 conv=sync
+sync
+rm temp.bin
+echo -e "...$2 is now signed.\n"
diff --git a/boot/ts4600-bootrom/ts4600-bootrom.mk b/boot/ts4600-bootrom/ts4600-bootrom.mk
new file mode 100644
index 0000000..681152d
--- /dev/null
+++ b/boot/ts4600-bootrom/ts4600-bootrom.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# ts4600-bootrom
+#
+################################################################################
+
+TS4600_BOOTROM_SITE = $(LINUX_DIR)/imx-bootlets-src-10.12.01
+TS4600_BOOTROM_SITE_METHOD = local
+TS4600_BOOTROM_DEPENDENCIES = linux
+
+# The imx-bootlets source code and the toolchain to use to build it come as a
+# part of the kernel directory
+TS4600_BOOTROM_MAKE_OPTS = \
+	CROSS_COMPILE="$(LINUX_DIR)/cross-toolchain/arm-fsl-linux-gnueabi/bin/arm-none-linux-gnueabi-" \
+
+# The ts4600-bootrom pack the first stage of the bootloader and the linux image in
+# one binary file.
+# To do so, the linux zImage previously generated is required to build the
+# ts4600-bootrom and then copy in the imx-bootlets source directory.
+# The parallel building as also been disabled to make it works.
+define TS4600_BOOTROM_BUILD_CMDS
+	cp $(LINUX_IMAGE_PATH) $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(TS4600_BOOTROM_MAKE_OPTS)
+endef
+
+# The final generated image should be signed and contain an i.MX28 BCB to work.
+define TS4600_BOOTROM_INSTALL_TARGET_CMDS
+	boot/ts4600-bootrom/ts4600-bootrom-sign $(@D)/imx28_ivt_linux.sb \
+		$(@D)/ts4600-bootrom.sign
+	$(INSTALL) -D -m 0644 $(@D)/ts4600-bootrom.sign output/images/
+endef
+
+$(eval $(generic-package))
diff --git a/configs/ts4600_defconfig b/configs/ts4600_defconfig
new file mode 100644
index 0000000..21f5d7f
--- /dev/null
+++ b/configs/ts4600_defconfig
@@ -0,0 +1,20 @@
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7600-linux/cross-toolchains/imx28-cross-glibc.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_4=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAM0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4600/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/embeddedarm/linux-2.6.35.3-imx28.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="69fc5de7e234e6b2103b15a1e36d398cbf9584c4"
+BR2_LINUX_KERNEL_DEFCONFIG="ts4600"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/technologic/ts4600/linux.fragment"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_TS4600_BOOTROM=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.10.0
