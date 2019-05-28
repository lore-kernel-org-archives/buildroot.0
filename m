From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 28 May 2019 15:48:11 -0400
Subject: [Buildroot] [PATCH v7 1/1] package/libglib2: bump to version 2.60.3
Message-ID: <20190528194811.120927-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Changes include:
  - Change the package type to meson, as autoconf is no longer supported.

  - Add 0002-add-option-to-build-tests.patch
      Upstream won't build tests when cross-compiling. However; this means still
      building the tests during a host build. Building the tests causes build
      failures on older distributions such as CentOS 6 and Debian 7 because of
      the command `objcopy --add-symbol` is used when building the test
      "test_resources2," which is not available with the older version of
      objcopy provided by the distributions.

  - Add 0003-remove-cpp-requirement.patch:
     C++ is not needed when just compiling. The inclusion of C++ in meson.build
     is to ensure libglib doesn't accidentally use C++ reserved keywords in
     public headers. Because tests aren't being compiled, there is no need for
     C++ as a requirement.
     (https://gitlab.gnome.org/GNOME/glib/issues/1748)

  - Add 0004-Add-Wno-format-nonliteral-to-compiler-arguments.patch:
    This prevents a false error when compiling against older gcc versions.
    (https://gitlab.gnome.org/GNOME/glib/issues/1744)

  - Remove 0004-Do-not-hardcode-python-path-into-various-tools.patch:
      The switch to meson makes this obsolete.

  - Remove LIBGLIB2_AUTORECONF = YES from libglib2.mk:
      Now that libglib2 is a meson package, there is no need for AUTORECONF.

  - Remove LIBGLIB2_INSTALL_STAGING_OPTS from libglib2.mk:
      Meson resolves these correctly.

  - Add LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE in libglib2.mk:
      Newer versions of libglib2 prefix glib-genmarshal, gobject-query, and
      glib-mkenums with ${bindir}. Unfortunately, this will resolve to the host
      systems /bin/ directory, which will cause compilation issues if the host
      does not have these programs. By removing the ${bindir}/ prefix, these
      programs are resolved in PATH instead.

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

v4 -> v5:
  - Bump version from 2.60.1 to 2.60.2
  - Replace 0002-Only-build-tests-if-certain-conditions-are-met.patch in favor
    of 0002-add-option-to-build-tests.patch. This allows tests to be disabled
    explicitly, and allows building on older distributions.

v5 -> v6:
  - Bump version from 2.60.2 to 2.60.3
  - Make a better commit log with more explination.
  - Add LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE to fix finding
    glib-genmarshal. (Thanks to Arnout, Yann, and Thomas!)

v6 -> v7:
  - Removed inappropriate depends on !BR2_nds32 in the Config.in file.
    This was used for some debugging and I missed it.

 ...01-fix-compile-time-atomic-detection.patch |   4 +-
 .../0002-add-option-to-build-tests.patch      | 103 +++++++++++++++
 package/libglib2/0002-disable-tests.patch     |  60 ---------
 ...03-gdbus-Avoid-printing-null-strings.patch |  73 -----------
 .../0003-remove-cpp-requirement.patch         |  96 ++++++++++++++
 ...mat-nonliteral-to-compiler-arguments.patch |  28 ++++
 ...dcode-python-path-into-various-tools.patch |  48 -------
 package/libglib2/libglib2.hash                |   4 +-
 package/libglib2/libglib2.mk                  | 122 ++++--------------
 9 files changed, 259 insertions(+), 279 deletions(-)
 create mode 100644 package/libglib2/0002-add-option-to-build-tests.patch
 delete mode 100644 package/libglib2/0002-disable-tests.patch
 delete mode 100644 package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch
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
diff --git a/package/libglib2/0002-add-option-to-build-tests.patch b/package/libglib2/0002-add-option-to-build-tests.patch
new file mode 100644
index 0000000000..35fcc700f3
--- /dev/null
+++ b/package/libglib2/0002-add-option-to-build-tests.patch
@@ -0,0 +1,103 @@
+From 8de64376005b8630ce5e29f45d5502a56b121173 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Wed, 8 May 2019 13:08:43 -0400
+Subject: [PATCH] add option to build tests.
+
+Upstream won't build tests when cross-compiling. However; this means still
+building the tests during a host build. Building the tests causes build
+failures on older distributions such as CentOS 6 and Debian 7 because the
+command `objcopy --add-symbol` is used when building the test
+"test_resources2," which is not available with the older version of objcopy
+provided by the distributions.
+
+Instead, add the option 'tests' which when set to false, enforces not
+building any tests, even when building the host variant.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ gio/meson.build     | 4 +++-
+ glib/meson.build    | 5 +++--
+ gobject/meson.build | 5 +++--
+ meson.build         | 6 +++++-
+ meson_options.txt   | 5 +++++
+ 5 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/gio/meson.build b/gio/meson.build
+index 4e5e021..925563c 100644
+--- a/gio/meson.build
++++ b/gio/meson.build
+@@ -994,4 +994,6 @@ if enable_systemtap
+ endif
+ 
+ subdir('fam')
+-subdir('tests')
++if build_tests
++  subdir('tests')
++endif
+diff --git a/glib/meson.build b/glib/meson.build
+index 8350ea2..bc1a7c5 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -370,5 +370,6 @@ if enable_systemtap
+     install_dir : tapset_install_dir,
+     install : true)
+ endif
+-
+-subdir('tests')
++if build_tests
++  subdir('tests')
++endif
+diff --git a/gobject/meson.build b/gobject/meson.build
+index db8d3c4..094cb58 100644
+--- a/gobject/meson.build
++++ b/gobject/meson.build
+@@ -165,5 +165,6 @@ if enable_systemtap
+     install_dir : tapset_install_dir,
+     install : true)
+ endif
+-
+-subdir('tests')
++if build_tests
++  subdir('tests')
++endif
+diff --git a/meson.build b/meson.build
+index b57b2d6..d625a50 100644
+--- a/meson.build
++++ b/meson.build
+@@ -75,6 +75,8 @@ installed_tests_enabled = get_option('installed_tests')
+ installed_tests_template = files('template.test.in')
+ installed_tests_template_tap = files('template-tap.test.in')
+ 
++build_tests = get_option('tests')
++
+ add_project_arguments('-D_GNU_SOURCE', language: 'c')
+ 
+ # Disable strict aliasing;
+@@ -1994,8 +1996,10 @@ subdir('gthread')
+ subdir('gmodule')
+ subdir('gio')
+ subdir('fuzzing')
+-subdir('tests')
+ 
++if build_tests
++  subdir('tests')
++endif
+ # xgettext is optional (on Windows for instance)
+ if find_program('xgettext', required : get_option('nls')).found()
+   subdir('po')
+diff --git a/meson_options.txt b/meson_options.txt
+index 5c5b4df..7ffde0a 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -89,3 +89,8 @@ option('nls',
+        value : 'auto',
+        yield: true,
+        description : 'Enable native language support (translations)')
++
++option('tests',
++       type : 'boolean',
++       value : false,
++       description : 'Build tests')
+-- 
+2.21.0
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
diff --git a/package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch b/package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch
deleted file mode 100644
index 800d3609d6..0000000000
--- a/package/libglib2/0003-gdbus-Avoid-printing-null-strings.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 79492bb914e419c54298ba6324e3d595e51c16c3 Mon Sep 17 00:00:00 2001
-From: Ernestas Kulik <ekulik@redhat.com>
-Date: Tue, 29 Jan 2019 09:50:46 +0100
-Subject: [PATCH] gdbus: Avoid printing null strings
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This mostly affects the 2.56 branch, but, given that GCC 9 is being
-stricter about passing null string pointers to printf-like functions, it
-might make sense to proactively fix such calls.
-
-gdbusauth.c: In function '_g_dbus_auth_run_server':
-gdbusauth.c:1302:11: error: '%s' directive argument is null
-[-Werror=format-overflow=]
- 1302 |           debug_print ("SERVER: WaitingForBegin, read '%s'",
- line);
-       |
-
-gdbusmessage.c: In function ?g_dbus_message_to_blob?:
-gdbusmessage.c:2730:30: error: ?%s? directive argument is null [-Werror=format-overflow=]
- 2730 |       tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
-      |
-
-Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
----
- gio/gdbusauth.c    | 2 +-
- gio/gdbusmessage.c | 5 ++---
- 2 files changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/gio/gdbusauth.c b/gio/gdbusauth.c
-index 1f8ea8057..752ec23fc 100644
---- a/gio/gdbusauth.c
-+++ b/gio/gdbusauth.c
-@@ -1272,9 +1272,9 @@ _g_dbus_auth_run_server (GDBusAuth              *auth,
-                                                     &line_length,
-                                                     cancellable,
-                                                     error);
--          debug_print ("SERVER: WaitingForBegin, read '%s'", line);
-           if (line == NULL)
-             goto out;
-+          debug_print ("SERVER: WaitingForBegin, read '%s'", line);
-           if (g_strcmp0 (line, "BEGIN") == 0)
-             {
-               /* YAY, done! */
-diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
-index 3221b925d..3a1a1f9e9 100644
---- a/gio/gdbusmessage.c
-+++ b/gio/gdbusmessage.c
-@@ -2731,7 +2731,6 @@ g_dbus_message_to_blob (GDBusMessage          *message,
-   if (message->body != NULL)
-     {
-       gchar *tupled_signature_str;
--      tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
-       if (signature == NULL)
-         {
-           g_set_error (error,
-@@ -2739,10 +2738,10 @@ g_dbus_message_to_blob (GDBusMessage          *message,
-                        G_IO_ERROR_INVALID_ARGUMENT,
-                        _("Message body has signature ?%s? but there is no signature header"),
-                        signature_str);
--          g_free (tupled_signature_str);
-           goto out;
-         }
--      else if (g_strcmp0 (tupled_signature_str, g_variant_get_type_string (message->body)) != 0)
-+      tupled_signature_str = g_strdup_printf ("(%s)", signature_str);
-+      if (g_strcmp0 (tupled_signature_str, g_variant_get_type_string (message->body)) != 0)
-         {
-           g_set_error (error,
-                        G_IO_ERROR,
---
-2.21.0
-
diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
new file mode 100644
index 0000000000..f0cb510c5d
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
+   version : '2.60.3',
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
+@@ -1440,20 +1439,6 @@ if g_have_iso_c_varargs
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
+@@ -1995,7 +1980,6 @@ subdir('gobject')
+ subdir('gthread')
+ subdir('gmodule')
+ subdir('gio')
+-subdir('fuzzing')
+
+ if build_tests
+   subdir('tests')
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
index faa01ef563..763c645b85 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.4.sha256sum
-sha256  27f703d125efb07f8a743666b580df0b4095c59fc8750e8890132c91d437504c  glib-2.56.4.tar.xz
+# https://download.gnome.org/sources/glib/2.60/glib-2.60.3.sha256sum
+sha256  04ab0d560d45790d055f50db2d69974eab8b693a77390075462c56e652b760b9  glib-2.60.3.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 63bfec32d6..78d6e5ab32 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,86 +4,13 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.60
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
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
@@ -91,14 +18,14 @@ LIBGLIB2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
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
@@ -117,31 +44,28 @@ HOST_LIBGLIB2_DEPENDENCIES = \
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
@@ -161,6 +85,16 @@ endef
 
 LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES
 
+# Newer versions of libglib2 prefix glib-genmarshal, gobject-query, and
+# glib-mkenums with ${bindir}. Unfortunately, this will resolve to the host
+# systems /bin/ directory, which will cause compilation issues if the host does
+# not have these programs. By removing the ${bindir}/ prefix, these programs
+# are resolved in PATH instead.
+define LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
+	$(SED) 's%$${bindir}/%%g' $(STAGING_DIR)/usr/lib/pkgconfig/glib-2.0.pc
+endef
+LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
+
 # Remove schema sources/DTDs, we use staging ones to compile them.
 # Do so at target finalization since other packages install additional
 # ones and we want to deal with it in a single place.
@@ -181,7 +115,7 @@ endef
 LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
 LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
 
 LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
-- 
2.21.0
