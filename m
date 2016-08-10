From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:06:05 +0200
Subject: [Buildroot] [PATCH 09/11] Update genimage configuration file and
	add post-image.sh script for Aria G25 in order to build a
	bootable SD card image named "sdcard.img"
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-11-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/aria-g25/genimage.cfg  | 29 +++++++++++++++++++++++++++++
 board/acmesystems/aria-g25/post-image.sh | 16 ++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 board/acmesystems/aria-g25/genimage.cfg
 create mode 100755 board/acmesystems/aria-g25/post-image.sh

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
new file mode 100644
index 0000000..12b5be6
--- /dev/null
+++ b/board/acmesystems/aria-g25/genimage.cfg
@@ -0,0 +1,29 @@
+# Minimal SD card image for the Acmesystems Aria-G25
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"acme-aria.dtb",
+			"boot.bin"
+		}
+	}
+	size = 16M
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
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/acmesystems/aria-g25/post-image.sh b/board/acmesystems/aria-g25/post-image.sh
new file mode 100755
index 0000000..c82b189
--- /dev/null
+++ b/board/acmesystems/aria-g25/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
-- 
2.7.4
