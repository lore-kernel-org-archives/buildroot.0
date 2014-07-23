From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 20:33:21 +0200
Subject: [Buildroot] [PATCH 4/4] python-numpy: add patch to fix build on
	uClibc
In-Reply-To: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1406140401-16997-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1406140401-16997-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/01d/01da44bc4b644a46326d8fbd87708b7a98971487/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-numpy-0001-no-fenv-on-uclibc.patch      | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch

diff --git a/package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch b/package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch
new file mode 100644
index 0000000..633dbcd
--- /dev/null
+++ b/package/python-numpy/python-numpy-0001-no-fenv-on-uclibc.patch
@@ -0,0 +1,79 @@
+Don't use <fenv.h> on uClibc
+
+The python-numpy code already has provisions to not use <fenv.h> when
+not available. However, it uses __GLIBC__ to know whether fenv.h is
+available or not, but uClibc defines __GLIBC__, so python-numpy thinks
+fenv.h is available.
+
+This patch fixes that by changing all defined(__GLIBC__) occurences by
+(defined(__GLIBC__) && !defined(__UCLIBC__)).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/numpy/core/include/numpy/ufuncobject.h
+===================================================================
+--- a/numpy/core/include/numpy/ufuncobject.h
++++ b/numpy/core/include/numpy/ufuncobject.h
+@@ -413,11 +413,11 @@
+         (void) fpsetsticky(0); \
+         }
+ 
+-#elif defined(__GLIBC__) || defined(__APPLE__) || \
++#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
+       defined(__CYGWIN__) || defined(__MINGW32__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ 
+-#if defined(__GLIBC__) || defined(__APPLE__) || \
++#if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
+     defined(__MINGW32__) || defined(__FreeBSD__)
+ #include <fenv.h>
+ #elif defined(__CYGWIN__)
+Index: b/numpy/core/src/npymath/ieee754.c.src
+===================================================================
+--- a/numpy/core/src/npymath/ieee754.c.src
++++ b/numpy/core/src/npymath/ieee754.c.src
+@@ -586,11 +586,11 @@
+ }
+ 
+ 
+-#elif defined(__GLIBC__) || defined(__APPLE__) || \
++#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
+       defined(__CYGWIN__) || defined(__MINGW32__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ 
+-# if defined(__GLIBC__) || defined(__APPLE__) || \
++# if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
+      defined(__MINGW32__) || defined(__FreeBSD__)
+ #  include <fenv.h>
+ # elif defined(__CYGWIN__)
+Index: b/numpy/numarray/_capi.c
+===================================================================
+--- a/numpy/numarray/_capi.c
++++ b/numpy/numarray/_capi.c
+@@ -10,7 +10,7 @@
+ #include <sys/param.h>
+ #endif
+ 
+-#if defined(__GLIBC__) || defined(__APPLE__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
++#if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ #include <fenv.h>
+ #elif defined(__CYGWIN__)
+ #include "numpy/fenv/fenv.h"
+@@ -258,7 +258,7 @@
+ }
+ 
+ /* Likewise for Integer overflows */
+-#if defined(__GLIBC__) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
++#if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ static int int_overflow_error(Float64 value) { /* For x86_64 */
+     feraiseexcept(FE_OVERFLOW);
+     return (int) value;
+@@ -3007,7 +3007,7 @@
+     return retstatus;
+ }
+ 
+-#elif defined(__GLIBC__) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
++#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ 
+ static int
+ NA_checkFPErrors(void)
-- 
2.0.0
