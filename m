From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 14 Jan 2019 18:43:16 +0300
Subject: [Buildroot] [PATCH v2] package/python-numpy: fix fenv build failure
 on ARC with glibc
Message-ID: <20190114154316.47795-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building python-numpy on ARC with glibc fails due to missing FE_*
definitions in <fenv.h>. These exceptions are not supported by
ARC architecture. Let's add patch, which disables compilation
of a part of the code in which FE_* errors occur for ARC.

ARCompact toolchain issues are already fixed in the latest toolchain.
Also since commit "311af5e8c2db887800639bc803c8201b6b70e9ce"
("toolchain/toolchain-buildroot: enable glibc for all little-endian
ARCs with atomic ops") glibc is available for ARCompact.
That is why in Config.in we are leaving only "BR_arc" and
removing comments, which are not actual.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
Changes since v1:
-Modify patch according to uClibc patch
-Remove irrelevant comments in Config.in
-Update commit message and title
 .../0003-no-FPU-exceptions-bits-on-ARC-glibc.patch | 42 ++++++++++++++++++++++
 package/python-numpy/Config.in                     |  4 +--
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch

diff --git a/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch b/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
new file mode 100644
index 0000000000..f2ed4f6f98
--- /dev/null
+++ b/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
@@ -0,0 +1,42 @@
+From ae217b0e77a52f08f46ef66fa88820946984507a Mon Sep 17 00:00:00 2001
+From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+Date: Tue, 6 Feb 2018 15:59:22 +0300
+Subject: [PATCH] FIX: no FPU exceptions bits on ARC glibc
+
+The FPU exceptions bits are missing in fenv.h in glibc for ARC architecture.
+
+Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+---
+ numpy/core/include/numpy/ufuncobject.h | 2 +-
+ numpy/core/src/npymath/ieee754.c.src   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/numpy/core/include/numpy/ufuncobject.h b/numpy/core/include/numpy/ufuncobject.h
+index 89f72fcea..29e05b179 100644
+--- a/numpy/core/include/numpy/ufuncobject.h
++++ b/numpy/core/include/numpy/ufuncobject.h
+@@ -319,7 +319,7 @@ typedef struct _loop1d_info {
+ #if defined(sun) || defined(__BSD__) || defined(__OpenBSD__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version < 502114)) || \
+       defined(__NetBSD__) || \
+-      (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
++      (defined(__GLIBC__) && !defined(__UCLIBC__) && !defined(__arc__)) || defined(__APPLE__) || \
+       defined(__CYGWIN__) || defined(__MINGW32__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114)) || \
+       defined(_AIX) || \
+diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
+index 8dc4d77ef..78e646470 100644
+--- a/numpy/core/src/npymath/ieee754.c.src
++++ b/numpy/core/src/npymath/ieee754.c.src
+@@ -627,7 +627,7 @@ void npy_set_floatstatus_invalid(void)
+ }
+ 
+ 
+-#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
++#elif (defined(__GLIBC__) && !defined(__UCLIBC__) && !defined(__arc__)) || defined(__APPLE__) || \
+       defined(__CYGWIN__) || defined(__MINGW32__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ #  include <fenv.h>
+-- 
+2.16.2
+
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 067085bf41..c337675ceb 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	bool
 	# Numpy has some CPU specific code
-	# ARCompact build fails due to toolchain issue
-	# ARC HS38 build fails on glibc due to missing FE_* definitions
-	default y if BR2_arc && BR2_archs38 && !BR2_TOOLCHAIN_USES_GLIBC
+	default y if BR2_arc
 	default y if BR2_aarch64
 	default y if BR2_arm
 	default y if BR2_armeb
-- 
2.16.2
