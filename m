From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 21:06:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix musl build error
Message-ID: <20170611190637.27379-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To reproduce the build error use this defconfig:

BR2_x86_64=y
BR2_x86_atom=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.02-744-g40962a0.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OSMESA=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT=y
BR2_PACKAGE_XORG7=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/0007-musl.patch | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/mesa3d/0007-musl.patch

diff --git a/package/mesa3d/0007-musl.patch b/package/mesa3d/0007-musl.patch
new file mode 100644
index 000000000..2dd08a13a
--- /dev/null
+++ b/package/mesa3d/0007-musl.patch
@@ -0,0 +1,35 @@
+From adadadc151fa8232ecd78649a10496661b98e40d Mon Sep 17 00:00:00 2001
+From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
+Date: Thu, 1 Jun 2017 12:13:18 +0200
+Subject: util/rand_xor: add missing include statements
+
+Fixes for:
+
+src/util/rand_xor.c:60:13: error: implicit declaration of function 'open' [-Werror=implicit-function-declaration]
+    int fd = open("/dev/urandom", O_RDONLY);
+             ^~~~
+src/util/rand_xor.c:60:34: error: 'O_RDONLY' undeclared (first use in this function)
+    int fd = open("/dev/urandom", O_RDONLY);
+                                  ^~~~~~~~
+
+Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
+Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
+[backported from upstream master branch:
+ https://cgit.freedesktop.org/mesa/mesa/commit/?id=adadadc151fa8232ecd78649a10496661b98e40d ]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/src/util/rand_xor.c b/src/util/rand_xor.c
+index de05fa6..de04bbc 100644
+--- a/src/util/rand_xor.c
++++ b/src/util/rand_xor.c
+@@ -25,6 +25,7 @@
+ #if defined(__linux__)
+ #include <sys/file.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #else
+ #include <time.h>
+ #endif
+-- 
+cgit v0.10.2
+
-- 
2.11.0
