From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Dec 2014 18:29:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Bump version to 10.4.0
Message-ID: <1418578195-4768-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- removed mesa3d-0002-execinfo_h.patch, applied upstream
- renamed remaining patch according to new convention

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...tform.h-not-installed-if-EGL-is-disabled.patch} |    0
 package/mesa3d/mesa3d-0002-execinfo_h.patch        |   47 --------------------
 package/mesa3d/mesa3d.hash                         |    4 +-
 package/mesa3d/mesa3d.mk                           |    2 +-
 4 files changed, 3 insertions(+), 50 deletions(-)
 rename package/mesa3d/{mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch => 0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch} (100%)
 delete mode 100644 package/mesa3d/mesa3d-0002-execinfo_h.patch

diff --git a/package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch b/package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
similarity index 100%
rename from package/mesa3d/mesa3d-0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
rename to package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
diff --git a/package/mesa3d/mesa3d-0002-execinfo_h.patch b/package/mesa3d/mesa3d-0002-execinfo_h.patch
deleted file mode 100644
index dbedfd1..0000000
--- a/package/mesa3d/mesa3d-0002-execinfo_h.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fixes uclibc build as uclibc does not include backtrace functionality
-
-Patch sent upstream:
-http://lists.freedesktop.org/archives/mesa-dev/2014-October/069506.html
-
-Bugtracker: https://bugs.freedesktop.org/show_bug.cgi?id=85197
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr Mesa-10.3.1.org/configure.ac Mesa-10.3.1/configure.ac
---- Mesa-10.3.1.org/configure.ac	2014-10-12 22:42:38.000000000 +0200
-+++ Mesa-10.3.1/configure.ac	2014-10-19 19:15:11.000000000 +0200
-@@ -539,6 +539,9 @@
- dnl See if posix_memalign is available
- AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
- 
-+dnl Check for backtrace support
-+AC_CHECK_HEADER([execinfo.h], [DEFINES="$DEFINES -DHAVE_EXECINFO_H"])
-+
- dnl Check for pthreads
- case "$host_os" in
- mingw*)
-diff -uNr Mesa-10.3.1.org/src/mapi/glapi/gen/gl_gentable.py Mesa-10.3.1/src/mapi/glapi/gen/gl_gentable.py
---- Mesa-10.3.1.org/src/mapi/glapi/gen/gl_gentable.py	2014-10-12 22:42:39.000000000 +0200
-+++ Mesa-10.3.1/src/mapi/glapi/gen/gl_gentable.py	2014-10-19 19:21:32.913846414 +0200
-@@ -42,7 +42,7 @@
- #endif
- 
- #if (defined(GLXEXT) && defined(HAVE_BACKTRACE)) \\
--	|| (!defined(GLXEXT) && defined(DEBUG) && !defined(_WIN32_WCE) && !defined(__CYGWIN__) && !defined(__MINGW32__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__))
-+	|| (!defined(GLXEXT) && defined(DEBUG) && defined(HAVE_EXECINFO_H) && !defined(_WIN32_WCE) && !defined(__CYGWIN__) && !defined(__MINGW32__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__))
- #define USE_BACKTRACE
- #endif
- 
-diff -uNr Mesa-10.3.1.org/src/mesa/drivers/dri/i915/intel_regions.c Mesa-10.3.1/src/mesa/drivers/dri/i915/intel_regions.c
---- Mesa-10.3.1.org/src/mesa/drivers/dri/i915/intel_regions.c	2014-05-06 00:45:23.000000000 +0200
-+++ Mesa-10.3.1/src/mesa/drivers/dri/i915/intel_regions.c	2014-10-19 19:23:13.833850693 +0200
-@@ -65,7 +65,9 @@
- #define _DBG(...) {debug_backtrace(); DBG(__VA_ARGS__);}
- 
- /* Backtracing debug support */
-+#ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
-+#endif
- 
- static void
- debug_backtrace(void)
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index bdcccaa..4c67205 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2014-November/000122.html
-sha256	0e4eee4a2ddf86456eed2fc44da367f95471f74249636710491e85cc256c4753	MesaLib-10.3.3.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2014-December/000130.html
+sha256	98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219	MesaLib-10.4.0.tar.bz2
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b3194d0..1e39b82 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.3.5
+MESA3D_VERSION = 10.4.0
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
1.7.10.4
