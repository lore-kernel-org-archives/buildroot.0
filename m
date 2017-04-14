From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri, 14 Apr 2017 17:45:51 -0400
Subject: [Buildroot] [PATCH 2/2] configs: add raspberrypi3 64bits defconfig
In-Reply-To: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
References: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170414214551.17986-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This configuration builds a 64bit image for RaspberryPi 3.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 board/raspberrypi/genimage-raspberrypi3-64.cfg | 31 +++++++++++++++++++++
 board/raspberrypi/post-image.sh                | 23 ++++++++++++++++
 configs/raspberrypi3_64_defconfig              | 37 ++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
 create mode 100644 configs/raspberrypi3_64_defconfig

diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
new file mode 100644
index 000000000..c5f86527d
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
@@ -0,0 +1,31 @@
+image boot.vfat {
+  vfat {
+    files = {
+      "bcm2710-rpi-3-b.dtb",
+      "bcm2837-rpi-3-b.dtb",
+      "rpi-firmware/bootcode.bin",
+      "rpi-firmware/cmdline.txt",
+      "rpi-firmware/config.txt",
+      "rpi-firmware/fixup.dat",
+      "rpi-firmware/start.elf",
+      "Image"
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index b2bb07067..e4127c9ea 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -16,6 +16,29 @@ dtoverlay=pi3-miniuart-bt
 __EOF__
 	fi
 	;;
+	--aarch64)
+	# Run a 64bits kernel (armv8)
+	sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
+	if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# enable 64bits support
+arm_control=0x200
+__EOF__
+	fi
+
+	# Enable uart console
+	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
+		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
+
+# enable rpi3 ttyS0 serial console
+enable_uart=1
+__EOF__
+	fi
+
+	# Use 64bits conffile
+	GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}-64.cfg"
+	;;
 esac
 
 rm -rf "${GENIMAGE_TMP}"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
new file mode 100644
index 000000000..ddc6842f9
--- /dev/null
+++ b/configs/raspberrypi3_64_defconfig
@@ -0,0 +1,37 @@
+BR2_aarch64=y
+
+BR2_GCC_VERSION_6_X=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
-- 
2.12.1
