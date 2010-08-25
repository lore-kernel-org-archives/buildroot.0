From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Aug 2010 17:30:38 +0200
Subject: [Buildroot] [git commit master 1/1] libglib2: add patch to rework
	clock_gettime() test
Message-ID: <20100825153144.9436F89016@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0ec4298153bd93f8d7efbd1890896fbac5046a7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test for clock_gettime() in configure.in doesn't work properly
when a previous package has loaded the shared configuration cache with
informations about the availability of clock_gettime. A package such
as ctorrent does so, which means that compiling ctorrent *then*
libglib2 currently fails.

According to people on the Autoconf mailing list, the libglib2 test is
likely the one that needs to be fixed. The problem is that the
AC_CHECK_FUNCS() test assumes that if it finds clock_gettime() it
means that there's no need to add any -lrt flag to the
build. Unfortunately, due to the shared configuration cache, this test
is already done with -lrt, so the test succeeds, and libglib2 does not
know that it needs to add -lrt to G_THREAD_LIBS and
G_THREAD_LIBS_FOR_GTHREAD.

So instead, we remplace the test with an AC_SEARCH_LIBS() test,
followed by a test on the result of this AC_SEARCH_LIBS() test to add
the necessary -lrt to G_THREAD_LIBS and
G_THREAD_LIBS_FOR_GTHREAD. Therefore, even if the result for the
AC_SEARCH_LIBS() test is cached due to the prior execution ctorrent
./configure script, libglib2 ./configure will properly add -lrt to the
appropriate variables.

Obviously, as this patch modifies the configure.in file, we enable the
autoreconf step for the libglib2 package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libglib2-fix-clock-gettime-check.patch         |   51 ++++++++++++++++++++
 package/libglib2/libglib2.mk                       |    2 +-
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 package/libglib2/libglib2-fix-clock-gettime-check.patch

diff --git a/package/libglib2/libglib2-fix-clock-gettime-check.patch b/package/libglib2/libglib2-fix-clock-gettime-check.patch
new file mode 100644
index 0000000..da2e485
--- /dev/null
+++ b/package/libglib2/libglib2-fix-clock-gettime-check.patch
@@ -0,0 +1,51 @@
+Rework clock_gettime() test
+
+The test for clock_gettime() in configure.in doesn't work properly
+when a previous package has loaded the shared configuration cache with
+informations about the availability of clock_gettime. A package such
+as ctorrent does so, which means that compiling ctorrent *then*
+libglib2 currently fails.
+
+According to people on the Autoconf mailing list, the libglib2 test is
+likely the one that needs to be fixed. The problem is that the
+AC_CHECK_FUNCS() test assumes that if it finds clock_gettime() it
+means that there's no need to add any -lrt flag to the
+build. Unfortunately, due to the shared configuration cache, this test
+is already done with -lrt, so the test succeeds, and libglib2 does not
+know that it needs to add -lrt to G_THREAD_LIBS and
+G_THREAD_LIBS_FOR_GTHREAD.
+
+So instead, we remplace the test with an AC_SEARCH_LIBS() test,
+followed by a test on the result of this AC_SEARCH_LIBS() test to add
+the necessary -lrt to G_THREAD_LIBS and
+G_THREAD_LIBS_FOR_GTHREAD. Therefore, even if the result for the
+AC_SEARCH_LIBS() test is cached due to the prior execution ctorrent
+./configure script, libglib2 ./configure will properly add -lrt to the
+appropriate variables.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: glib-2.24.1/configure.in
+===================================================================
+--- glib-2.24.1.orig/configure.in	2010-08-11 19:29:20.530916023 +0200
++++ glib-2.24.1/configure.in	2010-08-11 19:46:41.308866269 +0200
+@@ -2392,13 +2392,14 @@
+ 	LIBS="$glib_save_LIBS"
+ fi
+ 
+-AC_CHECK_FUNCS(clock_gettime, [], [
+-  AC_CHECK_LIB(rt, clock_gettime, [
+-    AC_DEFINE(HAVE_CLOCK_GETTIME, 1)
++AC_SEARCH_LIBS([clock_gettime], [rt], [
++    AC_DEFINE(HAVE_CLOCK_GETTIME, 1,[Have clock_gettime])
++])
++
++if test "$ac_cv_search_clock_gettime" = "-lrt"; then
+     G_THREAD_LIBS="$G_THREAD_LIBS -lrt"
+     G_THREAD_LIBS_FOR_GTHREAD="$G_THREAD_LIBS_FOR_GTHREAD -lrt"
+-  ])
+-])
++fi
+ 
+ AC_CACHE_CHECK(for monotonic clocks,
+     glib_cv_monotonic_clock,AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 8dc1fcb..61e8c1c 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -9,7 +9,7 @@ LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 
-LIBGLIB2_AUTORECONF = NO
+LIBGLIB2_AUTORECONF = YES
 LIBGLIB2_LIBTOOL_PATCH = NO
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_TARGET = YES
-- 
1.7.1
