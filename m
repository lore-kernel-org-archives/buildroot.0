From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:24:44 +0100
Subject: [Buildroot] [git commit] configs/csky_gx6605s: bump gcc to 6.3.0,
 kernel to 4.9.56
Message-ID: <20181216202408.2243A86517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31f5c8561f4b421a5d231f7f29e4fd00a7c3d7e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the csky custom external toolchain to fix a broken
host dependency of gdb on libexpat.so.0 (most hosts now ship
libexpat.so.1). gdb is required to copy and and boot the kernel (see
board/csky/readme.txt). The updated gdb no longer has this host
dependency, which solves the issue.

Since this external toolchain was built and tested with csky kernel
4.9.56, this patch also updates to that kernel version.

Finally, this 4.9.56 csky kernel changed its default bootargs. So we
add a patch to preserve the same behavior as the previous version.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-cmdline-for-serial-console-and-rootfs-on.patch | 25 ++++++++++++++++++++++
 configs/csky_gx6605s_defconfig                     |  7 +++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch b/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
new file mode 100644
index 0000000000..1da1a75400
--- /dev/null
+++ b/board/csky/gx6605s/patches/linux/0001-csky-update-cmdline-for-serial-console-and-rootfs-on.patch
@@ -0,0 +1,25 @@
+From 7e3f2c482bc16537a093e87a27f0d465804a88e4 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <juju@cotds.org>
+Date: Tue, 11 Dec 2018 23:04:46 +0100
+Subject: [PATCH] csky: update cmdline for serial console and rootfs on sda1
+
+Signed-off-by: Julien Olivain <juju@cotds.org>
+---
+ arch/csky/boot/dts/gx6605s.dts | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/csky/boot/dts/gx6605s.dts b/arch/csky/boot/dts/gx6605s.dts
+index ce56106af967..f5d60b21e6f9 100644
+--- a/arch/csky/boot/dts/gx6605s.dts
++++ b/arch/csky/boot/dts/gx6605s.dts
+@@ -155,6 +155,6 @@
+ 	};
+ 
+ 	chosen {
+-		bootargs = "console=tty0 init=/sbin/init root=/dev/sda2 rw rootwait";
++		bootargs = "console=ttyS0,115200 init=/sbin/init root=/dev/sda1 rw rootwait";
+ 	};
+ };
+-- 
+2.19.2
+
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index 5f39c536ac..d0a2aadc6d 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -1,8 +1,9 @@
 BR2_csky=y
+BR2_GLOBAL_PATCH_DIR="board/csky/gx6605s/patches"
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.2-20170227.tar.gz"
+BR2_TOOLCHAIN_EXTERNAL_URL="https://github.com/c-sky/tools/raw/master/csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz"
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="csky-linux"
-BR2_TOOLCHAIN_EXTERNAL_GCC_4_5=y
+BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
 BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
@@ -10,7 +11,7 @@ BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/314c498ddc8c43a66ca96ff3af7da98e10fa1cc6.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/6064a9bdf48cefbccc4f6472dd04251f0dec1931.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="gx66xx"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="gx6605s"
