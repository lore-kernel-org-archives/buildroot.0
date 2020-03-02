From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Mar 2020 16:04:50 +0100
Subject: [Buildroot] [PATCH/next v1 3/3] package/libevdev: convert to meson
In-Reply-To: <20200302150450.3546-1-ps.report@gmx.net>
References: <20200302150450.3546-1-ps.report@gmx.net>
Message-ID: <20200302150450.3546-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- drop legacy patch 0001-configure-add-disable-runtime-tests-option.patch
  and use -Dtests=disabled instead

- drop host-pkgconf dependency as pkgconf is only used in case tests
  are enabled to find the check package (checked via meson output -
  no 'Found pkg-config' - and via strace)

- update host-python dependecy to host-python3 as the script
  libevdev/make-event-names.py which is used to generate the
  header file event-names.h is updated to python3:
  '#!/usr/bin/env python3'
  This made no difference with autotools build as the script
  was called with '$(PYTHON) libevdev/make-event-names.py'.

- add patch to fix tools compile with older toolchains adding
  the local include path (only the meson build is affected)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ure-add-disable-runtime-tests-option.patch | 44 -------------------
 package/libevdev/libevdev.mk                  | 13 +++---
 2 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 package/libevdev/0001-configure-add-disable-runtime-tests-option.patch

diff --git a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch b/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
deleted file mode 100644
index 745903178c..0000000000
--- a/package/libevdev/0001-configure-add-disable-runtime-tests-option.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 93f6bc2b97a2b76a5e725d63d4b6c2dfe7baf63b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 11 Oct 2015 13:33:19 +0200
-Subject: [PATCH] configure: add '--disable-runtime-tests' option
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Rebased libevdev-1.6.0]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5161d93..2b3bb26 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,7 +76,14 @@ else
- 	AC_MSG_WARN([check not found - skipping building unit tests])
- fi
- AM_CONDITIONAL(HAVE_VALGRIND, [test "x$VALGRIND" != "x"])
--AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x$HAVE_CHECK" = "xyes"])
-+
-+AC_ARG_ENABLE([runtime-tests],
-+	AS_HELP_STRING([--disable-runtime-tests], [Disable runtime tests]))
-+AS_IF([test "x$enable_runtime_tests" != "xno"],
-+	[enable_runtime_tests=yes],
-+	[enable_runtime_tests=no])
-+
-+AM_CONDITIONAL(ENABLE_RUNTIME_TESTS, [test "x${enable_runtime_tests}x$HAVE_CHECK" = "xyesxyes"])
- AM_CONDITIONAL(ENABLE_STATIC_LINK_TEST, [test "x$enable_static" = "xyes"])
- 
- with_cflags=""
-@@ -162,7 +169,7 @@ AC_MSG_RESULT([
- 	       Libdir				${libdir}
- 
- 	       Build documentation		${have_doxygen}
--	       Enable unit-tests		${HAVE_CHECK}
-+	       Enable unit-tests		${HAVE_CHECK} (runtime-tests: ${enable_runtime_tests})
- 	       Enable profiling			${enable_gcov}
- 	       Static library symbol check	${static_symbol_leaks_test}
- 	       ])
--- 
-2.19.1
-
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 2fac47f2f8..9cd09ac2d3 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -10,14 +10,13 @@ LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
 LIBEVDEV_LICENSE_FILES = COPYING
 
-# patch touches configure.ac
-LIBEVDEV_AUTORECONF = YES
-
-# Uses PKG_CHECK_MODULES() in configure.ac
-LIBEVDEV_DEPENDENCIES = host-pkgconf host-python
+LIBEVDEV_DEPENDENCIES = host-python3
 
 LIBEVDEV_INSTALL_STAGING = YES
 
-LIBEVDEV_CONF_OPTS += --disable-runtime-tests
+LIBEVDEV_CONF_OPTS += \
+	-Dtests=disabled \
+	-Ddocumentation=disabled \
+	-Dcoverity=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.25.1
