From: Damien Lanson <damien@kal-host.com>
Date: Fri, 17 Jun 2016 16:18:56 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_libvdpau=3A_new_package?=
Message-ID: <1466173136-25627-1-git-send-email-damien@kal-host.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Damien Lanson <damien@kal-host.com>
---
 package/Config.in                                  |    1 +
 .../libvdpau/0001-missing-configh-include.patch    |   28 +++++++++++++
 package/libvdpau/0002-link-with-libx11.patch       |   28 +++++++++++++
 .../libvdpau/0003-vdpau-module-searchpath.patch    |   43 ++++++++++++++++++++
 package/libvdpau/Config.in                         |   15 +++++++
 package/libvdpau/libvdpau.hash                     |    4 ++
 package/libvdpau/libvdpau.mk                       |   27 ++++++++++++
 7 files changed, 146 insertions(+)
 create mode 100644 package/libvdpau/0001-missing-configh-include.patch
 create mode 100644 package/libvdpau/0002-link-with-libx11.patch
 create mode 100644 package/libvdpau/0003-vdpau-module-searchpath.patch
 create mode 100755 package/libvdpau/Config.in
 create mode 100644 package/libvdpau/libvdpau.hash
 create mode 100644 package/libvdpau/libvdpau.mk

diff --git a/package/Config.in b/package/Config.in
index 3d93951..ee79474 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -957,6 +957,7 @@ menu "Graphics"
 	source "package/libsvgtiny/Config.in"
 	source "package/libva/Config.in"
 	source "package/libva-intel-driver/Config.in"
+	source "package/libvdpau/Config.in"
 	source "package/libvips/Config.in"
 	source "package/menu-cache/Config.in"
 	source "package/opencv/Config.in"
diff --git a/package/libvdpau/0001-missing-configh-include.patch b/package/libvdpau/0001-missing-configh-include.patch
new file mode 100644
index 0000000..85f7934
--- /dev/null
+++ b/package/libvdpau/0001-missing-configh-include.patch
@@ -0,0 +1,28 @@
+From: Rico Tzschichholz <ricotz@ubuntu.com>
+Date: Tue, 1 Sep 2015 10:45:11 +0200
+Subject: mesa_dri2: Add missing include of config.h to define _GNU_SOURCE
+
+Fix build with -Wimplicit-function-declaration while secure_getenv() is
+guarded by __USE_GNU.
+
+Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
+Tested-by: Stefan Dirsch <sndirsch@suse.de>
+(cherry picked from commit 1cda354bdfd0c9ca107293b84b52f4464fdbedcc)
+---
+ src/mesa_dri2.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/mesa_dri2.c b/src/mesa_dri2.c
+index 51e8794..420ccee 100644
+--- a/src/mesa_dri2.c
++++ b/src/mesa_dri2.c
+@@ -33,6 +33,9 @@
+  *   and Jos? Hiram Soltren (jsoltren at nvidia.com)
+  */
+ 
++#ifdef HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #define NEED_REPLIES
+ #include <X11/Xlibint.h>
diff --git a/package/libvdpau/0002-link-with-libx11.patch b/package/libvdpau/0002-link-with-libx11.patch
new file mode 100644
index 0000000..2ecd10f
--- /dev/null
+++ b/package/libvdpau/0002-link-with-libx11.patch
@@ -0,0 +1,28 @@
+Subject: Link libvdpao with libX11 since it uses symbols from it
+Author: Russ Allbery <rra@debian.org>
+Forwarded: no
+
+libvdpau uses the symbols:
+
+    _XEatData
+    _XReply
+    _XFlush
+    _XReadPad
+    XFree
+
+which are provided by libX11, but wasn't linking with it directly, resulting
+in warnings during the package build (and possibly errors later with better
+linkers).
+
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -22,7 +22,8 @@ endif
+ libvdpau_la_LIBADD = \
+     $(DLOPEN_LIBS) \
+     $(PTHREAD_LIBS) \
+-    $(XEXT_LIBS)
++    $(XEXT_LIBS) \
++    $(X11_LIBS)
+ 
+ libvdpau_la_LDFLAGS = -version-info 1:0:0 -no-undefined
+ 
diff --git a/package/libvdpau/0003-vdpau-module-searchpath.patch b/package/libvdpau/0003-vdpau-module-searchpath.patch
new file mode 100644
index 0000000..9750871
--- /dev/null
+++ b/package/libvdpau/0003-vdpau-module-searchpath.patch
@@ -0,0 +1,43 @@
+From: Andreas Beckmann <debian@abeckmann.de>
+Subject: search the vdpau module in multiple directories
+ start searching the vdpau module in ${ORIGIN}/vdpau, then the MODULEDIR and
+ finally fall back to /usr/lib/vdpau
+
+--- a/src/vdpau_wrapper.c
++++ b/src/vdpau_wrapper.c
+@@ -103,6 +103,13 @@ static char * _vdp_get_driver_name_from_
+     return driver_name;
+ }
+ 
++static char const * _vdpau_module_search_paths[] = {
++    "${ORIGIN}/vdpau",
++    VDPAU_MODULEDIR,
++    "/usr/lib/vdpau",
++    NULL
++};
++
+ static VdpStatus _vdp_open_driver(
+     Display *             display,
+     int                   screen)
+@@ -117,6 +127,7 @@ static VdpStatus _vdp_open_driver(
+     char         vdpau_driver_lib[PATH_MAX];
+     char const * vdpau_trace;
+     char const * func_name;
++    char const ** module_path;
+ 
+     vdpau_driver = secure_getenv("VDPAU_DRIVER");
+     if (vdpau_driver) {
+@@ -138,9 +146,11 @@ static VdpStatus _vdp_open_driver(
+ 
+     /* Fallback to VDPAU_MODULEDIR when VDPAU_DRIVER_PATH is not set,
+      * or if we fail to create the driver path/dlopen the library. */
+-    if (!_vdp_driver_dll) {
++    for (module_path = _vdpau_module_search_paths;
++         !_vdp_driver_dll && *module_path;
++         ++module_path) {
+         if (snprintf(vdpau_driver_lib, sizeof(vdpau_driver_lib),
+-                     DRIVER_LIB_FORMAT, VDPAU_MODULEDIR, vdpau_driver) >=
++                     DRIVER_LIB_FORMAT, *module_path, vdpau_driver) >=
+                 sizeof(vdpau_driver_lib)) {
+             fprintf(stderr, "Failed to construct driver path: path too long\n");
+         }
diff --git a/package/libvdpau/Config.in b/package/libvdpau/Config.in
new file mode 100755
index 0000000..42ad09b
--- /dev/null
+++ b/package/libvdpau/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBVDPAU
+	bool "libvdpau"
+		depends on BR2_INSTALL_LIBSTDCPP
+		depends on BR2_TOOLCHAIN_HAS_THREADS
+        select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+		select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	help
+          VDPAU is the Video Decode and Presentation API for UNIX.
+          It provides an interface to video decode acceleration and
+          presentation hardware present in modern GPUs.
+
+	  http://freedesktop.org/wiki/Software/VDPAU
+
+comment "libvdpau needs a toolchain w/ threads, C++"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
new file mode 100644
index 0000000..8953752
--- /dev/null
+++ b/package/libvdpau/libvdpau.hash
@@ -0,0 +1,4 @@
+# From https://lists.freedesktop.org/archives/xorg-announce/2015-August/002630.html
+md5		2fa0b05a4f4d06791eec83bc9c854d14								  	libvdpau-1.1.1.tar.bz2
+sha1	86516e2a962fd34f65d49115d6ddf15fd912f579  							libvdpau-1.1.1.tar.bz2
+sha256	857a01932609225b9a3a5bf222b85e39b55c08787d0ad427dbd9ec033d58d736	libvdpau-1.1.1.tar.bz2
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
new file mode 100644
index 0000000..78e5de5
--- /dev/null
+++ b/package/libvdpau/libvdpau.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# libvdpau
+#
+################################################################################
+LIBVDPAU_VERSION = 1.1.1
+LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
+LIBVDPAU_SITE = http://people.freedesktop.org/~aplattner/vdpau
+LIBVDPAU_LICENSE = NVIDIA Corporation
+LIBVDPAU_LICENSE_FILES = COPYING
+LIBVDPAU_INSTALL_STAGING = YES
+
+#Autoreconf for patch 0002-link-with-libx11.patch
+LIBVDPAU_AUTORECONF = YES
+
+LIBVDPAU_DEPENDENCIES = xlib_libX11 xlib_libXext
+
+LIBVDPAU_CONF_OPTS = --with-module-dir=/usr/lib/vdpau
+
+ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
+LIBVDPAU_DEPENDENCIES += xproto_dri2proto
+LIBVDPAU_CONF_OPTS += --enable-dri2
+else
+LIBVDPAU_CONF_OPTS += --disable-dri2
+endif
+
+$(eval $(autotools-package))
\ No newline at end of file
-- 
1.7.10.4
