From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 21:03:55 +0100
Subject: [Buildroot] [git commit] configs/nitrogen6*: update to use genimage
Message-ID: <20160201224712.465CD7F8C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7df1e23cc6eb1033c714ac82ff9cd50350151f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also updating the documentation with the dd instruction to flash the
bootable media.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/boundarydevices/nitrogen6x/genimage.cfg  | 16 ++++++++++++++++
 board/boundarydevices/nitrogen6x/post-image.sh | 16 ++++++++++++++++
 board/boundarydevices/nitrogen6x/readme.txt    |  6 +++---
 configs/nitrogen6sx_defconfig                  |  4 +++-
 configs/nitrogen6x_defconfig                   |  4 +++-
 5 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/genimage.cfg b/board/boundarydevices/nitrogen6x/genimage.cfg
new file mode 100644
index 0000000..7a5e71e
--- /dev/null
+++ b/board/boundarydevices/nitrogen6x/genimage.cfg
@@ -0,0 +1,16 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.imx"
+		offset = 1024
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/boundarydevices/nitrogen6x/post-image.sh b/board/boundarydevices/nitrogen6x/post-image.sh
new file mode 100755
index 0000000..9cca1b1
--- /dev/null
+++ b/board/boundarydevices/nitrogen6x/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
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
+exit $?
diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
index 8657be8..6c723f1 100644
--- a/board/boundarydevices/nitrogen6x/readme.txt
+++ b/board/boundarydevices/nitrogen6x/readme.txt
@@ -2,11 +2,11 @@ Buildroot for Boundary Devices Nitrogen6X:
 
 http://boundarydevices.com/products/nitrogen6x-board-imx6-arm-cortex-a9-sbc/
 
-To install, simply write rootfs.ext2 to the first partition of a uSD card:
+To install, simply copy the image to a uSD card:
 
-sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
+sudo dd if=output/images/sdcard.img of=/dev/sdX
 
-Where 'sdX1' is the device node of the uSD partition.
+Where 'sdX' is the device node of the uSD partition.
 
 To upgrade u-boot, cancel autoboot and type:
 
diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 3670798..70e6376 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -6,11 +6,13 @@ BR2_cortex_a9=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_2r1=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Lock headers to match kernel
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 979bf09..af4a187 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -6,11 +6,13 @@ BR2_cortex_a9=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
+BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_2r1=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Lock headers to match kernel
 BR2_KERNEL_HEADERS_VERSION=y
