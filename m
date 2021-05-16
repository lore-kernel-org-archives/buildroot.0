From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 15:15:27 +0200
Subject: [Buildroot] [git commit branch/next] package/wayland: bump to
 version 1.19.0
Message-ID: <20210516133426.C36C581602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbde3a6c954ebf05e6a4a829823b65b90f8c06cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update wayland to version 1.19.0, which mostly includes bug fixes and is
the minimum version required by wlroots 0.13.0

Patch "0001-build-add-option-to-disable-tests.patch" is updated as an
actual backport from upstream. Since upstream has migrated to meson, and
we've already switched too, drop the autostuff hunks.

Patch "0002-meson-do-not-check-for-c.patch" is replaced by a newer one,
"0002-meson-only-require-cpp-for-tests.patch" which was accepted by
upstream as an improved version of it.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998 at free.fr:
  - do actual backports of upstream patches now they've been merged
  - consequently, drop the legacy autostuff hunks from first patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-build-add-option-to-disable-tests.patch   | 74 ++++------------------
 .../wayland/0002-meson-do-not-check-for-c.patch    | 29 ---------
 .../0002-meson-only-require-cpp-for-tests.patch    | 59 +++++++++++++++++
 package/wayland/wayland.hash                       |  8 +--
 package/wayland/wayland.mk                         |  2 +-
 5 files changed, 77 insertions(+), 95 deletions(-)

diff --git a/package/wayland/0001-build-add-option-to-disable-tests.patch b/package/wayland/0001-build-add-option-to-disable-tests.patch
index 6ab695e909..5ecf100d64 100644
--- a/package/wayland/0001-build-add-option-to-disable-tests.patch
+++ b/package/wayland/0001-build-add-option-to-disable-tests.patch
@@ -1,4 +1,4 @@
-From 283085496e06b5543771abe5cc746ff0b77cdd23 Mon Sep 17 00:00:00 2001
+From 88f1605a826ca0c2ff02be6f4cf9ecabf68e8341 Mon Sep 17 00:00:00 2001
 From: James Hilliard <james.hilliard1@gmail.com>
 Date: Tue, 3 Mar 2020 15:27:51 -0700
 Subject: [PATCH] build: add option to disable tests
@@ -15,65 +15,19 @@ Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 [Upstream status:
 https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/66]
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
- Makefile.am       | 2 ++
- configure.ac      | 9 +++++++++
  meson.build       | 4 +++-
  meson_options.txt | 4 ++++
- 4 files changed, 18 insertions(+), 1 deletion(-)
+ 2 files changed, 7 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index cc87392..d5d43e3 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -162,6 +162,7 @@ pkgconfig_DATA += egl/wayland-egl.pc
- include_HEADERS += egl/wayland-egl-backend.h
- pkgconfig_DATA += egl/wayland-egl-backend.pc
- 
-+if ENABLE_TESTS
- built_test_programs =				\
- 	array-test				\
- 	client-test				\
-@@ -295,6 +296,7 @@ os_wrappers_test_LDADD = libtest-runner.la
- 
- exec_fd_leak_checker_SOURCES = tests/exec-fd-leak-checker.c
- exec_fd_leak_checker_LDADD = libtest-helpers.la
-+endif
- 
- EXTRA_DIST += tests/scanner-test.sh			\
- 	protocol/tests.xml				\
-diff --git a/configure.ac b/configure.ac
-index dda5e48..99b7c96 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,13 @@ AC_ARG_ENABLE([libraries],
- 	      [],
- 	      [enable_libraries=yes])
- 
-+AC_ARG_ENABLE([tests],
-+	      [AC_HELP_STRING([--disable-tests],
-+			      [Disable compilation of test programs])],
-+	      [],
-+	      [enable_tests=yes])
-+
-+
- AC_ARG_WITH([host-scanner],
-               [AC_HELP_STRING([--with-host-scanner],
-                               [Use installed wayland-scanner from host PATH during build])],
-@@ -99,6 +106,8 @@ AM_CONDITIONAL(USE_HOST_SCANNER, test "x$with_host_scanner" = xyes)
- 
- AM_CONDITIONAL(ENABLE_LIBRARIES, test "x$enable_libraries" = xyes)
- 
-+AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = xyes)
-+
- AC_ARG_WITH(icondir, [  --with-icondir=<dir>    Look for cursor icons here],
- 		     [  ICONDIR=$withval],
- 		     [  ICONDIR=${datadir}/icons])
 diff --git a/meson.build b/meson.build
-index 5632f4e..b37bb7a 100644
+index cdb66bc..714a86d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -83,7 +83,9 @@ subdir('src')
+@@ -84,7 +84,9 @@ subdir('src')
  if get_option('libraries')
  	subdir('cursor')
  	subdir('egl')
@@ -81,15 +35,15 @@ index 5632f4e..b37bb7a 100644
 +	if get_option('tests')
 +		subdir('tests')
 +	endif
- endif
- 
- if get_option('documentation')
+ 	if get_option('documentation')
+ 		subdir('doc')
+ 	endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 76314f7..ab4be92 100644
+index de588d1..4433fa0 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -2,6 +2,10 @@ option('libraries',
-   description: 'Compile Wayland libraries',
+@@ -6,6 +6,10 @@ option('scanner',
+   description: 'Compile wayland-scanner binary',
    type: 'boolean',
    value: 'true')
 +option('tests',
@@ -100,5 +54,5 @@ index 76314f7..ab4be92 100644
    description: 'Build the documentation (requires Doxygen, dot, xmlto, xsltproc)',
    type: 'boolean',
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/wayland/0002-meson-do-not-check-for-c.patch b/package/wayland/0002-meson-do-not-check-for-c.patch
deleted file mode 100644
index c5819bf477..0000000000
--- a/package/wayland/0002-meson-do-not-check-for-c.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1df9b73db6541cbc483c6ee1b21dbe0cb6e5cbfa Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Wed, 29 Jul 2020 08:20:41 +0200
-Subject: [PATCH] meson: do not check for c++
-
-Wayland does not need c++, fixes building with toolchains lacking c++.
-
-Backported from upstream PR:
-https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/88
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b67b101..e47a52d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project(
--	'wayland', 'c', 'cpp',
-+	'wayland', 'c',
- 	version: '1.18.0',
- 	license: 'MIT',
- 	meson_version: '>= 0.47.0',
--- 
-2.27.0
-
diff --git a/package/wayland/0002-meson-only-require-cpp-for-tests.patch b/package/wayland/0002-meson-only-require-cpp-for-tests.patch
new file mode 100644
index 0000000000..84d0e4cf6f
--- /dev/null
+++ b/package/wayland/0002-meson-only-require-cpp-for-tests.patch
@@ -0,0 +1,59 @@
+From 4c2105312379b62dc84f6eaaf26e2ab293d51b92 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 16 Apr 2021 02:32:38 -0600
+Subject: [PATCH] meson: only require cpp for tests
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/130]
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ meson.build       |  2 +-
+ tests/meson.build | 16 +++++++++-------
+ 2 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 12b4641..cdb66bc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,5 +1,5 @@
+ project(
+-	'wayland', 'c', 'cpp',
++	'wayland', 'c',
+ 	version: '1.19.0',
+ 	license: 'MIT',
+ 	meson_version: '>= 0.52.1',
+diff --git a/tests/meson.build b/tests/meson.build
+index a32ac50..2e11af4 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -64,15 +64,17 @@ executable(
+ 	dependencies: test_runner_dep
+ )
+ 
+-test(
+-	'cpp-compile-test',
+-	executable(
++if add_languages('cpp')
++	test(
+ 		'cpp-compile-test',
+-		'cpp-compile-test.cpp',
+-		wayland_server_protocol_h,
+-		include_directories: src_inc
++		executable(
++			'cpp-compile-test',
++			'cpp-compile-test.cpp',
++			wayland_server_protocol_h,
++			include_directories: src_inc
++		)
+ 	)
+-)
++endif
+ 
+ sed_path = find_program('sed').path()
+ 
+-- 
+2.31.1
+
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index abd8bcdf29..e9dcb63a90 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,8 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041207.html
-md5  23317697b6e3ff2e1ac8c5ba3ed57b65  wayland-1.18.0.tar.xz
-sha1  33e5292b32a115e829458ea627201ed1e4ad4f45  wayland-1.18.0.tar.xz
-sha256  4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d  wayland-1.18.0.tar.xz
-sha512  e30199e30c2bbd361ee695b4f3f7a4e264f10ed8f46f2c90762b5739fc578ae757dc39aa0258d8fbf0ed418553470bccd4b2730ed9705481cfccdab5de96a8fc  wayland-1.18.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-January/041692.html
+sha256  baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15  wayland-1.19.0.tar.xz
+sha512  d8a86f5e23e4a88e7c84b82fdb51eb350419086afe462ecb2f4d5c3ba9290ede310cbbcffd60215219ddccf5bad4adec21a5ebfbef6577200f66ac7a1b64a5ef  wayland-1.19.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 6cb4a50dbb..ecfe95d68a 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.18.0
+WAYLAND_VERSION = 1.19.0
 WAYLAND_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
