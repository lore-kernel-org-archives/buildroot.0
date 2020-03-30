From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 29 Mar 2020 18:09:16 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.54.0
Message-ID: <20200330000916.97641-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...onfig-add-pkg_config_libdir-property.patch | 102 ------------------
 ...ction-determine-g-ir-scanner-and-g-i.patch |  62 -----------
 ...es-gnome.py-Fix-giscanner-and-gicomp.patch |  41 -------
 package/meson/meson.hash                      |   6 +-
 package/meson/meson.mk                        |   2 +-
 5 files changed, 4 insertions(+), 209 deletions(-)
 delete mode 100644 package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
 delete mode 100644 package/meson/0004-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
 delete mode 100644 package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicomp.patch

diff --git a/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch b/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
deleted file mode 100644
index 8ae34b999d..0000000000
--- a/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 3af920cb4a9c272b9b75a4f3eea9da9000520949 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@collabora.com>
-Date: Tue, 14 Jan 2020 11:11:52 +0100
-Subject: [PATCH] envconfig: add pkg_config_libdir property
-
-In order to unify the use of sysroot in the cross-file,
-the pkg_config_libdir can now be passed directly in the file.
-
-Upstream: 958df63dac810246e84c2b8eaa32d22d19ace0ef
-[Arnout: remove documentation changes: we don't extract docs/]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- mesonbuild/dependencies/base.py |  6 ++++++
- mesonbuild/envconfig.py         |  6 ++++++
- run_unittests.py                | 30 +++++++++++++++++++++++++++++-
- 3 files changed, 41 insertions(+), 1 deletion(-)
-
-diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
-index 40e304c7..282c314b 100644
---- a/mesonbuild/dependencies/base.py
-+++ b/mesonbuild/dependencies/base.py
-@@ -697,6 +697,12 @@ class PkgConfigDependency(ExternalDependency):
-         mlog.debug('PKG_CONFIG_PATH: ' + new_pkg_config_path)
-         env['PKG_CONFIG_PATH'] = new_pkg_config_path
- 
-+        pkg_config_libdir_prop = self.env.properties[self.for_machine].get_pkg_config_libdir()
-+        if pkg_config_libdir_prop:
-+            new_pkg_config_libdir = ':'.join([p for p in pkg_config_libdir_prop])
-+            env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
-+            mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
-+
-         fenv = frozenset(env.items())
-         targs = tuple(args)
-         cache = PkgConfigDependency.pkgbin_cache
-diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index c8a37f4c..3e5e44b8 100644
---- a/mesonbuild/envconfig.py
-+++ b/mesonbuild/envconfig.py
-@@ -143,6 +143,12 @@ class Properties(HasEnvVarFallback):
-     def get_sys_root(self) -> T.Optional[T.Union[str, T.List[str]]]:
-         return self.properties.get('sys_root', None)
- 
-+    def get_pkg_config_libdir(self) -> T.Optional[T.List[str]]:
-+        p = self.properties.get('pkg_config_libdir', None)
-+        if p is None:
-+            return p
-+        return mesonlib.listify(p)
-+
-     def __eq__(self, other: T.Any) -> 'T.Union[bool, NotImplemented]':
-         if isinstance(other, type(self)):
-             return self.properties == other.properties
-diff --git a/run_unittests.py b/run_unittests.py
-index 676604f4..382c0964 100755
---- a/run_unittests.py
-+++ b/run_unittests.py
-@@ -3629,6 +3629,34 @@ recommended as it is not supported on some platforms''')
-         self.wipe()
-         self.init(testdir, extra_args=['-Dstart_native=true'], override_envvars=env)
- 
-+    @skipIfNoPkgconfig
-+    @unittest.skipIf(is_windows(), 'Help needed with fixing this test on windows')
-+    def test_pkg_config_libdir(self):
-+        testdir = os.path.join(self.unit_test_dir,
-+                               '46 native dep pkgconfig var')
-+        with tempfile.NamedTemporaryFile(mode='w', delete=False) as crossfile:
-+            crossfile.write(textwrap.dedent(
-+                '''[binaries]
-+                pkgconfig = 'pkg-config'
-+
-+                [properties]
-+                pkg_config_libdir = [r'{0}']
-+
-+                [host_machine]
-+                system = 'linux'
-+                cpu_family = 'arm'
-+                cpu = 'armv7'
-+                endian = 'little'
-+                '''.format(os.path.join(testdir, 'cross_pkgconfig'))))
-+            crossfile.flush()
-+            self.meson_cross_file = crossfile.name
-+
-+        env = {'PKG_CONFIG_LIBDIR':  os.path.join(testdir,
-+                                                  'native_pkgconfig')}
-+        self.init(testdir, extra_args=['-Dstart_native=false'], override_envvars=env)
-+        self.wipe()
-+        self.init(testdir, extra_args=['-Dstart_native=true'], override_envvars=env)
-+
-     def __reconfigure(self, change_minor=False):
-         # Set an older version to force a reconfigure from scratch
-         filename = os.path.join(self.privatedir, 'coredata.dat')
-@@ -6863,7 +6891,7 @@ class NativeFileTests(BasePlatformTests):
- 
- class CrossFileTests(BasePlatformTests):
- 
--    """Tests for cross file functioality not directly related to
-+    """Tests for cross file functionality not directly related to
-     cross compiling.
- 
-     This is mainly aimed to testing overrides from cross files.
--- 
-2.24.1
-
diff --git a/package/meson/0004-gobject-introspection-determine-g-ir-scanner-and-g-i.patch b/package/meson/0004-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
deleted file mode 100644
index 9c7eb656bc..0000000000
--- a/package/meson/0004-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From f66b04b0996eae5cd7b0ad007435d5a51f28b691 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Mon, 24 Feb 2020 06:29:26 -0800
-Subject: [PATCH] gobject-introspection: determine g-ir-scanner and
- g-ir-compiler paths from pkgconfig
-
-Currently, meson hard codes the paths of these binaries which results in
-cross-compiled environments to run the host versions of these tools.
-However, GObject-introspection provides the appropriate paths to these
-utilities via pkg-config
-
-find_program is needed in the case g-i is built as a subproject. If
-g-ir-scanner or g-ir-compiler are in the build or source directory use those.
-If they aren't found in the source directory, use the results from pkg-config.
-
-Upstream commit: f66b04b0996eae5cd7b0ad007435d5a51f28b691
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- mesonbuild/modules/gnome.py | 21 ++++++++++++++++++---
- 1 file changed, 18 insertions(+), 3 deletions(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 3d5d7181..0ea4b273 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -736,15 +736,30 @@ class GnomeModule(ExtensionModule):
-         if kwargs.get('install_dir'):
-             raise MesonException('install_dir is not supported with generate_gir(), see "install_dir_gir" and "install_dir_typelib"')
- 
--        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
--        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
--
-         girtargets = [self._unwrap_gir_target(arg, state) for arg in args]
- 
-         if len(girtargets) > 1 and any([isinstance(el, build.Executable) for el in girtargets]):
-             raise MesonException('generate_gir only accepts a single argument when one of the arguments is an executable')
- 
-         self.gir_dep, pkgargs = self._get_gir_dep(state)
-+        # find_program is needed in the case g-i is built as subproject.
-+        # In that case it uses override_find_program so the gobject utilities
-+        # can be used from the build dir instead of from the system.
-+        # However, GObject-introspection provides the appropriate paths to
-+        # these utilities via pkg-config, so it would be best to use the
-+        # results from pkg-config when possible.
-+        gi_util_dirs_check = [state.environment.get_build_dir(), state.environment.get_source_dir()]
-+        giscanner = self.interpreter.find_program_impl('g-ir-scanner')
-+        if giscanner.found():
-+            giscanner_path = giscanner.get_command()[0]
-+            if not any(x in giscanner_path for x in gi_util_dirs_check):
-+                giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+
-+        gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
-+        if gicompiler.found():
-+            gicompiler_path = gicompiler.get_command()[0]
-+            if not any(x in gicompiler_path for x in gi_util_dirs_check):
-+                gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
- 
-         ns = kwargs.pop('namespace')
-         nsversion = kwargs.pop('nsversion')
--- 
-2.20.1
-
diff --git a/package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicomp.patch b/package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicomp.patch
deleted file mode 100644
index 4a0813dc8d..0000000000
--- a/package/meson/0005-mesonbuild-modules-gnome.py-Fix-giscanner-and-gicomp.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6ba034c37d8004a72d392f37f66e709c593d8983 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Aduskett@gmail.com>
-Date: Wed, 26 Feb 2020 05:51:28 -0800
-Subject: [PATCH] mesonbuild/modules/gnome.py: Fix giscanner and gicompiler
- logic
-
-Currently, giscanner and the gicompiler paths are only scanned via pkg-config
-if they are first found in the host path.
-
-Add a else statement to fix this oversite.
-
-Upstream commit: 6ba034c37d8004a72d392f37f66e709c593d8983
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
----
- mesonbuild/modules/gnome.py | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 0ea4b273..1743b59c 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -754,12 +754,16 @@ class GnomeModule(ExtensionModule):
-             giscanner_path = giscanner.get_command()[0]
-             if not any(x in giscanner_path for x in gi_util_dirs_check):
-                 giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
-+        else:
-+            giscanner = self.gir_dep.get_pkgconfig_variable('g_ir_scanner', {})
- 
-         gicompiler = self.interpreter.find_program_impl('g-ir-compiler')
-         if gicompiler.found():
-             gicompiler_path = gicompiler.get_command()[0]
-             if not any(x in gicompiler_path for x in gi_util_dirs_check):
-                 gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
-+        else:
-+            gicompiler = self.gir_dep.get_pkgconfig_variable('g_ir_compiler', {})
- 
-         ns = kwargs.pop('namespace')
-         nsversion = kwargs.pop('nsversion')
--- 
-2.20.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 3777a51542..bbb031957b 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.53.2/meson-0.53.2.tar.gz.asc
-sha256 3e8f830f33184397c2eb0b651ec502adb63decb28978bdc84b3558d71284c21f meson-0.53.2.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
+# https://github.com/mesonbuild/meson/releases/download/0.54.0/meson-0.54.0.tar.gz.asc
+sha256  dde5726d778112acbd4a67bb3633ab2ee75d33d1e879a6283a7b4a44c3363c27  meson-0.54.0.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 845ce8fb71..2e6c4cea71 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.53.2
+MESON_VERSION = 0.54.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.20.1
