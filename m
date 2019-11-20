From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 12:07:24 +0800
Subject: [Buildroot] [PATCH 8/9] board/freescale/common/ls: Add standard
 post image script for Layerscape processors
In-Reply-To: <20191120040725.32207-1-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
Message-ID: <20191120040725.32207-9-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the standard post image script for Layerscape processors (LS1028A
and other processors).

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
 board/freescale/common/ls/busybox.config    |  9 ++
 board/freescale/common/ls/post-image-spi.sh | 64 ++++++++++++++
 board/freescale/common/ls/post-image.sh     | 92 +++++++++++++++++++++
 3 files changed, 165 insertions(+)
 create mode 100644 board/freescale/common/ls/busybox.config
 create mode 100755 board/freescale/common/ls/post-image-spi.sh
 create mode 100755 board/freescale/common/ls/post-image.sh

diff --git a/board/freescale/common/ls/busybox.config b/board/freescale/common/ls/busybox.config
new file mode 100644
index 0000000000..7074c65aa6
--- /dev/null
+++ b/board/freescale/common/ls/busybox.config
@@ -0,0 +1,9 @@
+#
+# Additional Busybox Settings
+#
+CONFIG_TASKSET=y
+CONFIG_FEATURE_TASKSET_FANCY=y
+CONFIG_FEATURE_DF_FANCY=y
+CONFIG_FEATURE_SEAMLESS_GZ=y
+CONFIG_FEATURE_SEAMLESS_BZ2=y
+CONFIG_FEATURE_SEAMLESS_XZ=y
diff --git a/board/freescale/common/ls/post-image-spi.sh b/board/freescale/common/ls/post-image-spi.sh
new file mode 100755
index 0000000000..5e63b005ed
--- /dev/null
+++ b/board/freescale/common/ls/post-image-spi.sh
@@ -0,0 +1,64 @@
+#!/usr/bin/env bash
+# args from BR2_ROOTFS_POST_SCRIPT_ARGS
+# $2 linux building directory
+# $3 buildroot top directory
+# $4 u-boot building directory
+#
+plat_name()
+{
+	if grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"ls1028ardb\"$" ${BR2_CONFIG}; then
+		echo "ls1028ardb"
+	fi
+}
+
+# genimage.qspi.cfg.template: Boot from 64MB QSPI flash
+# genimage.xspi.256MB.cfg.template: Boot from 256MB flexSPI_nor flash
+# genimage.xspi.64MB.cfg.template: Boot from 64MB flexSPI_nor flash
+# genimage.cfg.template: Boot from SD and eMMC
+#
+genimage_type()
+{
+        if grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"qspi\"$" ${BR2_CONFIG}; then
+                echo "genimage.qspi.cfg.template"
+        elif grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"flexspi_nor\"$" ${BR2_CONFIG}; then
+		echo "genimage.xspi.cfg.template"
+        elif grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"emmc\"$" ${BR2_CONFIG}; then
+                echo "genimage.emmc.cfg.template"
+        elif grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"sd\"$" ${BR2_CONFIG}; then
+                echo "genimage.sd.cfg.template"
+        fi
+}
+
+main()
+{
+	# build the itb image
+	cp board/freescale/$(plat_name)/kernel.its ${BINARIES_DIR}/kernel.its
+	cd ${BINARIES_DIR}/
+	/usr/bin/mkimage -f kernel.its kernel.itb
+	rm kernel.its
+
+	cd ${3}
+
+	# build the SDcard image
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+
+	sed -e "s/%FILES%/${FILES}/" \
+		board/freescale/$(plat_name)/$(genimage_type) > ${GENIMAGE_CFG}
+
+	rm -rf "${GENIMAGE_TMP}"
+
+	genimage \
+		--rootpath "${TARGET_DIR}" \
+		--tmppath "${GENIMAGE_TMP}" \
+		--inputpath "${BINARIES_DIR}" \
+		--outputpath "${BINARIES_DIR}" \
+		--config "${GENIMAGE_CFG}"
+
+	rm -f ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
diff --git a/board/freescale/common/ls/post-image.sh b/board/freescale/common/ls/post-image.sh
new file mode 100755
index 0000000000..a34894b167
--- /dev/null
+++ b/board/freescale/common/ls/post-image.sh
@@ -0,0 +1,92 @@
+#!/usr/bin/env bash
+# args from BR2_ROOTFS_POST_SCRIPT_ARGS
+# $2 linux building directory
+# $3 buildroot top directory
+# $4 u-boot building directory
+
+#
+# dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
+# in ${BR_CONFIG}, then prints the corresponding list of file names for the
+# genimage configuration file
+#
+dtb_file()
+{
+        local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([\/a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
+
+        for dt in $DTB_LIST; do
+                echo -n "\"`basename $dt`.dtb\", "
+        done
+}
+
+#
+# For Freescale/NXP Layerscape serial platforms (ARM v8), we use Image for SD/eMMC boot,
+# Image.gz for QSPI/XSPI boot. Then,prints the corresponding file name for the genimage
+# configuration file
+#
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_IMAGE_TARGET_NAME=\"Image\"$" ${BR2_CONFIG}; then
+		echo "\"Image\""
+	else
+		echo "\"Image.gz\""
+	fi
+}
+
+plat_name()
+{
+	if grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"ls1028ardb\"$" ${BR2_CONFIG}; then
+		echo "ls1028ardb"
+	fi
+}
+
+#
+# genimage.qspi.cfg.template: Boot from 64MB QSPI flash
+# genimage.xspi.256MB.cfg.template: Boot from 256MB flexSPI_nor flash
+# genimage.xspi.64MB.cfg.template: Boot from 64MB flexSPI_nor flash
+# genimage.cfg.template: Boot from SD and eMMC
+#
+genimage_type()
+{
+        if grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"qspi\"$" ${BR2_CONFIG}; then
+                echo "genimage.qspi.cfg.template"
+        elif grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"flexspi_nor\"$" ${BR2_CONFIG}; then
+		echo "genimage.xspi.cfg.template"
+        elif grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"emmc\"$" ${BR2_CONFIG}; then
+                echo "genimage.emmc.cfg.template"
+        elif grep -Eq "^BR2_PACKAGE_HOST_RCW_BOOT_MODE=\"sd\"$" ${BR2_CONFIG}; then
+                echo "genimage.sd.cfg.template"
+        fi
+}
+
+dp_fw()
+{
+	if grep -Eq "^BR2_PACKAGE_CADENCE_DP_BIN=\"ls1028a-dp-fw.bin\"$" ${BR2_CONFIG}; then
+		echo "\"ls1028a-dp-fw.bin\", "
+
+	fi
+}
+
+main()
+{
+	local FILES="$(dtb_file) $(dp_fw) $(linux_image)"
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+	sed -e "s/%FILES%/${FILES}/" \
+		board/freescale/$(plat_name)/$(genimage_type) > ${GENIMAGE_CFG}
+
+	rm -rf "${GENIMAGE_TMP}"
+
+	genimage \
+		--rootpath "${TARGET_DIR}" \
+		--tmppath "${GENIMAGE_TMP}" \
+		--inputpath "${BINARIES_DIR}" \
+		--outputpath "${BINARIES_DIR}" \
+		--config "${GENIMAGE_CFG}"
+
+	rm -f ${GENIMAGE_CFG}
+
+	exit $?
+}
+
+main $@
-- 
2.17.1
