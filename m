From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  3 Mar 2020 16:09:43 -0700
Subject: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.18.0
Message-ID: <20200303230943.24334-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebase/update disable tests patch.

Replace autotools build system with meson as autotools is deprecated
and will be removed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...01-build-add-option-to-disable-tests.patch | 104 ++++++++++++++++++
 ...onfigure-add-option-to-disable-tests.patch |  73 ------------
 package/wayland/wayland.hash                  |  12 +-
 package/wayland/wayland.mk                    |  16 +--
 4 files changed, 118 insertions(+), 87 deletions(-)
 create mode 100644 package/wayland/0001-build-add-option-to-disable-tests.patch
 delete mode 100644 package/wayland/0001-configure-add-option-to-disable-tests.patch

diff --git a/package/wayland/0001-build-add-option-to-disable-tests.patch b/package/wayland/0001-build-add-option-to-disable-tests.patch
new file mode 100644
index 0000000000..6ab695e909
--- /dev/null
+++ b/package/wayland/0001-build-add-option-to-disable-tests.patch
@@ -0,0 +1,104 @@
+From 283085496e06b5543771abe5cc746ff0b77cdd23 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 3 Mar 2020 15:27:51 -0700
+Subject: [PATCH] build: add option to disable tests
+
+When building for a product, tests are not needed.
+
+Besides, one test requires a C++ compiler, which is not always
+available.
+
+So, add an option to configure to disable building tests altogether.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/66]
+---
+ Makefile.am       | 2 ++
+ configure.ac      | 9 +++++++++
+ meson.build       | 4 +++-
+ meson_options.txt | 4 ++++
+ 4 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index cc87392..d5d43e3 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -162,6 +162,7 @@ pkgconfig_DATA += egl/wayland-egl.pc
+ include_HEADERS += egl/wayland-egl-backend.h
+ pkgconfig_DATA += egl/wayland-egl-backend.pc
+ 
++if ENABLE_TESTS
+ built_test_programs =				\
+ 	array-test				\
+ 	client-test				\
+@@ -295,6 +296,7 @@ os_wrappers_test_LDADD = libtest-runner.la
+ 
+ exec_fd_leak_checker_SOURCES = tests/exec-fd-leak-checker.c
+ exec_fd_leak_checker_LDADD = libtest-helpers.la
++endif
+ 
+ EXTRA_DIST += tests/scanner-test.sh			\
+ 	protocol/tests.xml				\
+diff --git a/configure.ac b/configure.ac
+index dda5e48..99b7c96 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,6 +77,13 @@ AC_ARG_ENABLE([libraries],
+ 	      [],
+ 	      [enable_libraries=yes])
+ 
++AC_ARG_ENABLE([tests],
++	      [AC_HELP_STRING([--disable-tests],
++			      [Disable compilation of test programs])],
++	      [],
++	      [enable_tests=yes])
++
++
+ AC_ARG_WITH([host-scanner],
+               [AC_HELP_STRING([--with-host-scanner],
+                               [Use installed wayland-scanner from host PATH during build])],
+@@ -99,6 +106,8 @@ AM_CONDITIONAL(USE_HOST_SCANNER, test "x$with_host_scanner" = xyes)
+ 
+ AM_CONDITIONAL(ENABLE_LIBRARIES, test "x$enable_libraries" = xyes)
+ 
++AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = xyes)
++
+ AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
+ 		     [  ICONDIR=$withval],
+ 		     [  ICONDIR=${datadir}/icons])
+diff --git a/meson.build b/meson.build
+index 5632f4e..b37bb7a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -83,7 +83,9 @@ subdir('src')
+ if get_option('libraries')
+ 	subdir('cursor')
+ 	subdir('egl')
+-	subdir('tests')
++	if get_option('tests')
++		subdir('tests')
++	endif
+ endif
+ 
+ if get_option('documentation')
+diff --git a/meson_options.txt b/meson_options.txt
+index 76314f7..ab4be92 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -2,6 +2,10 @@ option('libraries',
+   description: 'Compile Wayland libraries',
+   type: 'boolean',
+   value: 'true')
++option('tests',
++  description: 'Compile Wayland tests',
++  type: 'boolean',
++  value: 'true')
+ option('documentation',
+   description: 'Build the documentation (requires Doxygen, dot, xmlto, xsltproc)',
+   type: 'boolean',
+-- 
+2.20.1
+
diff --git a/package/wayland/0001-configure-add-option-to-disable-tests.patch b/package/wayland/0001-configure-add-option-to-disable-tests.patch
deleted file mode 100644
index fdfbeb4bd1..0000000000
--- a/package/wayland/0001-configure-add-option-to-disable-tests.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 55ae8e1103f4697bfa01a84301a6560b89de5248 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Mon, 16 Apr 2018 19:52:34 +0300
-Subject: [PATCH] configure: add option to disable tests
-
-When building for a product, tests are not needed.
-
-Besides, one test requires a C++ compiler, which is not always
-available.
-
-So, add an option to configure to disable building tests altogether.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Reviewed-by: Eric Engestrom <eric.engestrom@imgtec.com>
-Tested-by: Eric Engestrom <eric.engestrom@imgtec.com>
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-
----
-Changes v1 -> v2:
-  - fix typo in yes-check  (Eric)
----
- Makefile.am  | 2 ++
- configure.ac | 8 ++++++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/Makefile.am b/Makefile.am
-index 741db5ebf9d9..4862d42959f0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -160,6 +160,7 @@ pkgconfig_DATA += egl/wayland-egl.pc
- include_HEADERS += egl/wayland-egl-backend.h
- pkgconfig_DATA += egl/wayland-egl-backend.pc
- 
-+if ENABLE_TESTS
- built_test_programs =				\
- 	array-test				\
- 	client-test				\
-@@ -287,6 +288,7 @@ os_wrappers_test_LDADD = libtest-runner.la
- 
- exec_fd_leak_checker_SOURCES = tests/exec-fd-leak-checker.c
- exec_fd_leak_checker_LDADD = libtest-helpers.la
-+endif
- 
- EXTRA_DIST += tests/scanner-test.sh			\
- 	protocol/tests.xml				\
-diff --git a/configure.ac b/configure.ac
-index c74ee97b24a2..5c94b7b76b06 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -89,10 +89,18 @@ AC_ARG_ENABLE([dtd-validation],
- 	      [],
- 	      [enable_dtd_validation=yes])
- 
-+AC_ARG_ENABLE([tests],
-+	      [AC_HELP_STRING([--disable-tests],
-+			      [Disable compilation of test programs])],
-+	      [],
-+	      [enable_tests=yes])
-+
- AM_CONDITIONAL(USE_HOST_SCANNER, test "x$with_host_scanner" = xyes)
- 
- AM_CONDITIONAL(ENABLE_LIBRARIES, test "x$enable_libraries" = xyes)
- 
-+AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = xyes)
-+
- AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
- 		     [  ICONDIR=$withval],
- 		     [  ICONDIR=${datadir}/icons])
--- 
-2.14.3
-
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 8774101884..abd8bcdf29 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-March/040335.html
-md5  d91f970aea11fd549eae023d06f91af3  wayland-1.17.0.tar.xz
-sha1 4d9e08a7a4a07fa37a25d7aa3ef83f08edec0600  wayland-1.17.0.tar.xz
-sha256 72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4  wayland-1.17.0.tar.xz
-sha512 c5051aab5ff078b368c196ecfedb33ccd961265bb914845d7ed81de361bb86ae18299575baa6c4eceb0d82cf8b495e8293f31b51d1cbc05d84af0a199ab3f946  wayland-1.17.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041207.html
+md5  23317697b6e3ff2e1ac8c5ba3ed57b65  wayland-1.18.0.tar.xz
+sha1  33e5292b32a115e829458ea627201ed1e4ad4f45  wayland-1.18.0.tar.xz
+sha256  4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d  wayland-1.18.0.tar.xz
+sha512  e30199e30c2bbd361ee695b4f3f7a4e264f10ed8f46f2c90762b5739fc578ae757dc39aa0258d8fbf0ed418553470bccd4b2730ed9705481cfccdab5de96a8fc  wayland-1.18.0.tar.xz
 
 # Locally calculated
-sha256 6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
+sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index e325c6d752..6de92f63d9 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.17.0
+WAYLAND_VERSION = 1.18.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
@@ -13,12 +13,12 @@ WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
 HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
 
-# 0002-configure-add-option-to-disable-tests.patch
-WAYLAND_AUTORECONF = YES
+WAYLAND_CONF_OPTS = \
+	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
+	-Dtests=false \
+	-Ddocumentation=false
 
-# wayland-scanner is only needed for building, not on the target
-WAYLAND_CONF_OPTS = --with-host-scanner --disable-tests
-HOST_WAYLAND_CONF_OPTS = --disable-tests
+HOST_WAYLAND_CONF_OPTS = -Dtests=false -Ddocumentation=false
 
 # Remove the DTD from the target, it's not needed at runtime
 define WAYLAND_TARGET_CLEANUP
@@ -26,5 +26,5 @@ define WAYLAND_TARGET_CLEANUP
 endef
 WAYLAND_POST_INSTALL_TARGET_HOOKS += WAYLAND_TARGET_CLEANUP
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.20.1
