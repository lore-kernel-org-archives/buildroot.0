From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:27:34 +0100
Subject: [Buildroot] [git commit] package/samba4: fix build with uclibc
Message-ID: <20191222221829.045D08DB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6118b1ba682769c085767a4fe945895aed44e5d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - autobuild.buildroot.org/results/9507739b3d5d51024ee9c60b74c2f85d5004e7e2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0010-Include-stdint.h-before-cmoka.h.patch     | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/package/samba4/0010-Include-stdint.h-before-cmoka.h.patch b/package/samba4/0010-Include-stdint.h-before-cmoka.h.patch
new file mode 100644
index 0000000000..71a79abbf8
--- /dev/null
+++ b/package/samba4/0010-Include-stdint.h-before-cmoka.h.patch
@@ -0,0 +1,134 @@
+From 512dff011cd1bce9ca48c20fd9470dbc05dd2449 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 15 Dec 2019 17:08:24 +0100
+Subject: [PATCH] Include stdint.h before cmoka.h
+
+This fix the following build failures:
+
+[2466/3864] Linking bin/default/lib/ldb/ldbmodify
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
+                 from ../../lib/tevent/tevent.h:31,
+                 from ../../lib/ldb/include/ldb.h:51,
+                 from ../../lib/ldb/tests/test_ldb_dn.c:25:
+/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
+ typedef unsigned long int uintptr_t;
+                           ^
+In file included from ../../lib/ldb/tests/test_ldb_dn.c:23:0:
+/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:132:28: note: previous declaration of 'uintptr_t' was here
+       typedef unsigned int uintptr_t;
+                            ^
+
+In file included from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
+                 from ../../lib/tevent/tevent.h:31,
+                 from ../../lib/ldb/tests/ldb_key_value_test.c:48:
+/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
+ typedef unsigned long int uintptr_t;
+                           ^
+In file included from ../../lib/ldb/tests/ldb_key_value_test.c:43:0:
+/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:132:28: note: previous declaration of 'uintptr_t' was here
+       typedef unsigned int uintptr_t;
+                            ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9507739b3d5d51024ee9c60b74c2f85d5004e7e2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.com/samba-team/samba/merge_requests/1003]
+---
+ lib/ldb/tests/ldb_key_value_sub_txn_test.c | 1 +
+ lib/ldb/tests/ldb_key_value_test.c         | 1 +
+ lib/ldb/tests/ldb_lmdb_size_test.c         | 1 +
+ lib/ldb/tests/ldb_lmdb_test.c              | 1 +
+ lib/ldb/tests/ldb_no_lmdb_test.c           | 1 +
+ lib/ldb/tests/test_ldb_dn.c                | 1 +
+ source4/utils/oLschema2ldif/test.c         | 1 +
+ 7 files changed, 7 insertions(+)
+
+diff --git a/lib/ldb/tests/ldb_key_value_sub_txn_test.c b/lib/ldb/tests/ldb_key_value_sub_txn_test.c
+index e71f81b866e..1eafd2d79e9 100644
+--- a/lib/ldb/tests/ldb_key_value_sub_txn_test.c
++++ b/lib/ldb/tests/ldb_key_value_sub_txn_test.c
+@@ -37,6 +37,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/ldb_key_value_test.c b/lib/ldb/tests/ldb_key_value_test.c
+index 3f31bb98350..458452e5dc4 100644
+--- a/lib/ldb/tests/ldb_key_value_test.c
++++ b/lib/ldb/tests/ldb_key_value_test.c
+@@ -39,6 +39,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/ldb_lmdb_size_test.c b/lib/ldb/tests/ldb_lmdb_size_test.c
+index c0c4fe87204..95eba878ba7 100644
+--- a/lib/ldb/tests/ldb_lmdb_size_test.c
++++ b/lib/ldb/tests/ldb_lmdb_size_test.c
+@@ -43,6 +43,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/ldb_lmdb_test.c b/lib/ldb/tests/ldb_lmdb_test.c
+index 78758bbbe16..798a1916281 100644
+--- a/lib/ldb/tests/ldb_lmdb_test.c
++++ b/lib/ldb/tests/ldb_lmdb_test.c
+@@ -40,6 +40,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/ldb_no_lmdb_test.c b/lib/ldb/tests/ldb_no_lmdb_test.c
+index 8e5a6eee8d2..be23d744004 100644
+--- a/lib/ldb/tests/ldb_no_lmdb_test.c
++++ b/lib/ldb/tests/ldb_no_lmdb_test.c
+@@ -40,6 +40,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/test_ldb_dn.c b/lib/ldb/tests/test_ldb_dn.c
+index 109ee53c8ab..6faff9b7de7 100644
+--- a/lib/ldb/tests/test_ldb_dn.c
++++ b/lib/ldb/tests/test_ldb_dn.c
+@@ -19,6 +19,7 @@
+ 
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/source4/utils/oLschema2ldif/test.c b/source4/utils/oLschema2ldif/test.c
+index 6748ce08c33..3834ea462fd 100644
+--- a/source4/utils/oLschema2ldif/test.c
++++ b/source4/utils/oLschema2ldif/test.c
+@@ -19,6 +19,7 @@
+ 
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+-- 
+2.24.0
+
