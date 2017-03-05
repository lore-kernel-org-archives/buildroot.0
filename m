From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 16:34:21 +0100
Subject: [Buildroot] [git commit] package/wayland: don't build tests
Message-ID: <20170305153506.02F138012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afe4b17bd8fe9201b0f15eb412c78de1a4bbd2d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wayland is entirely written in C, except for a single test that is
written in C++.

Since we are not interested in running the tests on the target, add an
option to configure to disable tests altogether.

Fixes:
    http://autobuild.buildroot.org/results/291/291e0f1ea18004190ae5acd9bec147cacc3e4bda/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...002-configure-add-option-to-disable-tests.patch | 68 ++++++++++++++++++++++
 package/wayland/wayland.mk                         |  6 +-
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/package/wayland/0002-configure-add-option-to-disable-tests.patch b/package/wayland/0002-configure-add-option-to-disable-tests.patch
new file mode 100644
index 0000000..8c67d9a
--- /dev/null
+++ b/package/wayland/0002-configure-add-option-to-disable-tests.patch
@@ -0,0 +1,68 @@
+From 33b025e04bf3fa94b74ea3325b3fd7c3f546bcb1 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 5 Mar 2017 10:06:02 +0100
+Subject: [PATCH] configure: add option to disable tests
+
+When building for a product, tests are not needed.
+
+Besides, one test requires a C++ compiler, which is not always
+available.
+
+So, add an option to configure to disable building tests altogether.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Patch submitted upstream:
+https://lists.freedesktop.org/archives/wayland-devel/2017-March/033359.html
+---
+ Makefile.am  | 3 ++-
+ configure.ac | 8 ++++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index d0c8bd3..9c2541d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -143,7 +143,7 @@ libwayland_cursor_la_CFLAGS =			\
+ 	-I$(top_srcdir)/src			\
+ 	-DICONDIR=\"$(ICONDIR)\"
+ 
+-
++if ENABLE_TESTS
+ built_test_programs =				\
+ 	array-test				\
+ 	client-test				\
+@@ -258,6 +258,7 @@ os_wrappers_test_LDADD = libtest-runner.la
+ 
+ exec_fd_leak_checker_SOURCES = tests/exec-fd-leak-checker.c
+ exec_fd_leak_checker_LDADD = libtest-runner.la
++endif
+ 
+ EXTRA_DIST += tests/scanner-test.sh			\
+ 	tests/data/example.xml				\
+diff --git a/configure.ac b/configure.ac
+index b583bef..96a5575 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -87,10 +87,18 @@ AC_ARG_ENABLE([dtd-validation],
+ 	      [],
+ 	      [enable_dtd_validation=yes])
+ 
++AC_ARG_ENABLE([tests],
++	      [AC_HELP_STRING([--disable-tests],
++			      [Disable compilation of test programs])],
++	      [],
++	      [enable_tests=yes])
++
+ AM_CONDITIONAL(USE_HOST_SCANNER, test "x$with_host_scanner" = xyes)
+ 
+ AM_CONDITIONAL(ENABLE_LIBRARIES, test "x$enable_libraries" = xyes)
+ 
++AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = "yes")
++
+ AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
+ 		     [  ICONDIR=$withval],
+ 		     [  ICONDIR=${datadir}/icons])
+-- 
+2.7.4
+
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 11fbce3..bd1030e 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -13,8 +13,12 @@ WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
 HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
 
+# 0002-configure-add-option-to-disable-tests.patch
+WAYLAND_AUTORECONF = YES
+
 # wayland-scanner is only needed for building, not on the target
-WAYLAND_CONF_OPTS = --with-host-scanner
+WAYLAND_CONF_OPTS = --with-host-scanner --disable-tests
+HOST_WAYLAND_CONF_OPTS = --disable-tests
 
 # Remove the DTD from the target, it's not needed at runtime
 define WAYLAND_TARGET_CLEANUP
