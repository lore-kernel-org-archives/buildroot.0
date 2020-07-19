From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Jul 2020 09:55:48 +0200
Subject: [Buildroot] [git commit] package/meson: fix LDFLAGS rpath match
 pattern
Message-ID: <20200719075148.BF0A486CB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae26a5b539242ca5952a1e4f45a43d2ff64856bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream change in d7235c5905fa98207d90f3ad34bf590493498d5b is not
sufficient to prevent rpaths from being stripped in some cases due to
a bug in how it matches rpaths in LDFLAGS.

Add a patch fixing the LDFLAGS rpath match pattern.

Fixes:
http://autobuild.buildroot.net/results/f2f/f2f912416ab11d454479ef3d22ed6b757207f84f/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-backends-fix-rpath-match-pattern.patch    | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/meson/0003-backends-fix-rpath-match-pattern.patch b/package/meson/0003-backends-fix-rpath-match-pattern.patch
new file mode 100644
index 0000000000..5fd5b73ade
--- /dev/null
+++ b/package/meson/0003-backends-fix-rpath-match-pattern.patch
@@ -0,0 +1,74 @@
+From af4ac0284714842535106f3d5f8a973c20e95105 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sat, 18 Jul 2020 17:01:33 -0600
+Subject: [PATCH] backends: fix rpath match pattern
+
+Since -Wl,-rpath= is not the only valid rpath ldflags syntax we
+need to try and match all valid rpath ldflags.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/mesonbuild/meson/pull/7472]
+---
+ mesonbuild/backend/backends.py |  6 ++++--
+ run_unittests.py               | 26 +++++++++++++++-----------
+ 2 files changed, 19 insertions(+), 13 deletions(-)
+
+diff --git a/mesonbuild/backend/backends.py b/mesonbuild/backend/backends.py
+index cfd3a397f..6f44abc13 100644
+--- a/mesonbuild/backend/backends.py
++++ b/mesonbuild/backend/backends.py
+@@ -455,9 +455,11 @@ class Backend:
+                 args.extend(self.environment.coredata.get_external_link_args(target.for_machine, lang))
+             except Exception:
+                 pass
++        rpath_regex = re.compile(r'-Wl,-rpath(?:-link)?[=,]([^,@\-][^,]+)')
+         for arg in args:
+-            if arg.startswith('-Wl,-rpath='):
+-                for dir in arg.replace('-Wl,-rpath=','').split(':'):
++            rpath_match = rpath_regex.match(arg)
++            if rpath_match:
++                for dir in rpath_match.group(1).split(':'):
+                     dirs.add(dir)
+         return dirs
+ 
+diff --git a/run_unittests.py b/run_unittests.py
+index 820b705b5..2c3ffc2e9 100755
+--- a/run_unittests.py
++++ b/run_unittests.py
+@@ -6421,17 +6421,21 @@ class LinuxlikeTests(BasePlatformTests):
+         self.install(use_destdir=False)
+         self.new_builddir()
+ 
+-        # Build an app that uses that installed library.
+-        # Supply the rpath to the installed library via LDFLAGS
+-        # (as systems like buildroot and guix are wont to do)
+-        # and verify install preserves that rpath.
+-        env = {'LDFLAGS': '-Wl,-rpath=' + yonder_libdir,
+-               'PKG_CONFIG_PATH': os.path.join(yonder_libdir, 'pkgconfig')}
+-        self.init(testdir, override_envvars=env)
+-        self.build()
+-        self.install(use_destdir=False)
+-        got_rpath = get_rpath(os.path.join(yonder_prefix, 'bin/rpathified'))
+-        self.assertEqual(got_rpath, yonder_libdir)
++        # Since rpath has multiple valid formats we need to
++        # test that they are all properly used.
++        rpath_formats = ['-Wl,-rpath=', '-Wl,-rpath,', '-Wl,-rpath-link=', '-Wl,-rpath-link,']
++        for rpath_format in rpath_formats:
++            # Build an app that uses that installed library.
++            # Supply the rpath to the installed library via LDFLAGS
++            # (as systems like buildroot and guix are wont to do)
++            # and verify install preserves that rpath.
++            env = {'LDFLAGS': rpath_format + yonder_libdir,
++                   'PKG_CONFIG_PATH': os.path.join(yonder_libdir, 'pkgconfig')}
++            self.init(testdir, override_envvars=env)
++            self.build()
++            self.install(use_destdir=False)
++            got_rpath = get_rpath(os.path.join(yonder_prefix, 'bin/rpathified'))
++            self.assertEqual(got_rpath, yonder_libdir, rpath_format)
+ 
+     @skip_if_not_base_option('b_sanitize')
+     def test_pch_with_address_sanitizer(self):
+-- 
+2.25.1
+
