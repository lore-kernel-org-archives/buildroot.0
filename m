From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:28 -0300
Subject: [Buildroot] [PATCH 5/9] configs/minnowboard_max: drop custom
 post-image script
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191013002232.1045-6-unixmania@gmail.com>
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
 board/minnowboard/post-image.sh   | 13 -------------
 configs/minnowboard_max_defconfig |  3 ++-
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100755 board/minnowboard/post-image.sh

diff --git a/board/minnowboard/post-image.sh b/board/minnowboard/post-image.sh
deleted file mode 100755
index 428baa5e55..0000000000
--- a/board/minnowboard/post-image.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh -e
-
-GENIMAGE_CFG="board/minnowboard/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage \
-    --rootpath "${TARGET_DIR}" \
-    --tmppath "${GENIMAGE_TMP}" \
-    --inputpath "${BINARIES_DIR}" \
-    --outputpath "${BINARIES_DIR}" \
-    --config "${GENIMAGE_CFG}"
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 523ddffd51..fef597c350 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -5,7 +5,8 @@ BR2_x86_silvermont=y
 # Misc
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/minnowboard/genimage.cfg"
 
 # Linux headers same as kernel, a 4.19 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-- 
2.18.1
