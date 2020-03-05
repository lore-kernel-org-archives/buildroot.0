From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:09:24 +0100
Subject: [Buildroot] [git commit branch/next] package/libevdev: convert to
 meson
Message-ID: <20200305215748.600328F521@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=157974248fca21c485050fb52dd30e70cd328bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- drop legacy patch 0001-configure-add-disable-runtime-tests-option.patch
  and use -Dtests=disabled instead

- drop host-pkgconf dependency as pkgconf is only used in case tests
  are enabled to find the check package (checked via meson output -
  no 'Found pkg-config' - and via strace)

- update host-python dependency to host-python3 as the script
  libevdev/make-event-names.py which is used to generate the
  header file event-names.h is updated to python3:
  '#!/usr/bin/env python3'
  This made no difference with autotools build as the script
  was called with '$(PYTHON) libevdev/make-event-names.py'.

  We use BR2_PYTHON3_HOST_DEPENDENCY instead of depending on
  host-python3, to use any available Python 3.x interpreter on the
  build machine instead of building our own, if possible.

- add patch to fix tools compile with older toolchains adding
  the local include path (only the meson build is affected)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...onfigure-add-disable-runtime-tests-option.patch | 44 ------------------
 ...on.build-use-local-include-path-for-tools.patch | 54 ++++++++++++++++++++++
 package/libevdev/libevdev.mk                       | 13 +++---
 3 files changed, 60 insertions(+), 51 deletions(-)

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
diff --git a/package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch b/package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch
new file mode 100644
index 0000000000..aa0af75055
--- /dev/null
+++ b/package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch
@@ -0,0 +1,54 @@
+From 83eb5bbac775d46b74e7f99fbd243d53f0118b37 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 2 Mar 2020 15:43:14 +0100
+Subject: [PATCH] meson.build: use local include path for tools
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following compile failure with old toolchains and meson
+build (autotools build not affected):
+
+  ../tools/mouse-dpi-tool.c: In function ???handle_event???:
+  ../tools/mouse-dpi-tool.c:115:13: error: ???const struct input_event??? has no member named ???input_event_sec???
+     m->us = ev->input_event_sec * 1000000 + ev->input_event_usec;
+               ^
+  ../tools/mouse-dpi-tool.c:115:45: error: ???const struct input_event??? has no member named ???input_event_usec???
+     m->us = ev->input_event_sec * 1000000 + ev->input_event_usec;
+                                               ^
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 4831f8e..5500a83 100644
+--- a/meson.build
++++ b/meson.build
+@@ -102,18 +102,22 @@ install_man(manpage)
+ # tools
+ executable('libevdev-events',
+ 	   sources: ['tools/libevdev-events.c'],
++	   include_directories: [includes_include],
+ 	   dependencies: dep_libevdev,
+ 	   install: false)
+ executable('touchpad-edge-detector',
+ 	   sources: ['tools/touchpad-edge-detector.c'],
++	   include_directories: [includes_include],
+ 	   dependencies: [dep_libevdev, dep_lm],
+            install: true)
+ executable('mouse-dpi-tool',
+ 	   sources: ['tools/mouse-dpi-tool.c'],
++	   include_directories: [includes_include],
+ 	   dependencies: dep_libevdev,
+            install: true)
+ executable('libevdev-tweak-device',
+ 	   sources: ['tools/libevdev-tweak-device.c'],
++	   include_directories: [includes_include],
+ 	   dependencies: dep_libevdev,
+ 	   install: true)
+ 
+-- 
+2.25.1
+
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 2fac47f2f8..78e3146b9a 100644
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
+LIBEVDEV_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
 
 LIBEVDEV_INSTALL_STAGING = YES
 
-LIBEVDEV_CONF_OPTS += --disable-runtime-tests
+LIBEVDEV_CONF_OPTS += \
+	-Dtests=disabled \
+	-Ddocumentation=disabled \
+	-Dcoverity=false
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
