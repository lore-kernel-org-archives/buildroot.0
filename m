From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Jun 2013 16:05:35 +0200
Subject: [Buildroot] [git commit] lttng: bump the various LTTng components
Message-ID: <20130624140833.EA6A69AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fcef3c9fe343ac2b54c07b0711210a96d993762
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the various LTTng components to their latest stable
version: 0.7.7 for liburcu, 1.1.1 for babeltrace, 2.1.3 for libust and
2.1.2 for lttng-modules.

For babeltrace, the patch
lttng-babeltrace-02-fix-build-old-compilers.patch has been removed
because it has been merged upstream as of version 1.1.1. This is also
the reason why the package no longer needs to be autoreconfigured.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liburcu/liburcu.mk                         |    2 +-
 ...tng-babeltrace-02-fix-build-old-compilers.patch |   27 --------------------
 package/lttng-babeltrace/lttng-babeltrace.mk       |    6 +---
 package/lttng-libust/lttng-libust.mk               |    2 +-
 package/lttng-modules/lttng-modules.mk             |    2 +-
 5 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 3c684ea..35f09f7 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.7.6
+LIBURCU_VERSION = 0.7.7
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 
diff --git a/package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch b/package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch
deleted file mode 100644
index b8f31be..0000000
--- a/package/lttng-babeltrace/lttng-babeltrace-02-fix-build-old-compilers.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Support old compilers
-
-Some old compilers do not use C99 as their default C language variant,
-for example gcc 4.3.x, which is used on some old machines. When such a
-compiler is used, by default, ULLONG_MAX is not visible. Adding
--std=gnu99 is needed to make this definition visible.
-
-In autoconf speak, this translates into the need of using
-AC_PROC_CC_STDC instead of AC_PROG_CC. See
-http://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/C-Compiler.html
-for more details.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -17,7 +17,7 @@
- AC_SYS_LARGEFILE
- 
- # Checks for programs.
--AC_PROG_CC
-+AC_PROG_CC_STDC
- AC_PROG_MAKE_SET
- LT_INIT
- AC_PROG_YACC
diff --git a/package/lttng-babeltrace/lttng-babeltrace.mk b/package/lttng-babeltrace/lttng-babeltrace.mk
index 2947c35..96d3a31 100644
--- a/package/lttng-babeltrace/lttng-babeltrace.mk
+++ b/package/lttng-babeltrace/lttng-babeltrace.mk
@@ -5,14 +5,10 @@
 ################################################################################
 
 LTTNG_BABELTRACE_SITE    = http://lttng.org/files/babeltrace/
-LTTNG_BABELTRACE_VERSION = 1.0.2
+LTTNG_BABELTRACE_VERSION = 1.1.1
 LTTNG_BABELTRACE_SOURCE  = babeltrace-$(LTTNG_BABELTRACE_VERSION).tar.bz2
 
 LTTNG_BABELTRACE_DEPENDENCIES = popt util-linux libglib2
 
-# One patch touches configure.ac
-LTTNG_BABELTRACE_AUTORECONF = YES
-HOST_LTTNG_BABELTRACE_AUTORECONF = YES
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 625475f..c295046 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.1.1
+LTTNG_LIBUST_VERSION = 2.1.3
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index c1dfff9..85ccaf3 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.1.0
+LTTNG_MODULES_VERSION = 2.1.2
 LTTNG_MODULES_SITE    = http://lttng.org/files/lttng-modules/
 LTTNG_MODULES_SOURCE  = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 
