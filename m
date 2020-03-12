From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 12 Mar 2020 12:42:55 -0700
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: bump version
 to 2.64.0
Message-ID: <20200312194256.3786578-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Remove upstream patches.
  - Change cross-compile options to upstream equivilants
  - Add -Ddoctool=disabled to GOBJECT_INTROSPECTION_CONF_OPTS
  - Change -Dcairo from a bool to a feature.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...> 0001-Add-rpath-links-to-ccompiler.patch} |   0
 ...lete-upstream-attempt-at-cross-compi.patch |  33 ----
 ...d-cross-compilation-support-to-meson.patch | 163 ------------------
 ...error-return-codes-from-ldd-wrapper.patch} |   2 +-
 .../0003-disable-tests.patch                  |  19 +-
 ...canner-add-use-binary-wrapper-option.patch |  52 ------
 ...scanner-add-a-use-ldd-wrapper-option.patch |  48 ------
 ...scanner-add-a-lib-dirs-envvar-option.patch |  73 --------
 .../gobject-introspection.hash                |   4 +-
 .../gobject-introspection.mk                  |  17 +-
 10 files changed, 25 insertions(+), 386 deletions(-)
 rename package/gobject-introspection/{0007-Add-rpath-links-to-ccompiler.patch => 0001-Add-rpath-links-to-ccompiler.patch} (100%)
 delete mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 delete mode 100644 package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
 rename package/gobject-introspection/{0008-ignore-error-return-codes-from-ldd-wrapper.patch => 0002-ignore-error-return-codes-from-ldd-wrapper.patch} (94%)
 delete mode 100644 package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
 delete mode 100644 package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
 delete mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch

diff --git a/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch
similarity index 100%
rename from package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
rename to package/gobject-introspection/0001-Add-rpath-links-to-ccompiler.patch
diff --git a/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
deleted file mode 100644
index 1e8bd3518a..0000000000
--- a/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3a9d1e5ee0aae56fafec0beba2014c19e4ff310c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 23 Mar 2016 17:07:28 +0200
-Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile support
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- common.mk                | 4 ----
- giscanner/gdumpparser.py | 6 ------
- 2 files changed, 10 deletions(-)
-
-diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
-index 1134f33..9bdc2bc 100644
---- a/giscanner/gdumpparser.py
-+++ b/giscanner/gdumpparser.py
-@@ -156,12 +156,6 @@ blob containing data gleaned from GObject's primitive introspection."""
-         out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
-
-         args = []
--
--        # Prepend the launcher command and arguments, if defined
--        launcher = os.environ.get('GI_CROSS_LAUNCHER')
--        if launcher:
--            args.extend(launcher.split())
--
-         args.extend(self._binary.args)
-         args.append('--introspect-dump=%s,%s' % (in_path, out_path))
- 
--- 
-2.7.0
-
diff --git a/package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch b/package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
deleted file mode 100644
index 5e3ac59dd9..0000000000
--- a/package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 2b3bce1526b538dc2c7fa223eaf9808858aa1b06 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 15 Nov 2018 15:10:05 +0100
-Subject: [PATCH] add cross-compilation support to meson
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- gir/meson.build   | 62 ++++++++++++++++++++++++++++++++++-------------
- meson.build       |  4 ++-
- meson_options.txt | 20 +++++++++++++++
- 3 files changed, 68 insertions(+), 18 deletions(-)
-
-diff --git a/gir/meson.build b/gir/meson.build
-index 85ae575..327c134 100644
---- a/gir/meson.build
-+++ b/gir/meson.build
-@@ -36,16 +36,29 @@ gir_files = [
- typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
- install_data(gir_files, install_dir: girdir)
- 
--scanner_command = [
--  python,
--  girscanner,
--  '--output=@OUTPUT@',
--  '--no-libtool',
--  '--quiet',
--  '--reparse-validate',
--  '--add-include-path', join_paths(meson.current_build_dir()),
--  '--add-include-path', join_paths(meson.current_source_dir()),
--]
-+if get_option('enable-host-gi')
-+    scanner_command = [
-+      'g-ir-scanner',
-+      '--output=@OUTPUT@',
-+      '--no-libtool',
-+      '--quiet',
-+      '--reparse-validate',
-+      '--add-include-path', join_paths(meson.current_build_dir()),
-+      '--add-include-path', join_paths(meson.current_source_dir()),
-+    ]
-+else
-+    scanner_command = [
-+      python,
-+      girscanner,
-+      '--output=@OUTPUT@',
-+      '--no-libtool',
-+      '--quiet',
-+      '--reparse-validate',
-+      '--add-include-path', join_paths(meson.current_build_dir()),
-+      '--add-include-path', join_paths(meson.current_source_dir()),
-+    ]
-+endif
-+
- 
- dep_type = glib_dep.type_name()
- if dep_type == 'internal'
-@@ -58,6 +71,12 @@ if dep_type == 'internal'
-                       '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
- endif
- 
-+if get_option('enable-gi-cross-wrapper') != ''
-+  scanner_command += ['--use-binary-wrapper=' + get_option('enable-gi-cross-wrapper')]
-+endif
-+if get_option('enable-gi-ldd-wrapper') != ''
-+  scanner_command += ['--use-ldd-wrapper=' + get_option('enable-gi-ldd-wrapper')]
-+endif
- # Take a glob and print to newlines
- globber = '''
- from glob import glob
-@@ -84,8 +103,8 @@ glib_command = scanner_command + [
- 
- if dep_type == 'pkgconfig'
-   glib_command += ['--external-library', '--pkg=glib-2.0']
--  glib_libdir = glib_dep.get_pkgconfig_variable('libdir')
--  glib_incdir = join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
-+  glib_libdir = get_option('pkgconfig-sysroot-path') + glib_dep.get_pkgconfig_variable('libdir')
-+  glib_incdir = get_option('pkgconfig-sysroot-path') + join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
-   glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
-   glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
-   glib_files += join_paths(glib_libincdir, 'glibconfig.h')
-@@ -339,7 +358,7 @@ endforeach
- if giounix_dep.found()
-   if dep_type == 'pkgconfig'
-     gio_command += ['--pkg=gio-unix-2.0']
--    giounix_includedir = join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
-+    giounix_includedir = get_option('pkgconfig-sysroot-path') + join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
-     # Get the installed gio-unix header list
-     ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
-     if ret.returncode() != 0
-@@ -422,15 +441,24 @@ gir_files += custom_target('gir-girepository',
- )
- 
- typelibs = []
-+if get_option('enable-gi-cross-wrapper') != ''
-+    gircompiler_command = [get_option('enable-gi-cross-wrapper'), gircompiler.full_path(), '-o', '@OUTPUT@', '@INPUT@',
-+              '--includedir', meson.current_build_dir(),
-+              '--includedir', meson.current_source_dir(),
-+    ]
-+else
-+    gircompiler_command = [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
-+              '--includedir', meson.current_build_dir(),
-+              '--includedir', meson.current_source_dir(),
-+    ]
-+endif
-+
- foreach gir : gir_files
-   typelibs += custom_target('generate-typelib- at 0@'.format(gir).underscorify(),
-     input: gir,
-     output: '@BASENAME at .typelib',
-     depends: [gobject_gir, ],
--    command: [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
--              '--includedir', meson.current_build_dir(),
--              '--includedir', meson.current_source_dir(),
--    ],
-+    command: gircompiler_command,
-     install: true,
-     install_dir: typelibdir,
-   )
-diff --git a/meson.build b/meson.build
-index 95bbd2b..f7baefd 100644
---- a/meson.build
-+++ b/meson.build
-@@ -163,7 +163,9 @@ endif
- subdir('girepository')
- subdir('tools')
- subdir('giscanner')
--subdir('gir')
-+if get_option('enable-introspection-data') == true
-+    subdir('gir')
-+endif
- subdir('examples')
- subdir('docs')
- subdir('tests')
-diff --git a/meson_options.txt b/meson_options.txt
-index 445a68a..a325511 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -25,3 +25,23 @@ option('python', type: 'string', value: 'python3',
- option('gir_dir_prefix', type: 'string',
-   description: 'Intermediate prefix for gir installation under ${prefix}'
- )
-+
-+option('enable-host-gi', type: 'boolean', value : false,
-+  description: 'Use gobject introspection tools installed in the host system (useful when cross-compiling)'
-+)
-+
-+option('enable-gi-cross-wrapper', type: 'string',
-+  description: 'Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)'
-+)
-+
-+option('enable-gi-ldd-wrapper', type: 'string',
-+  description: 'Use a ldd wrapper instead of system ldd command in giscanner (useful when cross-compiling)'
-+)
-+
-+option('enable-introspection-data', type: 'boolean', value : true,
-+  description: 'Build introspection data (.gir and .typelib files) in addition to library and tools'
-+)
-+
-+option('pkgconfig-sysroot-path', type: 'string',
-+  description: 'Specify a sysroot path to prepend to pkgconfig output (useful when cross-compiling)'
-+)
diff --git a/package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0002-ignore-error-return-codes-from-ldd-wrapper.patch
similarity index 94%
rename from package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
rename to package/gobject-introspection/0002-ignore-error-return-codes-from-ldd-wrapper.patch
index 568758d332..d43dc1393e 100644
--- a/package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
+++ b/package/gobject-introspection/0002-ignore-error-return-codes-from-ldd-wrapper.patch
@@ -17,7 +17,7 @@ diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
 index d67df95..80352a6 100644
 --- a/giscanner/shlibs.py
 +++ b/giscanner/shlibs.py
-@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, libraries):
+@@ -103,7 +103,7 @@ def _resolve_non_libtool(options, binary, libraries):
              args.extend(['otool', '-L', binary.args[0]])
          else:
              args.extend(['ldd', binary.args[0]])
diff --git a/package/gobject-introspection/0003-disable-tests.patch b/package/gobject-introspection/0003-disable-tests.patch
index fcc5a794f3..c75c7512d9 100644
--- a/package/gobject-introspection/0003-disable-tests.patch
+++ b/package/gobject-introspection/0003-disable-tests.patch
@@ -9,21 +9,26 @@ the subdir tests alltogether fixes this issue.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
+ meson.build | 6 ------
+ 1 file changed, 6 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index a5e825f..981e936 100644
+index eed4d6b..5058664 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -171,7 +171,6 @@ subdir('giscanner')
- subdir('gir')
- subdir('examples')
+@@ -214,12 +214,6 @@ if get_option('build_introspection_data') == true
+ endif
  subdir('docs')
--subdir('tests')
  
+-# The tests will also run, which is not possible if they
+-# were built for a different architecture.
+-if not meson.is_cross_build()
+-    subdir('tests')
+-endif
+-
  install_data('Makefile.introspection', install_dir: join_paths(get_option('datadir'), 'gobject-introspection-1.0'))
  install_data('m4/introspection.m4', install_dir: join_paths(get_option('datadir'), 'aclocal'))
+ 
 -- 
 2.24.1
 
diff --git a/package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch b/package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
deleted file mode 100644
index cffc2d954d..0000000000
--- a/package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 704b888d0abfb01067352c40156f49f655691c7c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 19 Oct 2015 18:26:40 +0300
-Subject: [PATCH] giscanner: add --use-binary-wrapper option
-
-With this option, giscanner will use a wrapper executable to run
-binaries it's producing, instead of running them directly. This
-is useful when binaries are cross-compiled and cannot be run directly,
-but they can be run using for example QEMU emulation.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- giscanner/scannermain.py | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index 633496f..d684cd0 100755
---- a/giscanner/scannermain.py
-+++ b/giscanner/scannermain.py
-@@ -120,6 +120,9 @@ def _get_option_parser():
-     parser.add_option("", "--program",
-                       action="store", dest="program", default=None,
-                       help="program to execute")
-+    parser.add_option("", "--use-binary-wrapper",
-+                      action="store", dest="wrapper", default=None,
-+                      help="wrapper to use for running programs (useful when cross-compiling)")
-     parser.add_option("", "--program-arg",
-                       action="append", dest="program_args", default=[],
-                       help="extra arguments to program")
-@@ -417,6 +420,17 @@ def create_binary(transformer, options, args):
-                                               gdump_parser.get_error_quark_functions())
-
-     shlibs = resolve_shlibs(options, binary, options.libraries)
-+    if options.wrapper:
-+        # The wrapper needs the binary itself, not the libtool wrapper script,
-+        # so we check if libtool has sneaked the binary into .libs subdirectory
-+        # and adjust the path accordingly
-+        import os.path
-+        dir_name, binary_name  = os.path.split(binary.args[0])
-+        libtool_binary = os.path.join(dir_name, '.libs', binary_name)
-+        if os.path.exists(libtool_binary):
-+            binary.args[0] = libtool_binary
-+      # Then prepend the wrapper to the command line to execute
-+        binary.args = [options.wrapper] + binary.args
-     gdump_parser.set_introspection_binary(binary)
-     gdump_parser.parse()
-     return shlibs
--- 
-2.7.0
-
diff --git a/package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch b/package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
deleted file mode 100644
index 386c1c34b0..0000000000
--- a/package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d4ad57fd4a32c4f0d2f0522a3090ef940746431b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Oct 2015 16:28:46 +0200
-Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
-
-This is useful in cross-compile environments where system's ldd
-command does not work on binaries built for a different architecture
-
-Upstream-Status: Pending [review in oe-core]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- giscanner/scannermain.py | 3 +++
- giscanner/shlibs.py      | 4 +++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index d684cd0..1b3b369 100755
---- a/giscanner/scannermain.py
-+++ b/giscanner/scannermain.py
-@@ -123,6 +123,9 @@ def _get_option_parser():
-     parser.add_option("", "--use-binary-wrapper",
-                       action="store", dest="wrapper", default=None,
-                       help="wrapper to use for running programs (useful when cross-compiling)")
-+    parser.add_option("", "--use-ldd-wrapper",
-+                      action="store", dest="ldd_wrapper", default=None,
-+                      help="wrapper to use instead of ldd (useful when cross-compiling)")
-     parser.add_option("", "--program-arg",
-                       action="append", dest="program_args", default=[],
-                       help="extra arguments to program")
-diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index c93d20c..c5b5942 100644
---- a/giscanner/shlibs.py
-+++ b/giscanner/shlibs.py
-@@ -97,7 +97,9 @@ def _resolve_non_libtool(options, binary, libraries):
-             args.extend(libtool)
-             args.append('--mode=execute')
-         platform_system = platform.system()
--        if platform_system == 'Darwin':
-+        if options.ldd_wrapper:
-+            args.extend([options.ldd_wrapper, binary.args[0]])
-+        elif platform_system == 'Darwin':
-             args.extend(['otool', '-L', binary.args[0]])
-         else:
-             args.extend(['ldd', binary.args[0]])
--- 
-2.7.0
-
diff --git a/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch b/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
deleted file mode 100644
index 06f5635610..0000000000
--- a/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 3a9b3d8179b7eb9d2cc93da31578945bc03a45c3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Apr 2018 12:56:15 -0400
-Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
-
-By default LD_LIBRARY_PATH is set to the list of target library paths;
-this breaks down in cross-compilation environment, as we need to run a
-native emulation wrapper rather than the target binary itself. This patch
-allows exporting those paths to a different environment variable
-which can be picked up and used by the wrapper.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- giscanner/ccompiler.py   | 4 ++--
- giscanner/dumper.py      | 3 ++-
- giscanner/scannermain.py | 3 +++
- 3 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index d10327c..6cf25d5 100644
---- a/giscanner/ccompiler.py
-+++ b/giscanner/ccompiler.py
-@@ -174,7 +174,7 @@ class CCompiler(object):
- 
-             self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
- 
--    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths):
-+    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths, lib_dirs_envvar):
-         # An "internal" link is where the library to be introspected
-         # is being built in the current directory.
- 
-@@ -184,7 +184,7 @@ class CCompiler(object):
-         if os.name == 'nt':
-             runtime_path_envvar = ['LIB', 'PATH']
-         else:
--            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH']
-+            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
-             # Search the current directory first
-             # (This flag is not supported nor needed for Visual C++)
-             args.append('-L.')
-diff --git a/giscanner/dumper.py b/giscanner/dumper.py
-index 3c7220b..0abd565 100644
---- a/giscanner/dumper.py
-+++ b/giscanner/dumper.py
-@@ -244,7 +244,8 @@ class DumpCompiler(object):
-                                                    libtool,
-                                                    self._options.libraries,
-                                                    self._options.extra_libraries,
--                                                   self._options.library_paths)
-+                                                   self._options.library_paths,
-+                                                   self._options.lib_dirs_envvar)
-             args.extend(pkg_config_libs)
- 
-         else:
-diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
-index d262785..51c9570 100755
---- a/giscanner/scannermain.py
-+++ b/giscanner/scannermain.py
-@@ -126,6 +126,9 @@ def _get_option_parser():
-     parser.add_option("", "--use-ldd-wrapper",
-                       action="store", dest="ldd_wrapper", default=None,
-                       help="wrapper to use instead of ldd (useful when cross-compiling)")
-+    parser.add_option("", "--lib-dirs-envvar",
-+                      action="store", dest="lib_dirs_envvar", default=None,
-+                      help="environment variable to write a list of library directories to (for running the transient binary), instead of standard LD_LIBRARY_PATH")
-     parser.add_option("", "--program-arg",
-                       action="append", dest="program_args", default=[],
-                       help="extra arguments to program")
--- 
-2.14.3
-
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index 0454c59565..c6923f8599 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,4 +1,4 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.62/gobject-introspection-1.62.0.sha256sum
-sha256 b1ee7ed257fdbc008702bdff0ff3e78a660e7e602efa8f211dc89b9d1e7d90a2 gobject-introspection-1.62.0.tar.xz
+#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.64/gobject-introspection-1.64.0.sha256sum
+sha256 eac05a63091c81adfdc8ef34820bcc7e7778c5b9e34734d344fc9e69ddf4fc82 gobject-introspection-1.64.0.tar.xz
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING.LGPL
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING.GPL
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 67e5e37dee..c18a1f17d3 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.62
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.64
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
@@ -37,19 +37,22 @@ GOBJECT_INTROSPECTION_NINJA_ENV += \
 # the package will attempt to use the systems libglib2 which will fail
 # if the systems libglib2 version is older than 2.60.
 HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
-	-Denable-introspection-data=false
+	-Dbuild_introspection_data=false
 
 # Use the host gi-scanner to prevent the scanner from generating incorrect
 # elf classes.
 GOBJECT_INTROSPECTION_CONF_OPTS = \
-	-Denable-host-gi=true \
-	-Denable-gi-cross-wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper" \
-	-Denable-gi-ldd-wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
-	-Denable-introspection-data=true
+	-Dgi_cross_use_host_gi=true \
+	-Dgi_cross_binary_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper" \
+	-Dgi_cross_ldd_wrapper="$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
+	-Dbuild_introspection_data=true \
+	-Ddoctool=disabled
 
 ifeq ($(BR2_PACKAGE_CAIRO),y)
 GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
-GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=true
+GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=enabled
+else
+GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=disabled
 endif
 
 # GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to ${HOME}
-- 
2.24.1
