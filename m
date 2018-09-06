From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Thu,  6 Sep 2018 15:37:44 -0700
Subject: [Buildroot] [PATCH 1/1] python-numpy: bump to version 1.15.1
Message-ID: <20180906223744.3635-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
Patch 0002-Add-support-of-ARC.patch was merged [1] upstream.
 
[1] https://github.com/numpy/numpy/commit/8edd610ffa3499eea3580f98f296ec80578fba73

 .../0002-Add-support-of-ARC.patch             | 68 -------------------
 package/python-numpy/python-numpy.hash        |  4 +-
 package/python-numpy/python-numpy.mk          |  2 +-
 3 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 package/python-numpy/0002-Add-support-of-ARC.patch

diff --git a/package/python-numpy/0002-Add-support-of-ARC.patch b/package/python-numpy/0002-Add-support-of-ARC.patch
deleted file mode 100644
index c022487c7f..0000000000
--- a/package/python-numpy/0002-Add-support-of-ARC.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 9a225e7d4fb1de5c99c6b5b17cae2fc4c2d1c59a Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Fri, 15 Sep 2017 11:59:14 +0300
-Subject: [PATCH] Add support of ARC
-
-Synopsys DesignWare ARC Processors are a family of 32-bit CPUs
-which in some configurations may run Linux kernel and full stack
-of applications on top of it. Among other things is Python.
-
-With that change we allow building and usage of Numpy on ARC.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- numpy/core/include/numpy/npy_cpu.h    | 6 ++++++
- numpy/core/include/numpy/npy_endian.h | 6 ++++--
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 60abae4e0b0e..84653ea183ce 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
-@@ -15,6 +15,8 @@
-  *              NPY_CPU_ARMEB
-  *              NPY_CPU_SH_LE
-  *              NPY_CPU_SH_BE
-+ *              NPY_CPU_ARCEL
-+ *              NPY_CPU_ARCEB
-  */
- #ifndef _NPY_CPUARCH_H_
- #define _NPY_CPUARCH_H_
-@@ -76,6 +78,10 @@
-     #define NPY_CPU_AARCH64
- #elif defined(__mc68000__)
-     #define NPY_CPU_M68K
-+#elif defined(__arc__) && defined(__LITTLE_ENDIAN__)
-+    #define NPY_CPU_ARCEL
-+#elif defined(__arc__) && defined(__BIG_ENDIAN__)
-+    #define NPY_CPU_ARCEB
- #else
-     #error Unknown CPU, please report this to numpy maintainers with \
-     information about your platform (OS, CPU and compiler)
-diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
-index e34b1d97e655..1a42121db92e 100644
---- a/numpy/core/include/numpy/npy_endian.h
-+++ b/numpy/core/include/numpy/npy_endian.h
-@@ -45,7 +45,8 @@
-             || defined(NPY_CPU_AARCH64) \
-             || defined(NPY_CPU_SH_LE)   \
-             || defined(NPY_CPU_MIPSEL)  \
--            || defined(NPY_CPU_PPC64LE)
-+            || defined(NPY_CPU_PPC64LE) \
-+            || defined(NPY_CPU_ARCEL)
-         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
-     #elif defined(NPY_CPU_PPC)          \
-             || defined(NPY_CPU_SPARC)   \
-@@ -56,7 +57,8 @@
-             || defined(NPY_CPU_SH_BE)   \
-             || defined(NPY_CPU_MIPSEB)  \
-             || defined(NPY_CPU_OR1K)    \
--            || defined(NPY_CPU_M68K)
-+            || defined(NPY_CPU_M68K)    \
-+            || defined(NPY_CPU_ARCEB)
-         #define NPY_BYTE_ORDER NPY_BIG_ENDIAN
-     #else
-         #error Unknown CPU: can not set endianness
--- 
-2.7.5
-
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 854f202297..055eb29f6f 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,4 +1,4 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.13.3
-sha256	4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094	numpy-1.13.3.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.15.1
+sha256	3c1ccce5d935ef8df16ae0595b459ef08a5cdb05aee195ebc04b9d89a72be7fa	numpy-1.15.1.tar.gz
 # License files, locally calculated
 sha256	94eebc7c8f86a287c1e9146ed52ebcde88183806d848d8c66e0e52d1aebf3b13	LICENSE.txt
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index d0d38371a3..bd5fe7e6a9 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.13.3
+PYTHON_NUMPY_VERSION = 1.15.1
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause
-- 
2.18.0
