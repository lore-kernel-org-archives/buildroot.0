From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 22:35:12 +0100
Subject: [Buildroot] [git commit] boards/zynq: rename the DTB to be loaded
 by U-Boot
Message-ID: <20171211213330.7CF9F804F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6465e4d34a4c1d94e73ec849297fc77b47b498a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are about to introduce genimage support for the Zynq boards. For
all of them U-Boot loads the DTB from a file named "devicetree.dtb" so
we need to rename it on the SD card image.

We could use genimage itself to rename files while creating the
image. But this would require a different genimage.cfg for each board,
leading to duplicate code.

Instead let's create a "devicetree.dtb" symlink pointing to the dtb
listed in the configuration. Currently all the Zynq-based boards have
only one DTS configured, but if one had two or more of them, the
symlink would point to the first one.

[Peter: only create symlink if dtb option is available]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/zynq/post-image.sh        | 11 +++++++++++
 configs/zynq_microzed_defconfig |  1 +
 configs/zynq_zc706_defconfig    |  1 +
 configs/zynq_zed_defconfig      |  1 +
 4 files changed, 14 insertions(+)

diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
new file mode 100755
index 0000000..98b3306
--- /dev/null
+++ b/board/zynq/post-image.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# let's use a symlink with that name that points to the *first*
+# devicetree listed in the config.
+
+FIRST_DT=$(sed -n \
+           's/^BR2_LINUX_KERNEL_INTREE_DTS_NAME="\([a-z0-9\-]*\).*"$/\1/p' \
+           ${BR2_CONFIG})
+
+[ -z "${FIRST_DT}" ] || ln -fs ${FIRST_DT}.dtb ${BINARIES_DIR}/devicetree.dtb
diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
index acd2da5..c6685a4 100644
--- a/configs/zynq_microzed_defconfig
+++ b/configs/zynq_microzed_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
index 1dcccd5..0bb8e3b 100644
--- a/configs/zynq_zc706_defconfig
+++ b/configs/zynq_zc706_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
index cd81598..cfcfdff 100644
--- a/configs/zynq_zed_defconfig
+++ b/configs/zynq_zed_defconfig
@@ -4,6 +4,7 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynq/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
