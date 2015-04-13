From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Apr 2015 22:36:21 +0200
Subject: [Buildroot] [PATCH v1] libevdev: bump version to 1.4.1
Message-ID: <1428957381-20716-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for details.

Additional remove upstream committed patch (and autoreconf variable
from makefile).

[1] http://lists.freedesktop.org/archives/input-tools/2015-April/001166.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...t-static-link-in-case-of-shared-only-buil.patch | 48 ----------------------
 package/libevdev/libevdev.hash                     |  4 +-
 package/libevdev/libevdev.mk                       |  5 +--
 3 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100644 package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch

diff --git a/package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch b/package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch
deleted file mode 100644
index c1c2044..0000000
--- a/package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 8cef0e4a9e0412db6fa37f5fae30efa57e94136f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 9 Mar 2015 22:01:52 +0100
-Subject: [PATCH] Disable test-static-link in case of shared only build.
-
-Fixes the following buildroot compile failure:
-
-libtool: link: [..]/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -o test-static-link test_static_link-test-link.o  ../libevdev/.libs/libevdev.so -Wl,-rpath -Wl,[...]/build/libevdev-1.4/libevdev/.libs
-[...]/arm-buildroot-linux-uclibcgnueabi/bin/ld: attempted static link of dynamic object `../libevdev/.libs/libevdev.so'
-collect2: error: ld returned 1 exit status
-Makefile:719: recipe for target 'test-static-link' failed
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac     | 1 +
- test/Makefile.am | 7 ++++++-
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c25b36f..be2e157 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -75,6 +75,7 @@ else
- fi
- AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
- AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x$HAVE_CHECK" = "xyes"])
-+AM_CONDITIONAL(ENABLE_STATIC_LINK_TEST, [test "x$enable_static" = "xyes"])
- 
- with_cflags=""
- if test "x$GCC" = "xyes"; then
-diff --git a/test/Makefile.am b/test/Makefile.am
-index ab4752e..1fe1e7e 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -1,4 +1,9 @@
--build_tests = test-compile-pedantic test-link test-static-link
-+build_tests = test-compile-pedantic test-link
-+
-+if ENABLE_STATIC_LINK_TEST
-+build_tests += test-static-link
-+endif
-+
- noinst_PROGRAMS = $(build_tests)
- 
- AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/include -I$(top_builddir)/libevdev
--- 
-2.1.4
-
diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 1708fb0..868a245 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-March/001151.html
-sha256 3223378a5c2b4fea51a1601b0404700a6ddc1e2150eb9d5f62f001ffe21dfa06 libevdev-1.4.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-April/001166.html
+sha256 5179d3c9a71dd764b4ab9df21edcdb5b61832cbc48ad90b75a52ac79cf8fae85 libevdev-1.4.1.tar.xz
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index cac3c06..eb26517 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.4
+LIBEVDEV_VERSION = 1.4.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
@@ -15,7 +15,4 @@ LIBEVDEV_DEPENDENCIES = host-pkgconf
 
 LIBEVDEV_INSTALL_STAGING = YES
 
-# patched configure.ac
-LIBEVDEV_AUTORECONF = YES
-
 $(eval $(autotools-package))
-- 
2.1.4
