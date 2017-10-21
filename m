From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sat, 21 Oct 2017 21:15:46 +0300
Subject: [Buildroot] [PATCH] python-numpy: Bump version to 1.13.3
Message-ID: <1508609746-1781-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is just a bug-fix release.

Removing 0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch
as it is a part of the release.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 ..._npy_scaled_cexp-f-l-is-defined-when-need.patch | 43 ----------------------
 package/python-numpy/python-numpy.hash             |  4 +-
 package/python-numpy/python-numpy.mk               |  2 +-
 3 files changed, 3 insertions(+), 46 deletions(-)
 delete mode 100644 package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch

diff --git a/package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch b/package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch
deleted file mode 100644
index a243df544ebc..000000000000
--- a/package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 9aa5d577c58f04f9606674dd6f326aee1bf1e6e8 Mon Sep 17 00:00:00 2001
-From: Charles Harris <charlesr.harris@gmail.com>
-Date: Thu, 21 Sep 2017 10:10:05 -0600
-Subject: [PATCH] BUG: Ensure `_npy_scaled_cexp{,f,l}` is defined when needed.
-
-The `_npy_scaled_cexp{,f,l}` functions were previously only defined when
-the npy_cexp fallback functions were needed, but they are also called by
-the npy_csinh and npy_ccosh functions.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- numpy/core/src/npymath/npy_math_complex.c.src | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/numpy/core/src/npymath/npy_math_complex.c.src b/numpy/core/src/npymath/npy_math_complex.c.src
-index a82a6737c..fb31e8e6a 100644
---- a/numpy/core/src/npymath/npy_math_complex.c.src
-+++ b/numpy/core/src/npymath/npy_math_complex.c.src
-@@ -184,7 +184,9 @@ npy_carg at c@(@ctype@ z)
- #define SCALED_CEXP_LOWERL 11357.216553474703895L
- #define SCALED_CEXP_UPPERL 22756.021937783004509L
- 
--#ifndef HAVE_CEXP at C@
-+#if !defined(HAVE_CSINH at C@) || \
-+    !defined(HAVE_CCOSH at C@) || \
-+    !defined(HAVE_CEXP at C@)
- 
- static
- @ctype@
-@@ -212,6 +214,10 @@ _npy_scaled_cexp at c@(@type@ x, @type@ y, npy_int expt)
-                          npy_ldexp at c@(mant * mantsin, expt + exsin));
- }
- 
-+#endif
-+
-+#ifndef HAVE_CEXP at C@
-+
- @ctype@
- npy_cexp at c@(@ctype@ z)
- {
--- 
-2.11.0
-
diff --git a/package/python-numpy/python-numpy.hash b/package/python-numpy/python-numpy.hash
index 7dcdb44a008f..6e76c62e7d7a 100644
--- a/package/python-numpy/python-numpy.hash
+++ b/package/python-numpy/python-numpy.hash
@@ -1,2 +1,2 @@
-# Copied from https://github.com/numpy/numpy/releases/tag/v1.13.1
-sha256	de020ec06f1e9ce1115a50161a38bf8d4c2525379900f9cb478cc613a1e7cd93	numpy-1.13.1.tar.gz
+# Copied from https://github.com/numpy/numpy/releases/tag/v1.13.3
+sha256	4c6b4eef790528bebb7ec9590d74cc193868940fe68e4109a91c196df72d8094	numpy-1.13.3.tar.gz
diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index d0c279f70686..d0d38371a36b 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_NUMPY_VERSION = 1.13.1
+PYTHON_NUMPY_VERSION = 1.13.3
 PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
 PYTHON_NUMPY_SITE = https://github.com/numpy/numpy/releases/download/v$(PYTHON_NUMPY_VERSION)
 PYTHON_NUMPY_LICENSE = BSD-3-Clause
-- 
2.7.5
