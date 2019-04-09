From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue,  9 Apr 2019 13:59:19 -0400
Subject: [Buildroot] [PATCH 2/2] package/libglib2: bump to version 2.60.0
In-Reply-To: <20190409175919.25833-1-aduskett@gmail.com>
References: <20190409175919.25833-1-aduskett@gmail.com>
Message-ID: <20190409175919.25833-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Changes include:
  - Moving to the meson build system, as autoconf is no longer supported.
  - Add 0002-Add-bool-option-for-tests.patch to allow disabling building tests.
  - Add 0003-make-cpp-optional.patch because c++ is not needed.
  - Add 0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch to prevent
    a false error when compiling against older gcc versions.
    (https://gitlab.gnome.org/GNOME/glib/issues/1744)

All tests except one pass:
./utils/test-pkg -c ./defconfig
           br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]: OK
 br-arm-cortex-m4-full [3/6]: SKIPPED
        br-x86-64-musl [4/6]: OK
    br-arm-full-static [5/6]: FAILED
          sourcery-arm [6/6]: OK

The br-arm-full-static fails because of the precompiled uclibc toolchain
erroring out during the build with undefined reference to `__fini_array_start'.

Building the same config file and compiling the toolchain from scratch allows
the build to pass.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0002-Add-bool-option-for-tests.patch      |  70 +++++++++++
 package/libglib2/0002-disable-tests.patch     |  60 ---------
 package/libglib2/0003-make-cpp-optional.patch | 119 ++++++++++++++++++
 ...mat-nonliteral-to-compiler-arguments.patch |  28 +++++
 package/libglib2/libglib2.hash                |   2 +-
 package/libglib2/libglib2.mk                  | 108 +++-------------
 6 files changed, 236 insertions(+), 151 deletions(-)
 create mode 100644 package/libglib2/0002-Add-bool-option-for-tests.patch
 delete mode 100644 package/libglib2/0002-disable-tests.patch
 create mode 100644 package/libglib2/0003-make-cpp-optional.patch
 create mode 100644 package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch

diff --git a/package/libglib2/0002-Add-bool-option-for-tests.patch b/package/libglib2/0002-Add-bool-option-for-tests.patch
new file mode 100644
index 0000000000..f905a60f31
--- /dev/null
+++ b/package/libglib2/0002-Add-bool-option-for-tests.patch
@@ -0,0 +1,70 @@
+From bf811098f10e2486fe9076e8953fd003b707010b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Tue, 9 Apr 2019 12:34:44 -0400
+Subject: [PATCH] Add bool option for tests
+
+Currently, there is no way to prevent tests from building using meson.
+When cross-compiling, building the tests isn't necessary.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+Upstream status: Pending https://gitlab.gnome.org/GNOME/glib/merge_requests/774
+---
+ gio/meson.build   | 4 +++-
+ meson.build       | 5 ++++-
+ meson_options.txt | 5 +++++
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/gio/meson.build b/gio/meson.build
+index 88575ec..30de1a6 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -993,4 +993,6 @@ if enable_systemtap
+ endif
+ 
+ subdir('fam')
+-subdir('tests')
++if with_tests
++    subdir('tests')
++endif
+diff --git a/meson.build b/meson.build
+index af0103c..423c3f4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -74,6 +74,7 @@ installed_tests_execdir = join_paths(glib_libexecdir, 'installed-tests', meson.p
+ installed_tests_enabled = get_option('installed_tests')
+ installed_tests_template = files('template.test.in')
+ installed_tests_template_tap = files('template-tap.test.in')
++with_tests = get_option('tests')
+ 
+ add_project_arguments('-D_GNU_SOURCE', language: 'c')
+ 
+@@ -1987,7 +1988,9 @@ subdir('gthread')
+ subdir('gmodule')
+ subdir('gio')
+ subdir('fuzzing')
+-subdir('tests')
++if with_tests
++  subdir('tests')
++endif
+ 
+ # xgettext is optional (on Windows for instance)
+ if find_program('xgettext', required : get_option('nls')).found()
+diff --git a/meson_options.txt b/meson_options.txt
+index 5c5b4df..e87bd9e 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -79,6 +79,11 @@ option('fam',
+        value : false,
+        description : 'Use fam for file system monitoring')
+ 
++option('tests',
++       type : 'boolean',
++       value : true,
++       description : 'Build the tests')
++
+ option('installed_tests',
+        type : 'boolean',
+        value : false,
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
diff --git a/package/libglib2/0003-make-cpp-optional.patch b/package/libglib2/0003-make-cpp-optional.patch
new file mode 100644
index 0000000000..2b71408c18
--- /dev/null
+++ b/package/libglib2/0003-make-cpp-optional.patch
@@ -0,0 +1,119 @@
+From ee5ed1385bd6c36123ff970a8fff89a811798421 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Tue, 9 Apr 2019 12:59:36 -0400
+Subject: [PATCH] make cpp optional
+
+C++ isn't actually necessary to build libglib2. The fuzzing folder only has
+c files in it, and there is only a single test that is written in c++.
+
+Check if a C++ compiler exists, and if it does, then add the cxx-test.cpp file
+to tests/meson.build.
+
+Also change cxx.find_library to cc.find_library in fuzzing/meson.build
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ fuzzing/meson.build |  2 +-
+ meson.build         | 32 +++++++++++++++++++-------------
+ tests/meson.build   | 15 ++++++++++-----
+ 3 files changed, 30 insertions(+), 19 deletions(-)
+
+diff --git a/fuzzing/meson.build b/fuzzing/meson.build
+index 16878fe..737e168 100644
+--- a/fuzzing/meson.build
++++ b/fuzzing/meson.build
+@@ -13,7 +13,7 @@ extra_c_args = cc.get_supported_arguments('-Werror=unused-function')
+ 
+ # Links in a static library provided by oss-fuzz, else a standalone driver.
+ # https://github.com/google/oss-fuzz/blob/master/docs/new_project_guide.md#buildsh-script-environment
+-fuzzing_engine = cxx.find_library('FuzzingEngine', required : false)
++fuzzing_engine = cc.find_library('FuzzingEngine', required : false)
+ if fuzzing_engine.found()
+   deps += fuzzing_engine
+ else
+diff --git a/meson.build b/meson.build
+index 423c3f4..3c615b7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('glib', 'c', 'cpp',
++project('glib', 'c',
+   version : '2.60.0',
+   meson_version : '>= 0.48.0',
+   default_options : [
+@@ -9,7 +9,11 @@ project('glib', 'c', 'cpp',
+ )
+ 
+ cc = meson.get_compiler('c')
+-cxx = meson.get_compiler('cpp')
++cxx_check = add_languages('cpp', required: false)
++if cxx_check
++  cxx = meson.get_compiler('cpp')
++endif
++
+ 
+ cc_can_run = not meson.is_cross_build() or meson.has_exe_wrapper()
+ 
+@@ -1439,18 +1443,20 @@ if g_have_iso_c_varargs
+ #endif''')
+ endif
+ 
+-g_have_iso_cxx_varargs = cxx.compiles('''
+-  void some_func (void) {
+-    int a(int p1, int p2, int p3);
+-    #define call_a(...) a(1,__VA_ARGS__)
+-    call_a(2,3);
+-  }''', name : 'ISO C99 varargs macros in C++')
++if cxx_check
++  g_have_iso_cxx_varargs = cxx.compiles('''
++    void some_func (void) {
++      int a(int p1, int p2, int p3);
++      #define call_a(...) a(1,__VA_ARGS__)
++      call_a(2,3);
++    }''', name : 'ISO C99 varargs macros in C++')
+ 
+-if g_have_iso_cxx_varargs
+-  glibconfig_conf.set('g_have_iso_cxx_varargs', '''
+-#ifdef __cplusplus
+-# define G_HAVE_ISO_VARARGS 1
+-#endif''')
++  if g_have_iso_cxx_varargs
++    glibconfig_conf.set('g_have_iso_cxx_varargs', '''
++  #ifdef __cplusplus
++  # define G_HAVE_ISO_VARARGS 1
++  #endif''')
++  endif
+ endif
+ 
+ g_have_gnuc_varargs = cc.compiles('''
+diff --git a/tests/meson.build b/tests/meson.build
+index 11075dd..8dafadf 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -48,13 +48,18 @@ tests = {
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
++if cxx_check
++  tests += {
++    'cxx-test' : {
++      'source' : 'cxx-test.cpp',
++      'include_directories' : gmoduleinc,
++      'dependencies' : [libgio_dep],
++    },
++  }
++endif
++
+ test_extra_programs = {
+   'slice-test' : {
+     'extra_sources' : ['memchunks.c'],
+-- 
+2.20.1
+
diff --git a/package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch b/package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch
new file mode 100644
index 0000000000..ca81b5263a
--- /dev/null
+++ b/package/libglib2/0005-Add-Wno-format-nonliteral-to-compiler-arguments.patch
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
+@@ -363,6 +363,7 @@ if cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Wno-cast-function-type',
+     # Due to function casts through (void*) we cannot support -Wpedantic:
+     # https://wiki.gnome.org/Projects/GLib/CompilerRequirements#Function_pointer_conversions.
++    '-Wno-format-nonliteral',
+     '-Wno-pedantic',
+     '-Werror=declaration-after-statement',
+     '-Werror=format=2',
+-- 
+2.20.1
+
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index faa01ef563..4dea10933c 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
 # https://download.gnome.org/sources/glib/2.56/glib-2.56.4.sha256sum
-sha256  27f703d125efb07f8a743666b580df0b4095c59fc8750e8890132c91d437504c  glib-2.56.4.tar.xz
+sha256  20865d8b96840d89d9340fc485b4b1131c1bb24d16a258a22d642c3bb1b44353  glib-2.60.0.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 63bfec32d6..73541ca001 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.60
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -16,89 +16,20 @@ LIBGLIB2_AUTORECONF = YES
 LIBGLIB2_INSTALL_STAGING = YES
 LIBGLIB2_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
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
-
 # glib/valgrind.h contains inline asm not compatible with thumb1
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
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
+	-Dinstalled_tests=false \
+	-Dtests=false
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
@@ -117,31 +48,28 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 # ${libdir} would be prefixed by the sysroot by pkg-config, causing a
 # bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
-	--with-pcre=system \
-	--disable-compile-warnings \
-	--with-gio-module-dir=/usr/lib/gio/modules
+	-Dinternal_pcre=false \
+	-Dgio_module_dir=/usr/lib/gio/modules \
+	-Dtests=false
 
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
@@ -181,7 +109,7 @@ endef
 LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
 LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
 
 LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
-- 
2.20.1
