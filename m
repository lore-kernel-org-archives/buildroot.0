From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Jun 2018 09:58:58 +0200
Subject: [Buildroot] [git commit] package/python: bump version to 2.7.15
Message-ID: <20180616085434.10CC188560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f6f32968e9f64441c822d0353c1eaacfde33dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0009, removed patch 0035 after upstream commit
https://github.com/python/cpython/commit/0b91f8a668201fc58fa732b8acc496caedfdbae0

Updated license hash after 2018 bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0009-Fix-python-config-for-cross-builds.patch  |  6 +-
 package/python/0035-GCC8-alignment-fix.patch       | 65 ----------------------
 package/python/python.hash                         |  9 ++-
 package/python/python.mk                           |  2 +-
 4 files changed, 9 insertions(+), 73 deletions(-)

diff --git a/package/python/0009-Fix-python-config-for-cross-builds.patch b/package/python/0009-Fix-python-config-for-cross-builds.patch
index 44ddbcec6f..761d6d9294 100644
--- a/package/python/0009-Fix-python-config-for-cross-builds.patch
+++ b/package/python/0009-Fix-python-config-for-cross-builds.patch
@@ -12,6 +12,8 @@ doesn't depend on the sysconfig import that usually leads to bad
 data/results.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for Python 2.7.15]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile.pre.in          |  13 +++---
  Misc/python-config.sh.in | 102 +++++++++++++++++++++++++++++++++++++++++++++++
@@ -36,8 +38,8 @@ index 33b994d..beb0837 100644
  
  # Default target
  all:		@DEF_MAKE_ALL_RULE@
--build_all:	$(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
-+build_all:	$(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
+-build_all:	check-clean-src $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
++build_all:	check-clean-src $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
  
  # Compile a binary with profile guided optimization.
  profile-opt:
diff --git a/package/python/0035-GCC8-alignment-fix.patch b/package/python/0035-GCC8-alignment-fix.patch
deleted file mode 100644
index b742aa09de..0000000000
--- a/package/python/0035-GCC8-alignment-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 0b91f8a668201fc58fa732b8acc496caedfdbae0 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fw@deneb.enyo.de>
-Date: Sun, 29 Apr 2018 12:18:33 -0700
-Subject: [PATCH] Indicate that _PyGC_Head is only 8-byte aligned. (closes
- bpo-33374)
-
-By spec, the "long double" in _PyGC_Head requires the union to always be 16-byte
-aligned. However, obmalloc only yields 8-byte alignment. Compilers including GCC
-8 are starting to use alignment information to do store-merging. So, the "long
-double" needs to be changed to a simple "double" as was long ago done in Python
-3 by e348c8d154cf6342c79d627ebfe89dfe9de23817. For 2.7, we need to add some
-dummy padding to make sure _PyGC_Head stays the same size.
-
-Upstream: https://bugs.python.org/issue33374
-Signed-off-by: Stefan Becker <chemobejk@gmail.com>
----
- Include/objimpl.h                                       | 17 ++++++++++++++++-
- .../2018-04-29-12-07-00.bpo-33374.-xegL6.rst            |  3 +++
- 2 files changed, 19 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst
-
-diff --git a/Include/objimpl.h b/Include/objimpl.h
-index 5f2868332955..cbf6bc3f8763 100644
---- a/Include/objimpl.h
-+++ b/Include/objimpl.h
-@@ -248,6 +248,20 @@ PyAPI_FUNC(PyVarObject *) _PyObject_GC_Resize(PyVarObject *, Py_ssize_t);
- /* for source compatibility with 2.2 */
- #define _PyObject_GC_Del PyObject_GC_Del
- 
-+/*
-+ * Former over-aligned definition of PyGC_Head, used to compute the size of the
-+ * padding for the new version below.
-+ */
-+union _gc_head;
-+union _gc_head_old {
-+    struct {
-+        union _gc_head_old *gc_next;
-+        union _gc_head_old *gc_prev;
-+        Py_ssize_t gc_refs;
-+    } gc;
-+    long double dummy;
-+};
-+
- /* GC information is stored BEFORE the object structure. */
- typedef union _gc_head {
-     struct {
-@@ -255,7 +269,8 @@ typedef union _gc_head {
-         union _gc_head *gc_prev;
-         Py_ssize_t gc_refs;
-     } gc;
--    long double dummy;  /* force worst-case alignment */
-+    double dummy; /* Force at least 8-byte alignment. */
-+    char dummy_padding[sizeof(union _gc_head_old)];
- } PyGC_Head;
- 
- extern PyGC_Head *_PyGC_generation0;
-diff --git a/Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst b/Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst
-new file mode 100644
-index 000000000000..9ec1a605c8f2
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst	
-@@ -0,0 +1,3 @@
-+Tweak the definition of PyGC_Head, so compilers do not believe it is always
-+16-byte aligned on x86. This prevents crashes with more aggressive
-+optimizations present in GCC 8.
diff --git a/package/python/python.hash b/package/python/python.hash
index 77e0fc878e..feadcfdcb5 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,6 +1,5 @@
-# From https://www.python.org/downloads/release/python-2714/
-md5 1f6db41ad91d9eb0a6f0c769b8613c5b  Python-2.7.14.tar.xz
+# From https://www.python.org/downloads/release/python-2715/
+md5 a80ae3cc478460b922242f43a1b4094d Python-2.7.15.tar.xz
 # Locally calculated
-sha256 71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66  Python-2.7.14.tar.xz
-# License files, locally calculated
-sha256 d2d17b17388da74dc9c6bdbf78eb7237432c3f8a0c87852df740ec99de2ec680  LICENSE
+sha256 22d9b1ac5b26135ad2b8c2901a9413537e08749a753356ee913c84dbd2df5574  Python-2.7.15.tar.xz
+sha256 b9a6d9320b8f2693e8d41e496ce56caadacaddcca9be2a64a61749278f425cf2  LICENSE
diff --git a/package/python/python.mk b/package/python/python.mk
index aa7917ab46..79df3c462a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).14
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).15
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
