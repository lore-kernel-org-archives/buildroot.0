From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2020 06:48:06 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.55.1
Message-ID: <20200816124806.2726538-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop fix rpath match pattern patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...003-backends-fix-rpath-match-pattern.patch | 123 ------------------
 package/meson/meson.hash                      |   4 +-
 package/meson/meson.mk                        |   2 +-
 3 files changed, 3 insertions(+), 126 deletions(-)
 delete mode 100644 package/meson/0003-backends-fix-rpath-match-pattern.patch

diff --git a/package/meson/0003-backends-fix-rpath-match-pattern.patch b/package/meson/0003-backends-fix-rpath-match-pattern.patch
deleted file mode 100644
index f4477b59d2..0000000000
--- a/package/meson/0003-backends-fix-rpath-match-pattern.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 1ce4258c219fe08b6d6eaa6aa944f27d91d054cb Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sat, 18 Jul 2020 17:01:33 -0600
-Subject: [PATCH] backends: fix rpath match pattern
-
-Since -Wl,-rpath= is not the only valid rpath ldflags syntax we
-need to try and match all valid rpath ldflags.
-
-In addition we should prevent -Wl,--just-symbols from being used to
-set rpath due to inconsistent compiler support.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1 at gmail.com: backport from upstream commit
-1ce4258c219fe08b6d6eaa6aa944f27d91d054cb]
----
- mesonbuild/backend/backends.py | 30 ++++++++++++++++++++++++--
- run_unittests.py               | 39 +++++++++++++++++++++++-----------
- 2 files changed, 55 insertions(+), 14 deletions(-)
-
-diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
-index cfd3a397f..e053f67e6 100644
---- a/mesonbuild/backend/backends.py
-+++ b/mesonbuild/backend/backends.py
-@@ -14,6 +14,7 @@
- 
- from collections import OrderedDict
- from functools import lru_cache
-+from pathlib import Path
- import enum
- import json
- import os
-@@ -455,10 +456,35 @@ class Backend:
-                 args.extend(self.environment.coredata.get_external_link_args(target.for_machine, lang))
-             except Exception:
-                 pass
-+        # Match rpath formats:
-+        # -Wl,-rpath=
-+        # -Wl,-rpath,
-+        rpath_regex = re.compile(r'-Wl,-rpath[=,]([^,]+)')
-+        # Match solaris style compat runpath formats:
-+        # -Wl,-R
-+        # -Wl,-R,
-+        runpath_regex = re.compile(r'-Wl,-R[,]?([^,]+)')
-+        # Match symbols formats:
-+        # -Wl,--just-symbols=
-+        # -Wl,--just-symbols,
-+        symbols_regex = re.compile(r'-Wl,--just-symbols[=,]([^,]+)')
-         for arg in args:
--            if arg.startswith('-Wl,-rpath='):
--                for dir in arg.replace('-Wl,-rpath=','').split(':'):
-+            rpath_match = rpath_regex.match(arg)
-+            if rpath_match:
-+                for dir in rpath_match.group(1).split(':'):
-                     dirs.add(dir)
-+            runpath_match = runpath_regex.match(arg)
-+            if runpath_match:
-+                for dir in runpath_match.group(1).split(':'):
-+                    # The symbols arg is an rpath if the path is a directory
-+                    if Path(dir).is_dir():
-+                        dirs.add(dir)
-+            symbols_match = symbols_regex.match(arg)
-+            if symbols_match:
-+                for dir in symbols_match.group(1).split(':'):
-+                    # Prevent usage of --just-symbols to specify rpath
-+                    if Path(dir).is_dir():
-+                        raise MesonException('Invalid arg for --just-symbols, {} is a directory.'.format(dir))
-         return dirs
- 
-     def rpaths_for_bundled_shared_libraries(self, target, exclude_system=True):
-diff --git a/run_unittests.py b/run_unittests.py
-index b5294b9f8..73131c75b 100755
---- a/run_unittests.py
-+++ b/run_unittests.py
-@@ -6473,19 +6473,34 @@ class LinuxlikeTests(BasePlatformTests):
-         self.init(yonder_dir)
-         self.build()
-         self.install(use_destdir=False)
--        self.new_builddir()
- 
--        # Build an app that uses that installed library.
--        # Supply the rpath to the installed library via LDFLAGS
--        # (as systems like buildroot and guix are wont to do)
--        # and verify install preserves that rpath.
--        env = {'LDFLAGS': '-Wl,-rpath=' + yonder_libdir,
--               'PKG_CONFIG_PATH': os.path.join(yonder_libdir, 'pkgconfig')}
--        self.init(testdir, override_envvars=env)
--        self.build()
--        self.install(use_destdir=False)
--        got_rpath = get_rpath(os.path.join(yonder_prefix, 'bin/rpathified'))
--        self.assertEqual(got_rpath, yonder_libdir)
-+        # Since rpath has multiple valid formats we need to
-+        # test that they are all properly used.
-+        rpath_formats = [
-+            ('-Wl,-rpath=', False),
-+            ('-Wl,-rpath,', False),
-+            ('-Wl,--just-symbols=', True),
-+            ('-Wl,--just-symbols,', True),
-+            ('-Wl,-R', False),
-+            ('-Wl,-R,', False)
-+        ]
-+        for rpath_format, exception in rpath_formats:
-+            # Build an app that uses that installed library.
-+            # Supply the rpath to the installed library via LDFLAGS
-+            # (as systems like buildroot and guix are wont to do)
-+            # and verify install preserves that rpath.
-+            self.new_builddir()
-+            env = {'LDFLAGS': rpath_format + yonder_libdir,
-+                   'PKG_CONFIG_PATH': os.path.join(yonder_libdir, 'pkgconfig')}
-+            if exception:
-+                with self.assertRaises(subprocess.CalledProcessError):
-+                    self.init(testdir, override_envvars=env)
-+                break
-+            self.init(testdir, override_envvars=env)
-+            self.build()
-+            self.install(use_destdir=False)
-+            got_rpath = get_rpath(os.path.join(yonder_prefix, 'bin/rpathified'))
-+            self.assertEqual(got_rpath, yonder_libdir, rpath_format)
- 
-     @skip_if_not_base_option('b_sanitize')
-     def test_pch_with_address_sanitizer(self):
--- 
-2.25.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c88ea8e904..331e50c038 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.55.0/meson-0.55.0.tar.gz.asc
-sha256  0a1ae2bfe2ae14ac47593537f93290fb79e9b775c55b4c53c282bc3ca3745b35  meson-0.55.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.55.1/meson-0.55.1.tar.gz.asc
+sha256  3b5741f884e04928bdfa1947467ff06afa6c98e623c25cef75adf71ca39ce080  meson-0.55.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index f698226a45..8633a2f717 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.55.0
+MESON_VERSION = 0.55.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1
