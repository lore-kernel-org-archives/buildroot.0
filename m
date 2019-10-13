From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:31 -0300
Subject: [Buildroot] [PATCH 8/9] configs/roseapplepi: drop custom post-image
 script
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191013002232.1045-9-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
The defconfig was edited by hand to reduce the turmoild that would
result from using "make savedefconfig"
---
 board/roseapplepi/post-build.sh |  4 ++++
 board/roseapplepi/post-image.sh | 18 ------------------
 configs/roseapplepi_defconfig   |  4 +++-
 3 files changed, 7 insertions(+), 19 deletions(-)
 create mode 100755 board/roseapplepi/post-build.sh
 delete mode 100755 board/roseapplepi/post-image.sh

diff --git a/board/roseapplepi/post-build.sh b/board/roseapplepi/post-build.sh
new file mode 100755
index 0000000000..ffdd19138c
--- /dev/null
+++ b/board/roseapplepi/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
diff --git a/board/roseapplepi/post-image.sh b/board/roseapplepi/post-image.sh
deleted file mode 100755
index e8f2df23f3..0000000000
--- a/board/roseapplepi/post-image.sh
+++ /dev/null
@@ -1,18 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-exit $?
diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index 966d444a45..d315a02e16 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -8,7 +8,9 @@ BR2_GLOBAL_PATCH_DIR="board/roseapplepi/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 # kernel does not build with gcc 8.x
 BR2_GCC_VERSION_7_X=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/roseapplepi/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/roseapplepi/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/roseapplepi/genimage.cfg"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-- 
2.18.1
