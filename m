From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 24 Apr 2019 15:31:12 -0400
Subject: [Buildroot] [PATCH v4 1/1] package/libglib2: bump to version 2.60.1
Message-ID: <20190424193112.81822-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Changes include:
  - Moving to the meson build system, as autoconf is no longer supported.
  - Add 0002-Only-build-tests-if-certain-conditions-are-met.patch
  - Add 0003-remove-cpp-requirement.patch because c++ is not needed.
  - Add 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch to prevent
    a false error when compiling against older gcc versions.
    (https://gitlab.gnome.org/GNOME/glib/issues/1744)
  - Remove 0004-Do-not-hardcode-python-path-into-various-tools.patch as the
    switch to meson makes this obsolete.
  - Remove LIBGLIB2_AUTORECONF = YES from libglib2.mk
  - Remove LIBGLIB2_INSTALL_STAGING_OPTS from libglib2.mk

All tests pass:
./utils/test-pkg -c ./defconfig
           br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]: OK
 br-arm-cortex-m4-full [3/6]: SKIPPED
        br-x86-64-musl [4/6]: OK
    br-arm-full-static [5/6]: OK
          sourcery-arm [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
v1 -> v2:
  - Remove LIBGLIB2_AUTORECONF = YES from libglib2.mk
  - Remove LIBGLIB2_INSTALL_STAGING_OPTS from libglib2.mk
  - Remove -Dtests=false from libglib2.mk in favor of the updated
    0002-Only-build-tests-if-certain-conditions-are-met.patch.
  - Instead of making cpp optional, remove cpp requirement completely as the
    c++ requirement is for testing purposes only.
  - Add a link to https://gitlab.gnome.org/GNOME/glib/issues/1748 as to why
    patch 0003 is buildroot specific.
  - Update url in 0001-fix-compile-time-atomic-detection.patch
  - Remove 0004-Do-not-hardcode-python-path-into-various-tools.patch (Arnout)

v2 -> v3:
  - Moved -Wno-format-nonliteral above the comment. (Arnout)

v3 -> v4:
  - Bump version from 2.60.0 to 2.60.1

 ...01-fix-compile-time-atomic-detection.patch |   4 +-
 ...-tests-if-certain-conditions-are-met.patch |  88 ++++++++++++++
 package/libglib2/0002-disable-tests.patch     |  60 ----------
 .../0003-remove-cpp-requirement.patch         |  96 +++++++++++++++
 ...mat-nonliteral-to-compiler-arguments.patch |  28 +++++
 ...dcode-python-path-into-various-tools.patch |  48 --------
 package/libglib2/libglib2.hash                |   4 +-
 package/libglib2/libglib2.mk                  | 110 +++---------------
 8 files changed, 232 insertions(+), 206 deletions(-)
 create mode 100644 package/libglib2/0002-Only-build-tests-if-certain-conditions-are-met.patch
 delete mode 100644 package/libglib2/0002-disable-tests.patch
 create mode 100644 package/libglib2/0003-remove-cpp-requirement.patch
 create mode 100644 package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
 delete mode 100644 package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch

diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
index 708188b2c1..527757d9c5 100644
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -5,8 +5,8 @@ Subject: [PATCH] Fix compile time atomic detection
 
 Improved compile-time detection of atomic support in the compiler.
 
-Upstream-Status: submitted
-See : https://bugzilla.gnome.org/show_bug.cgi?id=752731
+Upstream-Status: Merged
+See : https://gitlab.gnome.org/GNOME/glib/issues/1063
 
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
 Signed-off-by: Adam Duskett <aduskett@codeblue.com>
diff --git a/package/libglib2/0002-Only-build-tests-if-certain-conditions-are-met.patch b/package/libglib2/0002-Only-build-tests-if-certain-conditions-are-met.patch
new file mode 100644
index 0000000000..8f0514fbdd
--- /dev/null
+++ b/package/libglib2/0002-Only-build-tests-if-certain-conditions-are-met.patch
@@ -0,0 +1,88 @@
+From 84a13f3c561616973c8cdc04d5c909d28ba05efe Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Fri, 12 Apr 2019 11:49:27 -0400
+Subject: [PATCH v2 1/1] Only build tests if certain conditions are met.
+
+Only build tests if certain conditions are met.
+
+Currently, there is no way to prevent tests from building using meson.
+When cross-compiling, building the tests isn't necessary.
+
+Instead, only build the tests on the following conditions:
+1) If not cross-compiling.
+2) If cross-compiling, and there is an exe wrapper.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+Upstream status: Pending https://gitlab.gnome.org/GNOME/glib/merge_requests/774
+---
+ gio/meson.build     | 5 ++++-
+ glib/meson.build    | 6 +++++-
+ gobject/meson.build | 6 +++++-
+ meson.build         | 8 ++++++--
+ 4 files changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/gio/meson.build b/gio/meson.build
+index 88575ec..b6a27d8 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -994,4 +994,8 @@ if enable_systemtap
+ endif
+ 
+ subdir('fam')
+-subdir('tests')
++# Don?t build the tests unless we can run them (either natively or in an exe wrapper)
++build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
++if build_tests
++    subdir('tests')
++endif
+\ No newline at end of file
+diff --git a/glib/meson.build b/glib/meson.build
+index 8350ea2..7619568 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -371,4 +371,8 @@ if enable_systemtap
+     install : true)
+ endif
+ 
+-subdir('tests')
++# Don?t build the tests unless we can run them (either natively or in an exe wrapper)
++build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
++if build_tests
++  subdir('tests')
++endif
+\ No newline at end of file
+diff --git a/gobject/meson.build b/gobject/meson.build
+index db8d3c4..81dcffd 100644
+--- a/gobject/meson.build
++++ b/gobject/meson.build
+@@ -166,4 +166,8 @@ if enable_systemtap
+     install : true)
+ endif
+ 
+-subdir('tests')
++# Don?t build the tests unless we can run them (either natively or in an exe wrapper)
++build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
++if build_tests
++  subdir('tests')
++endif
+\ No newline at end of file
+diff --git a/meson.build b/meson.build
+index af0103c..cd29658 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1994,7 +1994,11 @@ subdir('gthread')
+ subdir('gmodule')
+ subdir('gio')
+ subdir('fuzzing')
+-subdir('tests')
++# Don?t build the tests unless we can run them (either natively or in an exe wrapper)
++build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
++if build_tests
++  subdir('tests')
++endif
+ 
+ # xgettext is optional (on Windows for instance)
+ if find_program('xgettext', required : get_option('nls')).found()
+-- 
+2.20.1
+
diff --git a/package/libglib2/0002-disable-tests.patch b/package/libglib2/0002-disable-tests.patch
deleted file mode 100644
index 523ebb35ac..0000000000
--- a/package/libglib2/0002-disable-tests.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From ee2d6609bce808ac72afdbf86db1a6e27c78171e Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
-Date: Wed, 21 Jun 2017 16:37:54 -0400
-Subject: [PATCH] disable tests
-
-Disable tests, some of them need python and sometimes host-python
-gets mixed with distro python leading to build failures.
-
-Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
-Signed-off-by: Adam Duskett <aduskett@codeblue.com>
----
- Makefile.am      | 2 +-
- gio/Makefile.am  | 2 +-
- glib/Makefile.am | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 008ad58..007332d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -6,7 +6,7 @@ include $(top_srcdir)/glib.mk
- 
- ACLOCAL_AMFLAGS = -I m4macros ${ACLOCAL_FLAGS}
- 
--SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs tests
-+SUBDIRS = . m4macros glib gmodule gthread gobject gio po docs
- DIST_SUBDIRS = $(SUBDIRS) build win32
- 
- bin_SCRIPTS = glib-gettextize
-diff --git a/gio/Makefile.am b/gio/Makefile.am
-index 67db1b7..78309b5 100644
---- a/gio/Makefile.am
-+++ b/gio/Makefile.am
-@@ -244,7 +244,7 @@ platform_libadd += win32/libgiowin32.la
- platform_deps += win32/libgiowin32.la
- endif
- 
--SUBDIRS += . tests
-+SUBDIRS += .
- 
- if HAVE_FAM
- SUBDIRS += fam
-diff --git a/glib/Makefile.am b/glib/Makefile.am
-index d755853..61166e5 100644
---- a/glib/Makefile.am
-+++ b/glib/Makefile.am
-@@ -33,8 +33,8 @@ else
- MAYBE_PCRE = pcre 
- endif
- 
--SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre . tests
--DIST_SUBDIRS = libcharset gnulib pcre update-pcre tests
-+SUBDIRS = libcharset $(PRINTF_SUBDIR) $(MAYBE_PCRE) update-pcre .
-+DIST_SUBDIRS = libcharset gnulib pcre update-pcre
- 
- AM_CPPFLAGS = 				\
- 	$(glib_INCLUDES) 		\
--- 
-2.9.4
-
diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
new file mode 100644
index 0000000000..2bb45b003d
--- /dev/null
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -0,0 +1,96 @@
+From ee5ed1385bd6c36123ff970a8fff89a811798421 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Tue, 9 Apr 2019 12:59:36 -0400
+Subject: [PATCH] remove cpp requirement
+
+The c++ test is necessary to ensure libglib doesn't accidentally use C++
+reserved keywords in public headers. Because this is just a test, it isn't
+necessary to have a C++ compiler to build libglib2.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+Upstream status: Denied (Buildroot specific)
+https://gitlab.gnome.org/GNOME/glib/issues/1748
+---
+ glib/glibconfig.h.in |  1 -
+ meson.build          | 18 +-----------------
+ tests/meson.build    |  5 -----
+ 3 files changed, 1 insertion(+), 23 deletions(-)
+
+diff --git a/glib/glibconfig.h.in b/glib/glibconfig.h.in
+index 2bf6c43..358867f 100644
+--- a/glib/glibconfig.h.in
++++ b/glib/glibconfig.h.in
+@@ -122,7 +122,6 @@ typedef unsigned @glib_intptr_type_define@ guintptr;
+ @glib_vacopy@
+ 
+ @g_have_iso_c_varargs@
+- at g_have_iso_cxx_varargs@
+ 
+ /* gcc-2.95.x supports both gnu style and ISO varargs, but if -ansi
+  * is passed ISO vararg support is turned off, and there is no work
+diff --git a/meson.build b/meson.build
+index c96289a..b694bb7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('glib', 'c', 'cpp',
++project('glib', 'c',
+   version : '2.60.1',
+   meson_version : '>= 0.48.0',
+   default_options : [
+@@ -9,7 +9,6 @@ project('glib', 'c', 'cpp',
+ )
+ 
+ cc = meson.get_compiler('c')
+-cxx = meson.get_compiler('cpp')
+ 
+ cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
+ 
+@@ -1438,20 +1437,6 @@ if g_have_iso_c_varargs
+ #endif''')
+ endif
+ 
+-g_have_iso_cxx_varargs = cxx.compiles('''
+-  void some_func (void) {
+-    int a(int p1, int p2, int p3);
+-    #define call_a(...) a(1,__VA_ARGS__)
+-    call_a(2,3);
+-  }''', name : 'ISO C99 varargs macros in C++')
+-
+-if g_have_iso_cxx_varargs
+-  glibconfig_conf.set('g_have_iso_cxx_varargs', '''
+-#ifdef __cplusplus
+-# define G_HAVE_ISO_VARARGS 1
+-#endif''')
+-endif
+-
+ g_have_gnuc_varargs = cc.compiles('''
+   void some_func (void) {
+     int a(int p1, int p2, int p3);
+@@ -1993,7 +1978,6 @@ subdir('gobject')
+ subdir('gthread')
+ subdir('gmodule')
+ subdir('gio')
+-subdir('fuzzing')
+ # Don?t build the tests unless we can run them (either natively or in an exe wrapper)
+ build_tests = not meson.is_cross_build() or (meson.is_cross_build() and meson.has_exe_wrapper())
+ if build_tests
+diff --git a/tests/meson.build b/tests/meson.build
+index 11075dd..e052892 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -48,11 +48,6 @@ tests = {
+     'dependencies' : [libgmodule_dep],
+     'export_dynamic' : true,
+   },
+-  'cxx-test' : {
+-    'source' : 'cxx-test.cpp',
+-    'include_directories' : gmoduleinc,
+-    'dependencies' : [libgio_dep],
+-  },
+ }
+ 
+ test_extra_programs = {
+-- 
+2.20.1
+
diff --git a/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
new file mode 100644
index 0000000000..e51bb6b2b1
--- /dev/null
+++ b/package/libglib2/0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch
@@ -0,0 +1,28 @@
+From 9e0f11a4981737f98bac93a22b6f2ff1a3887b63 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Tue, 9 Apr 2019 13:03:51 -0400
+Subject: [PATCH] Add '-Wno-format-nonliteral' to compiler arguments.
+
+This warning is a false positive on older versions of gcc.
+See https://gitlab.gnome.org/GNOME/glib/issues/1744 for more details.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 3c615b7..7cae4e8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -357,6 +357,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Wno-cast-function-type',
++    '-Wno-format-nonliteral',
+     # Due to function casts through (void*) we cannot support -Wpedantic:
+     # https://wiki.gnome.org/Projects/GLib/CompilerRequirements#Function_pointer_conversions.
+     '-Wno-pedantic',
+     '-Werror=declaration-after-statement',
+     '-Werror=format=2',
+-- 
+2.20.1
+
diff --git a/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch b/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
deleted file mode 100644
index fa558e6dbf..0000000000
--- a/package/libglib2/0004-Do-not-hardcode-python-path-into-various-tools.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b9160d951b9af647b97766c57295ca4f45cf9521 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 3 Oct 2017 10:45:55 +0300
-Subject: [PATCH] Do not hardcode python path into various tools
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Fetch from: http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch?id=eef7883587acc933d6f34b559ec03ff84d18573b
-Signed-off-by: David Owens <david.owens@rockwellcollins.com>
----
- gio/gdbus-2.0/codegen/gdbus-codegen.in | 2 +-
- gobject/glib-genmarshal.in             | 2 +-
- gobject/glib-mkenums.in                | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
-index 8050981..e693ef3 100644
---- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
-+++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
-@@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
-+#!/usr/bin/env python
- 
- # GDBus - GLib D-Bus Library
- #
-diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
-index 09e8408..b2f9d99 100755
---- a/gobject/glib-genmarshal.in
-+++ b/gobject/glib-genmarshal.in
-@@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
-+#!/usr/bin/env python
- 
- # pylint: disable=too-many-lines, missing-docstring, invalid-name
- 
-diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index d4bfd11..051fce4 100755
---- a/gobject/glib-mkenums.in
-+++ b/gobject/glib-mkenums.in
-@@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
-+#!/usr/bin/env python
- 
- # If the code below looks horrible and unpythonic, do not panic.
- #
--- 
-2.14.1
-
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index faa01ef563..4784454690 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.4.sha256sum
-sha256  27f703d125efb07f8a743666b580df0b4095c59fc8750e8890132c91d437504c  glib-2.56.4.tar.xz
+# https://download.gnome.org/sources/glib/2.60/glib-2.60.1.sha256sum
+sha256  89f884f5d5c6126140ec868cef184c42ce72902c13cd08f36e660371779b5560  glib-2.60.1.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 63bfec32d6..d39cdd9a7b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,86 +4,13 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.60
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
 LIBGLIB2_LICENSE_FILES = COPYING
-# 0002-disable-tests.patch
-LIBGLIB2_AUTORECONF = YES
-
 LIBGLIB2_INSTALL_STAGING = YES
-LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-
-LIBGLIB2_CONF_ENV = \
-	ac_cv_func_posix_getpwuid_r=yes \
-	glib_cv_stack_grows=no \
-	glib_cv_uscore=no \
-	ac_cv_func_strtod=yes \
-	ac_fsusage_space=yes \
-	fu_cv_sys_stat_statfs2_bsize=yes \
-	ac_cv_func_closedir_void=no \
-	ac_cv_func_getloadavg=no \
-	ac_cv_lib_util_getloadavg=no \
-	ac_cv_lib_getloadavg_getloadavg=no \
-	ac_cv_func_getgroups=yes \
-	ac_cv_func_getgroups_works=yes \
-	ac_cv_func_chown_works=yes \
-	ac_cv_have_decl_euidaccess=no \
-	ac_cv_func_euidaccess=no \
-	ac_cv_have_decl_strnlen=yes \
-	ac_cv_func_strnlen_working=yes \
-	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-	ac_cv_func_lstat_empty_string_bug=no \
-	ac_cv_func_stat_empty_string_bug=no \
-	vb_cv_func_rename_trailing_slash_bug=no \
-	ac_cv_have_decl_nanosleep=yes \
-	jm_cv_func_nanosleep_works=yes \
-	gl_cv_func_working_utimes=yes \
-	ac_cv_func_utime_null=yes \
-	jm_cv_func_svid_putenv=yes \
-	ac_cv_func_getcwd_null=yes \
-	ac_cv_func_getdelim=yes \
-	ac_cv_func_mkstemp=yes \
-	utils_cv_func_mkstemp_limitations=no \
-	utils_cv_func_mkdir_trailing_slash_bug=no \
-	jm_cv_func_gettimeofday_clobber=no \
-	gl_cv_func_working_readdir=yes \
-	jm_ac_cv_func_link_follows_symlink=no \
-	utils_cv_localtime_cache=no \
-	ac_cv_struct_st_mtim_nsec=no \
-	gl_cv_func_tzset_clobber=no \
-	gl_cv_func_getcwd_null=yes \
-	gl_cv_func_getcwd_path_max=yes \
-	ac_cv_func_fnmatch_gnu=yes \
-	am_getline_needs_run_time_check=no \
-	am_cv_func_working_getline=yes \
-	gl_cv_func_mkdir_trailing_slash_bug=no \
-	gl_cv_func_mkstemp_limitations=no \
-	ac_cv_func_working_mktime=yes \
-	jm_cv_func_working_re_compile_pattern=yes \
-	ac_use_included_regex=no \
-	gl_cv_c_restrict=no \
-	ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/bin/glib-genmarshal \
-	ac_cv_prog_F77=no \
-	ac_cv_func_posix_getgrgid_r=no \
-	glib_cv_long_long_format=ll \
-	ac_cv_func_printf_unix98=yes \
-	ac_cv_func_vsnprintf_c99=yes \
-	ac_cv_func_newlocale=no \
-	ac_cv_func_uselocale=no \
-	ac_cv_func_strtod_l=no \
-	ac_cv_func_strtoll_l=no \
-	ac_cv_func_strtoull_l=no \
-	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
-
-# old uClibc versions don't provide qsort_r
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
-else
-LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
-endif
 
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
@@ -91,14 +18,13 @@ LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
 endif
 
 HOST_LIBGLIB2_CONF_OPTS = \
-	--disable-coverage \
-	--disable-dtrace \
-	--disable-fam \
-	--disable-libelf \
-	--disable-selinux \
-	--disable-systemtap \
-	--disable-xattr \
-	--with-pcre=system
+	-Ddtrace=false \
+	-Dfam=false \
+	-Dselinux=disabled \
+	-Dsystemtap=false \
+	-Dxattr=false \
+	-Dinternal_pcre=false \
+	-Dinstalled_tests=false
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
@@ -117,31 +43,27 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 # ${libdir} would be prefixed by the sysroot by pkg-config, causing a
 # bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
-	--with-pcre=system \
-	--disable-compile-warnings \
-	--with-gio-module-dir=/usr/lib/gio/modules
+	-Dinternal_pcre=false \
+	-Dgio_module_dir=/usr/lib/gio/modules
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-LIBGLIB2_CONF_OPTS += --enable-libelf
 LIBGLIB2_DEPENDENCIES += elfutils
-else
-LIBGLIB2_CONF_OPTS += --disable-libelf
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-LIBGLIB2_CONF_OPTS += --with-libiconv=gnu
+LIBGLIB2_CONF_OPTS += -Diconv=gnu
 LIBGLIB2_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-LIBGLIB2_CONF_OPTS += --enable-selinux
+LIBGLIB2_CONF_OPTS += -Dselinux=enabled
 LIBGLIB2_DEPENDENCIES += libselinux
 else
-LIBGLIB2_CONF_OPTS += --disable-selinux
+LIBGLIB2_CONF_OPTS += -Dselinux=disabled
 endif
 
 # Purge gdb-related files
@@ -181,7 +103,7 @@ endef
 LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
 LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
 
 LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
-- 
2.20.1
