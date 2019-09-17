From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 21:44:37 +0200
Subject: [Buildroot] [git commit] package/libglib2: bump to version 2.62.0
Message-ID: <20190917195454.248658E8D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb912cb36deee74adefef2b9147381738f8e81fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
 - Refactor 0002-add-option-to-build-tests.patch to work with the new version.
 - Add the new option oss_fuzz=disabled to HOST_LIBGLIB2_CONF_OPTS and
   LIBGLIB2_CONF_OPTS.
 - Change -Diconv=gnu to -Diconv=external as the option has changed.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-compile-time-atomic-detection.patch   |  2 +-
 .../libglib2/0002-add-option-to-build-tests.patch  | 94 ++++++++--------------
 package/libglib2/0003-remove-cpp-requirement.patch | 30 +++----
 ...o-format-nonliteral-to-compiler-arguments.patch |  2 +-
 package/libglib2/libglib2.hash                     |  2 +-
 package/libglib2/libglib2.mk                       | 12 +--
 6 files changed, 60 insertions(+), 82 deletions(-)

diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
index 9d30468bdf..a471275243 100644
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -18,7 +18,7 @@ diff --git a/glib/gthread-posix.c b/glib/gthread-posix.c
 index 71a6b7b..d09d029 100644
 --- a/glib/gthread-posix.c
 +++ b/glib/gthread-posix.c
-@@ -65,7 +65,7 @@
+@@ -68,7 +68,7 @@
  #endif
  
  /* clang defines __ATOMIC_SEQ_CST but doesn't support the GCC extension */
diff --git a/package/libglib2/0002-add-option-to-build-tests.patch b/package/libglib2/0002-add-option-to-build-tests.patch
index 35fcc700f3..3b7d6753ca 100644
--- a/package/libglib2/0002-add-option-to-build-tests.patch
+++ b/package/libglib2/0002-add-option-to-build-tests.patch
@@ -1,6 +1,6 @@
-From 8de64376005b8630ce5e29f45d5502a56b121173 Mon Sep 17 00:00:00 2001
+From 3a137f52869fdbc7050d606bfba0e5b1e41bd8e6 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
-Date: Wed, 8 May 2019 13:08:43 -0400
+Date: Mon, 16 Sep 2019 10:08:52 -0700
 Subject: [PATCH] add option to build tests.
 
 Upstream won't build tests when cross-compiling. However; this means still
@@ -15,89 +15,65 @@ building any tests, even when building the host variant.
 
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
- gio/meson.build     | 4 +++-
- glib/meson.build    | 5 +++--
- gobject/meson.build | 5 +++--
- meson.build         | 6 +++++-
+ gio/meson.build     | 1 -
+ gobject/meson.build | 1 -
+ meson.build         | 2 +-
  meson_options.txt   | 5 +++++
- 5 files changed, 19 insertions(+), 6 deletions(-)
+ 4 files changed, 6 insertions(+), 3 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 4e5e021..925563c 100644
+index 9a9e621..6adc014 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -994,4 +994,6 @@ if enable_systemtap
- endif
+@@ -1010,7 +1010,6 @@ endif
  
  subdir('fam')
--subdir('tests')
-+if build_tests
-+  subdir('tests')
-+endif
-diff --git a/glib/meson.build b/glib/meson.build
-index 8350ea2..bc1a7c5 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -370,5 +370,6 @@ if enable_systemtap
-     install_dir : tapset_install_dir,
-     install : true)
+ # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
+-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
+ if build_tests
+     subdir('tests')
  endif
--
--subdir('tests')
-+if build_tests
-+  subdir('tests')
-+endif
 diff --git a/gobject/meson.build b/gobject/meson.build
-index db8d3c4..094cb58 100644
+index c7805c5..fb5874d 100644
 --- a/gobject/meson.build
 +++ b/gobject/meson.build
-@@ -165,5 +165,6 @@ if enable_systemtap
-     install_dir : tapset_install_dir,
-     install : true)
+@@ -166,7 +166,6 @@ if enable_systemtap
+ endif
+ 
+ # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
+-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
+ if build_tests
+   subdir('tests')
  endif
--
--subdir('tests')
-+if build_tests
-+  subdir('tests')
-+endif
 diff --git a/meson.build b/meson.build
-index b57b2d6..d625a50 100644
+index 717d1bc..3124f28 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -75,6 +75,8 @@ installed_tests_enabled = get_option('installed_tests')
- installed_tests_template = files('template.test.in')
- installed_tests_template_tap = files('template-tap.test.in')
- 
-+build_tests = get_option('tests')
-+
- add_project_arguments('-D_GNU_SOURCE', language: 'c')
- 
- # Disable strict aliasing;
-@@ -1994,8 +1996,10 @@ subdir('gthread')
- subdir('gmodule')
+@@ -2098,7 +2098,7 @@ subdir('gmodule')
  subdir('gio')
  subdir('fuzzing')
--subdir('tests')
- 
-+if build_tests
-+  subdir('tests')
-+endif
- # xgettext is optional (on Windows for instance)
- if find_program('xgettext', required : get_option('nls')).found()
-   subdir('po')
+ # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
+-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
++build_tests = get_option('tests')
+ if build_tests
+   subdir('tests')
+ endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 5c5b4df..7ffde0a 100644
+index 2c831e3..90468a7 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -89,3 +89,8 @@ option('nls',
-        value : 'auto',
+@@ -90,6 +90,11 @@ option('nls',
         yield: true,
         description : 'Enable native language support (translations)')
-+
+ 
 +option('tests',
 +       type : 'boolean',
 +       value : false,
 +       description : 'Build tests')
++
+ option('oss_fuzz',
+        type : 'feature',
+        value : 'disabled',
 -- 
 2.21.0
 
diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 444ed2464c..31a941bc7c 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -1,6 +1,6 @@
-From ee5ed1385bd6c36123ff970a8fff89a811798421 Mon Sep 17 00:00:00 2001
+From 2f168951df1feebeac549ada1ea44ea092484c54 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
-Date: Tue, 9 Apr 2019 12:59:36 -0400
+Date: Mon, 16 Sep 2019 10:12:38 -0700
 Subject: [PATCH] remove cpp requirement
 
 The c++ test is necessary to ensure libglib doesn't accidentally use C++
@@ -17,10 +17,10 @@ https://gitlab.gnome.org/GNOME/glib/issues/1748
  3 files changed, 1 insertion(+), 23 deletions(-)
 
 diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
-index 2bf6c43..358867f 100644
+index 7ef8c48..128e65d 100644
 --- a/glib/glibconfig.h.in
 +++ b/glib/glibconfig.h.in
-@@ -122,7 +122,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
+@@ -117,7 +117,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
  @glib_vacopy@
  
  @g_have_iso_c_varargs@
@@ -29,16 +29,16 @@ index 2bf6c43..358867f 100644
  /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
   * is passed ISO vararg support is turned off, and there is no work
 diff --git a/meson.build b/meson.build
-index c96289a..b694bb7 100644
+index 3124f28..642afb8 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.60.7',
-   meson_version : '>= 0.48.0',
-   default_options : [
-@@ -9,7 +9,6 @@ project('glib', 'c', 'cpp',
+   version : '2.62.0',
+   # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
+   meson_version : '>= 0.49.2',
+@@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
  )
  
  cc = meson.get_compiler('c')
@@ -46,7 +46,7 @@ index c96289a..b694bb7 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1440,20 +1439,6 @@ if g_have_iso_c_varargs
+@@ -1487,20 +1486,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,16 +67,16 @@ index c96289a..b694bb7 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -1995,7 +1980,6 @@ subdir('gobject')
+@@ -2096,7 +2081,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
 -subdir('fuzzing')
-
+ # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
+ build_tests = get_option('tests')
  if build_tests
-   subdir('tests')
 diff --git a/tests/meson.build b/tests/meson.build
-index 11075dd..e052892 100644
+index ce30442..2b31427 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -48,11 +48,6 @@ tests = {
@@ -92,5 +92,5 @@ index 11075dd..e052892 100644
  
  test_extra_programs = {
 -- 
-2.20.1
+2.21.0
 
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index b24fe691d1..c6ae49fd39 100644
--- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -15,7 +15,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -359,6 +359,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -369,6 +369,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      '-Wno-cast-function-type',
 +    '-Wno-format-nonliteral',
      # Due to function casts through (void*) we cannot support -Wpedantic:
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 39d880ee1d..facb44ed34 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
 # https://download.gnome.org/sources/glib/2.60/glib-2.60.6.sha256sum
-sha256  8b12c0af569afd3b71200556ad751bad4cf4bf7bc4b5f880638459a42ca86310  glib-2.60.7.tar.xz
+sha256  6c257205a0a343b662c9961a58bb4ba1f1e31c82f5c6b909ec741194abc3da10  glib-2.62.0.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f2f752851a..5183331c8d 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.60
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).7
+LIBGLIB2_VERSION_MAJOR = 2.62
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -28,7 +28,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dxattr=false \
 	-Dinternal_pcre=false \
 	-Dinstalled_tests=false \
-	-Dtests=false
+	-Dtests=false \
+	-Doss_fuzz=disabled
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
@@ -49,7 +50,8 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 LIBGLIB2_CONF_OPTS = \
 	-Dinternal_pcre=false \
 	-Dgio_module_dir=/usr/lib/gio/modules \
-	-Dtests=false
+	-Dtests=false \
+	-Doss_fuzz=disabled
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
@@ -60,7 +62,7 @@ LIBGLIB2_DEPENDENCIES += elfutils
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-LIBGLIB2_CONF_OPTS += -Diconv=gnu
+LIBGLIB2_CONF_OPTS += -Diconv=external
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
