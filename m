From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Thu, 28 May 2015 16:36:10 +0300
Subject: [Buildroot] [PATCH 1/1] Solid-Run HummingBoard i2eX defconfig and
	bootable microSD Bash script
Message-ID: <1432820170-10513-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 board/solid-run/hummingboard-i2eX/make_sd_card.sh | 207 ++++++++++++++++++++++
 configs/hummingboard_i2eX_defconfig               |  24 +++
 2 files changed, 231 insertions(+)
 create mode 100755 board/solid-run/hummingboard-i2eX/make_sd_card.sh
 create mode 100644 configs/hummingboard_i2eX_defconfig

diff --git a/board/solid-run/hummingboard-i2eX/make_sd_card.sh b/board/solid-run/hummingboard-i2eX/make_sd_card.sh
new file mode 100755
index 0000000..55c0f17
--- /dev/null
+++ b/board/solid-run/hummingboard-i2eX/make_sd_card.sh
@@ -0,0 +1,207 @@
+#!/bin/bash -eu
+# @(#) Create a bootable SD card from Buildroot tree for the HummingBoard i2eX
+#
+# Copyright (c) 2015 Tk Open Systems Ltd. all rights reserved
+# License granted for public use under the terms of the "Attribution-ShareAlike
+# 4.0 International" license, See full text at
+# https://creativecommons.org/licenses/by-sa/4.0/legalcode
+# Maintainer: yba at tkos.co.il
+
+USAGE="${0} <SD card device (e.g. 'sdb')> <Buildroot output dir (e.g '/home/yba/buildroot/output')>"
+ERROR=0
+
+if [ -z "${1+x}" ]
+then
+	if [ -z "${DEVICE+x}" ]
+	then
+		echo "${0} ERROR: No DEVICE env var or device specification in first parameter"
+		ERROR=$((${ERROR}+1))
+	fi
+	if [ -z "${BUILDROOT_OUTPUT_DIR+x}" ]
+	then
+		echo "${0} ERROR: No BUILDROOT_OUTPUT_DIR env var or device specification in second parameter"
+		ERROR=$((${ERROR}+1))
+	fi
+else
+	DEVICE=${1}
+	if [ -z "${2+x}" ]
+	then
+		if [ -z "${BUILDROOT_OUTPUT_DIR+x}" ]
+		then
+			echo "${0} ERROR: No BUILDROOT_OUTPUT_DIR env var or device specification in second parameter"
+			ERROR=$((${ERROR}+1))
+		fi
+	else
+		BUILDROOT_OUTPUT_DIR=${2}
+	fi
+fi
+[ 0 -lt ${ERROR} ] && { echo ${USAGE}; exit 1; }
+ERROR=0
+
+if [ -z "${4+x}" ]
+then
+	if [ -z "${ROOTFS_PARTITION_SIZE+x}" ]
+	then
+		ROOTFS_PARTITION_SIZE=128
+	fi
+else
+	ROOTFS_PARTITION_SIZE=${4}
+fi
+
+
+# rootfs partition starting at 1MB with size of ROOTFS_PARTITION_SIZE
+ROOTFS_PARTITION="n\np\n1\n2048\n+16M\nn\np\n2\n\n+${ROOTFS_PARTITION_SIZE}M\na\n\nw\n"
+#ROOTFS_PARTITION="n\np\n1\n2048\n+${ROOTFS_PARTITION_SIZE}M\na\n\nw\n"
+
+# Not so cool - I will have to maintain this script every time Rabeeh pushes
+# new code
+KERNEL_DIR=${BUILDROOT_OUTPUT_DIR}/build/linux-ea83bda1b403d745c67fbf6ea307d05ca138577f
+UBOOT_DIR=${BUILDROOT_OUTPUT_DIR}/build/uboot-e817fa3165a607b581433a6abfe37e095a5d1dc9
+
+# Handle Ubuntu fdisk silliness
+if echo $(uname -a) | grep -q Ubuntu
+then
+	FDISK="fdisk -c -u"
+else
+	FDISK="fdisk -u=sectors"
+fi
+
+
+if [ 0 -ne ${EUID} ]
+then
+	echo "${0} ERROR: You need to run this script as root or using 'sudo'."
+	exit 1
+fi
+
+if [ -z "${DEVICE}" ]
+then
+	echo "${0} ERROR: You need to specify the SD device as the first"
+	echo "command line parameter to this script. Example 'sdb'. Be "
+	echo "careful not to do something stupid like specifying your system"
+	echo "hard drive device."
+	ERROR=$((${ERROR}+1))
+else
+	if [ ! -b /dev/${DEVICE} ]
+	then
+		echo "${0} ERROR: /dev/${DEVICE} is not a block device file"
+		ERROR=$((${ERROR}+1))
+	fi
+fi
+
+if [ -f /etc/multipath.conf ]
+then
+	if grep -q blacklist //etc/multipath.conf && ! grep -q ${DEVICE} /etc/multipath.conf 
+	then
+		echo
+		echo "==> WARNING: You probably want to blacklist ${DEVICE} in /etc/multipath.conf"
+		echo "==> Otherwise the kernel will not be notified of partition changes"
+		echo
+		sleep 5
+	fi
+fi
+
+if [ -z "${BUILDROOT_OUTPUT_DIR}" ]
+then
+	echo "${0} ERROR: You need to specify the Buildroot output directory as"
+	echo "the third command line parameter to this script"
+	ERROR=$((${ERROR}+1))
+else
+	if [ ! -d "${BUILDROOT_OUTPUT_DIR}" ]
+	then
+		echo "${0} ERROR: The [${BUILDROOT_OUTPUT_DIR}] directory does not"
+		echo "exist."
+		ERROR=$((${ERROR}+1))
+	fi
+fi
+
+if [ ! -d ${KERNEL_DIR} ]
+then
+	echo "${0} INTERNAL ERROR: The kernel dir ${KERNEL_DIR} does not exist."
+	echo "The kernel version has probably been changed."
+	ERROR=$((${ERROR}+1))
+fi
+
+if [ ! -d ${UBOOT_DIR} ]
+then
+	echo "${0} INTERNAL ERROR: The U-Boot dir ${UBOOT_DIR} does not exist."
+	echo "The kernel version has probably been changed."
+	ERROR=$((${ERROR}+1))
+fi
+
+if [ ! -f ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar ]
+then
+	echo "${0} ERROR: The rootfs image file "
+	echo "[${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar]"
+	echo "was not found."
+	echo "Check that the third parameter is the fully qualified directory."
+	ERROR=$((${ERROR}+1))
+fi
+
+
+BINS="fdisk mkfs.ext4 mount umount dd mktemp partprobe"
+for BIN in ${BINS}
+do
+	if ! which ${BIN} >/dev/null
+	then
+		echo "${0} ERROR: Required executable ${BIN} is not in PATH"
+		ERROR=$((${ERROR}+1))
+	fi
+done
+
+MOUNT_POINT=$(mktemp -d /tmp/hummingboard.XXXX)
+if [ ! -d "${MOUNT_POINT}" ]
+then
+	echo "${0} ERROR: Can't create mount point"
+	exit 1
+fi
+
+[ 0 -lt ${ERROR} ] && exit 1
+
+# Zap any partition table on the SD
+dd if=/dev/zero of=/dev/${DEVICE} bs=1024 count=8
+
+printf ${ROOTFS_PARTITION} | ${FDISK} /dev/${DEVICE} || partprobe /dev/${DEVICE}
+sleep 2
+
+if [ ! -b /dev/${DEVICE}2 ]
+then
+	echo "${0} ERROR: /dev/${DEVICE}2 partition not recognized"
+	exit 1
+fi
+
+# Hat tip to hste and jas for this recipe
+if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 /dev/${DEVICE}2
+then
+	echo "${0} ERROR: Failed to create ext4 filesystem on /dev/${DEVICE}2"
+	exit 1
+fi
+
+if ! mount /dev/${DEVICE}2 ${MOUNT_POINT}
+then
+	echo "${0} ERROR: Cannot mount /dev/${DEVICE}2 on ${MOUNT_POINT}"
+	exit 1
+fi
+
+tar xvf ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar -C ${MOUNT_POINT}
+umount ${MOUNT_POINT}
+
+if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 /dev/${DEVICE}1
+then
+	echo "${0} ERROR: Failed to create ext4 filesystem on /dev/${DEVICE}1"
+	exit 1
+fi
+
+if ! mount /dev/${DEVICE}1 ${MOUNT_POINT}
+then
+	echo "${0} ERROR: Cannot mount /dev/${DEVICE}1 on ${MOUNT_POINT}"
+	exit 1
+fi
+
+cp ${BUILDROOT_OUTPUT_DIR}/images/zImage ${MOUNT_POINT}
+cp ${BUILDROOT_OUTPUT_DIR}/images/imx6q-hummingboard.dtb ${MOUNT_POINT}
+umount ${MOUNT_POINT}
+
+dd if=${BUILDROOT_OUTPUT_DIR}/images/SPL of=/dev/${DEVICE} bs=1K seek=1
+dd if=${UBOOT_DIR}/u-boot.img of=/dev/${DEVICE} bs=1K seek=42
+sync
+rmdir ${MOUNT_POINT}
diff --git a/configs/hummingboard_i2eX_defconfig b/configs/hummingboard_i2eX_defconfig
new file mode 100644
index 0000000..0463bae
--- /dev/null
+++ b/configs/hummingboard_i2eX_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV3=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_HOSTNAME="HummingBoard"
+BR2_TARGET_GENERIC_ISSUE="Welcome to HummingBoard i2eX"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/SolidRun/linux-imx6-3.14.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ea83bda1b403d745c67fbf6ea307d05ca138577f"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7_cbi_hb"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-hummingboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6_cubox-i"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/SolidRun/u-boot-imx6.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="e817fa3165a607b581433a6abfe37e095a5d1dc9"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.1.4
