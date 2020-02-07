From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  6 Feb 2020 18:38:34 -0800
Subject: [Buildroot] [PATCH v16 4/4] package/gobject-introspection: new
 package
In-Reply-To: <20200207023834.877032-1-aduskett@gmail.com>
References: <20200207023834.877032-1-aduskett@gmail.com>
Message-ID: <20200207023834.877032-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

GObject introspection is a middleware layer between C
libraries (using GObject) and language bindings. The C library
can be scanned at compile time and generate a metadata file,
in addition to the actual native C library. Then at runtime,
language bindings can read this metadata and automatically
provide bindings to call into the C library.

There's an XML format called GIR used by GObject-Introspection.
The purpose of it is to provide a standard structure to access the complete
available API that a library or other unit of code exports. It's
language-agnostic using namespaces to separate core, language, or
library-specific functionality.

Cross-compiling gobject-introspection is not an easy task. The main issue is
that in the process of creating the XML files, gobject-introspection must first
run and scan the binary, which, if the binary is cross-compiled, would not
typically be possible from the host system.

Because of this limitation, we use several wrappers to call instead first out
qemu, which runs the native scanner to create the binaries.

There are seven total patches and four different wrapper files needed to
successfully cross-compile and run this package, many of them are from
open-embedded, but one of them is of my own doing.

1) Revert a previous, incomplete attempt at adding cross-compiling support.

2) Add support for cross-compiling with meson.

3) Disable tests.

4) Add an option to use a binary wrapper; this patch will force giscanner to
   use a wrapper executable to run binaries it's producing, instead of
   attempting to run them from the host.

5) Add an option to use an LDD wrapper, again, useful for cross-compiled
   environments.

6) Add a --lib-dirs-envar option to pass to giscanner. (See patch for details.)

7) Add rpath-links to ccompiler: when passing the PACKAGE_GIR_EXTRA_LIBS_PATH
   to the ccompiler.py script, ccompiler.py needs to add -Wl,-rpath-link to the
   environment for the package to correctly link against the passed on paths.

8) Ignore error return codes from ldd-wrapper because prelink-rtld returns 127
   when it can't find a library, which breaks subprocess.check_output().

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v15 -> v16:
  - Re-added missing Config.in entry.
  - Removed a set -x in g-ir-scanner-wrapper
  - Fixed paths in g-ir-compiler.in
  - Removed GOBJECT_INTROSPECTION_PC_FILE_FIXUP in gobject-introspection.mk
    because the toolsdir entry no longer exists in the .pc file.
  - Cleaned up the grammar in the commit message.

Changes v14 -> v15:
  - Fixed number of patches in commit message. (Arnout)
  - Fixed license information (Adam)
  - Sorted dependencies (Arnout)
  - Removed redundant comment (Arnout)
  - Reordered host and target macros (Arnout)
  - Moved wrappers and wrapper installation logic to the host dir. (Arnout)
  - Combined the find functions in the target_finalize_hooks. (Arnout)
  

Changes v13 -> v14:
  - Bump to version 1.62.0

Changes v10 -> v11:
  - reorder config.in entries: arch deps first, then toolchain deps
    and order packages deps alphabetically (Yann)
  - drop dependency on threads, wchar, and !static: it's implicit from
    glibc (Yann)
  - Bump to version 1.60.2
  - Switched to a meson build system as autotools is no longer supported with
    gobject-introspection 1.60.x.
  - Removed the following patches that are no longer needed:
      - 0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
      - 0005-user-PYTHON_CONFIG-to-find-includes.patch
      - 0008-fix-gobject-pc.file.patch
  - Add the following patches:
      - 0002-add-cross-compilation-support-to-meson.patch
      - 0003-meson.build-disable-tests-when-cross-compiling.patch
      - 0008-ignore-error-return-codes-from-ldd-wrapper.patch

Changes v9 -> v10:
  - Makefile cleanup
  - Fix license syntax (Thomas)
  - Add libffi as a mandatory dependency (Thomas)
  - remove --disalbe-static (Thomas)
  - add --with-cairo if the cairo package is selected (Thomas)
  - Change PYTHON_INCLUDES to PYTHON_CONFIG in gobject-introspection.mk
    (Thomas)
  - Use | for all sed functions (Thomas)
  - Remove GOBJECT_INTROSPECTION_WRAPPERS (Thomas)
  - Add GOBJECT_INTROSPECTION_REMOVE_DEVELOPMENT_FILES target finalize
    hook. (Thomas)
  - Use $(dirname $0) in wrappers instead of $STAGING_DIR (Thomas)
  - Remove _GIR_EXTRA_LIBS_PATH in pkg-autotools.mk in favor of a
    seperate patch. (Thomas)

Changes v8 -> v9:
  - Create the $(STAGING_DIR)/usr/lib/gio/modules-dummy directory in the
    GOBJECT_INTROSPECTION_POST_PATCH_HOOKS to prevent qemu from
    segfaulting when g-ir-scanner-qemuwrapper is ran.
  - Remove the $(STAGING_DIR) prefix from gobject-introspection-1.0.pc
    to prevent pkg-config from appending a second staging_dir to the path
    of the g-ir-compiler. This prevents packages such a gstreamer1 from
    trying to call $(STAGING_DIR)/$(STAGING_DIR)/usr/bin/g-ir-compiler,
    which will break the build.

Changes v7 -> v8:
  - Add "select BR2_PACKAGE_HOST_PRELINK_CROSS" to Config.in

Changes v6 -> v7:
  - Remove the cross-ldd script in favor of the prelink-cross package.
  - Install the ldd and qemu wrappers in a post patch hook seperate of
    the other wrappers.
  - Set --enable-introspection-data in the configure options.

Changes v5 -> v6:
  - Update gobject-introspection to 1.56.1
  - Remove upstreamed 0008-add-Float128.patch

Changes v4 -> v5:
  - Added a more detailed commit message (Yann)
  - Removed  $HOST_DIR/bin/qemu- at HOST_QEMU_ARCH@ @HOST_QEMU_CPU_TUNE@
    in favor of @QEMU_USER@ (Thanks Yann)

Changes v3 -> v4:
  - Removed RFC tag.
  - Added 0007-Add-rpath-links-to-ccompiler.patch
  - Removed config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch as it is not
    Yocto specific.
  - Added the _GIR_EXTRA_LIBS_PATH to pkg-autotools.mk. This allows
    package specific Gir libraries to be passed on to
    g-ir-scanner-qemuwrapper.
  - Fixed a typo in g-ir-scanner-qemuwrapper.in.
  - Remove BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS_TARGET in
    favor of BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS

Changes v2 -> v3:
  - Removed Linux kernel dependency (baruch)
  - Changed $(LINUX_VERSION) to $(BR2_TOOLCHAIN_HEADERS_AT_LEAST)
    (baruch)
  - Changed @LINUX_VERSION@ in g-ir-scanner-qemuwrapper.in to
    @TOOLCHAIN_HEADERS_VERSION@ to match the above variable change.
  - Added BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS_TARGET in
    Config.in with only BR2_arm selected for now.
  - Removed BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS in favor of the above
    change.
  - Added two new lines in the base Makefile which removes any remaining
    .gir or .rnc files from the target filing system, as these are not
    needed or runtime, only compile time.

Changes v1 -> v2:
  - Fixed wrappers
  - Added 0007-giscanner-add-a-lib-dirs-envvar-option.patch
  - Added 0008-add-Float128.patch

 DEVELOPERS                                    |   1 +
 package/Config.in                             |   1 +
 ...lete-upstream-attempt-at-cross-compi.patch |  33 ++++
 ...d-cross-compilation-support-to-meson.patch | 163 ++++++++++++++++++
 .../0003-disable-tests.patch                  |  29 ++++
 ...canner-add-use-binary-wrapper-option.patch |  52 ++++++
 ...scanner-add-a-use-ldd-wrapper-option.patch |  48 ++++++
 ...scanner-add-a-lib-dirs-envvar-option.patch |  73 ++++++++
 .../0007-Add-rpath-links-to-ccompiler.patch   |  29 ++++
 ...-error-return-codes-from-ldd-wrapper.patch |  28 +++
 package/gobject-introspection/Config.in       |  33 ++++
 .../gobject-introspection/g-ir-compiler.in    |   3 +
 .../g-ir-scanner-lddwrapper.in                |   2 +
 .../g-ir-scanner-qemuwrapper.in               |  17 ++
 package/gobject-introspection/g-ir-scanner.in |   8 +
 .../gobject-introspection.hash                |   4 +
 .../gobject-introspection.mk                  | 116 +++++++++++++
 17 files changed, 640 insertions(+)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
 create mode 100644 package/gobject-introspection/0003-disable-tests.patch
 create mode 100644 package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
 create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
 create mode 100644 package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100644 package/gobject-introspection/g-ir-compiler.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner.in
 create mode 100644 package/gobject-introspection/gobject-introspection.hash
 create mode 100644 package/gobject-introspection/gobject-introspection.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7db172d45f..e17fece9a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -31,6 +31,7 @@ F:	package/audit/
 F:	package/busybox/
 F:	package/checkpolicy/
 F:	package/cppdb/
+F:	package/gobject-introspection/
 F:	package/gstreamer1/gstreamer1/
 F:	package/gstreamer1/gstreamer1-mm/
 F:	package/gstreamer1/gst1-plugins-bad/
diff --git a/package/Config.in b/package/Config.in
index bad4f9cba6..0132bc763a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1774,6 +1774,7 @@ menu "Other"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
+	source "package/gobject-introspection/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/jemalloc/Config.in"
diff --git a/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch b/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
new file mode 100644
index 0000000000..1e8bd3518a
--- /dev/null
+++ b/package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
@@ -0,0 +1,33 @@
+From 3a9d1e5ee0aae56fafec0beba2014c19e4ff310c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 23 Mar 2016 17:07:28 +0200
+Subject: [PATCH] Revert an incomplete upstream attempt at cross-compile support
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ common.mk                | 4 ----
+ giscanner/gdumpparser.py | 6 ------
+ 2 files changed, 10 deletions(-)
+
+diff --git a/giscanner/gdumpparser.py b/giscanner/gdumpparser.py
+index 1134f33..9bdc2bc 100644
+--- a/giscanner/gdumpparser.py
++++ b/giscanner/gdumpparser.py
+@@ -156,12 +156,6 @@ blob containing data gleaned from GObject's primitive introspection."""
+         out_path = os.path.join(self._binary.tmpdir, 'dump.xml')
+
+         args = []
+-
+-        # Prepend the launcher command and arguments, if defined
+-        launcher = os.environ.get('GI_CROSS_LAUNCHER')
+-        if launcher:
+-            args.extend(launcher.split())
+-
+         args.extend(self._binary.args)
+         args.append('--introspect-dump=%s,%s' % (in_path, out_path))
+ 
+-- 
+2.7.0
+
diff --git a/package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch b/package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
new file mode 100644
index 0000000000..5e3ac59dd9
--- /dev/null
+++ b/package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
@@ -0,0 +1,163 @@
+From 2b3bce1526b538dc2c7fa223eaf9808858aa1b06 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 15 Nov 2018 15:10:05 +0100
+Subject: [PATCH] add cross-compilation support to meson
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ gir/meson.build   | 62 ++++++++++++++++++++++++++++++++++-------------
+ meson.build       |  4 ++-
+ meson_options.txt | 20 +++++++++++++++
+ 3 files changed, 68 insertions(+), 18 deletions(-)
+
+diff --git a/gir/meson.build b/gir/meson.build
+index 85ae575..327c134 100644
+--- a/gir/meson.build
++++ b/gir/meson.build
+@@ -36,16 +36,29 @@ gir_files = [
+ typelibdir = join_paths(get_option('libdir'), 'girepository-1.0')
+ install_data(gir_files, install_dir: girdir)
+ 
+-scanner_command = [
+-  python,
+-  girscanner,
+-  '--output=@OUTPUT@',
+-  '--no-libtool',
+-  '--quiet',
+-  '--reparse-validate',
+-  '--add-include-path', join_paths(meson.current_build_dir()),
+-  '--add-include-path', join_paths(meson.current_source_dir()),
+-]
++if get_option('enable-host-gi')
++    scanner_command = [
++      'g-ir-scanner',
++      '--output=@OUTPUT@',
++      '--no-libtool',
++      '--quiet',
++      '--reparse-validate',
++      '--add-include-path', join_paths(meson.current_build_dir()),
++      '--add-include-path', join_paths(meson.current_source_dir()),
++    ]
++else
++    scanner_command = [
++      python,
++      girscanner,
++      '--output=@OUTPUT@',
++      '--no-libtool',
++      '--quiet',
++      '--reparse-validate',
++      '--add-include-path', join_paths(meson.current_build_dir()),
++      '--add-include-path', join_paths(meson.current_source_dir()),
++    ]
++endif
++
+ 
+ dep_type = glib_dep.type_name()
+ if dep_type == 'internal'
+@@ -58,6 +71,12 @@ if dep_type == 'internal'
+                       '--extra-library=glib-2.0', '--extra-library=gobject-2.0']
+ endif
+ 
++if get_option('enable-gi-cross-wrapper') != ''
++  scanner_command += ['--use-binary-wrapper=' + get_option('enable-gi-cross-wrapper')]
++endif
++if get_option('enable-gi-ldd-wrapper') != ''
++  scanner_command += ['--use-ldd-wrapper=' + get_option('enable-gi-ldd-wrapper')]
++endif
+ # Take a glob and print to newlines
+ globber = '''
+ from glob import glob
+@@ -84,8 +103,8 @@ glib_command = scanner_command + [
+ 
+ if dep_type == 'pkgconfig'
+   glib_command += ['--external-library', '--pkg=glib-2.0']
+-  glib_libdir = glib_dep.get_pkgconfig_variable('libdir')
+-  glib_incdir = join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
++  glib_libdir = get_option('pkgconfig-sysroot-path') + glib_dep.get_pkgconfig_variable('libdir')
++  glib_incdir = get_option('pkgconfig-sysroot-path') + join_paths(glib_dep.get_pkgconfig_variable('includedir'), 'glib-2.0')
+   glib_libincdir = join_paths(glib_libdir, 'glib-2.0', 'include')
+   glib_files += join_paths(glib_incdir, 'gobject', 'glib-types.h')
+   glib_files += join_paths(glib_libincdir, 'glibconfig.h')
+@@ -339,7 +358,7 @@ endforeach
+ if giounix_dep.found()
+   if dep_type == 'pkgconfig'
+     gio_command += ['--pkg=gio-unix-2.0']
+-    giounix_includedir = join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
++    giounix_includedir = get_option('pkgconfig-sysroot-path') + join_paths(giounix_dep.get_pkgconfig_variable('includedir'), 'gio-unix-2.0')
+     # Get the installed gio-unix header list
+     ret = run_command(python, '-c', globber.format(join_paths(giounix_includedir, 'gio', '*.h')))
+     if ret.returncode() != 0
+@@ -422,15 +441,24 @@ gir_files += custom_target('gir-girepository',
+ )
+ 
+ typelibs = []
++if get_option('enable-gi-cross-wrapper') != ''
++    gircompiler_command = [get_option('enable-gi-cross-wrapper'), gircompiler.full_path(), '-o', '@OUTPUT@', '@INPUT@',
++              '--includedir', meson.current_build_dir(),
++              '--includedir', meson.current_source_dir(),
++    ]
++else
++    gircompiler_command = [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
++              '--includedir', meson.current_build_dir(),
++              '--includedir', meson.current_source_dir(),
++    ]
++endif
++
+ foreach gir : gir_files
+   typelibs += custom_target('generate-typelib- at 0@'.format(gir).underscorify(),
+     input: gir,
+     output: '@BASENAME at .typelib',
+     depends: [gobject_gir, ],
+-    command: [gircompiler, '-o', '@OUTPUT@', '@INPUT@',
+-              '--includedir', meson.current_build_dir(),
+-              '--includedir', meson.current_source_dir(),
+-    ],
++    command: gircompiler_command,
+     install: true,
+     install_dir: typelibdir,
+   )
+diff --git a/meson.build b/meson.build
+index 95bbd2b..f7baefd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -163,7 +163,9 @@ endif
+ subdir('girepository')
+ subdir('tools')
+ subdir('giscanner')
+-subdir('gir')
++if get_option('enable-introspection-data') == true
++    subdir('gir')
++endif
+ subdir('examples')
+ subdir('docs')
+ subdir('tests')
+diff --git a/meson_options.txt b/meson_options.txt
+index 445a68a..a325511 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -25,3 +25,23 @@ option('python', type: 'string', value: 'python3',
+ option('gir_dir_prefix', type: 'string',
+   description: 'Intermediate prefix for gir installation under ${prefix}'
+ )
++
++option('enable-host-gi', type: 'boolean', value : false,
++  description: 'Use gobject introspection tools installed in the host system (useful when cross-compiling)'
++)
++
++option('enable-gi-cross-wrapper', type: 'string',
++  description: 'Use a wrapper to run gicompiler and binaries produced by giscanner (useful when cross-compiling)'
++)
++
++option('enable-gi-ldd-wrapper', type: 'string',
++  description: 'Use a ldd wrapper instead of system ldd command in giscanner (useful when cross-compiling)'
++)
++
++option('enable-introspection-data', type: 'boolean', value : true,
++  description: 'Build introspection data (.gir and .typelib files) in addition to library and tools'
++)
++
++option('pkgconfig-sysroot-path', type: 'string',
++  description: 'Specify a sysroot path to prepend to pkgconfig output (useful when cross-compiling)'
++)
diff --git a/package/gobject-introspection/0003-disable-tests.patch b/package/gobject-introspection/0003-disable-tests.patch
new file mode 100644
index 0000000000..fcc5a794f3
--- /dev/null
+++ b/package/gobject-introspection/0003-disable-tests.patch
@@ -0,0 +1,29 @@
+From 473b4288d8f4e891d0d21f7b60ef8053c5cd7af9 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 3 Feb 2020 10:07:15 -0800
+Subject: [PATCH] disable tests
+
+If introspection data on the host is not built, meson throws the error:
+"Unknown variable "typelibs". Because tests are not required, removing
+the subdir tests alltogether fixes this issue.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a5e825f..981e936 100644
+--- a/meson.build
++++ b/meson.build
+@@ -171,7 +171,6 @@ subdir('giscanner')
+ subdir('gir')
+ subdir('examples')
+ subdir('docs')
+-subdir('tests')
+ 
+ install_data('Makefile.introspection', install_dir: join_paths(get_option('datadir'), 'gobject-introspection-1.0'))
+ install_data('m4/introspection.m4', install_dir: join_paths(get_option('datadir'), 'aclocal'))
+-- 
+2.24.1
+
diff --git a/package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch b/package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
new file mode 100644
index 0000000000..cffc2d954d
--- /dev/null
+++ b/package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
@@ -0,0 +1,52 @@
+From 704b888d0abfb01067352c40156f49f655691c7c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 19 Oct 2015 18:26:40 +0300
+Subject: [PATCH] giscanner: add --use-binary-wrapper option
+
+With this option, giscanner will use a wrapper executable to run
+binaries it's producing, instead of running them directly. This
+is useful when binaries are cross-compiled and cannot be run directly,
+but they can be run using for example QEMU emulation.
+
+Upstream-Status: Pending [review on oe-core list]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ giscanner/scannermain.py | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
+index 633496f..d684cd0 100755
+--- a/giscanner/scannermain.py
++++ b/giscanner/scannermain.py
+@@ -120,6 +120,9 @@ def _get_option_parser():
+     parser.add_option("", "--program",
+                       action="store", dest="program", default=None,
+                       help="program to execute")
++    parser.add_option("", "--use-binary-wrapper",
++                      action="store", dest="wrapper", default=None,
++                      help="wrapper to use for running programs (useful when cross-compiling)")
+     parser.add_option("", "--program-arg",
+                       action="append", dest="program_args", default=[],
+                       help="extra arguments to program")
+@@ -417,6 +420,17 @@ def create_binary(transformer, options, args):
+                                               gdump_parser.get_error_quark_functions())
+
+     shlibs = resolve_shlibs(options, binary, options.libraries)
++    if options.wrapper:
++        # The wrapper needs the binary itself, not the libtool wrapper script,
++        # so we check if libtool has sneaked the binary into .libs subdirectory
++        # and adjust the path accordingly
++        import os.path
++        dir_name, binary_name  = os.path.split(binary.args[0])
++        libtool_binary = os.path.join(dir_name, '.libs', binary_name)
++        if os.path.exists(libtool_binary):
++            binary.args[0] = libtool_binary
++      # Then prepend the wrapper to the command line to execute
++        binary.args = [options.wrapper] + binary.args
+     gdump_parser.set_introspection_binary(binary)
+     gdump_parser.parse()
+     return shlibs
+-- 
+2.7.0
+
diff --git a/package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch b/package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
new file mode 100644
index 0000000000..386c1c34b0
--- /dev/null
+++ b/package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
@@ -0,0 +1,48 @@
+From d4ad57fd4a32c4f0d2f0522a3090ef940746431b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Oct 2015 16:28:46 +0200
+Subject: [PATCH] giscanner: add a --use-ldd-wrapper option
+
+This is useful in cross-compile environments where system's ldd
+command does not work on binaries built for a different architecture
+
+Upstream-Status: Pending [review in oe-core]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ giscanner/scannermain.py | 3 +++
+ giscanner/shlibs.py      | 4 +++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
+index d684cd0..1b3b369 100755
+--- a/giscanner/scannermain.py
++++ b/giscanner/scannermain.py
+@@ -123,6 +123,9 @@ def _get_option_parser():
+     parser.add_option("", "--use-binary-wrapper",
+                       action="store", dest="wrapper", default=None,
+                       help="wrapper to use for running programs (useful when cross-compiling)")
++    parser.add_option("", "--use-ldd-wrapper",
++                      action="store", dest="ldd_wrapper", default=None,
++                      help="wrapper to use instead of ldd (useful when cross-compiling)")
+     parser.add_option("", "--program-arg",
+                       action="append", dest="program_args", default=[],
+                       help="extra arguments to program")
+diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
+index c93d20c..c5b5942 100644
+--- a/giscanner/shlibs.py
++++ b/giscanner/shlibs.py
+@@ -97,7 +97,9 @@ def _resolve_non_libtool(options, binary, libraries):
+             args.extend(libtool)
+             args.append('--mode=execute')
+         platform_system = platform.system()
+-        if platform_system == 'Darwin':
++        if options.ldd_wrapper:
++            args.extend([options.ldd_wrapper, binary.args[0]])
++        elif platform_system == 'Darwin':
+             args.extend(['otool', '-L', binary.args[0]])
+         else:
+             args.extend(['ldd', binary.args[0]])
+-- 
+2.7.0
+
diff --git a/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch b/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
new file mode 100644
index 0000000000..06f5635610
--- /dev/null
+++ b/package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
@@ -0,0 +1,73 @@
+From 3a9b3d8179b7eb9d2cc93da31578945bc03a45c3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 27 Apr 2018 12:56:15 -0400
+Subject: [PATCH] giscanner: add a --lib-dirs-envvar option
+
+By default LD_LIBRARY_PATH is set to the list of target library paths;
+this breaks down in cross-compilation environment, as we need to run a
+native emulation wrapper rather than the target binary itself. This patch
+allows exporting those paths to a different environment variable
+which can be picked up and used by the wrapper.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ giscanner/ccompiler.py   | 4 ++--
+ giscanner/dumper.py      | 3 ++-
+ giscanner/scannermain.py | 3 +++
+ 3 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
+index d10327c..6cf25d5 100644
+--- a/giscanner/ccompiler.py
++++ b/giscanner/ccompiler.py
+@@ -174,7 +174,7 @@ class CCompiler(object):
+ 
+             self._cflags_no_deprecation_warnings = "-Wno-deprecated-declarations"
+ 
+-    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths):
++    def get_internal_link_flags(self, args, libtool, libraries, extra_libraries, libpaths, lib_dirs_envvar):
+         # An "internal" link is where the library to be introspected
+         # is being built in the current directory.
+ 
+@@ -184,7 +184,7 @@ class CCompiler(object):
+         if os.name == 'nt':
+             runtime_path_envvar = ['LIB', 'PATH']
+         else:
+-            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH']
++            runtime_path_envvar = ['LD_LIBRARY_PATH', 'DYLD_FALLBACK_LIBRARY_PATH'] if not lib_dirs_envvar else [lib_dirs_envvar]
+             # Search the current directory first
+             # (This flag is not supported nor needed for Visual C++)
+             args.append('-L.')
+diff --git a/giscanner/dumper.py b/giscanner/dumper.py
+index 3c7220b..0abd565 100644
+--- a/giscanner/dumper.py
++++ b/giscanner/dumper.py
+@@ -244,7 +244,8 @@ class DumpCompiler(object):
+                                                    libtool,
+                                                    self._options.libraries,
+                                                    self._options.extra_libraries,
+-                                                   self._options.library_paths)
++                                                   self._options.library_paths,
++                                                   self._options.lib_dirs_envvar)
+             args.extend(pkg_config_libs)
+ 
+         else:
+diff --git a/giscanner/scannermain.py b/giscanner/scannermain.py
+index d262785..51c9570 100755
+--- a/giscanner/scannermain.py
++++ b/giscanner/scannermain.py
+@@ -126,6 +126,9 @@ def _get_option_parser():
+     parser.add_option("", "--use-ldd-wrapper",
+                       action="store", dest="ldd_wrapper", default=None,
+                       help="wrapper to use instead of ldd (useful when cross-compiling)")
++    parser.add_option("", "--lib-dirs-envvar",
++                      action="store", dest="lib_dirs_envvar", default=None,
++                      help="environment variable to write a list of library directories to (for running the transient binary), instead of standard LD_LIBRARY_PATH")
+     parser.add_option("", "--program-arg",
+                       action="append", dest="program_args", default=[],
+                       help="extra arguments to program")
+-- 
+2.14.3
+
diff --git a/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
new file mode 100644
index 0000000000..08835d3ecc
--- /dev/null
+++ b/package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
@@ -0,0 +1,29 @@
+From 72a427bc50daee8f1ded0e9221e53dbbf2a80f08 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Wed, 14 Mar 2018 12:07:10 -0400
+Subject: [PATCH] Add rpath links to ccompiler
+
+This patch allows gobject-introspection to process extra paths passed to the
+compiler via the GIR_EXTRA_LIBS_PATH variable.
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ giscanner/ccompiler.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
+index a8bd5b1..51bb9bc 100644
+--- a/giscanner/ccompiler.py
++++ b/giscanner/ccompiler.py
+@@ -229,6 +229,8 @@ class CCompiler(object):
+ 
+         for envvar in runtime_path_envvar:
+             if envvar in os.environ:
++                for envvar_path in os.environ[envvar].split(':'):
++                    args.append("-Wl,-rpath-link," + envvar_path)
+                 os.environ[envvar] = \
+                     os.pathsep.join(runtime_paths + [os.environ[envvar]])
+             else:
+-- 
+2.14.3
+
diff --git a/package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
new file mode 100644
index 0000000000..568758d332
--- /dev/null
+++ b/package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
@@ -0,0 +1,28 @@
+From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 5 Sep 2018 16:46:52 +0200
+Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
+
+prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
+It is not an error per se, but it breaks subprocess.check_output().
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ giscanner/shlibs.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
+index d67df95..80352a6 100644
+--- a/giscanner/shlibs.py
++++ b/giscanner/shlibs.py
+@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, libraries):
+             args.extend(['otool', '-L', binary.args[0]])
+         else:
+             args.extend(['ldd', binary.args[0]])
+-        output = subprocess.check_output(args)
++        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
+         if isinstance(output, bytes):
+             output = output.decode("utf-8", "replace")
+ 
diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
new file mode 100644
index 0000000000..ecb4f048f3
--- /dev/null
+++ b/package/gobject-introspection/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_GOBJECT_INTROSPECTION
+	bool "gobject-introspection"
+	# While gcc 4.8 might be compatible with gobject-introspection,
+	# The autobuilders use some toolchains from codesourcery which
+	# have gcc 4.8 and a very old version of glibc, which will cause
+	# compile errors with locale.c. As such, require 4.9 until this
+	# can be verified.
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_USE_MMU # python3, libglib2
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HOST_PRELINK_CROSS
+	select BR2_PACKAGE_HOST_QEMU
+	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_ZLIB
+	help
+	  GObject introspection is a middleware layer between C
+	  libraries (using GObject) and language bindings. The C library
+	  can be scanned at compile time and generate a metadata file,
+	  in addition to the actual native C library. Then at runtime,
+	  language bindings can read this metadata and automatically
+	  provide bindings to call into the C library.
+
+	  https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
+
+comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gobject-introspection/g-ir-compiler.in b/package/gobject-introspection/g-ir-compiler.in
new file mode 100644
index 0000000000..a88fde7aa9
--- /dev/null
+++ b/package/gobject-introspection/g-ir-compiler.in
@@ -0,0 +1,3 @@
+#!/usr/bin/env sh
+
+$(dirname $0)/g-ir-scanner-qemuwrapper $(dirname $0)/../@GNU_TARGET_NAME@/sysroot/usr/bin/g-ir-compiler "$@"
diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
new file mode 100644
index 0000000000..3095414f69
--- /dev/null
+++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
@@ -0,0 +1,2 @@
+#!/usr/bin/env sh
+${HOST_DIR}/sbin/prelink-rtld --root=$(dirname $0)/../@GNU_TARGET_NAME@/sysroot/ "$@"
diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
new file mode 100644
index 0000000000..0b7a51d18b
--- /dev/null
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -0,0 +1,17 @@
+#!/usr/bin/env sh
+
+# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
+# is older than the target kernel.
+# Use a modules directory which does not exist so we don't load random things
+# which may then get deleted (or their dependencies) and potentially segfault
+GIO_MODULE_DIR=$(dirname $0)/../@GNU_TARGET_NAME@/sysroot/usr/lib/gio/modules-dummy \
+ at QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
+-L $(dirname $0)/../@GNU_TARGET_NAME@/sysroot/ \
+-E LD_LIBRARY_PATH=$GIR_EXTRA_LIBS_PATH:.libs:$(dirname $0)/../@GNU_TARGET_NAME@/sysroot/lib:$(dirname $0)/../@GNU_TARGET_NAME@/sysroot/usr/lib \
+"$@"
+
+if [ $? -ne 0 ]; then
+    echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help."
+    echo '(typically like this: GIR_EXTRA_LIBS_PATH="$(@D)/.libs")'
+    exit 1
+fi
diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
new file mode 100644
index 0000000000..9ce5b4b425
--- /dev/null
+++ b/package/gobject-introspection/g-ir-scanner.in
@@ -0,0 +1,8 @@
+#!/usr/bin/env sh
+
+export GI_SCANNER_DISABLE_CACHE=1
+$HOST_DIR/bin/g-ir-scanner.real \
+--lib-dirs-envvar=GIR_EXTRA_LIBS_PATH \
+--use-binary-wrapper=$(dirname $0)/g-ir-scanner-qemuwrapper \
+--use-ldd-wrapper=$(dirname $0)/g-ir-scanner-lddwrapper \
+--add-include-path=$(dirname $0)/../@GNU_TARGET_NAME@/sysroot/usr/share/gir-1.0 "$@"
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
new file mode 100644
index 0000000000..0454c59565
--- /dev/null
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -0,0 +1,4 @@
+#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.62/gobject-introspection-1.62.0.sha256sum
+sha256 b1ee7ed257fdbc008702bdff0ff3e78a660e7e602efa8f211dc89b9d1e7d90a2 gobject-introspection-1.62.0.tar.xz
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5 COPYING.LGPL
+sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING.GPL
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
new file mode 100644
index 0000000000..003a1eb259
--- /dev/null
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -0,0 +1,115 @@
+################################################################################
+#
+# gobject-introspection
+#
+################################################################################
+
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.62
+GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
+GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
+GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz
+GOBJECT_INTROSPECTION_INSTALL_STAGING = YES
+GOBJECT_INTROSPECTION_AUTORECONF = YES
+GOBJECT_INTROSPECTION_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-2-Clause
+GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scannerlexer.l
+
+GOBJECT_INTROSPECTION_DEPENDENCIES = \
+	host-autoconf-archive \
+	host-gobject-introspection \
+	host-prelink-cross \
+	host-qemu \
+	libffi \
+	libglib2 \
+	python3 \
+	zlib
+
+HOST_GOBJECT_INTROSPECTION_DEPENDENCIES = \
+	host-bison \
+	host-flex \
+	host-libglib2 \
+	host-python3
+
+# g-ir-scanner will default to /usr/bin/ld for linking if this is not set.
+GOBJECT_INTROSPECTION_NINJA_ENV += \
+	CC="$(TARGET_CC)"
+
+# Disable introspection data on the host, as it is not needed and
+# the package will attempt to use the systems libglib2 which will fail
+# if the systems libglib2 version is older than 2.60.
+HOST_GOBJECT_INTROSPECTION_CONF_OPTS = \
+	-Denable-introspection-data=false
+
+# Use the host gi-scanner to prevent the scanner from generating incorrect
+# elf classes.
+GOBJECT_INTROSPECTION_CONF_OPTS = \
+	-Denable-host-gi=true \
+	-Denable-gi-cross-wrapper="$(HOST_DIR)/usr/bin/g-ir-scanner-qemuwrapper" \
+	-Denable-gi-ldd-wrapper="$(HOST_DIR)/usr/bin/g-ir-scanner-lddwrapper" \
+	-Denable-introspection-data=true
+
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+GOBJECT_INTROSPECTION_DEPENDENCIES += cairo
+GOBJECT_INTROSPECTION_CONF_OPTS += -Dcairo=true
+endif
+
+# GI_SCANNER_DISABLE_CACHE=1 prevents g-ir-scanner from writing cache data to $HOME
+GOBJECT_INTROSPECTION_CONF_ENV = \
+	GI_SCANNER_DISABLE_CACHE=1
+
+HOST_GOBJECT_INTROSPECTION_CONF_ENV = \
+	GI_SCANNER_DISABLE_CACHE=1
+
+# Make sure g-ir-tool-template uses the host python.
+define GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
+	$(SED) '1s%#!.*%#!$(HOST_DIR)/bin/python%' $(@D)/tools/g-ir-tool-template.in
+endef
+GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
+HOST_GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_FIX_TOOLTEMPLATE_PYTHON_PATH
+
+# These wrappers allow gobject-introspection to build the internal introspection
+# libraries during the build process.
+define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
+	mv $(HOST_DIR)/usr/bin/g-ir-scanner $(HOST_DIR)/usr/bin/g-ir-scanner.real
+
+	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
+		$(HOST_DIR)/usr/bin/g-ir-scanner-lddwrapper
+	$(SED) "s%@GNU_TARGET_NAME@%$(GNU_TARGET_NAME)%g" \
+		$(HOST_DIR)/usr/bin/g-ir-scanner-lddwrapper
+
+	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-qemuwrapper.in \
+		$(HOST_DIR)/usr/bin/g-ir-scanner-qemuwrapper
+	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
+		$(HOST_DIR)/usr/bin/g-ir-scanner-qemuwrapper
+	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
+		$(HOST_DIR)/usr/bin/g-ir-scanner-qemuwrapper
+	$(SED) "s%@GNU_TARGET_NAME@%$(GNU_TARGET_NAME)%g" \
+		$(HOST_DIR)/usr/bin/g-ir-scanner-qemuwrapper
+
+	$(INSTALL) -D -m 755 \
+		$(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-compiler.in $(HOST_DIR)/usr/bin/g-ir-compiler
+	$(SED) "s%@GNU_TARGET_NAME@%$(GNU_TARGET_NAME)%g" \
+		$(HOST_DIR)/usr/bin/g-ir-compiler
+
+	$(INSTALL) -D -m 755 \
+		$(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner.in $(HOST_DIR)/usr/bin/g-ir-scanner
+	$(SED) "s%@GNU_TARGET_NAME@%$(GNU_TARGET_NAME)%g" \
+		$(HOST_DIR)/usr/bin/g-ir-scanner
+
+endef
+HOST_GOBJECT_INTROSPECTION_POST_INSTALL_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
+
+define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
+	# Use a modules directory which does not exist so we don't load random things
+	# which may then get deleted (or their dependencies) and potentially segfault
+	mkdir -p $(STAGING_DIR)/usr/lib/gio/modules-dummy
+endef
+GOBJECT_INTROSPECTION_PRE_CONFIGURE_HOOKS += GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
+
+# Only .typelib files are needed to run.
+define GOBJECT_INTROSPECTION_REMOVE_DEVELOPMENT_FILES
+	find $(TARGET_DIR)/usr/share \( -iname "*.gir" -o -iname \*.rnc \) -delete
+endef
+GOBJECT_INTROSPECTION_TARGET_FINALIZE_HOOKS += GOBJECT_INTROSPECTION_REMOVE_DEVELOPMENT_FILES
+
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.24.1
