From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Feb 2017 14:13:59 +0100
Subject: [Buildroot] [git commit branch/next] libepoxy: bump to version 1.4.0
Message-ID: <20170215131522.316FC7FAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e833d3065a17d200e0d9e2bfa285d8e4467d095
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop all patches since they're upstream, yay!

Switch to the gnome mirror since it's more handy than github, and it
also allows to drop autoreconf since it's a distribution tarball with
the configure script is already generated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-platforms-based-on-configuration-results.patch | 125 ---------------------
 ...0002-add-an-option-to-disable-glx-support.patch |  39 -------
 ...able-glx-actually-work-on-osx-and-windows.patch |  67 -----------
 ...arwin-use-glx-instead-of-opengl-framework.patch |  95 ----------------
 .../0005-Forward-egl-cflags-into-epoxy.pc.patch    |  45 --------
 package/libepoxy/0006-Make-egl-conditional.patch   |  59 ----------
 package/libepoxy/libepoxy.hash                     |   4 +-
 package/libepoxy/libepoxy.mk                       |   8 +-
 8 files changed, 6 insertions(+), 436 deletions(-)

diff --git a/package/libepoxy/0001-select-platforms-based-on-configuration-results.patch b/package/libepoxy/0001-select-platforms-based-on-configuration-results.patch
deleted file mode 100644
index e3a7b49..0000000
--- a/package/libepoxy/0001-select-platforms-based-on-configuration-results.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 7eff2bf8e27599c1c94217b2bb1b73d4b7d18e59 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 6 May 2015 10:45:22 +0200
-Subject: [PATCH 1/4] select platforms based on configuration results
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>
-Fetched from pull #81 on github for libepoxy:
-https://github.com/anholt/libepoxy/pull/81/commits
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac          | 13 +++++--------
- src/dispatch_common.c |  9 ++++++---
- src/dispatch_common.h |  9 +++++----
- 3 files changed, 16 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2d67726..225ab73 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,6 +58,10 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
- # uintptr_t to a void *") by default.  Kill that.
- XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- 
-+PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
-+
-+AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
-+
- has_znow=yes
- 
- case $host_os in
-@@ -86,7 +90,7 @@ case $host_os in
-         ;;
-     *)
-         build_egl=yes
--        build_glx=yes
-+        build_glx=$x11
-         build_wgl=no
-         # On platforms with dlopen, we load everything dynamically and
-         # don't link against a specific window system or GL implementation.
-@@ -144,13 +148,6 @@ esac
- 
- AC_SUBST([VISIBILITY_CFLAGS])
- 
--PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
--if test x$x11 = xno -a x$build_glx = xyes; then
--    AC_MSG_ERROR([libX11 headers (libx11-dev) required to build with GLX support])
--fi
--
--AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
--
- PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
- 
- AC_CONFIG_FILES([
-diff --git a/src/dispatch_common.c b/src/dispatch_common.c
-index 013027f..163d348 100644
---- a/src/dispatch_common.c
-+++ b/src/dispatch_common.c
-@@ -656,10 +656,13 @@ epoxy_get_proc_address(const char *name)
- #elif defined(__APPLE__)
-     return epoxy_gl_dlsym(name);
- #else
-+#if PLATFORM_HAS_GLX
-     if (epoxy_current_context_is_glx()) {
-         return glXGetProcAddressARB((const GLubyte *)name);
--    } else {
-+    } else
-+#endif /* PLATFORM_HAS_GLX */
- #if PLATFORM_HAS_EGL
-+    {
-         GLenum egl_api = epoxy_egl_get_current_gl_context_api();
- 
-         switch (egl_api) {
-@@ -669,10 +672,10 @@ epoxy_get_proc_address(const char *name)
-         case EGL_NONE:
-             break;
-         }
--#endif
-     }
-+#endif /* PLATFORM_HAS_EGL */
-     errx(1, "Couldn't find current GLX or EGL context.\n");
--#endif
-+#endif /* _WIN32 | __APPLE__*/
- }
- 
- WRAPPER_VISIBILITY (void)
-diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index 676a4d5..2728b45 100644
---- a/src/dispatch_common.h
-+++ b/src/dispatch_common.h
-@@ -21,12 +21,13 @@
-  * IN THE SOFTWARE.
-  */
- 
-+#include <config.h>
- #include <stdbool.h>
- 
- #ifdef _WIN32
- #define PLATFORM_HAS_EGL 0
- #define PLATFORM_HAS_GLX 0
--#define PLATFORM_HAS_WGL 1
-+#define PLATFORM_HAS_WGL BUILD_WGL
- #define EPOXY_IMPORTEXPORT __declspec(dllexport)
- #elif defined(__APPLE__)
- #define PLATFORM_HAS_EGL 0
-@@ -34,13 +35,13 @@
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #elif defined(ANDROID)
--#define PLATFORM_HAS_EGL 1
-+#define PLATFORM_HAS_EGL BUILD_EGL
- #define PLATFORM_HAS_GLX 0
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #else
--#define PLATFORM_HAS_EGL 1
--#define PLATFORM_HAS_GLX 1
-+#define PLATFORM_HAS_EGL BUILD_EGL
-+#define PLATFORM_HAS_GLX BUILD_GLX
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #endif
-
diff --git a/package/libepoxy/0002-add-an-option-to-disable-glx-support.patch b/package/libepoxy/0002-add-an-option-to-disable-glx-support.patch
deleted file mode 100644
index a81547d..0000000
--- a/package/libepoxy/0002-add-an-option-to-disable-glx-support.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a9efde0fb2678cd26bdf26d256732d97ded0c595 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 6 May 2015 11:05:48 +0200
-Subject: [PATCH 2/4] add an option to disable glx support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this option would help us in yocto to get deterministic build results
-
-Signed-off-by: Andreas M??ller <schnitzeltony@googlemail.com>
-Fetched from pull #81 on github for libepoxy:
-https://github.com/anholt/libepoxy/pull/81/commits
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 225ab73..d3d947c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,7 +58,14 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
- # uintptr_t to a void *") by default.  Kill that.
- XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- 
--PKG_CHECK_MODULES(X11, [x11], [x11=yes], [x11=no])
-+AC_ARG_ENABLE([glx],
-+                [AS_HELP_STRING([--disable-glx],
-+				[disable if you don't want x11/glx support])],
-+                [],
-+                [enable_glx=yes]
-+             )
-+
-+PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
- 
- AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
- 
-
diff --git a/package/libepoxy/0003-make-enable-glx-actually-work-on-osx-and-windows.patch b/package/libepoxy/0003-make-enable-glx-actually-work-on-osx-and-windows.patch
deleted file mode 100644
index 5b0d4fe..0000000
--- a/package/libepoxy/0003-make-enable-glx-actually-work-on-osx-and-windows.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 902ea1eb073187603ec2eda4d2a146bef96592d4 Mon Sep 17 00:00:00 2001
-From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Date: Mon, 18 Jan 2016 10:08:44 -0800
-Subject: [PATCH 3/4] Make --enable-glx actually work on OSX and Windows
-
-Followup for anholt/libepoxy#52
-
-Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Fetched from pull #81 on github for libepoxy:
-https://github.com/anholt/libepoxy/pull/81/commits
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac          | 6 +++---
- src/dispatch_common.h | 4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d3d947c..b4c7ede 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,7 +61,7 @@ XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- AC_ARG_ENABLE([glx],
-                 [AS_HELP_STRING([--disable-glx],
- 				[disable if you don't want x11/glx support])],
--                [],
-+                [enable_glx=$enableval],
-                 [enable_glx=yes]
-              )
- 
-@@ -74,7 +74,7 @@ has_znow=yes
- case $host_os in
-     mingw*)
-         build_egl=no
--        build_glx=no
-+        build_glx=$x11
-         build_wgl=yes
-         # On windows, the DLL has to have all of its functions
-         # resolved at link time, so we have to link directly aginst
-@@ -89,7 +89,7 @@ case $host_os in
-         ;;
-     darwin*)
-         build_egl=no
--        build_glx=no
-+        build_glx=$x11
-         build_wgl=no
-         build_apple=yes
-         has_znow=no
-diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index 2728b45..c30ce44 100644
---- a/src/dispatch_common.h
-+++ b/src/dispatch_common.h
-@@ -26,12 +26,12 @@
- 
- #ifdef _WIN32
- #define PLATFORM_HAS_EGL 0
--#define PLATFORM_HAS_GLX 0
-+#define PLATFORM_HAS_GLX BUILD_GLX
- #define PLATFORM_HAS_WGL BUILD_WGL
- #define EPOXY_IMPORTEXPORT __declspec(dllexport)
- #elif defined(__APPLE__)
- #define PLATFORM_HAS_EGL 0
--#define PLATFORM_HAS_GLX 0
-+#define PLATFORM_HAS_GLX BUILD_GLX
- #define PLATFORM_HAS_WGL 0
- #define EPOXY_IMPORTEXPORT
- #elif defined(ANDROID)
-
diff --git a/package/libepoxy/0004-darwin-use-glx-instead-of-opengl-framework.patch b/package/libepoxy/0004-darwin-use-glx-instead-of-opengl-framework.patch
deleted file mode 100644
index be9b009..0000000
--- a/package/libepoxy/0004-darwin-use-glx-instead-of-opengl-framework.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From d010922282580a32dfebcda12ee1c307b3ef6005 Mon Sep 17 00:00:00 2001
-From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Date: Mon, 18 Jan 2016 09:49:55 -0800
-Subject: [PATCH 4/4] darwin: Use GLX instead of OpenGL.framework if it is the
- current context
-
-Also makes a stab at similar support for Win32
-
-anholt/libepoxy#63
-
-Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
-Fetched from pull #81 on github for libepoxy:
-https://github.com/anholt/libepoxy/pull/81/commits
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/dispatch_common.c | 29 ++++++++++++++++-------------
- 1 file changed, 16 insertions(+), 13 deletions(-)
-
-diff --git a/src/dispatch_common.c b/src/dispatch_common.c
-index 163d348..cb9f76a 100644
---- a/src/dispatch_common.c
-+++ b/src/dispatch_common.c
-@@ -482,16 +482,20 @@ epoxy_glx_dlsym(const char *name)
- void *
- epoxy_gl_dlsym(const char *name)
- {
--#ifdef _WIN32
-+#if defined(_WIN32) || defined(__APPLE__)
-+if (!epoxy_current_context_is_glx()) {
-+# if defined(_WIN32)
-     return do_dlsym(&api.gl_handle, "OPENGL32", name, true);
--#elif defined(__APPLE__)
-+# elif defined(__APPLE__)
-     return do_dlsym(&api.gl_handle,
-                     "/System/Library/Frameworks/OpenGL.framework/Versions/Current/OpenGL",
-                     name, true);
--#else
-+# endif
-+}
-+#endif
-+
-     /* There's no library for desktop GL support independent of GLX. */
-     return epoxy_glx_dlsym(name);
--#endif
- }
- 
- void *
-@@ -615,7 +619,7 @@ epoxy_get_bootstrap_proc_address(const char *name)
-      */
- #if PLATFORM_HAS_GLX
-     if (api.glx_handle && glXGetCurrentContext())
--        return epoxy_gl_dlsym(name);
-+        return epoxy_glx_dlsym(name);
- #endif
- 
-     /* If epoxy hasn't loaded any API-specific library yet, try to
-@@ -644,22 +648,17 @@ epoxy_get_bootstrap_proc_address(const char *name)
-     }
- #endif /* PLATFORM_HAS_EGL */
- 
--    /* Fall back to GLX */
-+    /* Fall back to the platform default */
-     return epoxy_gl_dlsym(name);
- }
- 
- void *
- epoxy_get_proc_address(const char *name)
- {
--#ifdef _WIN32
--    return wglGetProcAddress(name);
--#elif defined(__APPLE__)
--    return epoxy_gl_dlsym(name);
--#else
- #if PLATFORM_HAS_GLX
-     if (epoxy_current_context_is_glx()) {
-         return glXGetProcAddressARB((const GLubyte *)name);
--    } else
-+    }
- #endif /* PLATFORM_HAS_GLX */
- #if PLATFORM_HAS_EGL
-     {
-@@ -674,8 +673,12 @@ epoxy_get_proc_address(const char *name)
-         }
-     }
- #endif /* PLATFORM_HAS_EGL */
-+#if defined(_WIN32)
-+    return wglGetProcAddress(name);
-+#elif defined(__APPLE__)
-+    return epoxy_gl_dlsym(name);
-+#endif
-     errx(1, "Couldn't find current GLX or EGL context.\n");
--#endif /* _WIN32 | __APPLE__*/
- }
- 
- WRAPPER_VISIBILITY (void)
diff --git a/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch b/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch
deleted file mode 100644
index d13f01d..0000000
--- a/package/libepoxy/0005-Forward-egl-cflags-into-epoxy.pc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 68e5f1574758240aedfe8653d7aaae62cdb08bf5 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 20 Dec 2015 10:07:06 -0300
-Subject: [PATCH] Forward egl cflags into epoxy.pc
-
-When building mesa egl without x11 and gles2 the headers need a
-MESA_EGL_NO_X11_HEADERS define, so put them in epoxy.pc as well since
-otherwise builds will fail.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: pull request https://github.com/anholt/libepoxy/pull/80
-
- configure.ac | 2 ++
- epoxy.pc.in  | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c7cffb2..7b599de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -102,6 +102,8 @@ if test x$build_egl = xyes; then
-     AC_DEFINE([BUILD_EGL], [1], [build EGL tests])
- fi
- 
-+AC_SUBST(EGL_CFLAGS)
-+
- PKG_CHECK_MODULES(GL, [gl], [gl=yes], [gl=no])
- if test x$gl = xno; then
-     build_glx=no
-diff --git a/epoxy.pc.in b/epoxy.pc.in
-index 8c85a33..f377da5 100644
---- a/epoxy.pc.in
-+++ b/epoxy.pc.in
-@@ -6,6 +6,6 @@ includedir=@includedir@
- Name: epoxy
- Description: epoxy GL dispatch Library
- Version: @PACKAGE_VERSION@
--Cflags: -I${includedir}
-+Cflags: -I${includedir} @EGL_CFLAGS@
- Libs: -L${libdir} -lepoxy
- Libs.private: @DLOPEN_LIBS@
--- 
-2.4.10
-
diff --git a/package/libepoxy/0006-Make-egl-conditional.patch b/package/libepoxy/0006-Make-egl-conditional.patch
deleted file mode 100644
index 752e8e4..0000000
--- a/package/libepoxy/0006-Make-egl-conditional.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5492e81f317e48141b0687ad77252c52c2dfcd6d Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Fri, 5 Feb 2016 19:03:39 -0300
-Subject: [PATCH] Make egl conditional
-
-Mesa can be built with GLX and without EGL support, so make this
-possible in epoxy as well.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- configure.ac | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6e56599..21e3a25 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -58,6 +58,13 @@ AC_CHECK_HEADER([KHR/khrplatform.h],
- # uintptr_t to a void *") by default.  Kill that.
- XORG_TESTSET_CFLAG(CWARNFLAGS, [-Wno-int-conversion])
- 
-+AC_ARG_ENABLE([egl],
-+		[AS_HELP_STRING([--disable-egl],
-+				[disable if you don't want egl support])],
-+		[enable_egl=$enableval],
-+		[enable_egl=yes]
-+             )
-+
- AC_ARG_ENABLE([glx],
-                 [AS_HELP_STRING([--disable-glx],
- 				[disable if you don't want x11/glx support])],
-@@ -65,6 +72,7 @@ AC_ARG_ENABLE([glx],
-                 [enable_glx=yes]
-              )
- 
-+PKG_CHECK_MODULES(EGL, [egl], [egl=$enable_egl], [egl=no])
- PKG_CHECK_MODULES(X11, [x11], [x11=$enable_glx], [x11=no])
- 
- AM_CONDITIONAL(HAVE_X11, test x$x11 = xyes)
-@@ -96,7 +104,7 @@ case $host_os in
-         EPOXY_LINK_LIBS=""
-         ;;
-     *)
--        build_egl=yes
-+        build_egl=$egl
-         build_glx=$x11
-         build_wgl=no
-         # On platforms with dlopen, we load everything dynamically and
-@@ -109,7 +117,6 @@ AC_SUBST(EPOXY_LINK_LIBS)
- 
- AM_CONDITIONAL(BUILD_EGL, test x$build_egl = xyes)
- if test x$build_egl = xyes; then
--    PKG_CHECK_MODULES(EGL, [egl])
-     AC_DEFINE([BUILD_EGL], [1], [build EGL tests])
- fi
- 
--- 
-2.4.10
-
diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index cb35cd4..eec1363 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 6700ddedffb827b42c72cce1e0be6fba67b678b19bf256e1b5efd3ea38cc2bb4  libepoxy-v1.3.1.tar.gz
+# From ftp://ftp.gnome.org/pub/gnome/sources/libepoxy/1.4/libepoxy-1.4.0.sha256sum
+sha256 25a906b14a921bc2b488cfeaa21a00486fe92630e4a9dd346e4ecabeae52ab41  libepoxy-1.4.0.tar.xz
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 7436e8f..dbfd6b8 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBEPOXY_VERSION = v1.3.1
-LIBEPOXY_SITE = $(call github,anholt,libepoxy,$(LIBEPOXY_VERSION))
+LIBEPOXY_VERSION_MAJOR = 1.4
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).0
+LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
+LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-# For patches 0001-0006:
-LIBEPOXY_AUTORECONF = YES
 LIBEPOXY_DEPENDENCIES = xutil_util-macros
 LIBEPOXY_LICENSE = MIT
 LIBEPOXY_LICENSE_FILES = COPYING
