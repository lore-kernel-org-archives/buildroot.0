From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 20:21:29 +0200
Subject: [Buildroot] [PATCH v2] lttng-babeltrace: fix build failure on gcc14
Message-ID: <1369765289-30040-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gcc14 machine has a moderately old host gcc, which was causing a
recurrent build failure of host-lttng-babeltrace:

 http://autobuild.buildroot.org/results/492/49216052c161874f41738e41e6e0c89a6dd04000/build-end.log

This commit adds a patch to fix this build failure, related to the
access of the ULLONG_MAX define on compilers that did not default to
the C99 variant of the C language.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2:
 Also autoreconf the target package, for consistency.
---
 ...beltrace-01-no-posix-fallocate-in-uclibc.patch} |    0
 ...tng-babeltrace-02-fix-build-old-compilers.patch |   27 ++++++++++++++++++++
 package/lttng-babeltrace/lttng-babeltrace.mk       |    4 +++
 3 files changed, 31 insertions(+)
 rename package/lttng-babeltrace/{lttng-babeltrace-no-posix-fallocate-in-uclibc.patch => lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch} (100%)
 create mode 100644 package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch

diff --git a/package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch b/package/lttng-babeltrace/lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch
similarity index 100%
rename from package/lttng-babeltrace/lttng-babeltrace-no-posix-fallocate-in-uclibc.patch
rename to package/lttng-babeltrace/lttng-babeltrace-01-no-posix-fallocate-in-uclibc.patch
diff --git a/package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch b/package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch
new file mode 100644
index 0000000..b8f31be
--- /dev/null
+++ b/package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch
@@ -0,0 +1,27 @@
+Support old compilers
+
+Some old compilers do not use C99 as their default C language variant,
+for example gcc 4.3.x, which is used on some old machines. When such a
+compiler is used, by default, ULLONG_MAX is not visible. Adding
+-std=gnu99 is needed to make this definition visible.
+
+In autoconf speak, this translates into the need of using
+AC_PROC_CC_STDC instead of AC_PROG_CC. See
+http://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/C-Compiler.html
+for more details.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,7 @@
+ AC_SYS_LARGEFILE
+ 
+ # Checks for programs.
+-AC_PROG_CC
++AC_PROG_CC_STDC
+ AC_PROG_MAKE_SET
+ LT_INIT
+ AC_PROG_YACC
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 82376a3..d3bfc83 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -4,5 +4,9 @@ LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
+# One patch touches configure.ac
+LTTNG_BABELTRACE_AUTORECONF = YES
+HOST_LTTNG_BABELTRACE_AUTORECONF = YES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
