From: Florian La Roche <F.LaRoche@pilz.de>
Date: Fri, 5 Oct 2018 08:45:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: add upstream patches
Message-ID: <20181005064525.28631-1-F.LaRoche@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patches from the upstream ltp-testsuite github
repository to compile correctly.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
---
 package/ltp-testsuite/0002-execve05.patch | 44 +++++++++++++++++++++++
 package/ltp-testsuite/0003-statx.patch    | 32 +++++++++++++++++
 package/ltp-testsuite/0004-statx.patch    | 26 ++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 package/ltp-testsuite/0002-execve05.patch
 create mode 100644 package/ltp-testsuite/0003-statx.patch
 create mode 100644 package/ltp-testsuite/0004-statx.patch

diff --git a/package/ltp-testsuite/0002-execve05.patch b/package/ltp-testsuite/0002-execve05.patch
new file mode 100644
index 0000000000..06e40c54e1
--- /dev/null
+++ b/package/ltp-testsuite/0002-execve05.patch
@@ -0,0 +1,44 @@
+From 6f61cad559df8791add50aa8d053ca77cd97c594 Mon Sep 17 00:00:00 2001
+From: "Allen, John" <John.Allen@amd.com>
+Date: Wed, 26 Sep 2018 14:31:37 +0000
+Subject: [PATCH] runtest/{ltplite, stress.part3}: Update execve05 calling
+ convention
+
+The calling convention for execve05 was recently changed and was updated
+in runtest/syscalls when the change was introduced, but not for other
+runtest files where execve05 is called. Update all calls to execve05 to
+use the new calling convention.
+
+Signed-off-by: John Allen <john.allen@amd.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+---
+ runtest/ltplite      | 2 +-
+ runtest/stress.part3 | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/runtest/ltplite b/runtest/ltplite
+index 61ab275d8e..f0102e7e63 100644
+--- a/runtest/ltplite
++++ b/runtest/ltplite
+@@ -174,7 +174,7 @@ execve01 execve01
+ execve02 execve02
+ execve03 execve03
+ execve04 execve04
+-execve05 execve05 20 $LTPROOT/testcases/bin/execve05 $LTPROOT/testcases/bin/execve05 4
++execve05 execve05 -i 5 -n 32
+ execvp01 execvp01
+ 
+ exit01 exit01
+diff --git a/runtest/stress.part3 b/runtest/stress.part3
+index 332daa9ece..513d2ea39d 100644
+--- a/runtest/stress.part3
++++ b/runtest/stress.part3
+@@ -115,7 +115,7 @@ execve01 execve01
+ execve02 execve02
+ execve03 execve03
+ execve04 execve04
+-execve05 execve05 20 $LTPROOT/testcases/bin/execve05 $LTPROOT/testcases/bin/execve05 4
++execve05 execve05 -i 5 -n 32
+ execvp01 execvp01
+ 
+ exit01 exit01
diff --git a/package/ltp-testsuite/0003-statx.patch b/package/ltp-testsuite/0003-statx.patch
new file mode 100644
index 0000000000..fedb8784c0
--- /dev/null
+++ b/package/ltp-testsuite/0003-statx.patch
@@ -0,0 +1,32 @@
+From a945304b6a2286d0665c70250cc5475eb07fd21e Mon Sep 17 00:00:00 2001
+From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
+Date: Wed, 26 Sep 2018 11:15:45 -0300
+Subject: [PATCH] statx: fix compile errors
+
+struct statx is only defined in sys/stat.h when _GNU_SOURCE is defined.
+The testcases do define _GNU_SOURCE, but not the m4 struct check.
+
+Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+---
+ m4/ltp-statx.m4 | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ltp-statx.m4 b/m4/ltp-statx.m4
+index 44303d30c2..5f79a94cdf 100644
+--- a/m4/ltp-statx.m4
++++ b/m4/ltp-statx.m4
+@@ -23,6 +23,11 @@ dnl
+ AC_DEFUN([LTP_CHECK_STATX],[
+ AC_CHECK_FUNCS(statx,,,[[#include <sys/stat.h>]])
+ AC_CHECK_HEADER(linux/fs.h,,,)
+-AC_CHECK_TYPES([struct statx],,,[[#include <sys/stat.h>]])
+-AC_CHECK_TYPES([struct statx_timestamp],,,[[#include <sys/stat.h>]])
++AC_CHECK_TYPES([struct statx],,,[[
++	#define _GNU_SOURCE
++	#include <sys/stat.h>
++]])
++AC_CHECK_TYPES([struct statx_timestamp],,,[[
++	#define _GNU_SOURCE
++	#include <sys/stat.h>]])
+ ])
diff --git a/package/ltp-testsuite/0004-statx.patch b/package/ltp-testsuite/0004-statx.patch
new file mode 100644
index 0000000000..7b9002d708
--- /dev/null
+++ b/package/ltp-testsuite/0004-statx.patch
@@ -0,0 +1,26 @@
+This is based on 0003-statx.patch so that autoconf does not have to run again.
+
+--- ltp-testsuite-20180926/configure
++++ ltp-testsuite-20180926/configure
+@@ -6502,7 +6502,9 @@
+ fi
+ 
+ 
+-ac_fn_c_check_type "$LINENO" "struct statx" "ac_cv_type_struct_statx" "#include <sys/stat.h>
++ac_fn_c_check_type "$LINENO" "struct statx" "ac_cv_type_struct_statx" "
++#define _GNU_SOURCE
++#include <sys/stat.h>
+ "
+ if test "x$ac_cv_type_struct_statx" = xyes; then :
+ 
+@@ -6513,7 +6515,9 @@
+ 
+ fi
+ 
+-ac_fn_c_check_type "$LINENO" "struct statx_timestamp" "ac_cv_type_struct_statx_timestamp" "#include <sys/stat.h>
++ac_fn_c_check_type "$LINENO" "struct statx_timestamp" "ac_cv_type_struct_statx_timestamp" "
++#define _GNU_SOURCE
++#include <sys/stat.h>
+ "
+ if test "x$ac_cv_type_struct_statx_timestamp" = xyes; then :
+ 
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
