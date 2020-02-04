From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 17:58:51 +0100
Subject: [Buildroot] [PATCH 2/3] package/meson: add upstream patch to
 support pkg_config_libdir
In-Reply-To: <20200204165852.1819360-1-arnout@mind.be>
References: <20200204165852.1819360-1-arnout@mind.be>
Message-ID: <20200204165852.1819360-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To allow meson to distinguish between pkg-config for host (= native)
and pkg-config for target (= cross), we want to be able to give a
different pkg_config_libdir for host and for target. meson already has a
'sys_root' option that sets the sysroot that is used by pkg-config, but
we also need explicit search directories for pkg-config.

Therefore, back-port an upstream patch (will be included in 0.54) that
adds this feature.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...onfig-add-pkg_config_libdir-property.patch | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/meson/0003-envconfig-add-pkg_config_libdir-property.patch

diff --git a/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch b/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
new file mode 100644
index 0000000000..ae40ab8b1c
--- /dev/null
+++ b/package/meson/0003-envconfig-add-pkg_config_libdir-property.patch
@@ -0,0 +1,102 @@
+From 3af920cb4a9c272b9b75a4f3eea9da9000520949 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@collabora.com>
+Date: Tue, 14 Jan 2020 11:11:52 +0100
+Subject: [PATCH] envconfig: add pkg_config_libdir property
+
+In order to unify the use of sysroot in the cross-file,
+the pkg_config_libdir can now be passed directly in the file.
+
+Upstream: 958df63dac810246e84c2b8eaa32d22d19ace0ef
+[Arnout: remove documentation changes: we don't extract docs/]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ mesonbuild/dependencies/base.py |  6 ++++++
+ mesonbuild/envconfig.py         |  6 ++++++
+ run_unittests.py                | 30 +++++++++++++++++++++++++++++-
+ 3 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/mesonbuild/dependencies/base.py b/mesonbuild/dependencies/base.py
+index 40e304c7..282c314b 100644
+--- a/mesonbuild/dependencies/base.py
++++ b/mesonbuild/dependencies/base.py
+@@ -697,6 +697,12 @@ class PkgConfigDependency(ExternalDependency):
+         mlog.debug('PKG_CONFIG_PATH: ' + new_pkg_config_path)
+         env['PKG_CONFIG_PATH'] = new_pkg_config_path
+ 
++        pkg_config_libdir_prop = self.env.properties[self.for_machine].get_pkg_config_libdir()
++        if pkg_config_libdir_prop:
++            new_pkg_config_libdir = ':'.join([p for p in pkg_config_libdir_prop])
++            env['PKG_CONFIG_LIBDIR'] = new_pkg_config_libdir
++            mlog.debug('PKG_CONFIG_LIBDIR: ' + new_pkg_config_libdir)
++
+         fenv = frozenset(env.items())
+         targs = tuple(args)
+         cache = PkgConfigDependency.pkgbin_cache
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index c8a37f4c..3e5e44b8 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -143,6 +143,12 @@ class Properties(HasEnvVarFallback):
+     def get_sys_root(self) -> T.Optional[T.Union[str, T.List[str]]]:
+         return self.properties.get('sys_root', None)
+ 
++    def get_pkg_config_libdir(self) -> T.Optional[T.List[str]]:
++        p = self.properties.get('pkg_config_libdir', None)
++        if p is None:
++            return p
++        return mesonlib.listify(p)
++
+     def __eq__(self, other: T.Any) -> 'T.Union[bool, NotImplemented]':
+         if isinstance(other, type(self)):
+             return self.properties == other.properties
+diff --git a/run_unittests.py b/run_unittests.py
+index 676604f4..382c0964 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -3621,6 +3621,34 @@ recommended as it is not supported on some platforms''')
+         self.wipe()
+         self.init(testdir, extra_args=['-Dstart_native=true'], override_envvars=env)
+ 
++    @skipIfNoPkgconfig
++    @unittest.skipIf(is_windows(), 'Help needed with fixing this test on windows')
++    def test_pkg_config_libdir(self):
++        testdir = os.path.join(self.unit_test_dir,
++                               '46 native dep pkgconfig var')
++        with tempfile.NamedTemporaryFile(mode='w', delete=False) as crossfile:
++            crossfile.write(textwrap.dedent(
++                '''[binaries]
++                pkgconfig = 'pkg-config'
++
++                [properties]
++                pkg_config_libdir = [r'{0}']
++
++                [host_machine]
++                system = 'linux'
++                cpu_family = 'arm'
++                cpu = 'armv7'
++                endian = 'little'
++                '''.format(os.path.join(testdir, 'cross_pkgconfig'))))
++            crossfile.flush()
++            self.meson_cross_file = crossfile.name
++
++        env = {'PKG_CONFIG_LIBDIR':  os.path.join(testdir,
++                                                  'native_pkgconfig')}
++        self.init(testdir, extra_args=['-Dstart_native=false'], override_envvars=env)
++        self.wipe()
++        self.init(testdir, extra_args=['-Dstart_native=true'], override_envvars=env)
++
+     def __reconfigure(self, change_minor=False):
+         # Set an older version to force a reconfigure from scratch
+         filename = os.path.join(self.privatedir, 'coredata.dat')
+@@ -6847,7 +6875,7 @@ class NativeFileTests(BasePlatformTests):
+ 
+ class CrossFileTests(BasePlatformTests):
+ 
+-    """Tests for cross file functioality not directly related to
++    """Tests for cross file functionality not directly related to
+     cross compiling.
+ 
+     This is mainly aimed to testing overrides from cross files.
+-- 
+2.24.1
+
-- 
2.24.1
