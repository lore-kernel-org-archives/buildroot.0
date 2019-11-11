From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 11 Nov 2019 13:02:51 -0800
Subject: [Buildroot] [PATCH,
 next 1/1] package/libglib2: bump to version 2.62.2
Message-ID: <20191111210251.2216431-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Changes include:
 - Refresh 0002-add-option-to-build-tests.patch to work with 2.62.2.
   Upstream now has an option called "installed_tests," which can be used to
   prevent the unit tests from being built. However; the check for build_tests
   is wrapped with "meson.is_cross_build() and  meson.has_exe_wrapper()".
   Removing that check and checking for just the installed_tests_enabled option
   allows for a much simpler patch.

 - Change -Dtests=false to -Dinstalled_tests=false in libglib2.mk as per the
   above comment.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0002-add-option-to-build-tests.patch      | 83 +++----------------
 .../0003-remove-cpp-requirement.patch         | 30 +++----
 ...mat-nonliteral-to-compiler-arguments.patch |  2 +-
 package/libglib2/libglib2.hash                |  4 +-
 package/libglib2/libglib2.mk                  |  5 +-
 5 files changed, 30 insertions(+), 94 deletions(-)

diff --git a/package/libglib2/0002-add-option-to-build-tests.patch b/package/libglib2/0002-add-option-to-build-tests.patch
index 5caaaff6b2..5f0d638dbf 100644
--- a/package/libglib2/0002-add-option-to-build-tests.patch
+++ b/package/libglib2/0002-add-option-to-build-tests.patch
@@ -14,81 +14,24 @@ Instead, add the option 'tests' which when set to false, enforces not
 building any tests, even when building the host variant.
 
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+Refresh for 2.62.2
 ---
- gio/meson.build       |  1 -
- glib/meson.build      |  3 +-
- gobject/meson.build   |  1 -
- meson.build           |  2 +-
- meson_options.txt     |  5 +++++
- 5 files changed, 6 insertions(+), 5 deletions(-)
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gio/meson.build b/gio/meson.build
-index 9a9e621..6adc014 100644
---- a/gio/meson.build
-+++ b/gio/meson.build
-@@ -1010,7 +1010,6 @@ endif
- 
- subdir('fam')
- # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
--build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
- if build_tests
-     subdir('tests')
- endif
-diff --git a/glib/meson.build b/glib/meson.build
-index 91a48f1..230d562 100644
---- a/glib/meson.build
-+++ b/glib/meson.build
-@@ -458,8 +458,7 @@ if enable_systemtap
-   )
- endif
- 
--# Don???t build the tests unless we can run them (either natively or in an exe wrapper)
--build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
-+build_tests = get_option('tests')
- if build_tests
-   subdir('tests')
- endif
-diff --git a/gobject/meson.build b/gobject/meson.build
-index c7805c5..fb5874d 100644
---- a/gobject/meson.build
-+++ b/gobject/meson.build
-@@ -166,7 +166,6 @@ if enable_systemtap
- endif
- 
- # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
--build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
- if build_tests
-   subdir('tests')
- endif
 diff --git a/meson.build b/meson.build
-index 717d1bc..3124f28 100644
+index 99806d0..3206603 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2098,7 +2098,7 @@ subdir('gmodule')
- subdir('gio')
- subdir('fuzzing')
- # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
--build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
-+build_tests = get_option('tests')
- if build_tests
-   subdir('tests')
- endif
-diff --git a/meson_options.txt b/meson_options.txt
-index 2c831e3..90468a7 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -90,6 +90,11 @@ option('nls',
-        yield: true,
-        description : 'Enable native language support (translations)')
+@@ -77,7 +77,7 @@ installed_tests_template = files('template.test.in')
+ installed_tests_template_tap = files('template-tap.test.in')
+ 
+ # Don???t build the tests unless we can run them (either natively, in an exe wrapper, or by installing them for later use)
+-build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper()) or installed_tests_enabled
++build_tests = installed_tests_enabled
+ 
+ add_project_arguments('-D_GNU_SOURCE', language: 'c')
  
-+option('tests',
-+       type : 'boolean',
-+       value : false,
-+       description : 'Build tests')
-+
- option('oss_fuzz',
-        type : 'feature',
-        value : 'disabled',
 -- 
-2.21.0
+2.23.0
 
diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 31a941bc7c..a96a94043c 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -12,9 +12,9 @@ Upstream status: Denied (Buildroot specific)
 https://gitlab.gnome.org/GNOME/glib/issues/1748
 ---
  glib/glibconfig.h.in |  1 -
- meson.build          | 18 +-----------------
+ meson.build          | 16 ----------------
  tests/meson.build    |  5 -----
- 3 files changed, 1 insertion(+), 23 deletions(-)
+ 3 files changed, 22 deletions(-)
 
 diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
 index 7ef8c48..128e65d 100644
@@ -29,15 +29,9 @@ index 7ef8c48..128e65d 100644
  /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
   * is passed ISO vararg support is turned off, and there is no work
 diff --git a/meson.build b/meson.build
-index 3124f28..642afb8 100644
+index 83774d0..99806d0 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1,4 +1,4 @@
--project('glib', 'c', 'cpp',
-+project('glib', 'c',
-   version : '2.62.0',
-   # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
-   meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
  )
  
@@ -46,7 +40,7 @@ index 3124f28..642afb8 100644
  
  cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
  
-@@ -1487,20 +1486,6 @@ if g_have_iso_c_varargs
+@@ -1490,20 +1489,6 @@ if g_have_iso_c_varargs
  #endif''')
  endif
  
@@ -67,21 +61,21 @@ index 3124f28..642afb8 100644
  g_have_gnuc_varargs = cc.compiles('''
    void some_func (void) {
      int a(int p1, int p2, int p3);
-@@ -2096,7 +2081,6 @@ subdir('gobject')
+@@ -2101,7 +2086,6 @@ subdir('gobject')
  subdir('gthread')
  subdir('gmodule')
  subdir('gio')
 -subdir('fuzzing')
- # Don???t build the tests unless we can run them (either natively or in an exe wrapper)
- build_tests = get_option('tests')
  if build_tests
+   subdir('tests')
+ endif
 diff --git a/tests/meson.build b/tests/meson.build
-index ce30442..2b31427 100644
+index e4ea226..7fd974c 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -48,11 +48,6 @@ tests = {
-     'dependencies' : [libgmodule_dep],
-     'export_dynamic' : true,
+@@ -56,11 +56,6 @@ tests = {
+     'source': 'module-test.c',
+     'c_args': ['-DMODULE_TYPE="plugin"'],
    },
 -  'cxx-test' : {
 -    'source' : 'cxx-test.cpp',
@@ -92,5 +86,5 @@ index ce30442..2b31427 100644
  
  test_extra_programs = {
 -- 
-2.21.0
+2.23.0
 
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
index c6ae49fd39..f792ceba3f 100644
--- a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
+++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -15,7 +15,7 @@ diff --git a/meson.build b/meson.build
 index 3c615b7..7cae4e8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -369,6 +369,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+@@ -372,6 +372,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
      '-Wno-cast-function-type',
 +    '-Wno-format-nonliteral',
      # Due to function casts through (void*) we cannot support -Wpedantic:
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index facb44ed34..54beef5d03 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.60/glib-2.60.6.sha256sum
-sha256  6c257205a0a343b662c9961a58bb4ba1f1e31c82f5c6b909ec741194abc3da10  glib-2.62.0.tar.xz
+# https://download.gnome.org/sources/glib/2.62/glib-2.62.2.sha256sum
+sha256  698824a413f76df039739c2a78f45b10939d526ae7495bab4e694e6730deb3f1  glib-2.62.2.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 73ea27f4d1..a466217528 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.62
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -28,7 +28,6 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dxattr=false \
 	-Dinternal_pcre=false \
 	-Dinstalled_tests=false \
-	-Dtests=false \
 	-Doss_fuzz=disabled
 
 LIBGLIB2_DEPENDENCIES = \
@@ -50,7 +49,7 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 LIBGLIB2_CONF_OPTS = \
 	-Dinternal_pcre=false \
 	-Dgio_module_dir=/usr/lib/gio/modules \
-	-Dtests=false \
+	-Dinstalled_tests=false \
 	-Doss_fuzz=disabled
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
-- 
2.23.0
