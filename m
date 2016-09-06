From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  6 Sep 2016 10:59:00 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.7.2
Message-ID: <1473170340-9594-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop all of the upstreamed patches (not precisely in the same form) and
rebase the only required patch for proper static builds with staging
libs required by other packages.
Build-tested for arm-glibc, arm-uclibc, arm-musl and arm-uclibc-static.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...install-static-library-and-headers-in-in.patch} |  14 ++-
 ...01-configure-refactor-backtrace-detection.patch | 132 ---------------------
 ...onfigure-refactor-always_inline-detection.patch |  42 -------
 ...compile-fix-undefined-PATH_MAX-under-musl.patch |  67 -----------
 package/btrfs-progs/btrfs-progs.hash               |   2 +-
 package/btrfs-progs/btrfs-progs.mk                 |   2 +-
 6 files changed, 10 insertions(+), 249 deletions(-)
 rename package/btrfs-progs/{0004-Makefile.in-install-static-library-and-headers-in-in.patch => 0001-Makefile.in-install-static-library-and-headers-in-in.patch} (76%)
 delete mode 100644 package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
 delete mode 100644 package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
 delete mode 100644 package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch

diff --git a/package/btrfs-progs/0004-Makefile.in-install-static-library-and-headers-in-in.patch b/package/btrfs-progs/0001-Makefile.in-install-static-library-and-headers-in-in.patch
similarity index 76%
rename from package/btrfs-progs/0004-Makefile.in-install-static-library-and-headers-in-in.patch
rename to package/btrfs-progs/0001-Makefile.in-install-static-library-and-headers-in-in.patch
index e6e9eab..d861dfc 100644
--- a/package/btrfs-progs/0004-Makefile.in-install-static-library-and-headers-in-in.patch
+++ b/package/btrfs-progs/0001-Makefile.in-install-static-library-and-headers-in-in.patch
@@ -12,15 +12,17 @@ should be installed by "install-static". Indeed, "make install" cannot
 be used if the support for shared library is not enabled.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Gustavo: Rebase for btrfs-progs 4.7.2]
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  Makefile.in | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 8450ab3..0d3b490 100644
+index 19697ff..5870a58 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -183,7 +183,7 @@ test: test-fsck test-convert test-misc
+@@ -219,7 +219,7 @@ test: test-fsck test-mkfs test-convert test-misc test-fuzz
  # NOTE: For static compiles, you need to have all the required libs
  # 	static equivalent available
  #
@@ -29,10 +31,10 @@ index 8450ab3..0d3b490 100644
  
  version.h: version.sh version.h.in configure.ac
  	@echo "    [SH]     $@"
-@@ -346,6 +346,10 @@ install-static: $(progs_static) $(INSTALLDIRS)
- 	for p in $(progs_static) ; do \
- 		$(INSTALL) -D -m755 $$p $(DESTDIR)$(bindir)/`basename $$p .static` ; \
+@@ -384,6 +384,10 @@ install-static: $(progs_static) $(INSTALLDIRS)
  	done
+ 	# btrfsck is a link to btrfs in the src tree, make it so for installed file as well
+ 	$(LN_S) -f btrfs.static $(DESTDIR)$(bindir)/btrfsck.static
 +	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
 +	$(INSTALL) $(libs_static) $(DESTDIR)$(libdir)
 +	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)
@@ -41,5 +43,5 @@ index 8450ab3..0d3b490 100644
  $(INSTALLDIRS):
  	@echo "Making install in $(patsubst install-%,%,$@)"
 -- 
-2.7.4
+2.7.3
 
diff --git a/package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch b/package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
deleted file mode 100644
index 0f834de..0000000
--- a/package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 9bef473d17ec01efe760462271791dfaaea280c0 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 29 Jul 2015 22:35:19 +0200
-Subject: [PATCH 1/3] configure: refactor backtrace() detection
-
-The current code assumes that if __GLIBC__ is not defined, backtrace
-support is not available, and defines BTRFS_DISABLE_BACKTRACE.
-
-However, this macro is already defined by the configure.ac script when
---disable-backtrace is passed. This means that if you are using a C
-library like musl which does not define __GLIBC__, and you pass
---disable-backtrace, you get a macro redefinition.
-
-Instead of relying on __GLIBC__, this commit implements a proper
-configure.ac based detection of backtrace support:
-
- * If the user passes --enable-backtrace, we check if the backtrace()
-   function is available. If not, we abort the configure process with
-   an error. Otherwise we enable backtrace support by defining
-   HAVE_BACKTRACE.
-
- * If the user passes --disable-backtrace, then we don't enable
-   backtrace support.
-
- * If the user passes nothing special, we auto-detect: if backtrace()
-   is available, we use it, otherwise we simply warn at configure time
-   but not fail.
-
-Upstream-status: pending
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- configure.ac | 32 ++++++++++++++++++++++----------
- kerncompat.h |  9 ++++-----
- 2 files changed, 26 insertions(+), 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c3a22d1..e936a10 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -63,22 +63,34 @@ AC_DEFUN([PKG_STATIC], [
-   fi
- ])
- 
--
-+# Provide a --{enable,disable}-backtrace option. If not passed, set
-+# enable_backtrace to 'auto' so that we try to enable backtrace
-+# support if available, but if not available, we gracefully fallback
-+# without backtrace support.
- AC_ARG_ENABLE([backtrace],
-   AS_HELP_STRING([--disable-backtrace], [disable btrfs backtrace]),
--  [], [enable_backtrace=yes]
-+  [enable_backtrace=${enableval}], [enable_backtrace=auto]
- )
- 
--AS_IF([test "x$enable_backtrace" = xno], [
--  AC_DEFINE([BTRFS_DISABLE_BACKTRACE], [1], [disable backtrace stuff in kerncompat.h ])
--])
--
--if test "x$enable_backtrace" = xyes; then
--	AC_CHECK_HEADERS([execinfo.h])
--	AC_CHECK_FUNCS([backtrace backtrace_symbols_fd], [],
--	      AC_MSG_ERROR([standard library does not have backtrace support]))
-+# Backtrace support requested (enable_backtrace is either 'yes' or
-+# 'auto'), so check for needed headers and functions.
-+if test "x$enable_backtrace" != xno; then
-+   AC_CHECK_HEADERS([execinfo.h])
-+   AC_CHECK_FUNCS([backtrace backtrace_symbols_fd])
- fi
- 
-+if test "x$ac_cv_func_backtrace" = xno; then
-+    # If backtrace support was requested but not available, we fail if
-+    # --enable-backtrace was passed, or we simply warn if we're
-+    # auto-detecting.
-+    if test "x$enable_backtrace" = xyes ; then
-+	AC_MSG_ERROR([standard library does not have backtrace support])
-+    elif test "x$enable_backtrace" = xauto ; then
-+        AC_MSG_WARN([standard library does not have backtrace support, disabled])
-+    fi
-+else
-+    AC_DEFINE([HAVE_BACKTRACE], [1], [Enable backtrace support])
-+fi
- 
- AC_ARG_ENABLE([documentation],
- 	      AS_HELP_STRING([--disable-documentation], [do not build domumentation]),
-diff --git a/kerncompat.h b/kerncompat.h
-index 5d92856..8318665 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -33,11 +33,10 @@
- #include <features.h>
- 
- #ifndef __GLIBC__
--#define BTRFS_DISABLE_BACKTRACE
- #define __always_inline __inline __attribute__ ((__always_inline__))
- #endif
- 
--#ifndef BTRFS_DISABLE_BACKTRACE
-+#ifdef HAVE_BACKTRACE
- #include <execinfo.h>
- #endif
- 
-@@ -65,7 +64,7 @@
- #define ULONG_MAX       (~0UL)
- #endif
- 
--#ifndef BTRFS_DISABLE_BACKTRACE
-+#ifdef HAVE_BACKTRACE
- #define MAX_BACKTRACE	16
- static inline void print_trace(void)
- {
-@@ -285,7 +284,7 @@ static inline long IS_ERR(const void *ptr)
- #define vmalloc(x) malloc(x)
- #define vfree(x) free(x)
- 
--#ifndef BTRFS_DISABLE_BACKTRACE
-+#ifdef HAVE_BACKTRACE
- #define BUG_ON(c) assert_trace(#c, __FILE__, __func__, __LINE__, !(c))
- #else
- #define BUG_ON(c) assert(!(c))
-@@ -293,7 +292,7 @@ static inline long IS_ERR(const void *ptr)
- 
- #define WARN_ON(c) BUG_ON(c)
- 
--#ifndef BTRFS_DISABLE_BACKTRACE
-+#ifdef HAVE_BACKTRACE
- #define	ASSERT(c) assert_trace(#c, __FILE__, __func__, __LINE__, (c))
- #else
- #define ASSERT(c) assert(c)
--- 
-2.4.3
-
diff --git a/package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch b/package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
deleted file mode 100644
index f54d250..0000000
--- a/package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1d99ae25bb1bd4879c6f20f607faf3040018ee84 Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Thu, 30 Jul 2015 15:44:52 +0100
-Subject: [PATCH 2/3] configure: refactor always_inline detection
-
-Use configure.ac to detect the availability of the always_inline glibc
-macro, and define it only if it does not exist.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- configure.ac | 1 +
- kerncompat.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e936a10..d3d81a1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -41,6 +41,7 @@ AC_PATH_PROG([RMDIR], [rmdir], [rmdir])
- 
- AC_CHECK_FUNCS([openat], [],
- 	[AC_MSG_ERROR([cannot find openat() function])])
-+AC_CHECK_DECLS([__always_inline])
- 
- m4_ifndef([PKG_PROG_PKG_CONFIG],
-   [m4_fatal([Could not locate the pkg-config autoconf
-diff --git a/kerncompat.h b/kerncompat.h
-index 8318665..757b9b4 100644
---- a/kerncompat.h
-+++ b/kerncompat.h
-@@ -32,7 +32,7 @@
- 
- #include <features.h>
- 
--#ifndef __GLIBC__
-+#ifndef HAVE_DECL___ALWAYS_INLINE
- #define __always_inline __inline __attribute__ ((__always_inline__))
- #endif
- 
--- 
-2.4.3
-
diff --git a/package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch b/package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch
deleted file mode 100644
index 3526014..0000000
--- a/package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 3197a4b058615d81aa4623fb5a52e57d7fbc3af2 Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Thu, 30 Jul 2015 15:47:16 +0100
-Subject: [PATCH 3/3] compile: fix undefined PATH_MAX under musl
-
-musl's strict implementation requires #include <limits.h> for PATH_MAX.
-
-Upstream-status: submitted
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- cmds-inspect.c | 1 +
- cmds-receive.c | 1 +
- cmds-scrub.c   | 1 +
- cmds-send.c    | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/cmds-inspect.c b/cmds-inspect.c
-index 71451fe..9712581 100644
---- a/cmds-inspect.c
-+++ b/cmds-inspect.c
-@@ -20,6 +20,7 @@
- #include <stdint.h>
- #include <sys/ioctl.h>
- #include <errno.h>
-+#include <limits.h>
- 
- #include "kerncompat.h"
- #include "ioctl.h"
-diff --git a/cmds-receive.c b/cmds-receive.c
-index 071bea9..d4b3103 100644
---- a/cmds-receive.c
-+++ b/cmds-receive.c
-@@ -28,6 +28,7 @@
- #include <wait.h>
- #include <assert.h>
- #include <getopt.h>
-+#include <limits.h>
- 
- #include <sys/stat.h>
- #include <sys/types.h>
-diff --git a/cmds-scrub.c b/cmds-scrub.c
-index b7aa809..5a85dc4 100644
---- a/cmds-scrub.c
-+++ b/cmds-scrub.c
-@@ -34,6 +34,7 @@
- #include <ctype.h>
- #include <signal.h>
- #include <stdarg.h>
-+#include <limits.h>
- 
- #include "ctree.h"
- #include "ioctl.h"
-diff --git a/cmds-send.c b/cmds-send.c
-index 20bba18..a0b7f95 100644
---- a/cmds-send.c
-+++ b/cmds-send.c
-@@ -33,6 +33,7 @@
- #include <assert.h>
- #include <getopt.h>
- #include <uuid/uuid.h>
-+#include <limits.h>
- 
- #include "ctree.h"
- #include "ioctl.h"
--- 
-2.4.3
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 799c878..4cd00aa 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	62db60c6a0868afb6302112cea54c756873bc30b826696b167ec03ecd61b2f12	btrfs-progs-v4.1.2.tar.xz
+sha256	f49bc9e143ffe60260c5bd70ef3b624576673f8b50f41e309892a425f7fbe60f	btrfs-progs-v4.7.2.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 8768057..e094986 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.1.2
+BTRFS_PROGS_VERSION = 4.7.2
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
-- 
2.7.3
