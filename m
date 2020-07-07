From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@collabora.com>
Date: Tue,  7 Jul 2020 09:53:39 +0200
Subject: [Buildroot] [PATCH 3/3] configs/lepotato: Add new defconfig
In-Reply-To: <20200707075339.389528-1-mylene.josserand@collabora.com>
References: <20200707075339.389528-1-mylene.josserand@collabora.com>
Message-ID: <20200707075339.389528-4-mylene.josserand@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a basic support for the Libre Computer board called "Le Potato".
One particularity is that this board is using FIP utilities to sign
a mainline u-boot. The defconfig reflects that.

The final image produced is a sd-card image.

Signed-off-by: Myl?ne Josserand <mylene.josserand@collabora.com>
---
 .gitlab-ci.yml                             |  1 +
 DEVELOPERS                                 |  2 +
 board/librecomputer/lepotato/boot.cmd      |  6 +++
 board/librecomputer/lepotato/genimage.cfg  | 28 ++++++++++
 board/librecomputer/lepotato/post-build.sh | 61 ++++++++++++++++++++++
 board/librecomputer/lepotato/post-image.sh | 17 ++++++
 board/librecomputer/lepotato/readme.txt    | 35 +++++++++++++
 configs/lepotato_defconfig                 | 29 ++++++++++
 8 files changed, 179 insertions(+)
 create mode 100644 board/librecomputer/lepotato/boot.cmd
 create mode 100644 board/librecomputer/lepotato/genimage.cfg
 create mode 100755 board/librecomputer/lepotato/post-build.sh
 create mode 100755 board/librecomputer/lepotato/post-image.sh
 create mode 100644 board/librecomputer/lepotato/readme.txt
 create mode 100644 configs/lepotato_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 951f843cf2..01044ebd98 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -215,6 +215,7 @@ imx8mmpico_defconfig: { extends: .defconfig }
 imx8mpico_defconfig: { extends: .defconfig }
 lafrite_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
+lepotato_defconfig: { extends: .defconfig }
 licheepi_zero_defconfig: { extends: .defconfig }
 linksprite_pcduino_defconfig: { extends: .defconfig }
 minnowboard_max-graphical_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index f36ba64114..91cc080304 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1845,6 +1845,8 @@ F:	package/libgeotiff/
 
 N:	Myl?ne Josserand <mylene.josserand@collabora.com>
 F:	package/rtl8723bu/
+F:	board/librecomputer/lepotato/
+F:	configs/lepotato_defconfig
 
 N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
diff --git a/board/librecomputer/lepotato/boot.cmd b/board/librecomputer/lepotato/boot.cmd
new file mode 100644
index 0000000000..5e5ae2d727
--- /dev/null
+++ b/board/librecomputer/lepotato/boot.cmd
@@ -0,0 +1,6 @@
+setenv bootargs console=ttyAML0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
+
+fatload mmc 0 $kernel_addr_r Image
+fatload mmc 0 $fdt_addr_r meson-gxl-s905x-libretech-cc.dtb
+
+booti $kernel_addr_r - $fdt_addr_r
diff --git a/board/librecomputer/lepotato/genimage.cfg b/board/librecomputer/lepotato/genimage.cfg
new file mode 100644
index 0000000000..96a52e1b53
--- /dev/null
+++ b/board/librecomputer/lepotato/genimage.cfg
@@ -0,0 +1,28 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"meson-gxl-s905x-libretech-cc.dtb",
+			"boot.scr"
+		}
+	}
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
\ No newline at end of file
diff --git a/board/librecomputer/lepotato/post-build.sh b/board/librecomputer/lepotato/post-build.sh
new file mode 100755
index 0000000000..d08face559
--- /dev/null
+++ b/board/librecomputer/lepotato/post-build.sh
@@ -0,0 +1,61 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+AML_BIN_DIR=${HOST_DIR}/usr/bin/fip/
+FIP_BUILD=${BINARIES_DIR}/fip/
+
+# Rename u-boot binary into bl33.bin and copy binaries
+install -m 0644 -D ${BINARIES_DIR}/u-boot.bin	${FIP_BUILD}/bl33.bin
+install -m 0644 ${AML_BIN_DIR}/bl2.bin		${FIP_BUILD}/
+install -m 0644 ${AML_BIN_DIR}/acs.bin		${FIP_BUILD}/
+install -m 0644 ${AML_BIN_DIR}/bl21.bin	${FIP_BUILD}/
+install -m 0644 ${AML_BIN_DIR}/bl30.bin	${FIP_BUILD}/
+install -m 0644 ${AML_BIN_DIR}/bl301.bin	${FIP_BUILD}/
+install -m 0644 ${AML_BIN_DIR}/bl31.img	${FIP_BUILD}/
+
+# Use Amlogic scripts
+${AML_BIN_DIR}/blx_fix.sh				\
+	      ${FIP_BUILD}/bl30.bin			\
+	      ${FIP_BUILD}/zero_tmp			\
+	      ${FIP_BUILD}/bl30_zero.bin		\
+	      ${FIP_BUILD}/bl301.bin			\
+	      ${FIP_BUILD}/bl301_zero.bin		\
+	      ${FIP_BUILD}/bl30_new.bin		\
+	      bl30
+
+${HOST_DIR}/bin/python3 ${AML_BIN_DIR}/acs_tool.py	\
+	   ${FIP_BUILD}/bl2.bin 			\
+	   ${FIP_BUILD}/bl2_acs.bin			\
+	   ${FIP_BUILD}/acs.bin 			\
+	   0
+
+${AML_BIN_DIR}/blx_fix.sh				\
+	      ${FIP_BUILD}/bl2_acs.bin			\
+	      ${FIP_BUILD}/zero_tmp			\
+	      ${FIP_BUILD}/bl2_zero.bin		\
+	      ${FIP_BUILD}/bl21.bin 			\
+	      ${FIP_BUILD}/bl21_zero.bin		\
+	      ${FIP_BUILD}/bl2_new.bin			\
+	      bl2
+
+# encrypt bootloader
+${AML_BIN_DIR}/aml_encrypt_gxl --bl3enc \
+	      --input ${FIP_BUILD}/bl30_new.bin
+
+${AML_BIN_DIR}/aml_encrypt_gxl --bl3enc \
+	      --input ${FIP_BUILD}/bl31.img
+
+${AML_BIN_DIR}/aml_encrypt_gxl --bl3enc \
+	      --input ${FIP_BUILD}/bl33.bin
+
+${AML_BIN_DIR}/aml_encrypt_gxl --bl2sig \
+	      --input ${FIP_BUILD}/bl2_new.bin \
+	      --output ${FIP_BUILD}/bl2.n.bin.sig
+
+# Generate last encryption to create u-boot binaries
+${AML_BIN_DIR}/aml_encrypt_gxl --bootmk		\
+	      --output ${BINARIES_DIR}/u-boot.bin	\
+	      --bl2    ${FIP_BUILD}/bl2.n.bin.sig	\
+	      --bl30   ${FIP_BUILD}/bl30_new.bin.enc	\
+	      --bl31   ${FIP_BUILD}/bl31.img.enc	\
+	      --bl33   ${FIP_BUILD}/bl33.bin.enc
diff --git a/board/librecomputer/lepotato/post-image.sh b/board/librecomputer/lepotato/post-image.sh
new file mode 100755
index 0000000000..8bc0d4efe7
--- /dev/null
+++ b/board/librecomputer/lepotato/post-image.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+        --rootpath "${TARGET_DIR}"     \
+        --tmppath "${GENIMAGE_TMP}"    \
+        --inputpath "${BINARIES_DIR}"  \
+        --outputpath "${BINARIES_DIR}" \
+        --config "${GENIMAGE_CFG}"
+
+dd if=${BINARIES_DIR}/u-boot.bin.sd.bin of=${BINARIES_DIR}/sdcard.img conv=fsync,notrunc bs=1 count=442 status=progress
+dd if=${BINARIES_DIR}/u-boot.bin.sd.bin of=${BINARIES_DIR}/sdcard.img conv=fsync,notrunc bs=512 skip=1 seek=1 status=progress
diff --git a/board/librecomputer/lepotato/readme.txt b/board/librecomputer/lepotato/readme.txt
new file mode 100644
index 0000000000..b9e62b164e
--- /dev/null
+++ b/board/librecomputer/lepotato/readme.txt
@@ -0,0 +1,35 @@
+Intro
+=====
+
+Libre Computer "Le Potato" is a low cost SBC based around an Amlogic
+s905xcc SoC (quad Cortex-A53) including 2GB DDR3. To see its specification,
+look at the website:
+
+https://libre.computer/products/boards/aml-s905x-cc/
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make lepotato_defconfig
+
+Compile everything and build the SD-card image:
+
+    $ make
+
+How to write the SD-card image
+======================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the image "sdcard.img" onto a SD-card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX status=progress
+
+How to boot
+===========
+
+Insert the SD-card in the slot and power up board. The system will boot
+automatically.
diff --git a/configs/lepotato_defconfig b/configs/lepotato_defconfig
new file mode 100644
index 0000000000..95934075ad
--- /dev/null
+++ b/configs/lepotato_defconfig
@@ -0,0 +1,29 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/librecomputer/lepotato/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/librecomputer/lepotato/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s905x-libretech-cc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="65M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="libretech-cc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT=y
+BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/librecomputer/lepotato/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_FIP=y
+BR2_PACKAGE_HOST_FIP_LEPOTATO=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.27.0
