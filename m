From: Guo Ren <ren_guo@c-sky.com>
Date: Thu, 23 Mar 2017 17:45:24 +0800
Subject: [Buildroot] [PATCH 1/1] configs: add post-images.sh in csky_gx6605s
Message-ID: <1490262324-17597-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdbinit will load gx6605s.dtb to a memory address, so we need put
them together in the ouput/images.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 board/csky/gx6605s/post-image.sh | 4 ++++
 board/csky/readme.txt            | 6 ++++--
 configs/csky_gx6605s_defconfig   | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100755 board/csky/gx6605s/post-image.sh

diff --git a/board/csky/gx6605s/post-image.sh b/board/csky/gx6605s/post-image.sh
new file mode 100755
index 0000000..d305d74
--- /dev/null
+++ b/board/csky/gx6605s/post-image.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+if [ ! -f $BINARIES_DIR/gdbinit ]; then
+	install -D -m 0644 board/csky/gx6605s/gdbinit ${BINARIES_DIR}/gdbinit
+fi
diff --git a/board/csky/readme.txt b/board/csky/readme.txt
index a820e3b..2667cab 100644
--- a/board/csky/readme.txt
+++ b/board/csky/readme.txt
@@ -43,7 +43,8 @@ After building, you should obtain this tree:
     output/images/
     ??? vmlinux
     ??? rootfs.ext2
-    ??? <board name>.dtb
+    ??? gdbinit
+    ??? gx6605s.dtb
 
 How to run it
 =============
@@ -83,5 +84,6 @@ Run
 
   Setup the Console with the rate 115200/8-N-1.
 
-  $ ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux
+  $ cd output/images
+  $ ../host/usr/bin/csky-linux-gdb -x gdbinit vmlinux
 
diff --git a/configs/csky_gx6605s_defconfig b/configs/csky_gx6605s_defconfig
index 5f39c53..7245d76 100644
--- a/configs/csky_gx6605s_defconfig
+++ b/configs/csky_gx6605s_defconfig
@@ -8,6 +8,7 @@ BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
 BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/csky/gx6605s/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/c-sky/linux-4.9.y/archive/314c498ddc8c43a66ca96ff3af7da98e10fa1cc6.tar.gz"
-- 
1.9.1
