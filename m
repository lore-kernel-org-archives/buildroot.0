From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 20 Mar 2020 16:45:37 +0100
Subject: [Buildroot] [PATCH 1/2] board/liteboard: drop custom post-image
 script
Message-ID: <20200320154538.3115525-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead use generic genimage.sh script.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Tested-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 board/grinn/liteboard/post-image.sh | 14 --------------
 configs/grinn_liteboard_defconfig   |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100755 board/grinn/liteboard/post-image.sh

diff --git a/board/grinn/liteboard/post-image.sh b/board/grinn/liteboard/post-image.sh
deleted file mode 100755
index 1a076eecb8..0000000000
--- a/board/grinn/liteboard/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/usr/bin/env bash
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
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
diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
index d48dfde715..58f2a6b40d 100644
--- a/configs/grinn_liteboard_defconfig
+++ b/configs/grinn_liteboard_defconfig
@@ -2,7 +2,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/liteboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/liteboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.23"
-- 
2.25.0
