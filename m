From: Alexandre Gambier <agambier.dev@gmail.com>
Date: Wed, 11 Oct 2017 14:19:32 +0200
Subject: [Buildroot] [PATCH 3/9] iMX6S-PICO: add post image scripts
In-Reply-To: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
References: <1507724378-23461-1-git-send-email-agambier.dev@gmail.com>
Message-ID: <1507724378-23461-3-git-send-email-agambier.dev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Gambier <agambier.dev@gmail.com>
---
 board/technexion/imx6spico/genimage.cfg.template | 40 ++++++++++++++++++
 board/technexion/imx6spico/post-image.sh         | 54 ++++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 board/technexion/imx6spico/genimage.cfg.template
 create mode 100755 board/technexion/imx6spico/post-image.sh

diff --git a/board/technexion/imx6spico/genimage.cfg.template b/board/technexion/imx6spico/genimage.cfg.template
new file mode 100644
index 0000000..45450a9
--- /dev/null
+++ b/board/technexion/imx6spico/genimage.cfg.template
@@ -0,0 +1,40 @@
+# Minimal SD card image for the Freescale boards Template
+#
+# We mimic the .sdcard Freescale's image format:
+# * the SD card must have 1 kB free space at the beginning,
+# * U-Boot is dumped as is,
+# * a FAT partition at offset 8 MB is containing zImage/uImage and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      %FILES%
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "SPL"
+    offset = 1024
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
diff --git a/board/technexion/imx6spico/post-image.sh b/board/technexion/imx6spico/post-image.sh
new file mode 100755
index 0000000..52b423a
--- /dev/null
+++ b/board/technexion/imx6spico/post-image.sh
@@ -0,0 +1,54 @@
+#!/usr/bin/env bash
+
+#
+# dtb_list extracts the list of DTB files from BR2_LINUX_KERNEL_INTREE_DTS_NAME
+# in ${BR_CONFIG}, then prints the corresponding list of file names for the
+# genimage configuration file
+#
+dtb_list()
+{
+	local DTB_LIST="imx6dl-pico_dwarf"
+
+	for dt in $DTB_LIST; do
+		echo -n "\"$dt.dtb\", "
+	done
+}
+
+#
+# linux_image extracts the Linux image format from BR2_LINUX_KERNEL_UIMAGE in
+# ${BR_CONFIG}, then prints the corresponding file name for the genimage
+# configuration file
+#
+linux_image()
+{
+	if grep -Eq "^BR2_LINUX_KERNEL_UIMAGE=y$" ${BR2_CONFIG}; then
+		echo "\"uImage\""
+	else
+		echo "\"zImage\""
+	fi
+}
+
+main()
+{
+	local FILES="$(dtb_list) $(linux_image), \"u-boot.img\""
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+	sed -e "s/%FILES%/${FILES}/" \
+		board/technexion/imx6spico/genimage.cfg.template > ${GENIMAGE_CFG}
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
2.7.4
