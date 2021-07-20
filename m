From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 21:23:33 +0200
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino: switch to
 extlinux.conf
Message-ID: <20210720185001.ED593884F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=f0d270ccfb0a9b486ea5907f6e86c5d9c07f93e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

a10_olinuxino is not switched to extlinux.conf, so the broken symlinks
are replaced by the previous content from a20_olinuxino.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olimex/a10_olinuxino/boot.cmd                                 | 6 +++++-
 board/olimex/a10_olinuxino/post-build.sh                            | 4 +++-
 board/olimex/a20_olinuxino/boot.cmd                                 | 5 -----
 board/olimex/a20_olinuxino/post-build.sh                            | 3 ---
 .../olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf | 4 ++++
 configs/olimex_a20_olinuxino_lime2_defconfig                        | 4 +---
 configs/olimex_a20_olinuxino_lime_defconfig                         | 4 +---
 7 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 120000
index 612c745500..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
new file mode 100644
index 0000000000..44d9239a94
--- /dev/null
+++ b/board/olimex/a10_olinuxino/boot.cmd
@@ -0,0 +1,5 @@
+setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+ext4load mmc 0 0x49000000 /boot/${fdtfile}
+ext4load mmc 0 0x46000000 /boot/zImage
+env set fdt_high ffffffff
+bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 120000
index b346896024..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
new file mode 100755
index 0000000000..d3f612f811
--- /dev/null
+++ b/board/olimex/a10_olinuxino/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a20_olinuxino/boot.cmd b/board/olimex/a20_olinuxino/boot.cmd
deleted file mode 100644
index 44d9239a94..0000000000
--- a/board/olimex/a20_olinuxino/boot.cmd
+++ /dev/null
@@ -1,5 +0,0 @@
-setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
-ext4load mmc 0 0x49000000 /boot/${fdtfile}
-ext4load mmc 0 0x46000000 /boot/zImage
-env set fdt_high ffffffff
-bootz 0x46000000 - 0x49000000
diff --git a/board/olimex/a20_olinuxino/post-build.sh b/board/olimex/a20_olinuxino/post-build.sh
deleted file mode 100755
index d3f612f811..0000000000
--- a/board/olimex/a20_olinuxino/post-build.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..f754da3623
--- /dev/null
+++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label Olinuxino
+    kernel /boot/zImage
+    fdtdir /boot
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index d149f04bfb..dca6123c18 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 
@@ -52,8 +52,6 @@ BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 8d759ca98a..0eaacc9ec1 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/a20_olinuxino/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 
@@ -52,8 +52,6 @@ BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
 
 # Additional tools
 BR2_PACKAGE_HOST_GENIMAGE=y
