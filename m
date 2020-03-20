From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 22:35:48 +0100
Subject: [Buildroot] [git commit] board/chiliboard: drop custom post-image
 script
Message-ID: <20200320212303.5401A82B7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a972f4af100925b6e7c6dde45ffec5d31bb9498c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead use generic genimage.sh script.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/grinn/chiliboard/post-image.sh | 14 --------------
 configs/grinn_chiliboard_defconfig   |  3 ++-
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/board/grinn/chiliboard/post-image.sh b/board/grinn/chiliboard/post-image.sh
deleted file mode 100755
index 1a076eecb8..0000000000
--- a/board/grinn/chiliboard/post-image.sh
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
diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index ab89bbf8f3..f3edf90de4 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -2,7 +2,8 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/grinn/chiliboard/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.1"
