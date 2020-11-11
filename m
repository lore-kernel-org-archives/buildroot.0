From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:01:21 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 allow to run script outside of the top-level directory
Message-ID: <20201117203828.1CDF77FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae86067a151b6596ca492d6f94ed513f4f8e18d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Currently, pkg-stats expects being executed from Buildroot's top-level
source directory. As we are going to extend pkg-stats to cover only
the packages available in the current configuration, it makes sense to
be able to run it from the output directory, which can be anywhere
compared to Buildroot's top-level directory.

This commit adjusts pkg-stats to this, by inferring all Buildroot
paths based on the location of the pkg-stats script itself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 503cc45c16..fd6e370c18 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -28,7 +28,9 @@ import subprocess
 import json
 import sys
 
-sys.path.append('utils/')
+brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
+
+sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
 import cve as cvecheck  # noqa: E402
 
@@ -66,7 +68,7 @@ def get_defconfig_list():
     """
     return [
         Defconfig(name[:-len('_defconfig')], os.path.join('configs', name))
-        for name in os.listdir('configs')
+        for name in os.listdir(os.path.join(brpath, 'configs'))
         if name.endswith('_defconfig')
     ]
 
@@ -108,9 +110,10 @@ class Package:
         Fills in the .url field
         """
         self.status['url'] = ("warning", "no Config.in")
-        for filename in os.listdir(os.path.dirname(self.path)):
+        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
+        for filename in os.listdir(pkgdir):
             if fnmatch.fnmatch(filename, 'Config.*'):
-                fp = open(os.path.join(os.path.dirname(self.path), filename), "r")
+                fp = open(os.path.join(pkgdir, filename), "r")
                 for config_line in fp:
                     if URL_RE.match(config_line):
                         self.url = config_line.strip()
@@ -138,7 +141,7 @@ class Package:
         Fills in the .infras field
         """
         self.infras = list()
-        with open(self.path, 'r') as f:
+        with open(os.path.join(brpath, self.path), 'r') as f:
             lines = f.readlines()
             for l in lines:
                 match = INFRA_RE.match(l)
@@ -178,7 +181,7 @@ class Package:
             return
 
         hashpath = self.path.replace(".mk", ".hash")
-        if os.path.exists(hashpath):
+        if os.path.exists(os.path.join(brpath, hashpath)):
             self.status['hash'] = ("ok", "found")
         else:
             self.status['hash'] = ("error", "missing")
@@ -191,7 +194,7 @@ class Package:
             self.status['patches'] = ("na", "no valid package infra")
             return
 
-        pkgdir = os.path.dirname(self.path)
+        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
         for subdir, _, _ in os.walk(pkgdir):
             self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
 
@@ -214,8 +217,8 @@ class Package:
         """
         Fills in the .warnings and .status['pkg-check'] fields
         """
-        cmd = ["./utils/check-package"]
-        pkgdir = os.path.dirname(self.path)
+        cmd = [os.path.join(brpath, "utils/check-package")]
+        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
         self.status['pkg-check'] = ("error", "Missing")
         for root, dirs, files in os.walk(pkgdir):
             for f in files:
@@ -300,11 +303,12 @@ def get_pkglist(npackages, package_list):
                      "toolchain/toolchain-wrapper.mk"]
     packages = list()
     count = 0
-    for root, dirs, files in os.walk("."):
+    for root, dirs, files in os.walk(brpath):
+        root = os.path.relpath(root, brpath)
         rootdir = root.split("/")
-        if len(rootdir) < 2:
+        if len(rootdir) < 1:
             continue
-        if rootdir[1] not in WALK_USEFUL_SUBDIRS:
+        if rootdir[0] not in WALK_USEFUL_SUBDIRS:
             continue
         for f in files:
             if not f.endswith(".mk"):
@@ -316,8 +320,7 @@ def get_pkglist(npackages, package_list):
             pkgpath = os.path.join(root, f)
             skip = False
             for exclude in WALK_EXCLUDES:
-                # pkgpath[2:] strips the initial './'
-                if re.match(exclude, pkgpath[2:]):
+                if re.match(exclude, pkgpath):
                     skip = True
                     continue
             if skip:
@@ -678,7 +681,7 @@ def boolean_str(b):
 
 def dump_html_pkg(f, pkg):
     f.write(" <tr>\n")
-    f.write("  <td>%s</td>\n" % pkg.path[2:])
+    f.write("  <td>%s</td>\n" % pkg.path)
 
     # Patch count
     td_class = ["centered"]
@@ -945,12 +948,13 @@ def __main__():
     else:
         package_list = None
     date = datetime.datetime.utcnow()
-    commit = subprocess.check_output(['git', 'rev-parse',
+    commit = subprocess.check_output(['git', '-C', brpath,
+                                      'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting developers ...")
-    developers = parse_developers()
+    developers = parse_developers(brpath)
     print("Build defconfig list ...")
     defconfigs = get_defconfig_list()
     for d in defconfigs:
