From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:16:50 +0200
Subject: [Buildroot] [git commit] package/python: fix sqlite3 extension
	without threads
Message-ID: <20140715171700.3A18E9D20C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85a016f5e17100999de884dc48473e52b0b67389
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a compiler error when building the sqlite3 extension, when the
toolchain does not have threads.

Fixes:
        http://autobuild.buildroot.net/results/10f/10f268cd55f16ee53f4c5e17e1248b0a1820f6ea/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../python-015-fix-sqlite-without-threads.patch    |   48 ++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)

diff --git a/package/python/python-015-fix-sqlite-without-threads.patch b/package/python/python-015-fix-sqlite-without-threads.patch
new file mode 100644
index 0000000..805edff
--- /dev/null
+++ b/package/python/python-015-fix-sqlite-without-threads.patch
@@ -0,0 +1,48 @@
+sqlite3: fix build when threads are not used/available
+
+When threads are not used/available, a function in the sqlite3 extension
+ends up with a label at the end:
+
+    void _pysqlite_final_callback(sqlite3_context* context)
+    {
+        PyObject* function_result;
+        PyObject** aggregate_instance;
+        int ok;
+
+    #ifdef WITH_THREAD
+        PyGILState_STATE threadstate;
+
+        threadstate = PyGILState_Ensure();
+    #endif
+
+        aggregate_instance = (PyObject**)sqlite3_aggregate_context(context, sizeof(PyObject*));
+        if (!*aggregate_instance) {
+            goto error;
+        }
+
+        [......]
+
+    error:
+    #ifdef WITH_THREAD
+        PyGILState_Release(threadstate);
+    #endif
+    }
+
+This is not valid, and gcc complains.
+
+Fix that by adding a dummy statement after the label, so that the label
+is never the last statement of the function.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN python-2.7.8.orig/Modules/_sqlite/connection.c python-2.7.8/Modules/_sqlite/connection.c
+--- python-2.7.8.orig/Modules/_sqlite/connection.c	2014-06-30 04:05:42.000000000 +0200
++++ python-2.7.8/Modules/_sqlite/connection.c	2014-07-12 13:53:32.258041224 +0200
+@@ -786,6 +786,7 @@
+ #ifdef WITH_THREAD
+     PyGILState_Release(threadstate);
+ #endif
++    ;   /* Make gcc happy: a label can't be at the end of a function */
+ }
+ 
+ static void _pysqlite_drop_unused_statement_references(pysqlite_Connection* self)
