From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:35:07 +0100
Subject: [Buildroot] [git commit] configs/qemu_arm_vexpress_tz_defconfig:
 build start-qemu.sh
Message-ID: <20201205211939.6D8D88352E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16430fd8c607eec3e4447d67317e4af858ec4217
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When tags was added by commit 011206b2bffd509b29365bc1eaa761414ee13726
to detect the qemu command line, the qemu_arm_vexpress_tz_defconfig
was ignored due to a build issue.

This build issue has been fixed by previous patches, so we can
enable the runtime testing by adding the tag in the readme.txt
and the post-image script in the defconfig.

Since Qemu from HOST_DIR is now executed directly from BINARIES_DIR,
we can remove all the string before "qemu-system-*".

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/arm-vexpress-tz/readme.txt  | 2 +-
 board/qemu/post-image.sh               | 3 +++
 configs/qemu_arm_vexpress_tz_defconfig | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index b235ba5cd7..abce750291 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -18,7 +18,7 @@ secure and non-secure worlds.
 	-serial stdio \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
 	-semihosting-config enable,target=native \
-	-bios bl1.bin
+	-bios bl1.bin # qemu_arm_vexpress_tz_defconfig
 
 The boot stage traces (if any) followed by the login prompt will appear
 in the terminal that started QEMU.
diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 404f77411c..88f0413496 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -27,6 +27,9 @@ QEMU_CMD_LINE="${QEMU_CMD_LINE//output\/images\//}"
 DEFAULT_ARGS="$(sed -r -e '/-serial stdio/!d; s/.*(-serial stdio).*/\1/' <<<"${QEMU_CMD_LINE}")"
 QEMU_CMD_LINE="${QEMU_CMD_LINE//-serial stdio/}"
 
+# Remove any string before qemu-system-*
+QEMU_CMD_LINE="$(sed -r -e 's/^.*(qemu-system-)/\1/' <<<"${QEMU_CMD_LINE}")"
+
 # Disable graphical output and redirect serial I/Os to console
 case ${DEFCONFIG_NAME} in
   (qemu_sh4eb_r2d_defconfig|qemu_sh4_r2d_defconfig)
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 5aeb6b4290..7f5a06f0ab 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -43,6 +43,10 @@ BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
 BR2_PACKAGE_OPTEE_TEST=y
 
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
 # U-boot for booting the dear Linux kernel
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
