From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 11:00:40 +0200
Subject: [Buildroot] [git commit] support/scripts: make CVE class
 independent of the Packaage class
Message-ID: <20200902161637.23DFB85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a2f69d672f51f96eef377139c9e77001ae4a0e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The affects method of the CVE uses the Package class defined in
pkg-stats. The purpose of migrating the CVE class outside of pkg-stats
was to be able to reuse it from other scripts. So let's remove the
Package dependency and only use the needed information.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve.py    | 10 +++++-----
 support/scripts/pkg-stats | 14 ++++++++------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e812da810c..6396019e0e 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -190,21 +190,21 @@ class CVE:
         """The set of package names referred by this CVE definition"""
         return set(p['product'] for p in self.each_cpe())
 
-    def affects(self, br_pkg):
+    def affects(self, name, version, cve_ignore_list):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
-        if br_pkg.is_cve_ignored(self.identifier):
+        if self.identifier in cve_ignore_list:
             return self.CVE_DOESNT_AFFECT
 
-        pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
+        pkg_version = distutils.version.LooseVersion(version)
         if not hasattr(pkg_version, "version"):
-            print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
+            print("Cannot parse package '%s' version '%s'" % (name, version))
             pkg_version = None
 
         for cpe in self.each_cpe():
-            if cpe['product'] != br_pkg.name:
+            if cpe['product'] != name:
                 continue
             if cpe['v_start'] == '-':
                 return self.CVE_AFFECTS
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 5e2213fb5c..be586a2c2e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -236,11 +236,12 @@ class Package:
                     self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
                 return
 
-    def is_cve_ignored(self, cve):
+    @property
+    def ignored_cves(self):
         """
-        Tells if the CVE is ignored by the package
+        Give the list of CVEs ignored by the package
         """
-        return cve in self.all_ignored_cves.get(self.pkgvar(), [])
+        return list(self.all_ignored_cves.get(self.pkgvar(), []))
 
     def set_developers(self, developers):
         """
@@ -536,9 +537,10 @@ def check_package_cves(nvd_path, packages):
 
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
-            if pkg_name in packages and cve.affects(packages[pkg_name]) == cve.CVE_AFFECTS:
-                packages[pkg_name].cves.append(cve.identifier)
-
+            if pkg_name in packages:
+                pkg = packages[pkg_name]
+                if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves) == cve.CVE_AFFECTS :
+                    pkg.cves.append(cve.identifier)
 
 def calculate_stats(packages):
     stats = defaultdict(int)
