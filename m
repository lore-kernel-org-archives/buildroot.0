From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 17:24:45 +0100
Subject: [Buildroot] [git commit] board/orangepi: drop redundant files
Message-ID: <20161215163013.63B09818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1a9fb9ddbc4e6520b9eeee43d45817f9e4a62aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The orangepi board variants use identical post-build and post-image scripts,
so move them up to board/orangepi and add symlinks in the variant
subdirectories, similary to how we handle it for the raspberry pi variants.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-one/post-build.sh      | 12 +-----------
 board/orangepi/orangepi-one/post-image.sh      | 15 +--------------
 board/orangepi/orangepi-pc/post-build.sh       | 12 +-----------
 board/orangepi/orangepi-pc/post-image.sh       | 15 +--------------
 board/orangepi/{orangepi-pc => }/post-build.sh |  2 +-
 board/orangepi/{orangepi-pc => }/post-image.sh |  0
 6 files changed, 5 insertions(+), 51 deletions(-)

diff --git a/board/orangepi/orangepi-one/post-build.sh b/board/orangepi/orangepi-one/post-build.sh
deleted file mode 100755
index 46e8905..0000000
--- a/board/orangepi/orangepi-one/post-build.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# post-build.sh for OrangePi One taken from CubieBoard's post-build.sh
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-
-BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
-BOOT_CMD=$BOARD_DIR/boot.cmd
-BOOT_CMD_H=$BINARIES_DIR/boot.scr
-
-# U-Boot script
-$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/orangepi/orangepi-one/post-build.sh b/board/orangepi/orangepi-one/post-build.sh
new file mode 120000
index 0000000..cd7f116
--- /dev/null
+++ b/board/orangepi/orangepi-one/post-build.sh
@@ -0,0 +1 @@
+../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-one/post-image.sh b/board/orangepi/orangepi-one/post-image.sh
deleted file mode 100755
index 359b4c9..0000000
--- a/board/orangepi/orangepi-one/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/board/orangepi/orangepi-one/post-image.sh b/board/orangepi/orangepi-one/post-image.sh
new file mode 120000
index 0000000..ae6294f
--- /dev/null
+++ b/board/orangepi/orangepi-one/post-image.sh
@@ -0,0 +1 @@
+../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/post-build.sh b/board/orangepi/orangepi-pc/post-build.sh
deleted file mode 100755
index ca7a99f..0000000
--- a/board/orangepi/orangepi-pc/post-build.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# post-build.sh for OrangePi PC taken from CubieBoard's post-build.sh
-# 2013, Carlo Caione <carlo.caione@gmail.com>
-
-BOARD_DIR="$(dirname $0)"
-MKIMAGE=$HOST_DIR/usr/bin/mkimage
-BOOT_CMD=$BOARD_DIR/boot.cmd
-BOOT_CMD_H=$BINARIES_DIR/boot.scr
-
-# U-Boot script
-$MKIMAGE -C none -A arm -T script -d $BOOT_CMD $BOOT_CMD_H
diff --git a/board/orangepi/orangepi-pc/post-build.sh b/board/orangepi/orangepi-pc/post-build.sh
new file mode 120000
index 0000000..cd7f116
--- /dev/null
+++ b/board/orangepi/orangepi-pc/post-build.sh
@@ -0,0 +1 @@
+../post-build.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/post-image.sh b/board/orangepi/orangepi-pc/post-image.sh
deleted file mode 100755
index 359b4c9..0000000
--- a/board/orangepi/orangepi-pc/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                               \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/board/orangepi/orangepi-pc/post-image.sh b/board/orangepi/orangepi-pc/post-image.sh
new file mode 120000
index 0000000..ae6294f
--- /dev/null
+++ b/board/orangepi/orangepi-pc/post-image.sh
@@ -0,0 +1 @@
+../post-image.sh
\ No newline at end of file
diff --git a/board/orangepi/orangepi-pc/post-build.sh b/board/orangepi/post-build.sh
similarity index 78%
copy from board/orangepi/orangepi-pc/post-build.sh
copy to board/orangepi/post-build.sh
index ca7a99f..a544a19 100755
--- a/board/orangepi/orangepi-pc/post-build.sh
+++ b/board/orangepi/post-build.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# post-build.sh for OrangePi PC taken from CubieBoard's post-build.sh
+# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
 # 2013, Carlo Caione <carlo.caione@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
diff --git a/board/orangepi/orangepi-pc/post-image.sh b/board/orangepi/post-image.sh
similarity index 100%
copy from board/orangepi/orangepi-pc/post-image.sh
copy to board/orangepi/post-image.sh
