Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D8BC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0DCF612B4;
	Tue,  6 Feb 2024 17:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0DCF612B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsSxKo1te1IV; Tue,  6 Feb 2024 17:11:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C238261142;
	Tue,  6 Feb 2024 17:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C238261142
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1E921BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB56612A5
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABB56612A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jNdOx2H15O8O for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 519DB60B45
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 519DB60B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D6D78718C; Tue,  6 Feb 2024 17:11:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:10:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc3d2bcb40e5cc47b4d6a3dd73fc145c1f00db50
X-Git-Newrev: fbea83fc47046653778e0cf49863b2c4a3bac8e7
X-Patchwork-Hint: ignore
Message-Id: <20240206171103.3D6D78718C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/pkg-stats: list packages from
 external trees.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbea83fc47046653778e0cf49863b2c4a3bac8e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Search the external trees for package files and add them to the list.
The list of directories walked and excluded are the same as for the main
tree, and should work out of the box if the user sticks to the directory
structure suggested in the manual.

Two additional properties were added to the Package class, the tree name and
the path. For consistency and to simplify the code, packages in the main tree
are marked as coming from "BR2".

The HTML output has a new column listing the external name (or "BR2") and the
json output has a new property "tree".

Signed-off-by: Juan Carrano <juan.carrano@ebee.berlin>
[Arnout:
 - fix flake8 error "'itertools' imported but unused";
 - use str.split instead of str.partition;
 - use BR2_EXTERNAL_BUILDROOT_PATH instead of BR2_EXTERNAL_BR2_PATH;
 - remove pkgdir variable, instead use self.pkgdir.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/pkg-stats | 92 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 32 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9349a0df57..05f0cd9e4a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -23,7 +23,7 @@ import asyncio
 import datetime
 import fnmatch
 import os
-from collections import defaultdict
+from collections import defaultdict, namedtuple
 import re
 import subprocess
 import json
@@ -77,6 +77,19 @@ def get_defconfig_list():
     ]
 
 
+Br2Tree = namedtuple("Br2Tree", ["name", "path"])
+
+
+def get_trees():
+    raw_variables = subprocess.check_output(["make", "--no-print-directory", "-s",
+                                             "BR2_HAVE_DOT_CONFIG=y", "printvars",
+                                             "VARS=BR2_EXTERNAL_NAMES BR2_EXTERNAL_%_PATH"])
+    variables = dict(line.split("=") for line in raw_variables.decode().split("\n") if line)
+    variables["BR2_EXTERNAL_BUILDROOT_PATH"] = brpath
+    externals = ["BUILDROOT", *variables["BR2_EXTERNAL_NAMES"].split()]
+    return [Br2Tree(name, os.path.normpath(variables[f"BR2_EXTERNAL_{name}_PATH"])) for name in externals]
+
+
 class Package:
     all_licenses = dict()
     all_license_files = list()
@@ -89,7 +102,9 @@ class Package:
     status_checks = ['cve', 'developers', 'hash', 'license',
                      'license-files', 'patches', 'pkg-check', 'url', 'version']
 
-    def __init__(self, name, path):
+    def __init__(self, tree, name, path):
+        self.tree = tree.name
+        self.tree_path = tree.path
         self.name = name
         self.path = path
         self.pkg_path = os.path.dirname(path)
@@ -118,15 +133,26 @@ class Package:
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
 
+    @property
+    def pkgdir(self):
+        return os.path.join(self.tree_path, self.pkg_path)
+
+    @property
+    def pkgfile(self):
+        return os.path.join(self.tree_path, self.path)
+
+    @property
+    def hashpath(self):
+        return self.pkgfile.replace(".mk", ".hash")
+
     def set_url(self):
         """
         Fills in the .url field
         """
         self.status['url'] = ("warning", "no Config.in")
-        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
-        for filename in os.listdir(pkgdir):
+        for filename in os.listdir(self.pkgdir):
             if fnmatch.fnmatch(filename, 'Config.*'):
-                fp = open(os.path.join(pkgdir, filename), "r")
+                fp = open(os.path.join(self.pkgdir, filename), "r")
                 for config_line in fp:
                     if URL_RE.match(config_line):
                         self.url = config_line.strip()
@@ -172,7 +198,7 @@ class Package:
             keep_target = True
 
         self.infras = list()
-        with open(os.path.join(brpath, self.path), 'r') as f:
+        with open(self.pkgfile, 'r') as f:
             lines = f.readlines()
             for line in lines:
                 match = INFRA_RE.match(line)
@@ -211,8 +237,7 @@ class Package:
             self.status['hash-license'] = ("na", "no valid package infra")
             return
 
-        hashpath = self.path.replace(".mk", ".hash")
-        if os.path.exists(os.path.join(brpath, hashpath)):
+        if os.path.exists(self.hashpath):
             self.status['hash'] = ("ok", "found")
         else:
             self.status['hash'] = ("error", "missing")
@@ -225,8 +250,7 @@ class Package:
             self.status['patches'] = ("na", "no valid package infra")
             return
 
-        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
-        for subdir, _, _ in os.walk(pkgdir):
+        for subdir, _, _ in os.walk(self.pkgdir):
             self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
 
         if self.patch_count == 0:
@@ -268,9 +292,8 @@ class Package:
         Fills in the .warnings and .status['pkg-check'] fields
         """
         cmd = [os.path.join(brpath, "utils/check-package")]
-        pkgdir = os.path.dirname(os.path.join(brpath, self.path))
         self.status['pkg-check'] = ("error", "Missing")
-        for root, dirs, files in os.walk(pkgdir):
+        for root, dirs, files in os.walk(self.pkgdir):
             for f in files:
                 cmd.append(os.path.join(root, f))
         o = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[1]
@@ -327,7 +350,7 @@ class Package:
              self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
 
-def get_pkglist(npackages, package_list):
+def get_pkglist(trees, npackages, package_list):
     """
     Builds the list of Buildroot packages, returning a list of Package
     objects. Only the .name and .path fields of the Package object are
@@ -362,8 +385,8 @@ def get_pkglist(npackages, package_list):
                      "toolchain/toolchain-wrapper.mk"]
     packages = list()
     count = 0
-    for root, dirs, files in os.walk(brpath):
-        root = os.path.relpath(root, brpath)
+    for br_tree, root, dirs, files in ((tree, *rdf) for tree in trees for rdf in os.walk(tree.path)):
+        root = os.path.relpath(root, br_tree.path)
         rootdir = root.split("/")
         if len(rootdir) < 1:
             continue
@@ -384,7 +407,7 @@ def get_pkglist(npackages, package_list):
                     continue
             if skip:
                 continue
-            p = Package(pkgname, pkgpath)
+            p = Package(br_tree, pkgname, pkgpath)
             packages.append(p)
             count += 1
             if npackages and count == npackages:
@@ -858,7 +881,7 @@ function expandField(fieldId){
 #package-grid, #results-grid {
   display: grid;
   grid-gap: 2px;
-  grid-template-columns: 1fr repeat(12, min-content);
+  grid-template-columns: min-content 1fr repeat(12, min-content);
 }
 #results-grid {
   grid-template-columns: 3fr 1fr;
@@ -924,6 +947,8 @@ def boolean_str(b):
 
 def dump_html_pkg(f, pkg):
     pkg_css_class = pkg.path.replace("/", "_")[:-3]
+    f.write(f'<div id="tree__{pkg_css_class}" \
+        class="tree data _{pkg_css_class}">{pkg.tree}</div>\n')
     f.write(f'<div id="package__{pkg_css_class}" \
         class="package data _{pkg_css_class}">{pkg.path}</div>\n')
     # Patch count
@@ -1128,31 +1153,33 @@ def dump_html_pkg(f, pkg):
 def dump_html_all_pkgs(f, packages):
     f.write("""
 <div id="package-grid">
-<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="package"
+<div style="grid-column: 1;" onclick="sortGrid(this.id)" id="tree"
+     class="tree data label"><span>Tree</span><span></span></div>
+<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="package"
      class="package data label"><span>Package</span><span></span></div>
-<div style="grid-column: 2;" onclick="sortGrid(this.id)" id="patch_count"
+<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="patch_count"
      class="centered patch_count data label"><span>Patch count</span><span></span></div>
-<div style="grid-column: 3;" onclick="sortGrid(this.id)" id="infrastructure"
+<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="infrastructure"
      class="centered infrastructure data label">Infrastructure<span></span></div>
-<div style="grid-column: 4;" onclick="sortGrid(this.id)" id="license"
+<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license"
      class="centered license data label"><span>License</span><span></span></div>
-<div style="grid-column: 5;" onclick="sortGrid(this.id)" id="license_files"
+<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="license_files"
      class="centered license_files data label"><span>License files</span><span></span></div>
-<div style="grid-column: 6;" onclick="sortGrid(this.id)" id="hash_file"
+<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="hash_file"
      class="centered hash_file data label"><span>Hash file</span><span></span></div>
-<div style="grid-column: 7;" onclick="sortGrid(this.id)" id="current_version"
+<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="current_version"
      class="centered current_version data label"><span>Current version</span><span></span></div>
-<div style="grid-column: 8;" onclick="sortGrid(this.id)" id="latest_version"
+<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="latest_version"
      class="centered latest_version data label"><span>Latest version</span><span></span></div>
-<div style="grid-column: 9;" onclick="sortGrid(this.id)" id="warnings"
+<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="warnings"
      class="centered warnings data label"><span>Warnings</span><span></span></div>
-<div style="grid-column: 10;" onclick="sortGrid(this.id)" id="upstream_url"
+<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="upstream_url"
      class="centered upstream_url data label"><span>Upstream URL</span><span></span></div>
-<div style="grid-column: 11;" onclick="sortGrid(this.id)" id="cves"
+<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="cves"
      class="centered cves data label"><span>CVEs</span><span></span></div>
-<div style="grid-column: 12;" onclick="sortGrid(this.id)" id="ignored_cves"
+<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="ignored_cves"
      class="centered ignored_cves data label"><span>CVEs Ignored</span><span></span></div>
-<div style="grid-column: 13;" onclick="sortGrid(this.id)" id="cpe_id"
+<div style="grid-column: 14;" onclick="sortGrid(this.id)" id="cpe_id"
      class="centered cpe_id data label"><span>CPE ID</span><span></span></div>
 """)
     for pkg in sorted(packages):
@@ -1223,7 +1250,7 @@ def dump_html(packages, stats, date, commit, output):
 def dump_json(packages, defconfigs, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
-    excluded_fields = ['url_worker', 'name']
+    excluded_fields = ['url_worker', 'name', 'tree_path']
     pkgs = {
         pkg.name: {
             k: v
@@ -1311,7 +1338,8 @@ def __main__():
                                       'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
     print("Build package list ...")
-    packages = get_pkglist(args.npackages, package_list)
+    all_trees = get_trees()
+    packages = get_pkglist(all_trees, args.npackages, package_list)
     print("Getting developers ...")
     developers = parse_developers()
     print("Build defconfig list ...")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
