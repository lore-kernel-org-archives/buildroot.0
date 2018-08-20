From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 16:22:16 +0200
Subject: [Buildroot] [PATCH] pv: fix build failures when building under a
 path containing 'yes'
Message-ID: <20180820142216.5904-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depending on the configuration, the cpp output may contain the string 'yes'
in a comment if built under a path containing 'yes', confusing the _AIX
test:

${CROSS}-cpp conftest.h
\# 1 "conftest.h"
\# 1 "<built-in>"
\# 1 "<command-line>"
\# 31 "<command-line>"
\# 1 "/home/peko/source/buildroot/output-yes/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/stdc-predef.h"
\# 32 "<command-line>" 2
\# 1 "conftest.txt"

If misdetected, the configure script adds -lc128 to LIBS, causing the
AC_CHECKS_FUNCS check for stat64 to fail, which in turn causes compilation
errors about redefinition of symbols:

In file included from ./src/include/pv-internal.h:9:0,
                 from src/pv/file.c:5:
./src/include/config.h:76:18: error: redefinition of 'struct stat'
  #  define stat64 stat
                   ^
Fix it by only matching on 'yes' on a line by itself.

As pv doesn't cleanly autoreconf (it doesn't use automake and configure.in
is located in subdir), instead directly patch configure.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../pv/0001-configure.in-tighten-AIX-test.patch    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/pv/0001-configure.in-tighten-AIX-test.patch

diff --git a/package/pv/0001-configure.in-tighten-AIX-test.patch b/package/pv/0001-configure.in-tighten-AIX-test.patch
new file mode 100644
index 0000000000..2e0d2af247
--- /dev/null
+++ b/package/pv/0001-configure.in-tighten-AIX-test.patch
@@ -0,0 +1,57 @@
+From cd7605723eb8e6d8231644f1cf62f1e80badf074 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 20 Aug 2018 15:57:22 +0200
+Subject: [PATCH] configure.in: tighten AIX test
+
+Depending on the configuration, the cpp output may contain the string 'yes'
+in a comment if built under a path containing 'yes', confusing the _AIX
+test:
+
+${CROSS}-cpp conftest.h
+\# 1 "conftest.h"
+\# 1 "<built-in>"
+\# 1 "<command-line>"
+\# 31 "<command-line>"
+\# 1 "/home/peko/source/buildroot/output-yes/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/stdc-predef.h" 1 3 4
+\# 32 "<command-line>" 2
+\# 1 "conftest.txt"
+
+Fix it by only matching on 'yes' on a line by itself.
+
+Upstream-status: submitted to author
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+
+ autoconf/configure.in | 2 +-
+ configure             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/autoconf/configure.in b/autoconf/configure.in
+index bd45004..487c42b 100644
+--- a/autoconf/configure.in
++++ b/autoconf/configure.in
+@@ -86,7 +86,7 @@ AC_PROG_MAKE_SET
+ 
+ dnl AIX needs -lc128
+ dnl
+-AC_EGREP_CPP([yes], [#ifdef _AIX
++AC_EGREP_CPP([^yes$], [#ifdef _AIX
+ yes
+ #endif
+ ], [LIBS="$LIBS -lc128"])
+diff --git a/configure b/configure
+index 7c11be0..59267b9 100755
+--- a/configure
++++ b/configure
+@@ -3377,7 +3377,7 @@ yes
+ 
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then
++  $EGREP "^yes$" >/dev/null 2>&1; then
+   LIBS="$LIBS -lc128"
+ fi
+ rm -f conftest*
+-- 
+2.11.0
+
-- 
2.11.0
