From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jan 2020 20:07:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.11.6
Message-ID: <20200129190700.691686-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.11.6.html

Removed patch 0004 which was applied upstream:
https://git.samba.org/samba.git/?p=samba.git;a=commit;h=1d28d27070a7ade82283dab11c9ef7cadfbf54fb
https://git.samba.org/samba.git/?p=samba.git;a=commit;h=3889444e00866eafebcdfb42be5f07990b881c56

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0004-Include-stdint.h-before-cmoka.h.patch | 134 ------------------
 package/samba4/samba4.hash                    |   4 +-
 package/samba4/samba4.mk                      |   2 +-
 3 files changed, 3 insertions(+), 137 deletions(-)
 delete mode 100644 package/samba4/0004-Include-stdint.h-before-cmoka.h.patch

diff --git a/package/samba4/0004-Include-stdint.h-before-cmoka.h.patch b/package/samba4/0004-Include-stdint.h-before-cmoka.h.patch
deleted file mode 100644
index 71a79abbf8..0000000000
--- a/package/samba4/0004-Include-stdint.h-before-cmoka.h.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 512dff011cd1bce9ca48c20fd9470dbc05dd2449 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 15 Dec 2019 17:08:24 +0100
-Subject: [PATCH] Include stdint.h before cmoka.h
-
-This fix the following build failures:
-
-[2466/3864] Linking bin/default/lib/ldb/ldbmodify
-In file included from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
-                 from ../../lib/tevent/tevent.h:31,
-                 from ../../lib/ldb/include/ldb.h:51,
-                 from ../../lib/ldb/tests/test_ldb_dn.c:25:
-/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
- typedef unsigned long int uintptr_t;
-                           ^
-In file included from ../../lib/ldb/tests/test_ldb_dn.c:23:0:
-/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:132:28: note: previous declaration of 'uintptr_t' was here
-       typedef unsigned int uintptr_t;
-                            ^
-
-In file included from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/mips64el-buildroot-linux-uclibc/5.5.0/include/stdint.h:9:0,
-                 from ../../lib/tevent/tevent.h:31,
-                 from ../../lib/ldb/tests/ldb_key_value_test.c:48:
-/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27: error: conflicting types for 'uintptr_t'
- typedef unsigned long int uintptr_t;
-                           ^
-In file included from ../../lib/ldb/tests/ldb_key_value_test.c:43:0:
-/home/buildroot/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cmocka.h:132:28: note: previous declaration of 'uintptr_t' was here
-       typedef unsigned int uintptr_t;
-                            ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/9507739b3d5d51024ee9c60b74c2f85d5004e7e2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.com/samba-team/samba/merge_requests/1003]
----
- lib/ldb/tests/ldb_key_value_sub_txn_test.c | 1 +
- lib/ldb/tests/ldb_key_value_test.c         | 1 +
- lib/ldb/tests/ldb_lmdb_size_test.c         | 1 +
- lib/ldb/tests/ldb_lmdb_test.c              | 1 +
- lib/ldb/tests/ldb_no_lmdb_test.c           | 1 +
- lib/ldb/tests/test_ldb_dn.c                | 1 +
- source4/utils/oLschema2ldif/test.c         | 1 +
- 7 files changed, 7 insertions(+)
-
-diff --git a/lib/ldb/tests/ldb_key_value_sub_txn_test.c b/lib/ldb/tests/ldb_key_value_sub_txn_test.c
-index e71f81b866e..1eafd2d79e9 100644
---- a/lib/ldb/tests/ldb_key_value_sub_txn_test.c
-+++ b/lib/ldb/tests/ldb_key_value_sub_txn_test.c
-@@ -37,6 +37,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/ldb_key_value_test.c b/lib/ldb/tests/ldb_key_value_test.c
-index 3f31bb98350..458452e5dc4 100644
---- a/lib/ldb/tests/ldb_key_value_test.c
-+++ b/lib/ldb/tests/ldb_key_value_test.c
-@@ -39,6 +39,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/ldb_lmdb_size_test.c b/lib/ldb/tests/ldb_lmdb_size_test.c
-index c0c4fe87204..95eba878ba7 100644
---- a/lib/ldb/tests/ldb_lmdb_size_test.c
-+++ b/lib/ldb/tests/ldb_lmdb_size_test.c
-@@ -43,6 +43,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/ldb_lmdb_test.c b/lib/ldb/tests/ldb_lmdb_test.c
-index 78758bbbe16..798a1916281 100644
---- a/lib/ldb/tests/ldb_lmdb_test.c
-+++ b/lib/ldb/tests/ldb_lmdb_test.c
-@@ -40,6 +40,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/ldb_no_lmdb_test.c b/lib/ldb/tests/ldb_no_lmdb_test.c
-index 8e5a6eee8d2..be23d744004 100644
---- a/lib/ldb/tests/ldb_no_lmdb_test.c
-+++ b/lib/ldb/tests/ldb_no_lmdb_test.c
-@@ -40,6 +40,7 @@
-  */
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/lib/ldb/tests/test_ldb_dn.c b/lib/ldb/tests/test_ldb_dn.c
-index 109ee53c8ab..6faff9b7de7 100644
---- a/lib/ldb/tests/test_ldb_dn.c
-+++ b/lib/ldb/tests/test_ldb_dn.c
-@@ -19,6 +19,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
-diff --git a/source4/utils/oLschema2ldif/test.c b/source4/utils/oLschema2ldif/test.c
-index 6748ce08c33..3834ea462fd 100644
---- a/source4/utils/oLschema2ldif/test.c
-+++ b/source4/utils/oLschema2ldif/test.c
-@@ -19,6 +19,7 @@
- 
- #include <stdarg.h>
- #include <stddef.h>
-+#include <stdint.h>
- #include <setjmp.h>
- #include <cmocka.h>
- 
--- 
-2.24.0
-
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 47e251b38c..022bc22055 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.11.5.tar.asc
-sha256 f3e299ff62e424c0c259a2e60ca30979c8a65244d7ef6b54667902dac639d93f  samba-4.11.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.11.6.tar.asc
+sha256 91438f4d7b71f673421435fa7f26b03b613f214139636ce50af35bc2ff09ef38  samba-4.11.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index d66fd5794d..005296ea74 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.11.5
+SAMBA4_VERSION = 4.11.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
