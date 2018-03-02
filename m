From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri,  2 Mar 2018 17:16:04 +0300
Subject: [Buildroot] [PATCH] package/python-numpy: fix fenv build failure on
 ARCv2 with glibc
Message-ID: <20180302141604.42489-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building python-numpy on ARC HS with glibc fails due to missing FE_*
definitions in <fenv.h>. There exceptions are not supported by
ARCv2 architecture.
Let's add patch, which disables compilation of a part of the
code in which FE_* errors occur for ARC.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
 .../0003-no-FPU-exceptions-bits-on-ARC-glibc.patch | 28 ++++++++++++++++++++++
 package/python-numpy/Config.in                     |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch

diff --git a/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch b/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
new file mode 100644
index 0000000000..8347b96931
--- /dev/null
+++ b/package/python-numpy/0003-no-FPU-exceptions-bits-on-ARC-glibc.patch
@@ -0,0 +1,28 @@
+From 0a667a5b31ca8a3ebc31f96b919e7e11d3bde856 Mon Sep 17 00:00:00 2001
+From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+Date: Tue, 6 Feb 2018 15:59:22 +0300
+Subject: [PATCH] FIX: no FPU exceptions bits on ARC glibc
+
+The FPU exceptions bits are missing in fenv.h in glibc for ARC architecture.
+
+Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
+---
+ numpy/core/src/npymath/ieee754.c.src | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
+index e63e409b6..944b2ea7c 100644
+--- a/numpy/core/src/npymath/ieee754.c.src
++++ b/numpy/core/src/npymath/ieee754.c.src
+@@ -612,7 +612,7 @@ void npy_set_floatstatus_invalid(void)
+ }
+ 
+ 
+-#elif (defined(__GLIBC__) && !defined(__UCLIBC__)) || defined(__APPLE__) || \
++#elif (defined(__GLIBC__) && !defined(__UCLIBC__) && !defined(__arc__)) || defined(__APPLE__) || \
+       defined(__CYGWIN__) || defined(__MINGW32__) || \
+       (defined(__FreeBSD__) && (__FreeBSD_version >= 502114))
+ #  include <fenv.h>
+-- 
+2.11.0
+
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 067085bf41..a1f31ef688 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	# Numpy has some CPU specific code
 	# ARCompact build fails due to toolchain issue
 	# ARC HS38 build fails on glibc due to missing FE_* definitions
-	default y if BR2_arc && BR2_archs38 && !BR2_TOOLCHAIN_USES_GLIBC
+	default y if BR2_arc
 	default y if BR2_aarch64
 	default y if BR2_arm
 	default y if BR2_armeb
-- 
2.11.0
