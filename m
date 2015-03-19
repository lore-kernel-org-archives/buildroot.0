From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 19 Mar 2015 23:18:18 +0100
Subject: [Buildroot] [PATCH v1] evtest: fix program_invocation_short_name
	undeclared
Message-ID: <1426803498-18890-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add fallback in case program_invocation_short_name is undeclared,
e.g. in case of some uclibc configurations.

Fixes [1]:
  evtest.c:730:20: error: 'program_invocation_short_name' undeclared (first use in this function)
    printf("%s %s\n", program_invocation_short_name, PACKAGE_VERSION);

[1] http://autobuild.buildroot.net/results/0fd/0fd36a0d79c4d82aedebb5aca8d3ce4214b1ed61

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-program_invocation_short_name-undeclared.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/evtest/0001-fix-program_invocation_short_name-undeclared.patch

diff --git a/package/evtest/0001-fix-program_invocation_short_name-undeclared.patch b/package/evtest/0001-fix-program_invocation_short_name-undeclared.patch
new file mode 100644
index 0000000..17f0fb3
--- /dev/null
+++ b/package/evtest/0001-fix-program_invocation_short_name-undeclared.patch
@@ -0,0 +1,50 @@
+From c124b50e13aaff46e7928d66b329644bf9b6dae7 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 19 Mar 2015 23:08:34 +0100
+Subject: [PATCH] fix program_invocation_short_name undeclared
+
+Add fallback in case program_invocation_short_name is undeclared,
+e.g. in case of some uclibc configurations.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 8 ++++++++
+ evtest.c     | 5 +++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8dabc81..c13b05e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,4 +22,12 @@ if test "x$XMLTO" = "x" || test "x$ASCIIDOC" = "x"; then
+ 	AC_MSG_WARN([xmlto or asciidoc not found - cannot create man pages without it])
+ fi
+ 
++AC_MSG_CHECKING([for program_invocation_short_name])
++AC_TRY_COMPILE([#define _GNU_SOURCE
++		#include <errno.h>], 
++	[strlen(program_invocation_short_name)],
++	AC_DEFINE(HAVE_PROGRAM_INVOCATION_SHORT_NAME, 1,
++		[Defined if program_invocation_short_name is defined])
++	AC_MSG_RESULT(yes), AC_MSG_RESULT(no))
++
+ AC_OUTPUT([Makefile])
+diff --git a/evtest.c b/evtest.c
+index 40bc82b..d601889 100644
+--- a/evtest.c
++++ b/evtest.c
+@@ -86,6 +86,11 @@
+ 
+ #define NAME_ELEMENT(element) [element] = #element
+ 
++/* fallback to canonical name */
++#ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
++static char *program_invocation_short_name = "evtest";
++#endif
++
+ enum evtest_mode {
+ 	MODE_CAPTURE,
+ 	MODE_QUERY,
+-- 
+2.1.4
+
-- 
2.1.4
