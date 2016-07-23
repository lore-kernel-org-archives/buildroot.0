From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jul 2016 18:50:22 +0200
Subject: [Buildroot] [PATCH] package/gdb: fix gnulib issue with musl and
	uClibc toolchains
Message-ID: <1469292622-32034-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnulib whant to use rpl_gettimeofday due bad guessing when
cross-compiling with musl and uClibc toolchains.

tracepoint-ipa.o: In function `get_timestamp':
tracepoint.c:(.text+0x147): undefined reference to `rpl_gettimeofday'
Makefile:329: recipe for target 'libinproctrace.so' failed

reported upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=19798

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...fix-bad-guessing-when-cross-compiling-wit.patch | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/gdb/7.11.1/0001-gdb-gnulib-fix-bad-guessing-when-cross-compiling-wit.patch

diff --git a/package/gdb/7.11.1/0001-gdb-gnulib-fix-bad-guessing-when-cross-compiling-wit.patch b/package/gdb/7.11.1/0001-gdb-gnulib-fix-bad-guessing-when-cross-compiling-wit.patch
new file mode 100644
index 0000000..1ad0f5c
--- /dev/null
+++ b/package/gdb/7.11.1/0001-gdb-gnulib-fix-bad-guessing-when-cross-compiling-wit.patch
@@ -0,0 +1,65 @@
+From 5696f95f7a6c214319a10edbdb4037ebec7a02f7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 23 Jul 2016 18:39:15 +0200
+Subject: [PATCH] gdb/gnulib: fix bad guessing when cross-compiling with musl
+ and uClibc toolchains
+
+Commit b2234a55a9065eeb2aba8d26706c63facd34f3ef disable gettimeofday
+replacement with rpl_gettimeofday for glibc toolchains but the same
+fix is needed for musl and uClibc toolchains.
+
+Otherwise the build fail with this error:
+tracepoint-ipa.o: In function `get_timestamp':
+tracepoint.c:(.text+0x147): undefined reference to `rpl_gettimeofday'
+Makefile:329: recipe for target 'libinproctrace.so' failed
+
+"It's a bit nasty.  Basically there are a lot of configure tests being
+done in order to figure out if the used runtime routines adhere to the
+standard(s).  A couple of those tests concern gettimeofday(). The last
+one wants to check if gettimeofday() and localtime() share a static
+buffer (apparently a MacOS X issue)" [2]
+
+[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19798
+[2] http://www.riscos.info/pipermail/gcc/2014-April/006093.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gnulib/configure                 | 4 +++-
+ gdb/gnulib/import/m4/gettimeofday.m4 | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/gnulib/configure b/gdb/gnulib/configure
+index 540bad3..c5f6078 100644
+--- a/gdb/gnulib/configure
++++ b/gdb/gnulib/configure
+@@ -13520,8 +13520,10 @@ else
+   if test "$cross_compiling" = yes; then :
+   # When cross-compiling:
+       case "$host_os" in
+-                # Guess all is fine on glibc systems.
++                # Guess all is fine on glibc/musl/uClibc systems.
+         *-gnu*) gl_cv_func_gettimeofday_clobber="guessing no" ;;
++        *-musl*) gl_cv_func_gettimeofday_clobber="guessing no" ;;
++        *-uclibc*) gl_cv_func_gettimeofday_clobber="guessing no" ;;
+                 # If we don't know, assume the worst.
+         *)      gl_cv_func_gettimeofday_clobber="guessing yes" ;;
+       esac
+diff --git a/gdb/gnulib/import/m4/gettimeofday.m4 b/gdb/gnulib/import/m4/gettimeofday.m4
+index ce246e1..7984252 100644
+--- a/gdb/gnulib/import/m4/gettimeofday.m4
++++ b/gdb/gnulib/import/m4/gettimeofday.m4
+@@ -109,8 +109,10 @@ AC_DEFUN([gl_FUNC_GETTIMEOFDAY_CLOBBER],
+      [gl_cv_func_gettimeofday_clobber=yes],
+      [# When cross-compiling:
+       case "$host_os" in
+-                # Guess all is fine on glibc systems.
++                # Guess all is fine on glibc/musl/uClibc systems.
+         *-gnu*) gl_cv_func_gettimeofday_clobber="guessing no" ;;
++        *-musl*) gl_cv_func_gettimeofday_clobber="guessing no" ;;
++        *-uclibc*) gl_cv_func_gettimeofday_clobber="guessing no" ;;
+                 # If we don't know, assume the worst.
+         *)      gl_cv_func_gettimeofday_clobber="guessing yes" ;;
+       esac
+-- 
+2.5.5
+
-- 
2.5.5
