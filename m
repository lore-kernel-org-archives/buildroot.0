From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:30 +0200
Subject: [Buildroot] [PATCH 4/9] package/pkg-utils: Make CVE class
 independent of the Pacakage class
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-5-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The affects method of the CVE use the Package class defined in
pkg-stats. The purpose of migrating the CVE class outside of pkg-stats
was to be able to reuse it from other scripts. So let's remove the
Package dependency and only use the needed information.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve.py    | 10 +++++-----
 support/scripts/pkg-stats | 14 ++++++++------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e911fe0c65..b754a17991 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -180,26 +180,26 @@ class CVE:
         """The set of package names referred by this CVE definition"""
         return set(p['product'] for p in self.each_cpe())
 
-    def affects(self, br_pkg):
+    def affects(self, name, version, cve_ignore_list):
         """
         True if the Buildroot Package object passed as argument is affected
         by this CVE.
         """
-        if br_pkg.is_cve_ignored(self.identifier):
+        if (self.identifier in cve_ignore_list):
             return False
 
         for cpe in self.each_cpe():
             affected = True
-            if cpe['product'] != br_pkg.name:
+            if cpe['product'] != name:
                 continue
             if cpe['v_start'] == '-':
                 return True
             if not (cpe['v_start'] or cpe['v_end']):
                 print("No CVE affected version")
                 continue
-            pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
+            pkg_version = distutils.version.LooseVersion(version)
             if not hasattr(pkg_version, "version"):
-                print("Cannot parse package '%s' version '%s'" % (br_pkg.name, br_pkg.current_version))
+                print("Cannot parse package '%s' version '%s'" % (name, version))
                 continue
 
             if cpe['v_start']:
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1c941104fe..883a5bd2be 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -245,11 +245,12 @@ class Package:
                     self.status['pkg-check'] = ("error", "{} warnings".format(self.warnings))
                 return
 
-    def is_cve_ignored(self, cve):
+    def cve_ignored_list(self):
         """
-        Tells if the CVE is ignored by the package
+        Give the list of CVEs ignored by the package
         """
-        return cve in self.all_ignored_cves.get(self.pkgvar(), [])
+        print(self.all_ignored_cves.get(self.pkgvar(), []))
+        return list(self.all_ignored_cves.get(self.pkgvar(), []))
 
     def set_developers(self, developers):
         """
@@ -501,9 +502,10 @@ def check_package_cves(nvd_path, packages):
 
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
-            if pkg_name in packages and cve.affects(packages[pkg_name]):
-                packages[pkg_name].cves.append(cve.identifier)
-
+            if pkg_name in packages:
+                pkg = packages[pkg_name]
+                if cve.affects(pkg.name, pkg.current_version, pkg.cve_ignored_list()):
+                    pkg.cves.append(cve.identifier)
 
 def calculate_stats(packages):
     stats = defaultdict(int)
-- 
2.27.0
