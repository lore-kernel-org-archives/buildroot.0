From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Mar 2015 23:04:37 +0100
Subject: [Buildroot] [git commit] libevdev: fix shared only build
Message-ID: <20150309220857.ED8CC7FDE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53ac9230bc72b143c804423db5ccfe7125d03e11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Do not build test-static-link in case of shared only build,
fixes the following compile failure:

libtool: link: [..]/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -o test-static-link test_static_link-test-link.o  ../libevdev/.libs/libevdev.so -Wl,-rpath -Wl,[...]/build/libevdev-1.4/libevdev/.libs
[...]/arm-buildroot-linux-uclibcgnueabi/bin/ld: attempted static link of dynamic object `../libevdev/.libs/libevdev.so'
collect2: error: ld returned 1 exit status
Makefile:719: recipe for target 'test-static-link' failed

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-static-link-in-case-of-shared-only-buil.patch |   48 ++++++++++++++++++++
 package/libevdev/libevdev.mk                       |    3 +
 2 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch b/package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch
new file mode 100644
index 0000000..c1c2044
--- /dev/null
+++ b/package/libevdev/0001-Disable-test-static-link-in-case-of-shared-only-buil.patch
@@ -0,0 +1,48 @@
+From 8cef0e4a9e0412db6fa37f5fae30efa57e94136f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 9 Mar 2015 22:01:52 +0100
+Subject: [PATCH] Disable test-static-link in case of shared only build.
+
+Fixes the following buildroot compile failure:
+
+libtool: link: [..]/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -o test-static-link test_static_link-test-link.o  ../libevdev/.libs/libevdev.so -Wl,-rpath -Wl,[...]/build/libevdev-1.4/libevdev/.libs
+[...]/arm-buildroot-linux-uclibcgnueabi/bin/ld: attempted static link of dynamic object `../libevdev/.libs/libevdev.so'
+collect2: error: ld returned 1 exit status
+Makefile:719: recipe for target 'test-static-link' failed
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac     | 1 +
+ test/Makefile.am | 7 ++++++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c25b36f..be2e157 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,6 +75,7 @@ else
+ fi
+ AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
+ AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x$HAVE_CHECK" = "xyes"])
++AM_CONDITIONAL(ENABLE_STATIC_LINK_TEST, [test "x$enable_static" = "xyes"])
+ 
+ with_cflags=""
+ if test "x$GCC" = "xyes"; then
+diff --git a/test/Makefile.am b/test/Makefile.am
+index ab4752e..1fe1e7e 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -1,4 +1,9 @@
+-build_tests = test-compile-pedantic test-link test-static-link
++build_tests = test-compile-pedantic test-link
++
++if ENABLE_STATIC_LINK_TEST
++build_tests += test-static-link
++endif
++
+ noinst_PROGRAMS = $(build_tests)
+ 
+ AM_CPPFLAGS = -I$(top_srcdir) -I$(top_srcdir)/include -I$(top_builddir)/libevdev
+-- 
+2.1.4
+
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 52b2ac3..c4f0cbd 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -15,4 +15,7 @@ LIBEVDEV_DEPENDENCIES = host-pkgconf
 
 LIBEVDEV_INSTALL_STAGING = YES
 
+# patched configure.ac
+LIBEVDEV_AUTORECONF = YES
+
 $(eval $(autotools-package))
