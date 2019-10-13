From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 21:22:26 -0300
Subject: [Buildroot] [PATCH 3/9] configs/beaglebone: don't use custom
 post-image script
In-Reply-To: <20191013002232.1045-1-unixmania@gmail.com>
References: <20191013002232.1045-1-unixmania@gmail.com>
Message-ID: <20191013002232.1045-4-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Use a post-build script to copy uEnv.txt to BINARIES_DIR, as made for
beagleboneai.

Keep the post-image script because it is still used by beaglebone_qt5.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
This should be made for beaglebone_qt5 too, but it's not possible to
test because it' broken since commit a7914499b80r:

    https://gitlab.com/buildroot.org/buildroot/-/jobs/289126249
---
 board/beaglebone/post-build.sh | 4 ++++
 configs/beaglebone_defconfig   | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100755 board/beaglebone/post-build.sh

diff --git a/board/beaglebone/post-build.sh b/board/beaglebone/post-build.sh
new file mode 100755
index 0000000000..ffdd19138c
--- /dev/null
+++ b/board/beaglebone/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index d88b4253ef..ee97f80322 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -2,7 +2,9 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-- 
2.18.1
