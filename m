From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 22 Jan 2020 18:56:32 -0700
Subject: [Buildroot] [PATCH v3 1/1] package/meson: bump to version 0.53.0
Message-ID: <20200123015632.32616-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch that is now upstream.

Add patch to prevent passing an invalid linker to gcc fixing:
ERROR: Unable to determine dynamic linker

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - backport upstream fix from commit instead of pull request
Changes v1 -> v2:
  - add patch to prevent passing an invalid linker to gcc
---
 ...ic-libs-when-default-library-static.patch} |   0
 ...dist.py-import-lzma-only-when-needed.patch |  50 -----
 ...-environment-Replace-LD-with-LANG-LD.patch | 193 ++++++++++++++++++
 package/meson/meson.hash                      |   4 +-
 package/meson/meson.mk                        |   2 +-
 5 files changed, 196 insertions(+), 53 deletions(-)
 rename package/meson/{0003-Prefer-ext-static-libs-when-default-library-static.patch => 0002-Prefer-ext-static-libs-when-default-library-static.patch} (100%)
 delete mode 100644 package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
 create mode 100644 package/meson/0003-environment-Replace-LD-with-LANG-LD.patch

diff --git a/package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch b/package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
similarity index 100%
rename from package/meson/0003-Prefer-ext-static-libs-when-default-library-static.patch
rename to package/meson/0002-Prefer-ext-static-libs-when-default-library-static.patch
diff --git a/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch b/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
deleted file mode 100644
index 81758bc1b3..0000000000
--- a/package/meson/0002-mdist.py-import-lzma-only-when-needed.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a3443360c8c0014638366d5bb2f5aa7683d5aec2 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 19 Oct 2019 09:52:06 +0200
-Subject: [PATCH] mdist.py: import lzma only when needed
-
-Importing lzma requires that python was built with lzma support. Buildroot
-builds its own version of python, without lzma support (i.e. without
-dependency on host-xz).
-
-lzma is anyway only needed to make the dist target, which we don't do in
-Buildroot. Therefore, in the Buildroot context, everything still works
-properly without lzma support.
-
-Moving the import down to the place where it is actually needed does not
-remove any functionality but fixes the problem for Buildroot.
-
-Source of patch:
-http://lists.busybox.net/pipermail/buildroot/2019-October/262990.html
-http://code.bulix.org/gdxcu4-914360
-
-Fixes https://github.com/mesonbuild/meson/issues/6012
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- mesonbuild/mdist.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/mdist.py b/mesonbuild/mdist.py
-index 7b753826..28e2fced 100644
---- a/mesonbuild/mdist.py
-+++ b/mesonbuild/mdist.py
-@@ -13,7 +13,6 @@
- # limitations under the License.
- 
- 
--import lzma
- import gzip
- import os
- import sys
-@@ -133,6 +132,7 @@ def create_dist_hg(dist_name, archives, src_root, bld_root, dist_sub, dist_scrip
-     if dist_scripts:
-         mlog.warning('dist scripts are not supported in Mercurial projects')
-     if 'xztar' in archives:
-+        import lzma
-         with lzma.open(xzname, 'wb') as xf, open(tarname, 'rb') as tf:
-             shutil.copyfileobj(tf, xf)
-         output_names.append(xzname)
--- 
-2.20.1
-
diff --git a/package/meson/0003-environment-Replace-LD-with-LANG-LD.patch b/package/meson/0003-environment-Replace-LD-with-LANG-LD.patch
new file mode 100644
index 0000000000..225b62fdd8
--- /dev/null
+++ b/package/meson/0003-environment-Replace-LD-with-LANG-LD.patch
@@ -0,0 +1,193 @@
+From abfa2fd3289c1e8aee230d58935e72fb617ed4e9 Mon Sep 17 00:00:00 2001
+From: Dylan Baker <dylan@pnwbakers.com>
+Date: Mon, 13 Jan 2020 11:15:36 -0800
+Subject: [PATCH] environment: Replace LD with <LANG>LD
+
+The rust code is ugly, because rust is annoying. It doesn't invoke a
+linker directly (unless that linker is link.exe or lld-link.exe),
+instead it invokes the C compiler (gcc or clang usually) to do it's
+linking. Meson doesn't have good abstractions for this, though we
+probably should because some of the D compilers do the same thing.
+Either that or we should just call the c compiler directly, like vala
+does.
+
+This changes the public interface for meson, which we don't do unless we
+absolutely have to. In this case I think we need to do it. A fair number
+of projects have already been using 'ld' in their cross/native files to
+get the ld binary and call it directly in custom_targets or generators,
+and we broke that. While we could hit this problem again names like
+`c_ld` and `cpp_ld` are far less likely to cause collisions than `ld`.
+Additionally this gives a way to set the linker on a per-compiler basis,
+which is probably in itself very useful.
+
+Fixes #6442
+[james.hilliard1 at gmail.com: backport from upstream commit
+730a7b296fdff8aca58e15829485b3b68262d3c0]
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+---
+ docs/markdown/howtox.md   | 34 +++++++++++++-------
+ mesonbuild/envconfig.py   | 10 +++++-
+ mesonbuild/environment.py | 66 ++++++++++++++++++++++++---------------
+ run_unittests.py          |  7 +++--
+ 4 files changed, 77 insertions(+), 40 deletions(-)
+
+diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
+index 0f277a7b..a13ac419 100644
+--- a/mesonbuild/envconfig.py
++++ b/mesonbuild/envconfig.py
+@@ -305,11 +305,19 @@ class BinaryTable(HasEnvVarFallback):
+         'rust': 'RUSTC',
+         'vala': 'VALAC',
+ 
++        # Linkers
++        'c_ld': 'CC_LD',
++        'cpp_ld': 'CXX_LD',
++        'd_ld': 'D_LD',
++        'fortran_ld': 'F_LD',
++        'objc_ld': 'OBJC_LD',
++        'objcpp_ld': 'OBJCPP_LD',
++        'rust_ld': 'RUST_LD',
++
+         # Binutils
+         'strip': 'STRIP',
+         'ar': 'AR',
+         'windres': 'WINDRES',
+-        'ld': 'LD',
+ 
+         # Other tools
+         'cmake': 'CMAKE',
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index 77fc1aea..58d135dc 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -748,7 +748,7 @@ class Environment:
+         check_args += self.coredata.compiler_options[for_machine][comp_class.language + '_args'].value
+ 
+         override = []  # type: typing.List[str]
+-        value = self.binaries[for_machine].lookup_entry('ld')
++        value = self.binaries[for_machine].lookup_entry(comp_class.language + 'ld')
+         if value is not None:
+             override = comp_class.use_linker_args(value[0])
+             check_args += override
+@@ -811,7 +811,7 @@ class Environment:
+             check_args = comp_class.LINKER_PREFIX + ['--version'] + extra_args
+ 
+         override = []  # type: typing.List[str]
+-        value = self.binaries[for_machine].lookup_entry('ld')
++        value = self.binaries[for_machine].lookup_entry(comp_class.language + 'ld')
+         if value is not None:
+             override = comp_class.use_linker_args(value[0])
+             check_args += override
+@@ -1354,6 +1354,7 @@ class Environment:
+ 
+         cc = self.detect_c_compiler(for_machine)
+         is_link_exe = isinstance(cc.linker, VisualStudioLikeLinkerMixin)
++        override = self.binaries[for_machine].lookup_entry('rustld')
+ 
+         for compiler in compilers:
+             if isinstance(compiler, str):
+@@ -1377,32 +1378,45 @@ class Environment:
+                 # the default use that, and second add the necessary arguments
+                 # to rust to use -fuse-ld
+ 
+-                extra_args = {}
+-                always_args = []
+-                if is_link_exe:
+-                    compiler.extend(['-C', 'linker={}'.format(cc.linker.exelist[0])])
+-                    extra_args['direct'] = True
+-                    extra_args['machine'] = cc.linker.machine
+-                elif not ((info.is_darwin() and isinstance(cc, AppleClangCCompiler)) or
+-                          isinstance(cc, GnuCCompiler)):
++                if override is None:
++                    extra_args = {}
++                    always_args = []
++                    if is_link_exe:
++                        compiler.extend(['-C', 'linker={}'.format(cc.linker.exelist[0])])
++                        extra_args['direct'] = True
++                        extra_args['machine'] = cc.linker.machine
++                    elif not ((info.is_darwin() and isinstance(cc, AppleClangCCompiler)) or
++                              isinstance(cc, GnuCCompiler)):
++                        c = cc.exelist[1] if cc.exelist[0].endswith('ccache') else cc.exelist[0]
++                        compiler.extend(['-C', 'linker={}'.format(c)])
++
++                    # This trickery with type() gets us the class of the linker
++                    # so we can initialize a new copy for the Rust Compiler
++                    if is_link_exe:
++                        linker = type(cc.linker)(for_machine, always_args, exelist=cc.linker.exelist,
++                                                 version=cc.linker.version, **extra_args)
++                    else:
++                        linker = type(cc.linker)(compiler, for_machine, cc.linker.id, cc.LINKER_PREFIX,
++                                                 always_args=always_args, version=cc.linker.version,
++                                                 **extra_args)
++                elif 'link' in override[0]:
++                    linker = self._guess_win_linker(
++                        override, RustCompiler, for_machine, use_linker_prefix=False)
++                    linker.direct = True
++                else:
++                    # We're creating a new type of "C" compiler, that has rust
++                    # as it's language. This is gross, but I can't figure out
++                    # another way to handle this, because rustc is actually
++                    # invoking the c compiler as it's linker.
++                    b = type('b', (type(cc), ), {})
++                    b.language = RustCompiler.language
++                    linker = self._guess_nix_linker(cc.exelist, b, for_machine)
++
++                    # Of course, we're not going to use any of that, we just
++                    # need it to get the proper arguments to pass to rustc
+                     c = cc.exelist[1] if cc.exelist[0].endswith('ccache') else cc.exelist[0]
+                     compiler.extend(['-C', 'linker={}'.format(c)])
+-
+-                value = self.binaries[for_machine].lookup_entry('ld')
+-                if value is not None:
+-                    for a in cc.use_linker_args(value[0]):
+-                        always_args.extend(['-C', 'link-arg={}'.format(a)])
+-
+-                # This trickery with type() gets us the class of the linker
+-                # so we can initialize a new copy for the Rust Compiler
+-
+-                if is_link_exe:
+-                    linker = type(cc.linker)(for_machine, always_args, exelist=cc.linker.exelist,
+-                                             version=cc.linker.version, **extra_args)
+-                else:
+-                    linker = type(cc.linker)(compiler, for_machine, cc.linker.id, cc.LINKER_PREFIX,
+-                                             always_args=always_args, version=cc.linker.version,
+-                                             **extra_args)
++                    compiler.extend(['-C', 'link-args={}'.format(' '.join(cc.use_linker_args(override[0])))])
+ 
+                 return RustCompiler(
+                     compiler, version, for_machine, is_cross, info, exe_wrap,
+diff --git a/run_unittests.py b/run_unittests.py
+index 669c8ffe..87c6b690 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -43,6 +43,7 @@ from distutils.dir_util import copy_tree
+ import mesonbuild.mlog
+ import mesonbuild.depfile
+ import mesonbuild.compilers
++import mesonbuild.envconfig
+ import mesonbuild.environment
+ import mesonbuild.mesonlib
+ import mesonbuild.coredata
+@@ -4624,7 +4625,8 @@ class WindowsTests(BasePlatformTests):
+     def _check_ld(self, name: str, lang: str, expected: str) -> None:
+         if not shutil.which(name):
+             raise unittest.SkipTest('Could not find {}.'.format(name))
+-        with mock.patch.dict(os.environ, {'LD': name}):
++        envvar = mesonbuild.envconfig.BinaryTable.evarMap['{}ld'.format(lang)]
++        with mock.patch.dict(os.environ, {envvar: name}):
+             env = get_fake_env()
+             try:
+                 comp = getattr(env, 'detect_{}_compiler'.format(lang))(MachineChoice.HOST)
+@@ -5876,7 +5878,8 @@ c = ['{0}']
+             raise unittest.SkipTest('Solaris currently cannot override the linker.')
+         if not shutil.which(check):
+             raise unittest.SkipTest('Could not find {}.'.format(check))
+-        with mock.patch.dict(os.environ, {'LD': name}):
++        envvar = mesonbuild.envconfig.BinaryTable.evarMap['{}ld'.format(lang)]
++        with mock.patch.dict(os.environ, {envvar: name}):
+             env = get_fake_env()
+             comp = getattr(env, 'detect_{}_compiler'.format(lang))(MachineChoice.HOST)
+             if lang != 'rust' and comp.use_linker_args('foo') == []:
+-- 
+2.20.1
+
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 461e908b4a..3039526857 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.52.1/meson-0.52.1.tar.gz.asc
-sha256 0c277472e49950a5537e3de3e60c57b80dbf425788470a1a8ed27446128fc035 meson-0.52.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.53.0/meson-0.53.0.tar.gz.sig
+sha256 035e75993ab6fa6c9ebf902b835c64cf397a763eb8e65c9bb6e1cc9730a9d3f6 meson-0.53.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d409ae7b52..22d7353659 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.52.1
+MESON_VERSION = 0.53.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.20.1
