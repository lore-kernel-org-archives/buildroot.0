From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 17 May 2018 22:13:19 -0500
Subject: [Buildroot] [PATCH v5 6/7] support/scripts/pkg-stats: add CPE
 reporting
In-Reply-To: <1526613200-48452-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1526613200-48452-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1526613200-48452-7-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pkg status now includes CPE as an item reported in the html
output (stat summary and for each pkg)

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes

v4 -> v5
[Ricardo
 - Renamed patch to correctly match file name
 - Removed extra prints as they aren't needed when we have the
   output reports/stdout
 - Updated v4 comments about general flake formatting cleanup

[Arnout
 - Collectly with Ricardo, decided to move cpe report analysis to
   a seperate script and breakout a module that's imported for the
   cpedb class
 - Rename cpe_dict to instead be cpedb

v3 -> v4
 - Collapsed patch 5 and 6 together into this single patch

[Eric
 - added except handling around file io
 - fixed condition where buildroot isn't generating a CPE
   string as part of the infra and output that is the case.
   (eventually these probably could be fixed but there aren't
   many at this point)

[Ricardo
 - fixed patch naming and resolved flake8 issues
 - took the opportunity to also fix other flake8 syntax
   update suggestions
 - added except handling to have proper exits
 - cleaned up csv file header skippin
 - condensed partial cve string split
 - updated help txt as suggested
 - reworked output file requirement.  Removed -o as required but
   added check if provided when -c isn't used

v3
 - New patch
---
 support/scripts/pkg-stats | 80 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 43f7e8d..db58a75 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -24,6 +24,7 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+from cpedb import CPEDB
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 
@@ -32,6 +33,7 @@ class Package:
     all_licenses = list()
     all_license_files = list()
     all_versions = dict()
+    all_cpe_id = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -43,6 +45,8 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.cpe_id = None
+        self.has_cpe = False
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -116,6 +120,26 @@ class Package:
                 self.warnings = int(m.group(1))
                 return
 
+    def set_cpe_info(self, cpe_dict):
+        """
+        Fills in the .has_cpe field
+        """
+        var = self.pkgvar()
+        if var in self.all_cpe_id:
+            self.cpe_id = self.all_cpe_id[var]
+        if self.cpe_id is None:
+            # BR infra did not build a CPE ID for this pkg
+            # as it's most likely a host pkg
+            return
+        result = cpe_dict.find(self.cpe_id)
+        if not result:
+            result = cpe_dict.find_partial(cpe_dict.get_cpe_no_version(self.cpe_id))
+            if result:
+                self.has_cpe = "Update"
+            # Unset case for has_cpe is assumed missing/does not exist
+        else:
+            self.has_cpe = cpe_dict.get_nvd_url(self.cpe_id)
+
     def __eq__(self, other):
         return self.path == other.path
 
@@ -254,6 +278,20 @@ def package_init_make_info():
 
         Package.all_versions[pkgvar] = value
 
+    # CPE ID
+    o = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y",
+                                 "-s", "printvars", "VARS=%_CPE_ID"])
+    for l in o.splitlines():
+        # Get variable name and value
+        pkgvar, value = l.split("=")
+
+        # Strip _CPE_ID
+        pkgvar = pkgvar[:-7]
+        if pkgvar in ("LINUX", "LINUX_HEADERS"):
+            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
+        else:
+            Package.all_cpe_id[pkgvar] = "cpe:2.3:a:" + value + ":*:*:*:*:*:*:*"
+
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -279,6 +317,12 @@ def calculate_stats(packages):
             stats["hash"] += 1
         else:
             stats["no-hash"] += 1
+        if pkg.has_cpe == "Update":
+            stats["update-cpe"] += 1
+        elif pkg.has_cpe:
+            stats["cpe"] += 1
+        else:
+            stats["no-cpe"] += 1
         stats["patches"] += pkg.patch_count
     return stats
 
@@ -422,6 +466,20 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%d</td>\n" %
             (" ".join(td_class), pkg.warnings))
 
+    # CPE Valid
+    td_class = ["centered"]
+    if not pkg.has_cpe:
+        td_class.append("wrong")
+        f.write("  <td class=\"%s\">%s</td>\n" %
+                (" ".join(td_class), boolean_str(pkg.has_cpe)))
+    elif pkg.has_cpe == "Update":
+        td_class.append("wrong")
+        f.write("  <td class=\"%s\">Update</td>\n" %
+                (" ".join(td_class)))
+    else:
+        td_class.append("correct")
+        f.write("  <td class=\"%s\"><a href=\"%s\">%s</a></td>\n" %
+                (" ".join(td_class), pkg.has_cpe, boolean_str(pkg.has_cpe)))
     f.write(" </tr>\n")
 
 
@@ -437,6 +495,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
+<td class=\"centered\">CPE Valid</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -463,6 +522,12 @@ def dump_html_stats(f, stats):
             stats["hash"])
     f.write(" <tr><td>Packages not having a hash file</td><td>%s</td></tr>\n" %
             stats["no-hash"])
+    f.write(" <tr><td>Packages having a registered CPE</td><td>%s</td></tr>\n" %
+            stats["cpe"])
+    f.write(" <tr><td>Packages needing CPE update</td><td>%s</td></tr>\n" %
+            stats["update-cpe"])
+    f.write(" <tr><td>Packages missing a registered CPE</td><td>%s</td></tr>\n" %
+            stats["no-cpe"])
     f.write(" <tr><td>Total number of patches</td><td>%s</td></tr>\n" %
             stats["patches"])
     f.write("</table>\n")
@@ -499,17 +564,19 @@ def parse_args():
 def __main__():
     args = parse_args()
     if args.npackages and args.packages:
-        print "ERROR: -n and -p are mutually exclusive"
+        print("ERROR: -n and -p are mutually exclusive")
         sys.exit(1)
     if args.packages:
         package_list = args.packages.split(",")
     else:
         package_list = None
-    print "Build package list ..."
+    cpedb = CPEDB()
+    cpedb.get_xml_dict()
+    print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
-    print "Getting package make info ..."
+    print("Getting package make info ...")
     package_init_make_info()
-    print "Getting package details ..."
+    print("Getting package details ...")
     for pkg in packages:
         pkg.set_infra()
         pkg.set_license()
@@ -517,9 +584,10 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
-    print "Calculate stats"
+        pkg.set_cpe_info(cpedb)
+    print("Calculate stats")
     stats = calculate_stats(packages)
-    print "Write HTML"
+    print("Write HTML")
     dump_html(packages, stats, args.output)
 
 
-- 
1.9.1
