From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 May 2018 21:30:26 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/python: add
 upstream GCC8 build fix
Message-ID: <20180502193044.DD3F581244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=348a201b429ca4bcf9ad4f3e40a993ec4bc9aa5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fedora 28 switched to GCC8.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
[Thomas: fixup location of SoB in the patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a1b7f5e64d392a802adb586b97deea0a6f4f500e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/0035-GCC8-alignment-fix.patch | 65 ++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/package/python/0035-GCC8-alignment-fix.patch b/package/python/0035-GCC8-alignment-fix.patch
new file mode 100644
index 0000000000..b742aa09de
--- /dev/null
+++ b/package/python/0035-GCC8-alignment-fix.patch
@@ -0,0 +1,65 @@
+From 0b91f8a668201fc58fa732b8acc496caedfdbae0 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fw@deneb.enyo.de>
+Date: Sun, 29 Apr 2018 12:18:33 -0700
+Subject: [PATCH] Indicate that _PyGC_Head is only 8-byte aligned. (closes
+ bpo-33374)
+
+By spec, the "long double" in _PyGC_Head requires the union to always be 16-byte
+aligned. However, obmalloc only yields 8-byte alignment. Compilers including GCC
+8 are starting to use alignment information to do store-merging. So, the "long
+double" needs to be changed to a simple "double" as was long ago done in Python
+3 by e348c8d154cf6342c79d627ebfe89dfe9de23817. For 2.7, we need to add some
+dummy padding to make sure _PyGC_Head stays the same size.
+
+Upstream: https://bugs.python.org/issue33374
+Signed-off-by: Stefan Becker <chemobejk@gmail.com>
+---
+ Include/objimpl.h                                       | 17 ++++++++++++++++-
+ .../2018-04-29-12-07-00.bpo-33374.-xegL6.rst            |  3 +++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst
+
+diff --git a/Include/objimpl.h b/Include/objimpl.h
+index 5f2868332955..cbf6bc3f8763 100644
+--- a/Include/objimpl.h
++++ b/Include/objimpl.h
+@@ -248,6 +248,20 @@ PyAPI_FUNC(PyVarObject *) _PyObject_GC_Resize(PyVarObject *, Py_ssize_t);
+ /* for source compatibility with 2.2 */
+ #define _PyObject_GC_Del PyObject_GC_Del
+ 
++/*
++ * Former over-aligned definition of PyGC_Head, used to compute the size of the
++ * padding for the new version below.
++ */
++union _gc_head;
++union _gc_head_old {
++    struct {
++        union _gc_head_old *gc_next;
++        union _gc_head_old *gc_prev;
++        Py_ssize_t gc_refs;
++    } gc;
++    long double dummy;
++};
++
+ /* GC information is stored BEFORE the object structure. */
+ typedef union _gc_head {
+     struct {
+@@ -255,7 +269,8 @@ typedef union _gc_head {
+         union _gc_head *gc_prev;
+         Py_ssize_t gc_refs;
+     } gc;
+-    long double dummy;  /* force worst-case alignment */
++    double dummy; /* Force at least 8-byte alignment. */
++    char dummy_padding[sizeof(union _gc_head_old)];
+ } PyGC_Head;
+ 
+ extern PyGC_Head *_PyGC_generation0;
+diff --git a/Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst b/Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst
+new file mode 100644
+index 000000000000..9ec1a605c8f2
+--- /dev/null
++++ b/Misc/NEWS.d/next/Core and Builtins/2018-04-29-12-07-00.bpo-33374.-xegL6.rst	
+@@ -0,0 +1,3 @@
++Tweak the definition of PyGC_Head, so compilers do not believe it is always
++16-byte aligned on x86. This prevents crashes with more aggressive
++optimizations present in GCC 8.
