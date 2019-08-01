From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  1 Aug 2019 23:09:19 +0200
Subject: [Buildroot] [PATCH 4/5] package/python-numpy: disable numpy if
 fenv.h is not provided by libc
In-Reply-To: <20190801210920.31338-1-romain.naour@smile.fr>
References: <20190801210920.31338-1-romain.naour@smile.fr>
Message-ID: <20190801210920.31338-4-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Damien DUVAL <damien.duval@smile.fr>

With a c library which does not provide fenv.h, it won't work at runtime:
Crash after an "import numpy" on python.

Since numpy v1.16.0:
"Alpine Linux (and other musl c library distros) support
We now default to use fenv.h for floating point status error reporting.
Previously we had a broken default that sometimes would not report
underflow, overflow, and invalid floating point operations. Now we can
support non-glibc distrubutions like Alpine Linux as long as they ship
fenv.h."
Also there is a lack of define in glibc for ARC architecture and python
numpy cannot build.
The removed patches were just fixes for the build for uclibc and glibc
for ARC

Configurations which does not provide fenv.h (like uclibc) won't be able
to select the python-numpy package to avoid errors at runtime.

Signed-off-by: Damien DUVAL <damien.duval@smile.fr>
Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../0001-Don-t-use-fenv.h-on-uClibc.patch     | 30 ------------------
 ...-no-FPU-exceptions-bits-on-ARC-glibc.patch | 31 -------------------
 package/python-numpy/Config.in                | 10 ++++++
 3 files changed, 10 insertions(+), 61 deletions(-)
 delete mode 100644 package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
 delete mode 100644 package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch

diff --git a/package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch b/package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
deleted file mode 100644
index 8b3937a1ba..0000000000
--- a/package/python-numpy/0001-Don-t-use-fenv.h-on-uClibc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 52b47439d17463304e5bd7974dec17ced0b0f24a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 Mar 2019 10:38:27 +0100
-Subject: [PATCH] Don't use <fenv.h> on uClibc
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/numpy/numpy/pull/13137]
----
- numpy/core/src/npymath/ieee754.c.src | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
-index d960838c8..f3f15f841 100644
---- a/numpy/core/src/npymath/ieee754.c.src
-+++ b/numpy/core/src/npymath/ieee754.c.src
-@@ -681,7 +681,8 @@ void npy_set_floatstatus_invalid(void)
-     fp_raise_xcp(FP_INVALID);
- }
- 
--#elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha))
-+#elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha)) || \
-+      defined (__UCLIBC__)
- 
- /*
-  * By using a volatile floating point value,
--- 
-2.14.1
-
diff --git a/package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch b/package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
deleted file mode 100644
index ece52118d7..0000000000
--- a/package/python-numpy/0002-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1125f1ee33324bc91b4e8dd9da49163af572d04a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 Mar 2019 10:48:25 +0100
-Subject: [PATCH] FIX: no FPU exceptions bits on ARC glibc
-
-The FPU exceptions bits are missing in fenv.h in glibc for ARC
-architecture.
-
-Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/numpy/numpy/pull/13137]
----
- numpy/core/src/npymath/ieee754.c.src | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/core/src/npymath/ieee754.c.src b/numpy/core/src/npymath/ieee754.c.src
-index f3f15f841..3f66b24a4 100644
---- a/numpy/core/src/npymath/ieee754.c.src
-+++ b/numpy/core/src/npymath/ieee754.c.src
-@@ -682,7 +682,7 @@ void npy_set_floatstatus_invalid(void)
- }
- 
- #elif defined(_MSC_VER) || (defined(__osf__) && defined(__alpha)) || \
--      defined (__UCLIBC__)
-+      defined (__UCLIBC__) || (defined(__arc__) && defined(__GLIBC__))
- 
- /*
-  * By using a volatile floating point value,
--- 
-2.14.1
-
diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
index 6d0b373413..bcd51e6000 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -16,6 +16,10 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	# python-numpy needs fenv.h which is not provided by uclibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	# python-numpy is not compatible with glibc for ARC architecture.
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_arc)
 	select BR2_PACKAGE_LAPACK_COMPLEX if BR2_PACKAGE_LAPACK
 	help
 	  NumPy is the fundamental package for scientific computing
@@ -25,3 +29,9 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	  C library.
 
 	  http://www.numpy.org/
+
+comment "python-numpy needs glibc or musl"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+comment "python-numpy is not compatible with glibc for ARC architecture"
+	depends on BR2_TOOLCHAIN_USES_GLIBC && BR2_arc
-- 
2.20.1
