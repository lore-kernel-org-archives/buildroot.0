From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:06:15 +0200
Subject: [Buildroot] [git commit] python-numpy: Bump to the most recent
	release 1.13.1
Message-ID: <20170919195901.D17D77FB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fbb91c3ac911bc654d44f889fac4ae8066be5a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note previously used location for releases on SourceForge is no longer
supported (latest tarball v1.11.2 available there is dated 2016-10-04)
so as other distros
(see, Fedora http://pkgs.fedoraproject.org/cgit/rpms/numpy.git/tree/numpy.spec?id=7013948f8ba073c69a91a545f0a0898cb62652fa#n22)
we get release tarball directly from GitHub.

Also note 0001-no-fenv-on-uclibc.patch was rebased on v1.13.1.

0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch is no
longer needed. Since https://github.com/numpy/numpy/pull/4852, there
is a wrapper for frexpl and ldexpl like for the other math functions.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: improve explanation of 0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-numpy/0001-no-fenv-on-uclibc.patch  | 80 +++++++---------------
 ...indly-enable-frexpl-and-ldexpl-for-uClibc.patch | 33 ---------
 package/python-numpy/python-numpy.hash             |  4 +-
 package/python-numpy/python-numpy.mk               |  6 +-
 4 files changed, 30 insertions(+), 93 deletions(-)

diff --git a/package/python-numpy/0001-no-fenv-on-uclibc.patch b/package/python-numpy/0001-no-fenv-on-uclibc.patch
index 633dbcd..5aa377b 100644
--- a/package/python-numpy/0001-no-fenv-on-uclibc.patch
+++ b/package/python-numpy/0001-no-fenv-on-uclibc.patch
@@ -1,4 +1,7 @@
-Don't use <fenv.h> on uClibc
+From 1d309b81a6fdac33dfb5148f618bafe6ebdff958 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 15 Sep 2017 12:51:36 +0300
+Subject: [PATCH] Don't use <fenv.h> on uClibc
 
 The python-numpy code already has provisions to not use <fenv.h> when
 not available. However, it uses __GLIBC__ to know whether fenv.h is
@@ -9,30 +12,30 @@ This patch fixes that by changing all defined(__GLIBC__) occurences by
 (defined(__GLIBC__) && !defined(__UCLIBC__)).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ numpy/core/include/numpy/ufuncobject.h | 2 +-
+ numpy/core/src/npymath/ieee754.c.src   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: b/numpy/core/include/numpy/ufuncobject.h
-===================================================================
+diff --git a/numpy/core/include/numpy/ufuncobject.h b/numpy/core/include/numpy/ufuncobject.h
+index d0ac1fd7d732..65e49fcd5b7a 100644
 --- a/numpy/core/include/numpy/ufuncobject.h
 +++ b/numpy/core/include/numpy/ufuncobject.h
-@@ -413,11 +413,11 @@
-         (void) fpsetsticky(0); \
-         }
- 
--#elif defined(__GLIBC__) || defined(__APPLE__) || \
-+#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
+@@ -319,7 +319,7 @@ typedef struct _loop1d_info {
+ #if defined(sun) || defined(__BSD__) || defined(__OpenBSD__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version < 502114)) || \
+       defined(__NetBSD__) || \
+-      defined(__GLIBC__) || defined(__APPLE__) || \
++      (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
        defined(__CYGWIN__) || defined(__MINGW32__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- 
--#if defined(__GLIBC__) || defined(__APPLE__) || \
-+#if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
-     defined(__MINGW32__) || defined(__FreeBSD__)
- #include <fenv.h>
- #elif defined(__CYGWIN__)
-Index: b/numpy/core/src/npymath/ieee754.c.src
-===================================================================
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114)) || \
+       defined(_AIX) || \
+diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
+index 0370ea6c77aa..e63e409b6604 100644
 --- a/numpy/core/src/npymath/ieee754.c.src
 +++ b/numpy/core/src/npymath/ieee754.c.src
-@@ -586,11 +586,11 @@
+@@ -612,7 +612,7 @@ void npy_set_floatstatus_invalid(void)
  }
  
  
@@ -40,40 +43,7 @@ Index: b/numpy/core/src/npymath/ieee754.c.src
 +#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
        defined(__CYGWIN__) || defined(__MINGW32__) || \
        (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- 
--# if defined(__GLIBC__) || defined(__APPLE__) || \
-+# if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
-      defined(__MINGW32__) || defined(__FreeBSD__)
  #  include <fenv.h>
- # elif defined(__CYGWIN__)
-Index: b/numpy/numarray/_capi.c
-===================================================================
---- a/numpy/numarray/_capi.c
-+++ b/numpy/numarray/_capi.c
-@@ -10,7 +10,7 @@
- #include <sys/param.h>
- #endif
- 
--#if defined(__GLIBC__) || defined(__APPLE__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
-+#if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- #include <fenv.h>
- #elif defined(__CYGWIN__)
- #include "numpy/fenv/fenv.h"
-@@ -258,7 +258,7 @@
- }
- 
- /* Likewise for Integer overflows */
--#if defined(__GLIBC__) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
-+#if (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- static int int_overflow_error(Float64 value) { /* For x86_64 */
-     feraiseexcept(FE_OVERFLOW);
-     return (int) value;
-@@ -3007,7 +3007,7 @@
-     return retstatus;
- }
- 
--#elif defined(__GLIBC__) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
-+#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || defined(__CYGWIN__) || defined(__MINGW32__) || (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- 
- static int
- NA_checkFPErrors(void)
+-- 
+2.7.5
+
diff --git a/package/python-numpy/0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch b/package/python-numpy/0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch
deleted file mode 100644
index 42d1941..0000000
--- a/package/python-numpy/0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b0a1b9628d17251bb417a063ec6c6e09f32393c2 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Tue, 6 Oct 2015 01:20:48 +0100
-Subject: [PATCH] Don't blindly enable frexpl and ldexpl for uClibc
-
-When the size of double and long double are equal, numpy blindly
-assumes that frexpl and ldexpl will be available as well. But for
-uClibc, that's not true: it only defines the long double functions
-when long double "exists" on the architecture.
-
-So make an exception for uClibc.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- numpy/core/src/private/npy_config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/core/src/private/npy_config.h b/numpy/core/src/private/npy_config.h
-index 453dbd0..7ecf72c 100644
---- a/numpy/core/src/private/npy_config.h
-+++ b/numpy/core/src/private/npy_config.h
-@@ -11,7 +11,7 @@
- #endif
- 
- /* Safe to use ldexp and frexp for long double for MSVC builds */
--#if (NPY_SIZEOF_LONGDOUBLE == NPY_SIZEOF_DOUBLE) || defined(_MSC_VER)
-+#if ((NPY_SIZEOF_LONGDOUBLE == NPY_SIZEOF_DOUBLE) && !defined(__UCLIBC__)) || defined(_MSC_VER)
-     #ifdef HAVE_LDEXP
-         #define HAVE_LDEXPL 1
-     #endif
--- 
-2.5.3
-
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 39b134b..7dcdb44 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  2764d0819acc77e9ff81b060fe7f69530b0d85c26ac9d162639b787cb227d253  numpy-1.8.0.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.13.1
+sha256	de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93	numpy-1.13.1.tar.gz
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 93ffaa4..d0c279f 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.8.0
+PYTHON_NUMPY_VERSION = 1.13.1
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
-PYTHON_NUMPY_SITE = http://downloads.sourceforge.net/numpy
+PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause
 PYTHON_NUMPY_LICENSE_FILES = LICENSE.txt
-PYTHON_NUMPY_SETUP_TYPE = distutils
+PYTHON_NUMPY_SETUP_TYPE = setuptools
 
 ifeq ($(BR2_PACKAGE_CLAPACK),y)
 PYTHON_NUMPY_DEPENDENCIES += clapack
