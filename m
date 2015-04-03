From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 17:26:00 +0200
Subject: [Buildroot] [git commit] config: Add defconfig for Freescale i.MX28
	EVK
Message-ID: <20150403152626.6B95E7FD53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0eb659d04e7854a25be09c5358212a7bfcc39b2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The i.MX28 Evaluation Kit (or EVK) is Freescale's evaluation board based on the
i.MX287 Applications Processor.

This defconfig is based on mainline u-boot and Linux kernel.

Also, we add an SD card creation script and documentation, shamelessly based on
the ones for i.MX5/6 by Luca Ceresoli.

[Arnout: fixate U-Boot and kernel (headers) versions]

Signed-off-by: Vincent Stehl?? <vincent.stehle@freescale.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx28evk/create-boot-sd.sh |   97 ++++++++++++++++++++++++++++
 board/freescale/imx28evk/readme.txt        |   58 +++++++++++++++++
 configs/freescale_imx28evk_defconfig       |   25 +++++++
 3 files changed, 180 insertions(+), 0 deletions(-)

diff --git a/board/freescale/imx28evk/create-boot-sd.sh b/board/freescale/imx28evk/create-boot-sd.sh
new file mode 100755
index 0000000..5e050cb
--- /dev/null
+++ b/board/freescale/imx28evk/create-boot-sd.sh
@@ -0,0 +1,97 @@
+#!/bin/sh
+
+set -u
+set -e
+
+PROGNAME=$(basename $0)
+
+usage()
+{
+    echo "Create an SD card that boots on an i.MX28 EVK board."
+    echo
+    echo "Note: all data on the the card will be completely deleted!"
+    echo "Use with care!"
+    echo "Superuser permissions may be required to write to the device."
+    echo
+    echo "Usage: ${PROGNAME} <sd_block_device>"
+    echo "Arguments:"
+    echo "  <sd_block_device>     The device to be written to"
+    echo
+    echo "Example: ${PROGNAME} /dev/mmcblk0"
+    echo
+}
+
+if [ $# -ne 1 ]; then
+    usage
+    exit 1
+fi
+
+if [ $(id -u) -ne 0 ]; then
+    echo "${PROGNAME} must be run as root"
+    exit 1
+fi
+
+DEV=${1}
+
+# The partition name prefix depends on the device name:
+# - /dev/sde -> /dev/sde1
+# - /dev/mmcblk0 -> /dev/mmcblk0p1
+if echo ${DEV}|grep -q mmcblk ; then
+    PART="p"
+else
+    PART=""
+fi
+
+PART1=${DEV}${PART}1
+PART2=${DEV}${PART}2
+PART3=${DEV}${PART}3
+
+# Unmount the partitions if mounted
+umount ${PART1} || true
+umount ${PART2} || true
+umount ${PART3} || true
+
+# First, clear the card
+dd if=/dev/zero of=${DEV} bs=1M count=20
+
+sync
+
+# Partition the card.
+# SD layout for i.MX28 boot:
+# - Special partition type 53 at sector 2048, containing an SD-SB-encapsulated u-boot
+# - FAT partition containing zImage
+# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
+sfdisk --force -u S ${DEV} <<EOF
+2048,2000,53
+4048,16000,b
+20048,,L
+EOF
+
+sync
+
+# Copy the bootloader@offset 2048
+# (We need to skip the partition table in the .sd, too.)
+dd if=output/images/u-boot.sd of=${DEV}1 bs=1M
+
+# Prepare a temp dir for mounting partitions
+TMPDIR=$(mktemp -d)
+ 
+# FAT partition: kernel
+mkfs.vfat ${PART2}
+mount ${PART2} ${TMPDIR}
+cp output/images/*Image ${TMPDIR}/
+cp output/images/*.dtb  ${TMPDIR}/ || true
+sync
+umount ${TMPDIR}
+
+# ext2 partition: root filesystem
+mkfs.ext2 ${PART3}
+mount ${PART3} ${TMPDIR}
+tar -C ${TMPDIR}/ -xf output/images/rootfs.tar
+sync
+umount ${TMPDIR}
+
+# Cleanup
+rmdir ${TMPDIR}
+sync
+echo Done
diff --git a/board/freescale/imx28evk/readme.txt b/board/freescale/imx28evk/readme.txt
new file mode 100644
index 0000000..cbf6aae
--- /dev/null
+++ b/board/freescale/imx28evk/readme.txt
@@ -0,0 +1,58 @@
+**************************
+Freescale i.MX28 EVK board
+**************************
+
+This file documents the Buildroot support for the Freescale i.MX28 EVK board.
+
+Read the i.MX28 Evaluation Kit Quick Start Guide [1] for an introduction to the
+board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX28 EVK board:
+
+  make freescale_imx28evk_defconfig
+
+Build all components:
+
+  make
+
+You will find in ./output/images/ the following files:
+  - imx28-evk.dtb
+  - rootfs.tar
+  - u-boot.sd
+  - zImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Run the following script as root on your SD card. This will partition the card
+and copy the bootloader, kernel and root filesystem as needed.
+
+*** WARNING! The script will destroy all the card content. Use with care! ***
+
+  ./board/freescale/imx28evk/create-boot-sd.sh <your-sd-device>
+
+Boot the i.MX28 EVK board
+=========================
+
+To boot your newly created system (refer to the i.MX28 EVK Quick Start Guide
+[1] for guidance):
+- insert the SD card in the SD Card Socket 0 of the board;
+- verify that your i.MX28 EVK board jumpers and switches are set as mentioned
+  in the i.MX28 EVK Quick Start Guide [1];
+- connect an RS232 UART cable to the Debug UART Port and connect using a
+  terminal emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] http://cache.freescale.com/files/32bit/doc/user_guide/EVK_imx28_QuickStart.pdf
diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
new file mode 100644
index 0000000..7125cec
--- /dev/null
+++ b/configs/freescale_imx28evk_defconfig
@@ -0,0 +1,25 @@
+# architecture
+BR2_arm=y
+BR2_arm926t=y
+
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.19.2"
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
+BR2_LINUX_KERNEL_DEFCONFIG="mxs"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx28evk"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_FORMAT_SD=y
