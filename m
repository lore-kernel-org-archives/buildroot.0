From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jan 2018 13:53:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/samba4: Fix uClibc build on 64bit
 platforms by including stdint.h
Message-ID: <20180128125334.11755-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/fdd/fdd9bb5bea4488fc9e16746222051156224317a6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...build-on-64bit-platforms-by-including-std.patch | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch

diff --git a/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
new file mode 100644
index 0000000000..3b248e690d
--- /dev/null
+++ b/package/samba4/0003-Fix-uClibc-build-on-64bit-platforms-by-including-std.patch
@@ -0,0 +1,67 @@
+From 4a63f267efab2ef86adbeddda45909127135d7c8 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 28 Jan 2018 11:57:11 +0100
+Subject: [PATCH 1/1] Fix uClibc build on 64bit platforms by including stdint.h
+
+Fixes an error detected by buildroot autobuilders:
+http://autobuild.buildroot.net/results/573/573e2268e205e10d1352fa81122d8f225fdb4575/build-end.log
+
+/home/rclinux/rc-buildroot-test/scripts/instance-1/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/stdint.h:122:27:
+error: conflicting types for 'uintptr_t'
+ typedef unsigned long int uintptr_t;
+                           ^
+In file included from ../lib/ldb/tests/ldb_msg.c:17:0:
+../third_party/cmocka/cmocka.h:126:28: note: previous declaration of 'uintptr_t' was here
+       typedef unsigned int uintptr_t;
+
+The define __WORDSIZE is missing when cmocka.h decides how to
+define uintptr_t, this patch includes stdint.h when needed.
+
+Patch sent upstream:
+https://lists.samba.org/archive/samba-technical/2018-January/125306.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/ldb/tests/ldb_mod_op_test.c   | 1 +
+ lib/ldb/tests/ldb_msg.c           | 1 +
+ libcli/smb/test_smb1cli_session.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/lib/ldb/tests/ldb_mod_op_test.c b/lib/ldb/tests/ldb_mod_op_test.c
+index cf2288c7bce..4690594186e 100644
+--- a/lib/ldb/tests/ldb_mod_op_test.c
++++ b/lib/ldb/tests/ldb_mod_op_test.c
+@@ -13,6 +13,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/lib/ldb/tests/ldb_msg.c b/lib/ldb/tests/ldb_msg.c
+index f8de418e0dc..31786a9a318 100644
+--- a/lib/ldb/tests/ldb_msg.c
++++ b/lib/ldb/tests/ldb_msg.c
+@@ -13,6 +13,7 @@
+  */
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+diff --git a/libcli/smb/test_smb1cli_session.c b/libcli/smb/test_smb1cli_session.c
+index d1e21d5431e..6a526c96b61 100644
+--- a/libcli/smb/test_smb1cli_session.c
++++ b/libcli/smb/test_smb1cli_session.c
+@@ -1,5 +1,6 @@
+ #include <stdarg.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <setjmp.h>
+ #include <cmocka.h>
+ 
+-- 
+2.11.0
+
-- 
2.11.0
