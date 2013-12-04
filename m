From: Thomas Pedersen <thomas@cozybit.com>
Date: Wed,  4 Dec 2013 15:57:44 -0800
Subject: [Buildroot] [PATCH] pandaboard: fix defonf build with recent kernels
Message-ID: <1386201464-19380-1-git-send-email-thomas@cozybit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch "pandaboard: Fix defconfig build" locked the
default pandaboard kernel to 3.8.11. This is inconvenient,
however, and we can make the default pandaboard kernel
build and boot with a few changes:

1. specify the correct load address
2. append the flattened device tree to the uImage

Note the default device tree is now for the pandaboard-ES,
so users of other board revisions will need to set the
correct DTS_NAME.

Signed-off-by: Thomas Pedersen <thomas@cozybit.com>
---
 configs/pandaboard_defconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 95cfdd6..341ce22 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -11,14 +11,15 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
-
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.11"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
+BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_APPENDED_DTB=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
+# might need omap4-panda or omap4-panda-a4 instead
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es"
 
 # GCC
 BR2_GCC_VERSION_4_6_X=y
-- 
1.8.4.3
