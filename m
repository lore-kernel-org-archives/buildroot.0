From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:45:37 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/python-numpy:
 disable numpy if fenv.h is not provided by libc
Message-ID: <20190829214311.28A0188598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15f273b60ab43ff4f82429a36999963d708e8283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

With a C library which does not provide fenv.h, it won't work at runtime:
Crash after an "import numpy" on python.

Since numpy v1.16.0:
"Alpine Linux (and other musl c library distros) support
We now default to use fenv.h for floating point status error reporting.
Previously we had a broken default that sometimes would not report
underflow, overflow, and invalid floating point operations. Now we can
support non-glibc distrubutions like Alpine Linux as long as they ship
fenv.h."

Disable python-numpy for uClibc to avoid the runtime errors.

ARC's glibc used to have an incomplete fenv.h, but this has been fixed
since commit be0aaaaecda5 ("toolchain: bump ARC tools to arc-2019.03
release"), so we don't need an exception for ARC.

Two patches attempted to fix the build for uclibc and glibc for ARC, but
didn't fix the runtime issue. Remove those patches.

Signed-off-by: Damien DUVAL <damien.duval@smile.fr>
Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1aa59097e61d524bb55ab1fcd4fbe5098b3e0bed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Don-t-use-fenv.h-on-uClibc.patch          | 30 ---------------------
 ...2-FIX-no-FPU-exceptions-bits-on-ARC-glibc.patch | 31 ----------------------
 package/python-numpy/Config.in                     |  5 ++++
 3 files changed, 5 insertions(+), 61 deletions(-)

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
index c337675ceb..5b9ee5803b 100644
--- a/package/python-numpy/Config.in
+++ b/package/python-numpy/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 config BR2_PACKAGE_PYTHON_NUMPY
 	bool "python-numpy"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	# python-numpy needs fenv.h which is not provided by uclibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	help
 	  NumPy is the fundamental package for scientific computing
 	  with Python.
@@ -24,3 +26,6 @@ config BR2_PACKAGE_PYTHON_NUMPY
 	  C library.
 
 	  http://www.numpy.org/
+
+comment "python-numpy needs glibc or musl"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
