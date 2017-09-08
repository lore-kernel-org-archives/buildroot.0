From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  8 Sep 2017 12:23:48 +0300
Subject: [Buildroot] [PATCH 1/2] strace: fix program_invocation_name uClibc
	declaration mismatch
Message-ID: <8423660704daf069a26cafd6fd43009796262e33.1504862629.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The local program_invocation_name declaration conflicts with the uClibc
one. Add a patch making this declaration depend on
!HAVE_PROGRAM_INVOCATION_NAME.

Fixes:
http://autobuild.buildroot.net/results/5f0/5f0852f3ffb46f8fb2b4c9318652c5ab3ab5e97d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...s-fix-program_invocation_name-type-confli.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch

diff --git a/package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch b/package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch
new file mode 100644
index 000000000000..b144bdd78c50
--- /dev/null
+++ b/package/strace/0001-error_prints-fix-program_invocation_name-type-confli.patch
@@ -0,0 +1,45 @@
+From 96ad51b91c6ab7ff8bac58f90f199324baed07af Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 8 Sep 2017 12:08:13 +0300
+Subject: [PATCH] error_prints: fix program_invocation_name type conflict
+
+uClibc-ng declares program_invocation_name as const. This causes the
+build failure below:
+
+error_prints.c:40:14: error: conflicting types for ?program_invocation_name?
+ extern char *program_invocation_name;
+              ^~~~~~~~~~~~~~~~~~~~~~~
+In file included from error_prints.c:32:0:
+.../output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/errno.h:54:20: note: previous declaration of ?program_invocation_name? was here
+ extern const char *program_invocation_name, *program_invocation_short_name;
+                    ^~~~~~~~~~~~~~~~~~~~~~~
+Makefile:3856: recipe for target 'strace-error_prints.o' failed
+
+Declare program_invocation_name only when the C library does not provide
+one.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent upstream; waiting for moderator approval to appear at
+https://sourceforge.net/p/strace/mailman/strace-devel/.
+
+ error_prints.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/error_prints.c b/error_prints.c
+index 8519b9246698..710e99b04ab9 100644
+--- a/error_prints.c
++++ b/error_prints.c
+@@ -37,7 +37,9 @@
+ 
+ #include "error_prints.h"
+ 
++#ifndef HAVE_PROGRAM_INVOCATION_NAME
+ extern char *program_invocation_name;
++#endif
+ 
+ static void
+ verror_msg(int err_no, const char *fmt, va_list p)
+-- 
+2.14.1
+
-- 
2.14.1
