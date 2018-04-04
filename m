From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:04:58 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats-new: add current
 version information
Message-ID: <20180404200817.4E63A83F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=338c7b5e6288a20080d0715408eeb5596c6d2b7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new column in the HTML output containing the
current version of a package in Buildroot. As such, it isn't terribly
useful, but combined with the latest upstream version added in a
follow-up commit, it will become very useful.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats-new | 46 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index 5dc70f1671..43f7e8d543 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -31,6 +31,7 @@ INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 class Package:
     all_licenses = list()
     all_license_files = list()
+    all_versions = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -41,6 +42,7 @@ class Package:
         self.has_hash = False
         self.patch_count = 0
         self.warnings = 0
+        self.current_version = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -88,6 +90,14 @@ class Package:
         for subdir, _, _ in os.walk(pkgdir):
             self.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))
 
+    def set_current_version(self):
+        """
+        Fills in the .current_version field
+        """
+        var = self.pkgvar()
+        if var in self.all_versions:
+            self.current_version = self.all_versions[var]
+
     def set_check_package_warnings(self):
         """
         Fills in the .warnings field
@@ -217,6 +227,33 @@ def package_init_make_info():
 
         Package.all_license_files.append(pkgvar)
 
+    # Version
+    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
+                                 "-s", "printvars", "VARS=%_VERSION"])
+
+    # We process first the host package VERSION, and then the target
+    # package VERSION. This means that if a package exists in both
+    # target and host variants, with different version numbers
+    # (unlikely), we'll report the target version number.
+    version_list = o.splitlines()
+    version_list = [x for x in version_list if x.startswith("HOST_")] + \
+                   [x for x in version_list if not x.startswith("HOST_")]
+    for l in version_list:
+        # Get variable name and value
+        pkgvar, value = l.split("=")
+
+        # If present, strip HOST_ from variable name
+        if pkgvar.startswith("HOST_"):
+            pkgvar = pkgvar[5:]
+
+        if pkgvar.endswith("_DL_VERSION"):
+            continue
+
+        # Strip _VERSION
+        pkgvar = pkgvar[:-8]
+
+        Package.all_versions[pkgvar] = value
+
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -369,6 +406,13 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%s</td>\n" %
             (" ".join(td_class), boolean_str(pkg.has_hash)))
 
+    # Current version
+    if len(pkg.current_version) > 20:
+        current_version = pkg.current_version[:20] + "..."
+    else:
+        current_version = pkg.current_version
+    f.write("  <td class=\"centered\">%s</td>\n" % current_version)
+
     # Warnings
     td_class = ["centered"]
     if pkg.warnings == 0:
@@ -391,6 +435,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">License</td>
 <td class=\"centered\">License files</td>
 <td class=\"centered\">Hash file</td>
+<td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
 </tr>
 """)
@@ -471,6 +516,7 @@ def __main__():
         pkg.set_hash_info()
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
+        pkg.set_current_version()
     print "Calculate stats"
     stats = calculate_stats(packages)
     print "Write HTML"
