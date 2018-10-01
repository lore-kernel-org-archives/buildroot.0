From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Oct 2018 15:55:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: Fix uClibc build on 64bit
 platforms by including stdint.h, updated for 4.9.1
Message-ID: <20181001135549.6047-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/68f/68f3fb75ba8a2f138e9c3f37b2681b81441e2cd9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-on-64bit-platforms-by-including-std.patch | 76 +++++++++++++++++--
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
index 0f174d5369..c1418bd885 100644
--- a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
+++ b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
@@ -1,4 +1,4 @@
-From 3d91847322eba55e97adc76c5c95570382af7059 Mon Sep 17 00:00:00 2001
+From 5627ea3826a00c149ff3d49c40706217043a014d Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Sun, 28 Jan 2018 11:57:11 +0100
 Subject: [PATCH] Fix uClibc build on 64bit platforms by including stdint.h
@@ -21,18 +21,36 @@ Patch sent upstream:
 https://lists.samba.org/archive/samba-technical/2018-January/125306.html
 
 [updated for samba-4.8.4, v2 sent upstream
- https://lists.samba.org/archive/samba-technical/2018-August/129732.html]
+ https://lists.samba.org/archive/samba-technical/2018-August/129732.html,
+ updated for samba-4.9.1]
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
+ lib/ldb/tests/ldb_kv_ops_test.c   | 1 +
  lib/ldb/tests/ldb_mod_op_test.c   | 1 +
  lib/ldb/tests/ldb_msg.c           | 1 +
+ lib/ldb/tests/ldb_tdb_test.c      | 1 +
+ lib/ldb/tests/test_ldb_qsort.c    | 1 +
+ lib/util/tests/test_ms_fnmatch.c  | 1 +
  libcli/auth/tests/ntlm_check.c    | 1 +
  libcli/smb/test_smb1cli_session.c | 1 +
- 4 files changed, 4 insertions(+)
+ source3/lib/test_tldap.c          | 1 +
+ 9 files changed, 9 insertions(+)
 
+diff --git a/lib/ldb/tests/ldb_kv_ops_test.c b/lib/ldb/tests/ldb_kv_ops_test.c
+index 30ce019fac8..3ac7763b307 100644
+--- a/lib/ldb/tests/ldb_kv_ops_test.c
++++ b/lib/ldb/tests/ldb_kv_ops_test.c
+@@ -46,6 +46,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
 diff --git a/lib/ldb/tests/ldb_mod_op_test.c b/lib/ldb/tests/ldb_mod_op_test.c
-index c8b9c1aa9ff..4893dc3b38b 100644
+index 01667af3865..a1a20d38f28 100644
 --- a/lib/ldb/tests/ldb_mod_op_test.c
 +++ b/lib/ldb/tests/ldb_mod_op_test.c
 @@ -13,6 +13,7 @@
@@ -55,6 +73,42 @@ index f8de418e0dc..31786a9a318 100644
  #include <setjmp.h>
  #include <cmocka.h>
  
+diff --git a/lib/ldb/tests/ldb_tdb_test.c b/lib/ldb/tests/ldb_tdb_test.c
+index 686a35104ea..2e312e60a3c 100644
+--- a/lib/ldb/tests/ldb_tdb_test.c
++++ b/lib/ldb/tests/ldb_tdb_test.c
+@@ -40,6 +40,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/test_ldb_qsort.c b/lib/ldb/tests/test_ldb_qsort.c
+index 06e80d94379..663cf0e7564 100644
+--- a/lib/ldb/tests/test_ldb_qsort.c
++++ b/lib/ldb/tests/test_ldb_qsort.c
+@@ -19,6 +19,7 @@
+ 
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/util/tests/test_ms_fnmatch.c b/lib/util/tests/test_ms_fnmatch.c
+index 7fe8ed05e28..d11c7bed4be 100644
+--- a/lib/util/tests/test_ms_fnmatch.c
++++ b/lib/util/tests/test_ms_fnmatch.c
+@@ -19,6 +19,7 @@
+ 
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
 diff --git a/libcli/auth/tests/ntlm_check.c b/libcli/auth/tests/ntlm_check.c
 index e87a0a276d4..65c7b086008 100644
 --- a/libcli/auth/tests/ntlm_check.c
@@ -78,6 +132,18 @@ index d1e21d5431e..6a526c96b61 100644
  #include <setjmp.h>
  #include <cmocka.h>
  
+diff --git a/source3/lib/test_tldap.c b/source3/lib/test_tldap.c
+index a6c2f2117cb..659c5a7371a 100644
+--- a/source3/lib/test_tldap.c
++++ b/source3/lib/test_tldap.c
+@@ -20,6 +20,7 @@
+ 
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
 -- 
-2.18.0
+2.19.0
 
-- 
2.19.0
