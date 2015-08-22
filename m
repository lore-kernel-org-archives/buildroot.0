From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Sat, 22 Aug 2015 22:01:28 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs on
	first boot
In-Reply-To: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
Message-ID: <1440273688-92868-4-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add init scripts to auto-expand the persistent rootfs on the first boot
to fill the medium.

These scripts follow the same procedure as raspi-config. The root
partition is first expanded, then a reboot is required, then the rootfs
is expanded. Each script removes itself once run.

The volatile (initramfs) rootfs is not affected by this change.

The instructions in readme.txt are updated accordingly.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 board/raspberrypi/post-build.sh                    |  7 +++++
 board/raspberrypi/readme.txt                       | 11 ++++---
 .../rootfs-overlay/etc/init.d/S22expand-rootpart   | 36 ++++++++++++++++++++++
 .../rootfs-overlay/etc/init.d/S23expand-rootfs     | 16 ++++++++++
 configs/raspberrypi2_defconfig                     |  8 +++++
 configs/raspberrypi_defconfig                      | 12 ++++++--
 6 files changed, 84 insertions(+), 6 deletions(-)
 create mode 100755 board/raspberrypi/post-build.sh
 create mode 100755 board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart
 create mode 100755 board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs

diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
new file mode 100755
index 0000000..4b92b33
--- /dev/null
+++ b/board/raspberrypi/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/bash -e
+
+# The init scripts used to auto-expand the persistent rootfs on the first boot
+# to fill the medium must not be used with the volatile (initramfs) rootfs.
+if grep "^BR2_TARGET_ROOTFS_INITRAMFS=y$" "${BR2_CONFIG}" &>/dev/null; then
+	rm -f "${TARGET_DIR}"/etc/init.d/{S22expand-rootpart,S23expand-rootfs}
+fi
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index d63e71e..7ee783b 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -34,10 +34,13 @@ And for model 2 B:
   $ make raspberrypi2_defconfig
 
 If you want to use a persistent rootfs, the generated ext4 rootfs image fits its
-contents with only a small (but sensible) margin of free space by default, so
-you might want to adjust "Filesystem images"/"ext2/3/4 root filesystem"/
-"size in blocks (leave at 0 for auto calculation)" depending on your needs, then
-skip to "Build the rootfs", below.
+contents with only a small (but sensible) margin of free space by default, but
+it is auto-expanded on the first boot to fill the medium. You can however adjust
+"Filesystem images"/"ext2/3/4 root filesystem"/
+"size in blocks (leave at 0 for auto calculation)" to fit your needs. The
+auto-expansion is controlled by
+board/raspberrypi/rootfs-overlay/etc/init.d/S*expand-root*. Skip to
+"Build the rootfs", below.
 
 For a volatile rootfs, you have to slightly adjust the configuration:
 
diff --git a/board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart b/board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart
new file mode 100755
index 0000000..7f19e7a
--- /dev/null
+++ b/board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Expanding the root partition: "
+		BLOCK_DEV="/dev/mmcblk0"
+		PART_NUM="2"
+		PART_START="$(parted -ms "${BLOCK_DEV}" unit s p 2>/dev/null | \
+			grep "^${PART_NUM}:" | cut -d : -f 2 | sed 's/s$//')"
+		if [ -z "${PART_START}" ]; then
+			echo "failed"
+		else
+			fdisk "${BLOCK_DEV}" <<-EOF &>/dev/null
+				d
+				$PART_NUM
+				n
+				p
+				$PART_NUM
+				$PART_START
+
+				w
+			EOF
+			echo "done"
+		fi
+		rm -f /etc/init.d/S22expand-rootpart
+		if [ "${PART_START}" ]; then
+			reboot -f
+			while true; do :; done
+		fi
+		exit 2
+		;;
+	*)
+		echo "Usage: $0 start" >&2
+		exit 1
+		;;
+esac
diff --git a/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs b/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs
new file mode 100755
index 0000000..7b3f286
--- /dev/null
+++ b/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+case "$1" in
+	start)
+		echo -n "Expanding the root FS: "
+		resize2fs /dev/mmcblk0p2 &>/dev/null
+		ret=$?
+		[ ${ret} -eq 0 ] && echo "done" || echo "failed"
+		rm -f /etc/init.d/S23expand-rootfs
+		exit ${ret}
+		;;
+	*)
+		echo "Usage: $0 start" >&2
+		exit 1
+		;;
+esac
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 73dc290..2e064e0 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -3,6 +3,7 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
@@ -27,6 +28,13 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+BR2_PACKAGE_PARTED=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+
+BR2_ROOTFS_OVERLAY="board/raspberrypi2/rootfs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 58f4cab..7e744f3 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -2,6 +2,9 @@ BR2_arm=y
 BR2_arm1176jzf_s=y
 BR2_ARM_EABIHF=y
 
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 # Lock to 4.1 headers as the RPi kernel stable tree is
@@ -10,8 +13,6 @@ BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="4.1.5"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
@@ -26,6 +27,13 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus"
 BR2_PACKAGE_RPI_FIRMWARE=y
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
+BR2_PACKAGE_E2FSPROGS=y
+BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
+BR2_PACKAGE_PARTED=y
+BR2_PACKAGE_UTIL_LINUX_BINARIES=y
+
+BR2_ROOTFS_OVERLAY="board/raspberrypi/rootfs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs"
-- 
2.1.4
