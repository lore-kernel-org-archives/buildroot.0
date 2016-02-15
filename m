From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Mon, 15 Feb 2016 12:29:51 -0300
Subject: [Buildroot] [PATCH v2 2/2] board/firefly_rk3288: add new board
In-Reply-To: <1455550191-28706-1-git-send-email-ariel@vanguardiasur.com.ar>
References: <1455550191-28706-1-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <1455550191-28706-3-git-send-email-ariel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds basic configuration files for the Firefly RK3288 board.
Both minimal and demo defconfigs are added. The latter enables Qt5 with
the required Mali T76X GPU user space components.

More info about the board:
http://en.t-firefly.com/en/firenow/firefly_rk3288/specifications/

Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 board/firefly/firefly-rk3288/extlinux.conf |  6 +++++
 board/firefly/firefly-rk3288/post-build.sh |  3 +++
 board/firefly/firefly-rk3288/post-image.sh | 20 +++++++++++++++
 board/firefly/firefly-rk3288/readme.txt    | 40 +++++++++++++++++++++++++++++
 board/firefly/firefly-rk3288/sd-image.cfg  | 22 ++++++++++++++++
 configs/firefly_rk3288_defconfig           | 33 ++++++++++++++++++++++++
 configs/firefly_rk3288_demo_defconfig      | 41 ++++++++++++++++++++++++++++++
 7 files changed, 165 insertions(+)
 create mode 100644 board/firefly/firefly-rk3288/extlinux.conf
 create mode 100755 board/firefly/firefly-rk3288/post-build.sh
 create mode 100755 board/firefly/firefly-rk3288/post-image.sh
 create mode 100644 board/firefly/firefly-rk3288/readme.txt
 create mode 100644 board/firefly/firefly-rk3288/sd-image.cfg
 create mode 100644 configs/firefly_rk3288_defconfig
 create mode 100644 configs/firefly_rk3288_demo_defconfig

diff --git a/board/firefly/firefly-rk3288/extlinux.conf b/board/firefly/firefly-rk3288/extlinux.conf
new file mode 100644
index 0000000..39ac5b9
--- /dev/null
+++ b/board/firefly/firefly-rk3288/extlinux.conf
@@ -0,0 +1,6 @@
+default firefly-rk3288
+
+label firefly-rk3288
+kernel /boot/uImage
+devicetree /boot/rk3288-firefly.dtb
+append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
diff --git a/board/firefly/firefly-rk3288/post-build.sh b/board/firefly/firefly-rk3288/post-build.sh
new file mode 100755
index 0000000..94e89ce
--- /dev/null
+++ b/board/firefly/firefly-rk3288/post-build.sh
@@ -0,0 +1,3 @@
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/firefly/firefly-rk3288/post-image.sh b/board/firefly/firefly-rk3288/post-image.sh
new file mode 100755
index 0000000..1dd30a6
--- /dev/null
+++ b/board/firefly/firefly-rk3288/post-image.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/usr/bin/mkimage
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/sd-image.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage							\
+	--rootpath "${TARGET_DIR}"		\
+	--tmppath "${GENIMAGE_TMP}"		\
+	--inputpath "${BINARIES_DIR}"	\
+	--outputpath "${BINARIES_DIR}"	\
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/firefly/firefly-rk3288/readme.txt b/board/firefly/firefly-rk3288/readme.txt
new file mode 100644
index 0000000..d621085
--- /dev/null
+++ b/board/firefly/firefly-rk3288/readme.txt
@@ -0,0 +1,40 @@
+Firefly RK3288
+
+How to build it
+===============
+
+  $ make firefly_rk3288_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile all and build rootfs image:
+
+  $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+  output/images/
+  ??? rk3288-firefly.dtb
+  ??? rootfs.ext2
+  ??? rootfs.ext4 -> rootfs.ext2
+  ??? sdcard.img
+  ??? u-boot-dtb.img
+  ??? u-boot-spl-dtb.bin
+  ??? u-boot-spl-dtb.img
+  ??? uImage
+
+Prepare your SDCard
+===================
+
+Buildroot generates a ready-to-use SD card image that you can flash directly to
+the card. The image will be in output/images/sdcard.img.
+You can write this image directly to an SD card device (i.e. /dev/xxx):
+
+  $ dd if=output/images/sdcard.img of=/dev/xxx
+
+Finally, you can insert the SD card to the Firefly RK3288 board and boot it.
diff --git a/board/firefly/firefly-rk3288/sd-image.cfg b/board/firefly/firefly-rk3288/sd-image.cfg
new file mode 100644
index 0000000..a9eb9f0
--- /dev/null
+++ b/board/firefly/firefly-rk3288/sd-image.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot-spl-dtb {
+    in-partition-table = "no"
+    image = "u-boot-spl-dtb.img"
+    offset = 32K
+  }
+
+  partition u-boot-dtb {
+    in-partition-table = "no"
+    image = "u-boot-dtb.img"
+    offset = 128K
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    size = 512M
+  }
+}
diff --git a/configs/firefly_rk3288_defconfig b/configs/firefly_rk3288_defconfig
new file mode 100644
index 0000000..a4eaa44
--- /dev/null
+++ b/configs/firefly_rk3288_defconfig
@@ -0,0 +1,33 @@
+BR2_arm=y
+BR2_cortex_a12=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
+BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
+BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="firefly-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/firefly_rk3288_demo_defconfig b/configs/firefly_rk3288_demo_defconfig
new file mode 100644
index 0000000..2fa6a5b
--- /dev/null
+++ b/configs/firefly_rk3288_demo_defconfig
@@ -0,0 +1,41 @@
+BR2_arm=y
+BR2_cortex_a12=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.4"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="firefly-rk3288"
+BR2_TARGET_GENERIC_ISSUE="Welcome to FIREFLY RK3288!"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/firefly-rk3288/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/firefly/firefly-rk3288/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git at github.com:mmind/linux-rockchip.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ccb89e9b5657b4911c16d08e1581121222ee12c4"
+BR2_LINUX_KERNEL_DEFCONFIG="rk3288_veyron"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x02000000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-firefly"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_MALI_T76X=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="firefly-rk3288"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.0
