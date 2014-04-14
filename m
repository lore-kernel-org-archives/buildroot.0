From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 22:40:17 +0200
Subject: [Buildroot] [git commit] lttng-libust: Disable liblttng-ust-dl with
	uClibc.
Message-ID: <20140414204029.5B3049C79B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51f5c91c0959e0e58595716ce9881711e9c08f8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to uClibc commit [1], dlinfo is not available in recent uClibc (>0.9.33),
but is available in older version of uClibc (<=0.9.33) whith a different prototype
than dlinfo() in glibc.

To be able to use LTTng UST with uClibc, we need to disable the Dynamic Linker
Tracing functionality [2].

A specific test on dlinfo() prototype is performed to enable or disable this
functionality.

This patch supersede the one added in abf58f46cedacace1db53de5cc12a8fe9f7fbd82
that wrongly disable liblttng-ust-dl even if dlinfo() comme from glibc.

Fixes:
http://autobuild.buildroot.net/results/a6c/a6c33dd7ec2a36a50c5ea74b989a371d6c85e899/build-end.log

[1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
[2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...iblttng-ust-dl-if-dlinfo-is-not-available.patch |   59 ++++++++++++++-----
 1 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch b/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
index 7849840..dd00f37 100644
--- a/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
+++ b/package/lttng-libust/lttng-libust-0001-Disable-liblttng-ust-dl-if-dlinfo-is-not-available.patch
@@ -1,17 +1,27 @@
-Disable liblttng-ust-dl if dlinfo is not available in C library.
+From 44316d0214425f5ae0d8af07099caae3e95ac890 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 8 Apr 2014 22:15:27 +0200
+Subject: [PATCH 1/1] Fix: disable liblttng-ust-dl if dlinfo is not available
+ in C library
 
-According to uClibc commit [1], dlinfo is not available.
-To be able to use LTTng UST with uClibc, we need to disable
-the Dynamic Linker Tracing functionality [2].
+According to uClibc commit [1], dlinfo is not available in recent uClibc (>0.9.33),
+but is available in older version of uClibc (<=0.9.33) whith a different prototype
+than dlinfo() in glibc.
+
+To be able to use LTTng UST with uClibc, we need to disable the Dynamic Linker
+Tracing functionality [2].
+
+A specific test on dlinfo() prototype is performed to enable or disable this
+functionality.
 
 [1] http://git.uclibc.org/uClibc/commit/?id=f3c9dc499c5c787ddd8c4320f2d44d2ae6e40c22
 [2] http://lists.lttng.org/pipermail/lttng-dev/2014-February/022423.html
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
- Makefile.am  | 5 ++++-
- configure.ac | 3 +++
- 2 files changed, 7 insertions(+), 1 deletion(-)
+ Makefile.am  |  5 ++++-
+ configure.ac | 18 ++++++++++++++++++
+ 2 files changed, 22 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
 index b79d2dd..c907ff1 100644
@@ -34,19 +44,36 @@ index b79d2dd..c907ff1 100644
  SUBDIRS += liblttng-ust-java liblttng-ust-jul
  endif
 diff --git a/configure.ac b/configure.ac
-index f507883..5dcf0e2 100644
+index b04d4e3..f4b499b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -145,6 +145,9 @@ AC_C_INLINE
- AC_FUNC_MALLOC
- AC_CHECK_FUNCS([gettimeofday munmap socket strerror strtol sched_getcpu sysconf])
+@@ -119,8 +119,26 @@ AC_CHECK_LIB([dl], [dlopen],
+ 		AC_MSG_ERROR([Cannot find dlopen in libdl nor libc. Use [LDFLAGS]=-Ldir to specify their location.])
+ 	])
+ ])
++AS_IF([test "$x$have_libdl" = "yes" || test "x$have_libc_dl" = "xyes"],
++	[AC_MSG_CHECKING([for dlinfo()])
++		# Ensure the check is covered by the LIBS variable
++		LIBS="$LIBS -ldl"
++		AC_LINK_IFELSE(
++			[AC_LANG_PROGRAM([[#define _GNU_SOURCE /* Required on Linux to get GNU extensions */
++							#include <dlfcn.h>]],
++				[[dlinfo(0, 0, 0);]])],
++			[AC_MSG_RESULT([yes])
++				dlinfo_ok=yes;
++			],
++			[AC_MSG_RESULT([no])
++				AC_MSG_WARN([dlinfo() is not available, the Dynamic Linker Tracing functionality is disabled.])
++				dlinfo_ok=no;
++			])
++	],
++	[dlinfo_ok=no])
+ AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBDL], [test "x$have_libdl" = "xyes"])
+ AM_CONDITIONAL([LTTNG_UST_BUILD_WITH_LIBC_DL], [test "x$have_libc_dl" = "xyes"])
++AM_CONDITIONAL([HAVE_DLINFO], [test "dlinfo_ok" = "yes"])
  
-+AC_CHECK_FUNCS([dlinfo])
-+AM_CONDITIONAL([HAVE_DLINFO], [test "${ac_cv_func_dlinfo}" = "yes"])
-+
- CFLAGS="-Wall $CFLAGS"
+ AC_CHECK_LIB([pthread], [pthread_create])
  
- # URCU
 -- 
 1.9.0
 
