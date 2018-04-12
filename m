From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Thu, 12 Apr 2018 14:35:24 +0200
Subject: [Buildroot] [PATCH 3/4] imx: add imx8 boot preparation script
In-Reply-To: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1523536525-10280-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1523536525-10280-3-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new script, imx8-prepare-boot.sh, that finalize
the boot file for a specific iMX8 board. Currently only
imx8mqevk is available and supported.

Also add genimage template for iMX8.

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
 .../common/imx/genimage.cfg.template_imx8          | 40 ++++++++++++++++++++++
 .../common/imx/imx8-bootloader-prepare.sh          | 16 +++++++++
 board/freescale/common/imx/post-image.sh           |  4 ++-
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
 create mode 100755 board/freescale/common/imx/imx8-bootloader-prepare.sh

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
new file mode 100644
index 0000000..fdb6450
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_imx8
@@ -0,0 +1,40 @@
+# Minimal SD card image for the Freescale iMX8 boards
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 33 kB free space at the beginning,
+# * U-Boot is integrated into imx8-boot-sd.bin and is dumped as is,
+# * a FAT partition at offset 32MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 32M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition imx-boot {
+    in-partition-table = "no"
+    image = "imx8-boot-sd.bin"
+    offset = 33K
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext2"
+  }
+}
diff --git a/board/freescale/common/imx/imx8-bootloader-prepare.sh b/board/freescale/common/imx/imx8-bootloader-prepare.sh
new file mode 100755
index 0000000..2648147
--- /dev/null
+++ b/board/freescale/common/imx/imx8-bootloader-prepare.sh
@@ -0,0 +1,16 @@
+#!/usr/bin/env bash
+
+main ()
+{
+	# Currently we support imx8mqevk.
+	cat ${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/lpddr4_pmu_train_fw.bin > ${BINARIES_DIR}/u-boot-spl-ddr.bin
+	BL31=${BINARIES_DIR}/bl31.bin BL33=${BINARIES_DIR}/u-boot.bin ${HOST_DIR}/bin/mkimage_fit_atf.sh ${BINARIES_DIR}/fsl-imx8mq-evk.dtb > ${BINARIES_DIR}/u-boot.its
+	${HOST_DIR}/bin/mkimage -E -p 0x3000 -f ${BINARIES_DIR}/u-boot.its ${BINARIES_DIR}/u-boot.itb
+	rm -f ${BINARIES_DIR}/u-boot.its
+
+	${HOST_DIR}/bin/mkimage_imx8 -fit -signed_hdmi ${BINARIES_DIR}/signed_hdmi_imx8m.bin -loader ${BINARIES_DIR}/u-boot-spl-ddr.bin 0x7E1000 -second_loader ${BINARIES_DIR}/u-boot.itb 0x40200000 0x60000 -out ${BINARIES_DIR}/imx8-boot-sd.bin
+
+	exit $?
+}
+
+main $@
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 70d2c9c..264c8a4 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -32,7 +32,9 @@ linux_image()
 
 genimage_type()
 {
-	if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
+	if grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M=y$" ${BR2_CONFIG}; then
+		echo "genimage.cfg.template_imx8"
+	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
 		echo "genimage.cfg.template_spl"
 	else
 		echo "genimage.cfg.template"
-- 
2.7.4
