From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 11 Oct 2015 23:24:43 +0200
Subject: [Buildroot] [PATCH v1 2/2] libevdev: disable runtime tests
In-Reply-To: <1444598683-12269-1-git-send-email-ps.report@gmx.net>
References: <1444598683-12269-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444598683-12269-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new configure option '--disable-runtime-tests' and use it do
disable runtime tests which fail to compile on some uclibc
configurations.

Fixes [1], [2]:
  test-libevdev-init.c: In function 'test_set_clock_id':
  test-libevdev-init.c:493: error: 'CLOCK_MONOTONIC_RAW' undeclared (first use in this function)

and compile failure for !BR2_USE_MMU configuration:
  test-main.c:(.text+0x8): undefined reference to `_fork'

[1] http://autobuild.buildroot.net/results/0d0/0d0a987471ce8e9f76fc96e0ae8f0bfeadb45028/
[2] http://autobuild.buildroot.net/results/939/9392033f1b8d2c8e4e8791c90918dabbe28a7067/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...onfigure-add-disable-runtime-tests-option.patch | 44 ++++++++++++++++++++++
 package/libevdev/libevdev.mk                       |  5 +++
 2 files changed, 49 insertions(+)
 create mode 100644 package/libevdev/0001-configure-add-disable-runtime-tests-option.patch

diff --git a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
new file mode 100644
index 0000000..f4a8100
--- /dev/null
+++ b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
@@ -0,0 +1,44 @@
+From 0e7e71ab1b5b457b5c566cc3b0beeff795f183d1 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 11 Oct 2015 13:33:19 +0200
+Subject: [PATCH] configure: add '--disable-runtime-tests' option
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 54a2510..f285e93 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -74,7 +74,16 @@ else
+ 	AC_MSG_WARN([check not found - skipping building unit tests])
+ fi
+ AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
+-AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x$HAVE_CHECK" = "xyes"])
++AC_ARG_ENABLE([runtime-tests],
++	AS_HELP_STRING([--disable-runtime-tests], [Disable runtime tests]))
++AS_IF([test "x$enable_runtime_tests" != "xno"],
++	[enable_runtime_tests=yes],
++	[enable_runtime_tests=no])
++
++AC_MSG_RESULT([
++	       BLA				${enable_runtime_tests}
++	])
++AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x${enable_runtime_tests}x$HAVE_CHECK" = "xyesxyes"])
+ AM_CONDITIONAL(ENABLE_STATIC_LINK_TEST, [test "x$enable_static" = "xyes"])
+ 
+ with_cflags=""
+@@ -159,7 +168,7 @@ AC_MSG_RESULT([
+ 	       Libdir				${libdir}
+ 
+ 	       Build documentation		${have_doxygen}
+-	       Enable unit-tests		${HAVE_CHECK}
++	       Enable unit-tests		${HAVE_CHECK} (runtime-tests: ${enable_runtime_tests})
+ 	       Enable profiling			${enable_gcov}
+ 	       Static library symbol check	${static_symbol_leaks_test}
+ 	       ])
+-- 
+2.1.4
+
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index d9a2be6..97d8a92 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -10,9 +10,14 @@ LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
 LIBEVDEV_LICENSE_FILES = COPYING
 
+# patch touches configure.ac
+LIBEVDEV_AUTORECONF = YES
+
 # Uses PKG_CHECK_MODULES() in configure.ac
 LIBEVDEV_DEPENDENCIES = host-pkgconf
 
 LIBEVDEV_INSTALL_STAGING = YES
 
+LIBEVDEV_CONF_OPTS += --disable-runtime-tests
+
 $(eval $(autotools-package))
-- 
2.1.4
