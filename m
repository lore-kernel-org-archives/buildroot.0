From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 19:01:48 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/libepoxy: Fix OpenGL / EGL
	dependencies
Message-ID: <1430586108-23704-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libepoxy depeneds on EGL, OpenGL is an optional dependency.
These packages can also be provided by other packages, not only mesa3d.
In order to avoid build errors with rpi-userland, it installs its header
files in an usual place, two upstream patches are backported.

Fixes
http://autobuild.buildroot.net/results/596/596f44a26aad45c027f0f4f97d63e97a1f4fd001

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: Check for egl by using pkgconfig (Thomas)

 package/x11r7/libepoxy/0001-egl-pkgconfig.patch    |   59 ++++++++++++++++++
 .../x11r7/libepoxy/0002-Avoid-name-conflict.patch  |   64 ++++++++++++++++++++
 package/x11r7/libepoxy/Config.in                   |    8 ++-
 package/x11r7/libepoxy/libepoxy.mk                 |    4 +-
 4 files changed, 132 insertions(+), 3 deletions(-)
 create mode 100644 package/x11r7/libepoxy/0001-egl-pkgconfig.patch
 create mode 100644 package/x11r7/libepoxy/0002-Avoid-name-conflict.patch

diff --git a/package/x11r7/libepoxy/0001-egl-pkgconfig.patch b/package/x11r7/libepoxy/0001-egl-pkgconfig.patch
new file mode 100644
index 0000000..b725c28
--- /dev/null
+++ b/package/x11r7/libepoxy/0001-egl-pkgconfig.patch
@@ -0,0 +1,59 @@
+From d56f21c494b315306215c4730835a9b291360e9b Mon Sep 17 00:00:00 2001
+From: Eric Anholt <eric@anholt.net>
+Date: Fri, 13 Jun 2014 14:59:37 -0700
+Subject: [PATCH] Use the EGL pkgconfig for finding eglplatform.h.
+
+We don't ever explicity link against libEGL, so no need to make use of
+EGL_LIBS.
+
+Fixes #30.
+
+Upstream status: committed
+https://github.com/anholt/libepoxy/commit/d56f21c494b315306215c4730835a9b291360e9b
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac     | 1 +
+ src/Makefile.am  | 1 +
+ test/Makefile.am | 4 +++-
+ 3 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 399e351..f97c9b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -98,6 +98,7 @@ AC_SUBST(EPOXY_LINK_LIBS)
+ 
+ AM_CONDITIONAL(BUILD_EGL, test x$build_egl = xyes)
+ if test x$build_egl = xyes; then
++    PKG_CHECK_MODULES(EGL, [egl])
+     AC_DEFINE([BUILD_EGL], [1], [build EGL tests])
+ fi
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 8e20cd6..49c3507 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -28,6 +28,7 @@ AM_CFLAGS = \
+ 	$(CWARNFLAGS) \
+ 	$(VISIBILITY_CFLAGS) \
+ 	$(X11_CFLAGS) \
++	$(EGL_CFLAGS) \
+ 	$()
+ 
+ epoxyincludedir = $(includedir)/epoxy
+diff --git a/test/Makefile.am b/test/Makefile.am
+index ffb330e..f29baca 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -46,7 +46,9 @@ libwgl_common_la_LIBADD = $(EPOXY)
+ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/include \
+ 	-I$(top_builddir)/include \
+-	$(X11_CFLAGS)
++	$(X11_CFLAGS) \
++	$(EGL_CFLAGS) \
++	$()
+ 
+ AM_CFLAGS = $(CWARNFLAGS)
+ 
diff --git a/package/x11r7/libepoxy/0002-Avoid-name-conflict.patch b/package/x11r7/libepoxy/0002-Avoid-name-conflict.patch
new file mode 100644
index 0000000..d646253
--- /dev/null
+++ b/package/x11r7/libepoxy/0002-Avoid-name-conflict.patch
@@ -0,0 +1,64 @@
+From b2ae054b3aa0d6796b6936c7a89b8cce7cefe7ba Mon Sep 17 00:00:00 2001
+From: Eric Anholt <eric@anholt.net>
+Date: Fri, 13 Jun 2014 15:54:29 -0700
+Subject: [PATCH] Avoid name conflicts between pkgconfig's EGL_LIBS and a
+ temporary var.
+
+I felt a little uncomfortable knowing I had two things defining
+EGL_LIBS, but it worked on my system.  It failed on the travis ci
+build.
+
+Upstream status: committed
+https://github.com/anholt/libepoxy/commit/b2ae054b3aa0d6796b6936c7a89b8cce7cefe7ba
+
+This patch fixes an error created by 0001-egl-pkgconfig.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ test/Makefile.am | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/test/Makefile.am b/test/Makefile.am
+index f29baca..1892b17 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -22,9 +22,9 @@
+ EPOXY = $(builddir)/../src/libepoxy.la
+ 
+ check_LTLIBRARIES = \
+-	$(EGL_LIBS) \
+-	$(GLX_LIBS) \
+-	$(WGL_LIBS) \
++	$(EGL_UTIL_LIB) \
++	$(GLX_UTIL_LIB) \
++	$(WGL_UTIL_LIB) \
+ 	$()
+ 
+ libegl_common_la_SOURCES = \
+@@ -78,7 +78,7 @@ EGL_TESTS = \
+ 	egl_gles2_without_glx \
+ 	$()
+ 
+-EGL_LIBS = libegl_common.la
++EGL_UTIL_LIB = libegl_common.la
+ endif
+ 
+ if BUILD_GLX
+@@ -116,7 +116,7 @@ GLX_TESTS = \
+         $(GLX_NON_APPLE_TESTS) \
+ 	$()
+ 
+-GLX_LIBS = libglx_common.la
++GLX_UTIL_LIB = libglx_common.la
+ endif
+ 
+ if BUILD_WGL
+@@ -127,7 +127,7 @@ WGL_TESTS = \
+ 	wgl_usefontbitmaps_unicode$(EXEEXT) \
+ 	$()
+ 
+-WGL_LIBS = libwgl_common.la
++WGL_UTIL_LIB = libwgl_common.la
+ endif
+ 
+ egl_has_extension_nocontext_LDADD = $(EPOXY) libegl_common.la $(X11_LIBS)
diff --git a/package/x11r7/libepoxy/Config.in b/package/x11r7/libepoxy/Config.in
index c4f5794..875ccc5 100644
--- a/package/x11r7/libepoxy/Config.in
+++ b/package/x11r7/libepoxy/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBEPOXY
 	bool "epoxy"
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBEGL
 	help
-	  Epoxy is a library for handling OpenGL function pointer management for you.
+	  Epoxy is a library for handling OpenGL function pointer
+	  management for you.
 
 	  https://github.com/anholt/libepoxy
+
+comment "epoxy needs an OpenGL EGL backend"
+	depends on !BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/x11r7/libepoxy/libepoxy.mk b/package/x11r7/libepoxy/libepoxy.mk
index d908893..001d05d 100644
--- a/package/x11r7/libepoxy/libepoxy.mk
+++ b/package/x11r7/libepoxy/libepoxy.mk
@@ -8,7 +8,9 @@ LIBEPOXY_VERSION = v1.2
 LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
 LIBEPOXY_INSTALL_STAGING = YES
 LIBEPOXY_AUTORECONF = YES
-LIBEPOXY_DEPENDENCIES = mesa3d
+LIBEPOXY_DEPENDENCIES = xlib_libX11 xutil_util-macros \
+	$(if $(BR2_PACKAGE_HAS_LIBEGL),libegl) \
+	$(if $(BR2_PACKAGE_HAS_LIBGL),libgl)
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
 
-- 
1.7.10.4
