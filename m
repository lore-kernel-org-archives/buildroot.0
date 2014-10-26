From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 14:13:51 +0100
Subject: [Buildroot] [git commit] package/mesa3d: Fix uClibc build with
	BR2_ENABLE_DEBUG=yes
Message-ID: <20141026131356.1085EB06F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b90a1ea36da85287583f9d82150d3f2c88c77d9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/mesa3d-0002-execinfo_h.patch |   47 +++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/mesa3d-0002-execinfo_h.patch b/package/mesa3d/mesa3d-0002-execinfo_h.patch
new file mode 100644
index 0000000..dbedfd1
--- /dev/null
+++ b/package/mesa3d/mesa3d-0002-execinfo_h.patch
@@ -0,0 +1,47 @@
+Fixes uclibc build as uclibc does not include backtrace functionality
+
+Patch sent upstream:
+http://lists.freedesktop.org/archives/mesa-dev/2014-October/069506.html
+
+Bugtracker: https://bugs.freedesktop.org/show_bug.cgi?id=85197
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr Mesa-10.3.1.org/configure.ac Mesa-10.3.1/configure.ac
+--- Mesa-10.3.1.org/configure.ac	2014-10-12 22:42:38.000000000 +0200
++++ Mesa-10.3.1/configure.ac	2014-10-19 19:15:11.000000000 +0200
+@@ -539,6 +539,9 @@
+ dnl See if posix_memalign is available
+ AC_CHECK_FUNC([posix_memalign], [DEFINES="$DEFINES -DHAVE_POSIX_MEMALIGN"])
+ 
++dnl Check for backtrace support
++AC_CHECK_HEADER([execinfo.h], [DEFINES="$DEFINES -DHAVE_EXECINFO_H"])
++
+ dnl Check for pthreads
+ case "$host_os" in
+ mingw*)
+diff -uNr Mesa-10.3.1.org/src/mapi/glapi/gen/gl_gentable.py Mesa-10.3.1/src/mapi/glapi/gen/gl_gentable.py
+--- Mesa-10.3.1.org/src/mapi/glapi/gen/gl_gentable.py	2014-10-12 22:42:39.000000000 +0200
++++ Mesa-10.3.1/src/mapi/glapi/gen/gl_gentable.py	2014-10-19 19:21:32.913846414 +0200
+@@ -42,7 +42,7 @@
+ #endif
+ 
+ #if (defined(GLXEXT) && defined(HAVE_BACKTRACE)) \\
+-	|| (!defined(GLXEXT) && defined(DEBUG) && !defined(_WIN32_WCE) && !defined(__CYGWIN__) && !defined(__MINGW32__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__))
++	|| (!defined(GLXEXT) && defined(DEBUG) && defined(HAVE_EXECINFO_H) && !defined(_WIN32_WCE) && !defined(__CYGWIN__) && !defined(__MINGW32__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__))
+ #define USE_BACKTRACE
+ #endif
+ 
+diff -uNr Mesa-10.3.1.org/src/mesa/drivers/dri/i915/intel_regions.c Mesa-10.3.1/src/mesa/drivers/dri/i915/intel_regions.c
+--- Mesa-10.3.1.org/src/mesa/drivers/dri/i915/intel_regions.c	2014-05-06 00:45:23.000000000 +0200
++++ Mesa-10.3.1/src/mesa/drivers/dri/i915/intel_regions.c	2014-10-19 19:23:13.833850693 +0200
+@@ -65,7 +65,9 @@
+ #define _DBG(...) {debug_backtrace(); DBG(__VA_ARGS__);}
+ 
+ /* Backtracing debug support */
++#ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
++#endif
+ 
+ static void
+ debug_backtrace(void)
