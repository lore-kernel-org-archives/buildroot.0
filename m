From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon, 21 Aug 2017 15:18:15 +0200
Subject: [Buildroot] [PATCH] board: remove Armadeus's APF9328 support
Message-ID: <1503321495-5763-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

i.MX1/L boards require an old Linux kernel version to run, which is not
compatible with latest Buildroot needs.
Will fix:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873568

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 board/armadeus/readme.txt          |  9 ++-------
 configs/armadeus_apf9328_defconfig | 29 -----------------------------
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 configs/armadeus_apf9328_defconfig

diff --git a/board/armadeus/readme.txt b/board/armadeus/readme.txt
index a1f1325..98c7b08 100644
--- a/board/armadeus/readme.txt
+++ b/board/armadeus/readme.txt
@@ -13,7 +13,6 @@ Supported platforms
 Buildroot currently supports the following Armadeus platforms with the
 associated defconfigs:
 
- * APF9328 SOM + devt boards -> armadeus_apf9328_defconfig
  * APF27 SOM + devt board    -> armadeus_apf27_defconfig
  * APF51 SOM + devt board    -> armadeus_apf51_defconfig
  * APF28 SOM + devt board    -> armadeus_apf28_defconfig
@@ -46,15 +45,12 @@ When the build is finished, you will end up with:
 
     output/images/
     ??? imx**-apfxxdev.dtb	[1]
-    ??? rootfs.jffs2		[2]
     ??? rootfs.tar
-    ??? rootfs.ubi		[2]
-    ??? rootfs.ubifs		[2]
+    ??? rootfs.ubi
+    ??? rootfs.ubifs
     ??? uImage
 
 [1] Only if the kernel version used uses a Device Tree.
-[2] .ubi/.ubifs images are not available on APF9328 and replaced by a
-    .jffs2 one in this case.
 
 Building U-Boot is currently not supported in these configurations.
 
@@ -69,7 +65,6 @@ it:
   $ cp output/images/uImage /tftpboot/apfxx-linux.bin
   $ cp output/images/*.dtb /tftpboot/
   $ cp output/images/rootfs.ubi /tftpboot/apfxx-rootfs.ubi
-  $ cp output/images/rootfs.jffs2 /tftpboot/apfxx-rootfs.jffs2
 
 where "apfxx" is the version of your SOM, as used with _defconfigs.
 
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
deleted file mode 100644
index 8abfcfd..0000000
--- a/configs/armadeus_apf9328_defconfig
+++ /dev/null
@@ -1,29 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm920t=y
-
-# Toolchain
-BR2_PACKAGE_GDB=y
-BR2_PACKAGE_HOST_GDB=y
-BR2_ENABLE_LOCALE_PURGE=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
-
-# System
-BR2_TARGET_GENERIC_HOSTNAME="apf9328"
-BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# Filesystem
-BR2_TARGET_ROOTFS_JFFS2=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.29"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x08008000"
-- 
2.1.4
