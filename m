From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 12:20:46 +0100
Subject: [Buildroot] [git commit] configs/beaglebone: don't use custom
 post-image script
Message-ID: <20191027111553.E06F58906A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5570bf98502583da3961bc33731b8d8c0cf7d09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use support/scripts/genimage.sh, instead, which prevents duplicating
TARGET_DIR under ${BUILD_DIR}/genimage.tmp/root.

Use a post-build script to copy uEnv.txt to BINARIES_DIR, as made for
beagleboneai.

Keep the post-image script because it is still used by beaglebone_qt5.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/post-build.sh | 4 ++++
 configs/beaglebone_defconfig   | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

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
