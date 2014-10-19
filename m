From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 17:23:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Fix uClibc build with
	BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413732225-14832-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413732225-14832-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d-0002-execinfo_h.patch |   42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/mesa3d/mesa3d-0002-execinfo_h.patch

diff --git a/package/mesa3d/mesa3d-0002-execinfo_h.patch b/package/mesa3d/mesa3d-0002-execinfo_h.patch
new file mode 100644
index 0000000..9e3cdd8
--- /dev/null
+++ b/package/mesa3d/mesa3d-0002-execinfo_h.patch
@@ -0,0 +1,42 @@
+Fixes uclibc build as uclibc does not include backtrace functionality
+
+Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=85197
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr Mesa-10.3.1.org/src/mapi/glapi/gen/gl_gentable.py Mesa-10.3.1/src/mapi/glapi/gen/gl_gentable.py
+--- Mesa-10.3.1.org/src/mapi/glapi/gen/gl_gentable.py	2014-10-12 22:42:39.000000000 +0200
++++ Mesa-10.3.1/src/mapi/glapi/gen/gl_gentable.py	2014-10-19 13:52:19.517222947 +0200
+@@ -40,9 +40,10 @@
+ #ifdef HAVE_DIX_CONFIG_H
+ #include <dix-config.h>
+ #endif
++#include <features.h>
+ 
+ #if (defined(GLXEXT) && defined(HAVE_BACKTRACE)) \\
+-	|| (!defined(GLXEXT) && defined(DEBUG) && !defined(_WIN32_WCE) && !defined(__CYGWIN__) && !defined(__MINGW32__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__))
++	|| (!defined(GLXEXT) && defined(DEBUG) && !defined(_WIN32_WCE) && !defined(__CYGWIN__) && !defined(__MINGW32__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__DragonFly__) && !defined(__UCLIBC__))
+ #define USE_BACKTRACE
+ #endif
+ 
+diff -uNr Mesa-10.3.1.org/src/mesa/drivers/dri/i915/intel_regions.c Mesa-10.3.1/src/mesa/drivers/dri/i915/intel_regions.c
+--- Mesa-10.3.1.org/src/mesa/drivers/dri/i915/intel_regions.c	2014-05-06 00:45:23.000000000 +0200
++++ Mesa-10.3.1/src/mesa/drivers/dri/i915/intel_regions.c	2014-10-19 13:54:01.645226603 +0200
+@@ -41,6 +41,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <errno.h>
++#include <features.h>
+ 
+ #include "main/hash.h"
+ #include "intel_context.h"
+@@ -65,7 +66,9 @@
+ #define _DBG(...) {debug_backtrace(); DBG(__VA_ARGS__);}
+ 
+ /* Backtracing debug support */
++#if !defined(__UCLIBC__)
+ #include <execinfo.h>
++#endif
+ 
+ static void
+ debug_backtrace(void)
-- 
1.7.10.4
