From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 Mar 2019 12:49:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: bump to version 1.16.2
Message-ID: <20190316114943.14110-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update patches and send them upstream
- Update license hash (typos fixed and year updated)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Don-t-use-fenv.h-on-uClibc.patch          | 30 +++++++++++++
 package/python-numpy/0001-no-fenv-on-uclibc.patch  | 49 ----------------------
 ...2-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch | 31 ++++++++++++++
 .../0003-no-FPU-exceptions-bits-on-ARC-glibc.patch | 42 -------------------
 package/python-numpy/python-numpy.hash             |  6 +--
 package/python-numpy/python-numpy.mk               |  2 +-
 6 files changed, 65 insertions(+), 95 deletions(-)
 create mode 100644 package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
 delete mode 100644 package/python-numpy/0001-no-fenv-on-uclibc.patch
 create mode 100644 package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
 delete mode 100644 package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch

diff --git a/package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch b/package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
new file mode 100644
index 0000000000..8b3937a1ba
--- /dev/null
+++ b/package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
@@ -0,0 +1,30 @@
+From 52b47439d17463304e5bd7974dec17ced0b0f24a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Mar 2019 10:38:27 +0100
+Subject: [PATCH] Don't use <fenv.h> on uClibc
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/numpy/numpy/pull/13137]
+---
+ numpy/core/src/npymath/ieee754.c.src | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
+index d960838c8..f3f15f841 100644
+--- a/numpy/core/src/npymath/ieee754.c.src
++++ b/numpy/core/src/npymath/ieee754.c.src
+@@ -681,7 +681,8 @@ void npy_set_floatstatus_invalid(void)
+     fp_raise_xcp(FP_INVALID);
+ }
+ 
+-#elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha))
++#elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha)) || \
++      defined (__UCLIBC__)
+ 
+ /*
+  * By using a volatile floating point value,
+-- 
+2.14.1
+
diff --git a/package/python-numpy/0001-no-fenv-on-uclibc.patch b/package/python-numpy/0001-no-fenv-on-uclibc.patch
deleted file mode 100644
index 5aa377bb21..0000000000
--- a/package/python-numpy/0001-no-fenv-on-uclibc.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 1d309b81a6fdac33dfb5148f618bafe6ebdff958 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 15 Sep 2017 12:51:36 +0300
-Subject: [PATCH] Don't use <fenv.h> on uClibc
-
-The python-numpy code already has provisions to not use <fenv.h> when
-not available. However, it uses __GLIBC__ to know whether fenv.h is
-available or not, but uClibc defines __GLIBC__, so python-numpy thinks
-fenv.h is available.
-
-This patch fixes that by changing all defined(__GLIBC__) occurences by
-(defined(__GLIBC__) && !defined(__UCLIBC__)).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- numpy/core/include/numpy/ufuncobject.h | 2 +-
- numpy/core/src/npymath/ieee754.c.src   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/numpy/core/include/numpy/ufuncobject.h b/numpy/core/include/numpy/ufuncobject.h
-index d0ac1fd7d732..65e49fcd5b7a 100644
---- a/numpy/core/include/numpy/ufuncobject.h
-+++ b/numpy/core/include/numpy/ufuncobject.h
-@@ -319,7 +319,7 @@ typedef struct _loop1d_info {
- #if defined(sun) || defined(__BSD__) || defined(__OpenBSD__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version < 502114)) || \
-       defined(__NetBSD__) || \
--      defined(__GLIBC__) || defined(__APPLE__) || \
-+      (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
-       defined(__CYGWIN__) || defined(__MINGW32__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114)) || \
-       defined(_AIX) || \
-diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
-index 0370ea6c77aa..e63e409b6604 100644
---- a/numpy/core/src/npymath/ieee754.c.src
-+++ b/numpy/core/src/npymath/ieee754.c.src
-@@ -612,7 +612,7 @@ void npy_set_floatstatus_invalid(void)
- }
- 
- 
--#elif defined(__GLIBC__) || defined(__APPLE__) || \
-+#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
-       defined(__CYGWIN__) || defined(__MINGW32__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- #  include <fenv.h>
--- 
-2.7.5
-
diff --git a/package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch b/package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
new file mode 100644
index 0000000000..ece52118d7
--- /dev/null
+++ b/package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
@@ -0,0 +1,31 @@
+From 1125f1ee33324bc91b4e8dd9da49163af572d04a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Mar 2019 10:48:25 +0100
+Subject: [PATCH] FIX: no FPU exceptions bits on ARC glibc
+
+The FPU exceptions bits are missing in fenv.h in glibc for ARC
+architecture.
+
+Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/numpy/numpy/pull/13137]
+---
+ numpy/core/src/npymath/ieee754.c.src | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
+index f3f15f841..3f66b24a4 100644
+--- a/numpy/core/src/npymath/ieee754.c.src
++++ b/numpy/core/src/npymath/ieee754.c.src
+@@ -682,7 +682,7 @@ void npy_set_floatstatus_invalid(void)
+ }
+ 
+ #elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha)) || \
+-      defined (__UCLIBC__)
++      defined (__UCLIBC__) || (defined(__arc__) && defined(__GLIBC__))
+ 
+ /*
+  * By using a volatile floating point value,
+-- 
+2.14.1
+
diff --git a/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch b/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
deleted file mode 100644
index f2ed4f6f98..0000000000
--- a/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ae217b0e77a52f08f46ef66fa88820946984507a Mon Sep 17 00:00:00 2001
-From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
-Date: Tue, 6 Feb 2018 15:59:22 +0300
-Subject: [PATCH] FIX: no FPU exceptions bits on ARC glibc
-
-The FPU exceptions bits are missing in fenv.h in glibc for ARC architecture.
-
-Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
----
- numpy/core/include/numpy/ufuncobject.h | 2 +-
- numpy/core/src/npymath/ieee754.c.src   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/numpy/core/include/numpy/ufuncobject.h b/numpy/core/include/numpy/ufuncobject.h
-index 89f72fcea..29e05b179 100644
---- a/numpy/core/include/numpy/ufuncobject.h
-+++ b/numpy/core/include/numpy/ufuncobject.h
-@@ -319,7 +319,7 @@ typedef struct _loop1d_info {
- #if defined(sun) || defined(__BSD__) || defined(__OpenBSD__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version < 502114)) || \
-       defined(__NetBSD__) || \
--      (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
-+      (defined(__GLIBC__) && !defined(__UCLIBC__) && !defined(__arc__)) || defined(__APPLE__) || \
-       defined(__CYGWIN__) || defined(__MINGW32__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114)) || \
-       defined(_AIX) || \
-diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
-index 8dc4d77ef..78e646470 100644
---- a/numpy/core/src/npymath/ieee754.c.src
-+++ b/numpy/core/src/npymath/ieee754.c.src
-@@ -627,7 +627,7 @@ void npy_set_floatstatus_invalid(void)
- }
- 
- 
--#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
-+#elif (defined(__GLIBC__) && !defined(__UCLIBC__) && !defined(__arc__)) || defined(__APPLE__) || \
-       defined(__CYGWIN__) || defined(__MINGW32__) || \
-       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
- #  include <fenv.h>
--- 
-2.16.2
-
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 7c7f446118..ef2aa7f16d 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,4 +1,4 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.15.1
-sha256	3c1ccce5d935ef8df16ae0595b459ef08a5cdb05aee195ebc04b9d89a72be7fa	numpy-1.15.1.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.16.2
+sha256	8088221e6e27da8d5907729f0bfe798f526836f22cc59ae83a0f867e67416a3e	numpy-1.16.2.tar.gz
 # License files, locally calculated
-sha256	9e85ee1c3f11444243c9b7667721592a01f1cd90cb28ad937ac99f6241d6b685	LICENSE.txt
+sha256	6b5086f61fe0c71564a79304ecbaa60f11fa3f3debf82f73d16a611cab102adc	LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 26a10c377b..20f42eab69 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.15.1
+PYTHON_NUMPY_VERSION = 1.16.2
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause
-- 
2.14.1
