From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 22:41:42 +0100
Subject: [Buildroot] [git commit branch/next] freescale: Add a standard
	genimage script for MX23/MX28
Message-ID: <20161106214220.C9E8F81770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61331ac08e688ba5cf2913a09cbb3c54892cd54a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a standard genimage script for the MXS processors (MX23 and MX28).

Based on the common scripts for the other imx devices:
board/freescale/common/genimage.cfg.template
board/freescale/common/post-image.sh

This makes it easier to add new MX23/MX28 boards configurations into
Buildroot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/common/mxs/genimage.cfg.template | 39 +++++++++++++++++
 board/freescale/common/mxs/post-image.sh         | 54 ++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/board/freescale/common/mxs/genimage.cfg.template b/board/freescale/common/mxs/genimage.cfg.template
new file mode 100644
index 0000000..e094fb7
--- /dev/null
+++ b/board/freescale/common/mxs/genimage.cfg.template
@@ -0,0 +1,39 @@
+# Minimal SD card image for the Freescale MX23/MX28 Template
+#
+# We mimic the .sdcard Freescale's MX23/MX28 image format:
+# * u-boot.sb is placed at offset 1M,
+# * a FAT partition at offset 16 MB is containing zImage/uImage and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+	vfat {
+		files = {
+			%FILES%
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0x53
+		image = "u-boot.sd"
+		offset = 1M
+		size = 16M
+	}
+
+	partition kernel {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/freescale/common/mxs/post-image.sh b/board/freescale/common/mxs/post-image.sh
new file mode 100755
index 0000000..0bfb835
--- /dev/null
+++ b/board/freescale/common/mxs/post-image.sh
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
+	local DTB_LIST="$(sed -n 's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9 \-]*\)"$/\1/p' ${BR2_CONFIG})"
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
+	local FILES="$(dtb_list) $(linux_image)"
+	local GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
+	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+	sed -e "s/%FILES%/${FILES}/" \
+		board/freescale/common/mxs/genimage.cfg.template > ${GENIMAGE_CFG}
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
