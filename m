From: guoren at kernel.org <guoren@kernel.org>
Date: Mon, 24 Jun 2019 11:41:33 +0800
Subject: [Buildroot] [PATCH] configs/csky_gx6605s: bump kernel to 5.0 and
 use buildroot toolchain
Message-ID: <1561347693-16089-1-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

The most thing is to use the toolchain compiled by buildroot itself. And
we also bump kernel to 5.0 with kernel.org.

For all 610s including qemu we use 0x10000000 PHYS_OFFSET for unified
maintain. There is no gx6605s.dts for the config, so we need wget it from
csky gitlab CI storage.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-cmdline-for-serial-console-and-rootfs-on.patch | 25 ------------------
 board/csky/readme.txt                              |  2 +-
 board/qemu/csky/linux-ck610.config.fragment        |  1 +
 configs/csky_gx6605s_defconfig                     | 30 +++++++++++-----------
 4 files changed, 17 insertions(+), 41 deletions(-)
 delete mode 100644 board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch

diff --git a/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch b/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
deleted file mode 100644
index 1da1a75..0000000
--- a/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7e3f2c482bc16537a093e87a27f0d465804a88e4 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <juju@cotds.org>
-Date: Tue, 11 Dec 2018 23:04:46 +0100
-Subject: [PATCH] csky: update cmdline for serial console and rootfs on sda1
-
-Signed-off-by: Julien Olivain <juju@cotds.org>
----
- arch/csky/boot/dts/gx6605s.dts | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/csky/boot/dts/gx6605s.dts b/arch/csky/boot/dts/gx6605s.dts
-index ce56106af967..f5d60b21e6f9 100644
---- a/arch/csky/boot/dts/gx6605s.dts
-+++ b/arch/csky/boot/dts/gx6605s.dts
-@@ -155,6 +155,6 @@
- 	};
- 
- 	chosen {
--		bootargs = "console=tty0 init=/sbin/init root=/dev/sda2 rw rootwait";
-+		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda1 rw rootwait";
- 	};
- };
--- 
-2.19.2
-
diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index dc82dcc..4e285f8 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -43,7 +43,6 @@ After building, you should obtain this tree:
     output/images/
     +-- vmlinux
     +-- rootfs.ext2
-    +-- <board name>.dtb
 
 How to run it
 =============
@@ -84,5 +83,6 @@ Run
   Setup the Console with the rate 115200/8-N-1.
 
   $ cd output/images
+  $ wget https://gitlab.com/c-sky/buildroot/-/jobs/238397687/artifacts/raw/output/images/gx6605s.dtb
   $ ../host/bin/csky-linux-gdb -x ../../board/csky/gx6605s/gdbinit vmlinux
 
diff --git a/board/qemu/csky/linux-ck610.config.fragment b/board/qemu/csky/linux-ck610.config.fragment
index d80d0ee..b690c7d 100644
--- a/board/qemu/csky/linux-ck610.config.fragment
+++ b/board/qemu/csky/linux-ck610.config.fragment
@@ -1,5 +1,6 @@
 CONFIG_COMPILE_TEST=y
 CONFIG_CPU_CK610=y
 CONFIG_CPU_PM_WAIT=y
+CONFIG_RAM_BASE=0x10000000
 CONFIG_CSKY_APB_INTC=y
 CONFIG_GX6605S_TIMER=y
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index d0a2aad..9193b61 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -1,18 +1,18 @@
+# Architecture
 BR2_csky=y
-BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
-BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
-BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
+BR2_ck610=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# linux kernel header, the same version with linux kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+
+# Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/6064a9bdf48cefbccc4f6472dd04251f0dec1931.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"
-BR2_TARGET_ROOTFS_EXT2=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.12"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/csky/linux-ck610.config.fragment"
-- 
2.7.4
