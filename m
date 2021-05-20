From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 14:29:25 +0200
Subject: [Buildroot] [git commit branch/next] package/libglib2: bump to
 version 2.68.1
Message-ID: <20210520122947.6A59188D19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c72524fb1b1c6b7dd1b1f511eea0fdf5a39dd3a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Other changes:
  - Drop 0002-allow-explicit-disabling-of-tests.patch as this patch has been
    upstreamed and the option is now simply "tests."
  - Add -Dglib_debug=disabled and -Dlibelf=disabled as defaults to both
    HOST_LIBGLIB2_CONF_OPTS and LIBGLIB2_CONF_OPTS
  - Refactor existing patches to apply to 2.68.1

Tested with test-pkg -p libglib2 -a.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-fix-compile-time-atomic-detection.patch   | 12 ++++---
 .../0002-allow-explicit-disabling-of-tests.patch   | 37 ----------------------
 ...ent.patch => 0002-remove-cpp-requirement.patch} |  6 ++--
 ...-format-nonliteral-to-compiler-arguments.patch} |  7 ++--
 package/libglib2/libglib2.hash                     |  4 +--
 package/libglib2/libglib2.mk                       | 12 ++++---
 6 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
index d84a1ab460..aae505f8e5 100644
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -10,19 +10,21 @@ See : https://gitlab.gnome.org/GNOME/glib/issues/1063
 
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
+Refresh for 2.68.1
 ---
- glib/gthread-posix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ glib/gthread-posix.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/glib/gthread-posix.c b/glib/gthread-posix.c
 index 71a6b7b..d09d029 100644
 --- a/glib/gthread-posix.c
 +++ b/glib/gthread-posix.c
-@@ -73,7 +73,7 @@
+@@ -72,8 +72,7 @@
+ #include <sys/syscall.h>
  #endif
  
- /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
--#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && !defined(__clang__)
+-#if defined(HAVE_FUTEX) && \
+-    (defined(HAVE_STDATOMIC_H) || defined(__ATOMIC_SEQ_CST))
 +#if defined(HAVE_FUTEX) && defined(__ATOMIC_SEQ_CST) && defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4) && !defined(__clang__)
  #define USE_NATIVE_MUTEX
  #endif
diff --git a/package/libglib2/0002-allow-explicit-disabling-of-tests.patch b/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
deleted file mode 100644
index c865c04e03..0000000000
--- a/package/libglib2/0002-allow-explicit-disabling-of-tests.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From cdccbc6ec36243463613cb32d7058c26c3c51e16 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Wed, 18 Sep 2019 09:50:00 -0700
-Subject: [PATCH] allow explicit disabling of tests
-
-Upstream won't build tests when cross-compiling. However; this means still
-building the tests during a host build. Building the tests causes build
-failures on older distributions such as CentOS 6 and Debian 7 because the
-command `objcopy --add-symbol` is used when building the test
-"test_resources2," which is not available with the older version of objcopy
-provided by the distributions.
-
-Instead, remove the conditional checks which set build_tests and only check if
-installed_tests_enabled is passed.
-
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-Refresh for 2.62.2
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 99806d0..3206603 100644
---- a/meson.build
-+++ b/meson.build
-@@ -84,7 +84,7 @@ installed_tests_template = files('template.test.in')
- installed_tests_template_tap = files('template-tap.test.in')
- 
- # Don???t build the tests unless we can run them (either natively, in an exe wrapper, or by installing them for later use)
--build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper()) or installed_tests_enabled
-+build_tests = installed_tests_enabled
- 
- add_project_arguments('-D_GNU_SOURCE', language: 'c')
- 
--- 
-2.23.0
-
diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
similarity index 95%
rename from package/libglib2/0003-remove-cpp-requirement.patch
rename to package/libglib2/0002-remove-cpp-requirement.patch
index 11978e9755..35d46e161b 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.66.8',
+   version : '2.68.1',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
@@ -46,7 +46,7 @@ index 4bbf4c2..ac59f4e 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1548,20 +1547,6 @@ if g_have_iso_c_varargs
+@@ -1679,20 +1678,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,7 +67,7 @@ index 4bbf4c2..ac59f4e 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2167,7 +2152,6 @@ subdir('gobject')
+@@ -2330,7 +2315,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
similarity index 84%
rename from package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
rename to package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index f792ceba3f..67aea7982e 100644
--- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0003-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -7,6 +7,7 @@ This warning is a false positive on older versions of gcc.
 See https://gitlab.gnome.org/GNOME/glib/issues/1744 for more details.
 
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+Refresh for 2.68.1
 ---
  meson.build | 1 +
  1 file changed, 1 insertion(+)
@@ -15,14 +16,14 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -372,6 +372,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -431,6 +431,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     # building with -Wbad-function-cast.
+     '-Wno-bad-function-cast',
      '-Wno-cast-function-type',
 +    '-Wno-format-nonliteral',
      # Due to function casts through (void*) we cannot support -Wpedantic:
      # https://wiki.gnome.org/Projects/GLib/CompilerRequirements#Function_pointer_conversions.
      '-Wno-pedantic',
-     '-Werror=declaration-after-statement',
-     '-Werror=format=2',
 -- 
 2.20.1
 
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 4f69f1cc48..e3a3aa7561 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.66/glib-2.66.8.sha256sum
-sha256  97bc87dd91365589af5cbbfea2574833aea7a1b71840fd365ecd2852c76b9c8b  glib-2.66.8.tar.xz
+# https://download.gnome.org/sources/glib/2.68/glib-2.68.1.sha256sum
+sha256  241654b96bd36b88aaa12814efc4843b578e55d47440103727959ac346944333  glib-2.68.1.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 9ce40d91ff..b5554d6b56 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.66
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).8
+LIBGLIB2_VERSION_MAJOR = 2.68
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -25,11 +25,13 @@ endif
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
 	-Dfam=false \
+	-Dglib_debug=disabled \
+	-Dlibelf=disabled \
 	-Dselinux=disabled \
 	-Dsystemtap=false \
 	-Dxattr=false \
 	-Dinternal_pcre=false \
-	-Dinstalled_tests=false \
+	-Dtests=false \
 	-Doss_fuzz=disabled
 
 LIBGLIB2_DEPENDENCIES = \
@@ -49,9 +51,11 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 # ${libdir} would be prefixed by the sysroot by pkg-config, causing a
 # bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
+	-Dglib_debug=disabled \
 	-Dinternal_pcre=false \
+	-Dlibelf=disabled \
 	-Dgio_module_dir=/usr/lib/gio/modules \
-	-Dinstalled_tests=false \
+	-Dtests=false \
 	-Doss_fuzz=disabled
 
 LIBGLIB2_MESON_EXTRA_PROPERTIES = \
