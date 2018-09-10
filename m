From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 21:58:42 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.2.0
Message-ID: <20180910195801.27FFA83C17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d3235f9c191db170c731418880fb8eb8a0413ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream unconditionally enabled floating-point textures:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=18.2&id=66673bef941af344314fe9c91cad8cd330b245eb

x11 support depends on xlib_libXrandr now:
https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=18.2&id=3f960c1338713d317ce6463be68cee162c968d8d

Removed 0003-musl-time-h.patch, patch was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                         |  7 +++++++
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/0003-musl-time-h.patch    | 33 --------------------------------
 package/mesa3d/Config.in                 | 24 +----------------------
 package/mesa3d/mesa3d.hash               | 11 +++++------
 package/mesa3d/mesa3d.mk                 | 10 ++--------
 6 files changed, 16 insertions(+), 71 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cbdac59631..3b84e3da91 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2018.11"
 
+config BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT
+	bool "mesa3d opengl texture float option removed"
+	select BR2_LEGACY
+	help
+	  mesa3d now unconditionally enables floating-point textures,
+	  as the corresponding patent has expired.
+
 config BR2_KERNEL_HEADERS_4_10
 	bool "kernel headers version 4.10.x are no longer supported"
 	select BR2_KERNEL_HEADERS_4_9
diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index c5a8a68c48..775466d970 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.8
+MESA3D_HEADERS_VERSION = 18.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0003-musl-time-h.patch b/package/mesa3d/0003-musl-time-h.patch
deleted file mode 100644
index 811d135622..0000000000
--- a/package/mesa3d/0003-musl-time-h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3c288da5eec81ee58b85927df18d9194ead8f5c2 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 12 Jun 2018 11:59:01 +0100
-Subject: drivers/dri/i965: add missing #include
-
-brw_bufmgr.h uses time_t without include time.h, so the build fails under musl.
-
-Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/mesa/mesa/commit/src/mesa/drivers/dri/i965/brw_bufmgr.h?id=3c288da5eec81ee58b85927df18d9194ead8f5c2
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/mesa/drivers/dri/i965/brw_bufmgr.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/mesa/drivers/dri/i965/brw_bufmgr.h b/src/mesa/drivers/dri/i965/brw_bufmgr.h
-index 8cdf944..32fc7a5 100644
---- a/src/mesa/drivers/dri/i965/brw_bufmgr.h
-+++ b/src/mesa/drivers/dri/i965/brw_bufmgr.h
-@@ -37,6 +37,8 @@
- #include <stdbool.h>
- #include <stdint.h>
- #include <stdio.h>
-+#include <time.h>
-+
- #include "util/u_atomic.h"
- #include "util/list.h"
- 
--- 
-cgit v1.1
-
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 06574ae513..aea579d4e3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -13,6 +13,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ZLIB
 	help
@@ -253,29 +254,6 @@ config BR2_PACKAGE_MESA3D_OPENGL_ES
 	  Use the Khronos OpenGL ES APIs. This is commonly used on
 	  embedded systems and represents a subset of the OpenGL API.
 
-config BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT
-	bool "OpenGL texture float (patented format)"
-	help
-	  GL_ARB_texture_float is required to enable GLX core profile
-	  (OpenGL3.x) otherwise the compat profile is used
-	  (OpenGL2.1).
-
-	  The source code to implement ARB_texture_float extension is
-	  included and can be toggled on at compile time, for those
-	  who purchased a license from SGI, or are in a country where
-	  the patent does not apply, etc.
-
-	  Please consult docs/patents.txt with your lawyer before
-	  building Mesa.
-
-	  Also, note that this option doesn't affect all drivers. Some
-	  drivers have support for texture float enabled
-	  unconditionally.
-
-	  If unsure, say N.
-
-	  http://www.google.com/patents/about?id=mIIOAAAAEBAJ&dq=6650327
-
 endif # BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_PROVIDES_LIBGL
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 3224160a5b..7e2b7438b1 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-September/000459.html
-md5  d2d1de1e338e63877f753ab9d66ba597  mesa-18.1.8.tar.xz
-sha1 bb723111c45680dc31be991dd872c2c1f4f9252d  mesa-18.1.8.tar.xz
-sha256 bd1be67fe9c73b517765264ac28911c84144682d28dbff140e1c2deb2f44c21b  mesa-18.1.8.tar.xz
-sha512 ab89c6d27b765d3efdf61b24dc56d863ae590d83003d2eae4bfe25ecfbeda5bee0227f21d057523bb4eceeaf3d9955df48087ffb472c41b123c100e593056cb9  mesa-18.1.8.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-September/000460.html
+md5  88e1a7f31f259cec69bb76b3cb10c956  mesa-18.2.0.tar.xz
+sha1 73723d9f3815487f474d84eb91a5cd17edfb63d4  mesa-18.2.0.tar.xz
+sha256 22452bdffff8e11bf4284278155a9f77cb28d6d73a12c507f1490732d0d9ddce  mesa-18.2.0.tar.xz
+sha512 e6e997e166845009f6b97da204384758c797c870b56332652c0a2636734638f9180b7e4dbad144495645308ae4d77981a2493a22d57973723338b658e0655557  mesa-18.2.0.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
-sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9fca4c792d..3835390574 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.8
+MESA3D_VERSION = 18.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -61,6 +61,7 @@ MESA3D_DEPENDENCIES += \
 	xlib_libXext \
 	xlib_libXdamage \
 	xlib_libXfixes \
+	xlib_libXrandr \
 	xorgproto \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx --disable-mangling
@@ -202,13 +203,6 @@ else
 MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT),y)
-MESA3D_CONF_OPTS += --enable-texture-float
-MESA3D_LICENSE_FILES += docs/patents.txt
-else
-MESA3D_CONF_OPTS += --disable-texture-float
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
 MESA3D_DEPENDENCIES += xlib_libXvMC
 MESA3D_CONF_OPTS += --enable-xvmc
