From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 30 Jul 2015 16:54:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: fix build issues under
	musl
Message-ID: <1438271680-3692-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/b97/b97f1e9cd459da96e3e1680bb7c43d8103ab12c2/build-end.log

Patches by Thomas to refactor detection of __always_inline and backtrace
detection. Also added #include <limits.h> for PATH_MAX.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 ...01-configure-refactor-backtrace-detection.patch | 132 +++++++++++++++++++++
 ...onfigure-refactor-always_inline-detection.patch |  56 +++++++++
 ...compile-fix-undefined-PATH_MAX-under-musl.patch |  67 +++++++++++
 3 files changed, 255 insertions(+)
 create mode 100644 package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
 create mode 100644 package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
 create mode 100644 package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch

diff --git a/package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch b/package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
new file mode 100644
index 0000000..0f834de
--- /dev/null
+++ b/package/btrfs-progs/0001-configure-refactor-backtrace-detection.patch
@@ -0,0 +1,132 @@
+From 9bef473d17ec01efe760462271791dfaaea280c0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 29 Jul 2015 22:35:19 +0200
+Subject: [PATCH 1/3] configure: refactor backtrace() detection
+
+The current code assumes that if __GLIBC__ is not defined, backtrace
+support is not available, and defines BTRFS_DISABLE_BACKTRACE.
+
+However, this macro is already defined by the configure.ac script when
+--disable-backtrace is passed. This means that if you are using a C
+library like musl which does not define __GLIBC__, and you pass
+--disable-backtrace, you get a macro redefinition.
+
+Instead of relying on __GLIBC__, this commit implements a proper
+configure.ac based detection of backtrace support:
+
+ * If the user passes --enable-backtrace, we check if the backtrace()
+   function is available. If not, we abort the configure process with
+   an error. Otherwise we enable backtrace support by defining
+   HAVE_BACKTRACE.
+
+ * If the user passes --disable-backtrace, then we don't enable
+   backtrace support.
+
+ * If the user passes nothing special, we auto-detect: if backtrace()
+   is available, we use it, otherwise we simply warn at configure time
+   but not fail.
+
+Upstream-status: pending
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ configure.ac | 32 ++++++++++++++++++++++----------
+ kerncompat.h |  9 ++++-----
+ 2 files changed, 26 insertions(+), 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c3a22d1..e936a10 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -63,22 +63,34 @@ AC_DEFUN([PKG_STATIC], [
+   fi
+ ])
+ 
+-
++# Provide a --{enable,disable}-backtrace option. If not passed, set
++# enable_backtrace to 'auto' so that we try to enable backtrace
++# support if available, but if not available, we gracefully fallback
++# without backtrace support.
+ AC_ARG_ENABLE([backtrace],
+   AS_HELP_STRING([--disable-backtrace], [disable btrfs backtrace]),
+-  [], [enable_backtrace=yes]
++  [enable_backtrace=${enableval}], [enable_backtrace=auto]
+ )
+ 
+-AS_IF([test "x$enable_backtrace" = xno], [
+-  AC_DEFINE([BTRFS_DISABLE_BACKTRACE], [1], [disable backtrace stuff in kerncompat.h ])
+-])
+-
+-if test "x$enable_backtrace" = xyes; then
+-	AC_CHECK_HEADERS([execinfo.h])
+-	AC_CHECK_FUNCS([backtrace backtrace_symbols_fd], [],
+-	      AC_MSG_ERROR([standard library does not have backtrace support]))
++# Backtrace support requested (enable_backtrace is either 'yes' or
++# 'auto'), so check for needed headers and functions.
++if test "x$enable_backtrace" != xno; then
++   AC_CHECK_HEADERS([execinfo.h])
++   AC_CHECK_FUNCS([backtrace backtrace_symbols_fd])
+ fi
+ 
++if test "x$ac_cv_func_backtrace" = xno; then
++    # If backtrace support was requested but not available, we fail if
++    # --enable-backtrace was passed, or we simply warn if we're
++    # auto-detecting.
++    if test "x$enable_backtrace" = xyes ; then
++	AC_MSG_ERROR([standard library does not have backtrace support])
++    elif test "x$enable_backtrace" = xauto ; then
++        AC_MSG_WARN([standard library does not have backtrace support, disabled])
++    fi
++else
++    AC_DEFINE([HAVE_BACKTRACE], [1], [Enable backtrace support])
++fi
+ 
+ AC_ARG_ENABLE([documentation],
+ 	      AS_HELP_STRING([--disable-documentation], [do not build domumentation]),
+diff --git a/kerncompat.h b/kerncompat.h
+index 5d92856..8318665 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -33,11 +33,10 @@
+ #include <features.h>
+ 
+ #ifndef __GLIBC__
+-#define BTRFS_DISABLE_BACKTRACE
+ #define __always_inline __inline __attribute__ ((__always_inline__))
+ #endif
+ 
+-#ifndef BTRFS_DISABLE_BACKTRACE
++#ifdef HAVE_BACKTRACE
+ #include <execinfo.h>
+ #endif
+ 
+@@ -65,7 +64,7 @@
+ #define ULONG_MAX       (~0UL)
+ #endif
+ 
+-#ifndef BTRFS_DISABLE_BACKTRACE
++#ifdef HAVE_BACKTRACE
+ #define MAX_BACKTRACE	16
+ static inline void print_trace(void)
+ {
+@@ -285,7 +284,7 @@ static inline long IS_ERR(const void *ptr)
+ #define vmalloc(x) malloc(x)
+ #define vfree(x) free(x)
+ 
+-#ifndef BTRFS_DISABLE_BACKTRACE
++#ifdef HAVE_BACKTRACE
+ #define BUG_ON(c) assert_trace(#c, __FILE__, __func__, __LINE__, !(c))
+ #else
+ #define BUG_ON(c) assert(!(c))
+@@ -293,7 +292,7 @@ static inline long IS_ERR(const void *ptr)
+ 
+ #define WARN_ON(c) BUG_ON(c)
+ 
+-#ifndef BTRFS_DISABLE_BACKTRACE
++#ifdef HAVE_BACKTRACE
+ #define	ASSERT(c) assert_trace(#c, __FILE__, __func__, __LINE__, (c))
+ #else
+ #define ASSERT(c) assert(c)
+-- 
+2.4.3
+
diff --git a/package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch b/package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
new file mode 100644
index 0000000..02b6428
--- /dev/null
+++ b/package/btrfs-progs/0002-configure-refactor-always_inline-detection.patch
@@ -0,0 +1,56 @@
+From f464d1f29fecc7e8c51957bfa759198d64aed49a Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Thu, 30 Jul 2015 15:44:52 +0100
+Subject: [PATCH 2/3] configure: refactor always_inline detection
+
+Use configure.ac to detect the availability of the always_inline glibc
+macro, and define it only if it does not exist.
+
+Upstream-status: pending
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ configure.ac | 7 +++++++
+ kerncompat.h | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e936a10..394e2f1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,6 +41,7 @@ AC_PATH_PROG([RMDIR], [rmdir], [rmdir])
+ 
+ AC_CHECK_FUNCS([openat], [],
+ 	[AC_MSG_ERROR([cannot find openat() function])])
++AC_CHECK_DECLS([__always_inline])
+ 
+ m4_ifndef([PKG_PROG_PKG_CONFIG],
+   [m4_fatal([Could not locate the pkg-config autoconf
+@@ -92,6 +93,12 @@ else
+     AC_DEFINE([HAVE_BACKTRACE], [1], [Enable backtrace support])
+ fi
+ 
++AX_GCC_FUNC_ATTRIBUTE(always_inline)
++
++if test "x$ax_cv_have_func_attribute_always_inline" = xyes; then
++    AC_DEFINE([HAVE_ALWAYS_INLINE], [1], [Enable always_inline support])
++fi
++
+ AC_ARG_ENABLE([documentation],
+ 	      AS_HELP_STRING([--disable-documentation], [do not build domumentation]),
+   [], [enable_documentation=yes]
+diff --git a/kerncompat.h b/kerncompat.h
+index 8318665..757b9b4 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -32,7 +32,7 @@
+ 
+ #include <features.h>
+ 
+-#ifndef __GLIBC__
++#ifndef HAVE_DECL___ALWAYS_INLINE
+ #define __always_inline __inline __attribute__ ((__always_inline__))
+ #endif
+ 
+-- 
+2.4.3
+
diff --git a/package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch b/package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch
new file mode 100644
index 0000000..3526014
--- /dev/null
+++ b/package/btrfs-progs/0003-compile-fix-undefined-PATH_MAX-under-musl.patch
@@ -0,0 +1,67 @@
+From 3197a4b058615d81aa4623fb5a52e57d7fbc3af2 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Thu, 30 Jul 2015 15:47:16 +0100
+Subject: [PATCH 3/3] compile: fix undefined PATH_MAX under musl
+
+musl's strict implementation requires #include <limits.h> for PATH_MAX.
+
+Upstream-status: submitted
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ cmds-inspect.c | 1 +
+ cmds-receive.c | 1 +
+ cmds-scrub.c   | 1 +
+ cmds-send.c    | 1 +
+ 4 files changed, 4 insertions(+)
+
+diff --git a/cmds-inspect.c b/cmds-inspect.c
+index 71451fe..9712581 100644
+--- a/cmds-inspect.c
++++ b/cmds-inspect.c
+@@ -20,6 +20,7 @@
+ #include <stdint.h>
+ #include <sys/ioctl.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #include "kerncompat.h"
+ #include "ioctl.h"
+diff --git a/cmds-receive.c b/cmds-receive.c
+index 071bea9..d4b3103 100644
+--- a/cmds-receive.c
++++ b/cmds-receive.c
+@@ -28,6 +28,7 @@
+ #include <wait.h>
+ #include <assert.h>
+ #include <getopt.h>
++#include <limits.h>
+ 
+ #include <sys/stat.h>
+ #include <sys/types.h>
+diff --git a/cmds-scrub.c b/cmds-scrub.c
+index b7aa809..5a85dc4 100644
+--- a/cmds-scrub.c
++++ b/cmds-scrub.c
+@@ -34,6 +34,7 @@
+ #include <ctype.h>
+ #include <signal.h>
+ #include <stdarg.h>
++#include <limits.h>
+ 
+ #include "ctree.h"
+ #include "ioctl.h"
+diff --git a/cmds-send.c b/cmds-send.c
+index 20bba18..a0b7f95 100644
+--- a/cmds-send.c
++++ b/cmds-send.c
+@@ -33,6 +33,7 @@
+ #include <assert.h>
+ #include <getopt.h>
+ #include <uuid/uuid.h>
++#include <limits.h>
+ 
+ #include "ctree.h"
+ #include "ioctl.h"
+-- 
+2.4.3
+
-- 
2.4.3
