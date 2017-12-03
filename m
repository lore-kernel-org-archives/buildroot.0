From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  3 Dec 2017 14:56:14 +0200
Subject: [Buildroot] [PATCH 3/8] odroidc2: add post build script.
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203125619.30919-3-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

add post-build script to generate uboot's scr file and the kernel's
uImage file.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/post-build.sh | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 board/hardkernel/odroidc2/post-build.sh

diff --git a/board/hardkernel/odroidc2/post-build.sh b/board/hardkernel/odroidc2/post-build.sh
new file mode 100755
index 0000000000..6e2e71e501
--- /dev/null
+++ b/board/hardkernel/odroidc2/post-build.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+# post-build.sh for Odroid C2 taken from CubieBoard's post-build.sh
+# 2013, Carlo Caione <carlo.caione@gmail.com>
+
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOOT_CMD=$BOARD_DIR/boot.cmd
+BOOT_CMD_H=$BINARIES_DIR/boot.scr
+
+# U-Boot script
+${MKIMAGE} -C none -A arm -T script -d ${BOOT_CMD} ${BOOT_CMD_H}
+
+# vendor u-boot uses uImage
+if [ -f "${BINARIES_DIR}/Image" ]; then
+    ${MKIMAGE} -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 \
+	     -n linux -d ${BINARIES_DIR}/Image ${BINARIES_DIR}/uImage
+fi
-- 
2.15.1
