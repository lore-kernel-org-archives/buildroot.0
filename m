From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 31 Jul 2020 01:48:21 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: update rpath patch to
 upstream version
Message-ID: <20200731074821.4137503-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The version of this patch merged by upstream has some changes to rpath
syntax matching and handling for additional syntax edge cases.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...003-backends-fix-rpath-match-pattern.patch | 77 +++++++++++++++----
 1 file changed, 63 insertions(+), 14 deletions(-)

diff --git a/package/meson/0003-backends-fix-rpath-match-pattern.patch b/package/meson/0003-backends-fix-rpath-match-pattern.patch
index 5fd5b73ade..f4477b59d2 100644
--- a/package/meson/0003-backends-fix-rpath-match-pattern.patch
+++ b/package/meson/0003-backends-fix-rpath-match-pattern.patch
@@ -1,4 +1,4 @@
-From af4ac0284714842535106f3d5f8a973c20e95105 Mon Sep 17 00:00:00 2001
+From 1ce4258c219fe08b6d6eaa6aa944f27d91d054cb Mon Sep 17 00:00:00 2001
 From: James Hilliard <james.hilliard1@gmail.com>
 Date: Sat, 18 Jul 2020 17:01:33 -0600
 Subject: [PATCH] backends: fix rpath match pattern
@@ -6,23 +6,45 @@ Subject: [PATCH] backends: fix rpath match pattern
 Since -Wl,-rpath= is not the only valid rpath ldflags syntax we
 need to try and match all valid rpath ldflags.
 
+In addition we should prevent -Wl,--just-symbols from being used to
+set rpath due to inconsistent compiler support.
+
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/mesonbuild/meson/pull/7472]
+[james.hilliard1 at gmail.com: backport from upstream commit
+1ce4258c219fe08b6d6eaa6aa944f27d91d054cb]
 ---
- mesonbuild/backend/backends.py |  6 ++++--
- run_unittests.py               | 26 +++++++++++++++-----------
- 2 files changed, 19 insertions(+), 13 deletions(-)
+ mesonbuild/backend/backends.py | 30 ++++++++++++++++++++++++--
+ run_unittests.py               | 39 +++++++++++++++++++++++-----------
+ 2 files changed, 55 insertions(+), 14 deletions(-)
 
 diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
-index cfd3a397f..6f44abc13 100644
+index cfd3a397f..e053f67e6 100644
 --- a/mesonbuild/backend/backends.py
 +++ b/mesonbuild/backend/backends.py
-@@ -455,9 +455,11 @@ class Backend:
+@@ -14,6 +14,7 @@
+ 
+ from collections import OrderedDict
+ from functools import lru_cache
++from pathlib import Path
+ import enum
+ import json
+ import os
+@@ -455,10 +456,35 @@ class Backend:
                  args.extend(self.environment.coredata.get_external_link_args(target.for_machine, lang))
              except Exception:
                  pass
-+        rpath_regex = re.compile(r'-Wl,-rpath(?:-link)?[=,]([^,@\-][^,]+)')
++        # Match rpath formats:
++        # -Wl,-rpath=
++        # -Wl,-rpath,
++        rpath_regex = re.compile(r'-Wl,-rpath[=,]([^,]+)')
++        # Match solaris style compat runpath formats:
++        # -Wl,-R
++        # -Wl,-R,
++        runpath_regex = re.compile(r'-Wl,-R[,]?([^,]+)')
++        # Match symbols formats:
++        # -Wl,--just-symbols=
++        # -Wl,--just-symbols,
++        symbols_regex = re.compile(r'-Wl,--just-symbols[=,]([^,]+)')
          for arg in args:
 -            if arg.startswith('-Wl,-rpath='):
 -                for dir in arg.replace('-Wl,-rpath=','').split(':'):
@@ -30,15 +52,30 @@ index cfd3a397f..6f44abc13 100644
 +            if rpath_match:
 +                for dir in rpath_match.group(1).split(':'):
                      dirs.add(dir)
++            runpath_match = runpath_regex.match(arg)
++            if runpath_match:
++                for dir in runpath_match.group(1).split(':'):
++                    # The symbols arg is an rpath if the path is a directory
++                    if Path(dir).is_dir():
++                        dirs.add(dir)
++            symbols_match = symbols_regex.match(arg)
++            if symbols_match:
++                for dir in symbols_match.group(1).split(':'):
++                    # Prevent usage of --just-symbols to specify rpath
++                    if Path(dir).is_dir():
++                        raise MesonException('Invalid arg for --just-symbols, {} is a directory.'.format(dir))
          return dirs
  
+     def rpaths_for_bundled_shared_libraries(self, target, exclude_system=True):
 diff --git a/run_unittests.py b/run_unittests.py
-index 820b705b5..2c3ffc2e9 100755
+index b5294b9f8..73131c75b 100755
 --- a/run_unittests.py
 +++ b/run_unittests.py
-@@ -6421,17 +6421,21 @@ class LinuxlikeTests(BasePlatformTests):
+@@ -6473,19 +6473,34 @@ class LinuxlikeTests(BasePlatformTests):
+         self.init(yonder_dir)
+         self.build()
          self.install(use_destdir=False)
-         self.new_builddir()
+-        self.new_builddir()
  
 -        # Build an app that uses that installed library.
 -        # Supply the rpath to the installed library via LDFLAGS
@@ -53,14 +90,26 @@ index 820b705b5..2c3ffc2e9 100755
 -        self.assertEqual(got_rpath, yonder_libdir)
 +        # Since rpath has multiple valid formats we need to
 +        # test that they are all properly used.
-+        rpath_formats = ['-Wl,-rpath=', '-Wl,-rpath,', '-Wl,-rpath-link=', '-Wl,-rpath-link,']
-+        for rpath_format in rpath_formats:
++        rpath_formats = [
++            ('-Wl,-rpath=', False),
++            ('-Wl,-rpath,', False),
++            ('-Wl,--just-symbols=', True),
++            ('-Wl,--just-symbols,', True),
++            ('-Wl,-R', False),
++            ('-Wl,-R,', False)
++        ]
++        for rpath_format, exception in rpath_formats:
 +            # Build an app that uses that installed library.
 +            # Supply the rpath to the installed library via LDFLAGS
 +            # (as systems like buildroot and guix are wont to do)
 +            # and verify install preserves that rpath.
++            self.new_builddir()
 +            env = {'LDFLAGS': rpath_format + yonder_libdir,
 +                   'PKG_CONFIG_PATH': os.path.join(yonder_libdir, 'pkgconfig')}
++            if exception:
++                with self.assertRaises(subprocess.CalledProcessError):
++                    self.init(testdir, override_envvars=env)
++                break
 +            self.init(testdir, override_envvars=env)
 +            self.build()
 +            self.install(use_destdir=False)
-- 
2.25.1
