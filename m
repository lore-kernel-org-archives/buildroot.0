From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 Oct 2018 16:41:58 -0500
Subject: [Buildroot] [PATCH v7 06/10] support/scripts/pkg-stats: add CPE
 reporting
In-Reply-To: <1539812522-7171-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1539812522-7171-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1539812522-7171-6-git-send-email-matthew.weber@rockwellcollins.com>
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
v6 -> v7
 - Rebased to work after url checking code was added upstream

v5 -> v6
 - Rebased to capture formatting changes

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
 support/scripts/pkg-stats | 68 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d0b06b1..21d1767 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -26,6 +26,7 @@ import subprocess
 import sys
 import requests  # URL checking
 from multiprocessing import Pool
+from cpedb import CPEDB
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile("\s*https?://\S*\s*$")
@@ -35,6 +36,7 @@ class Package:
     all_licenses = list()
     all_license_files = list()
     all_versions = dict()
+    all_cpe_id = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -49,6 +51,8 @@ class Package:
         self.url = None
         self.url_status = None
         self.url_worker = None
+        self.cpe_id = None
+        self.has_cpe = False
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -139,6 +143,26 @@ class Package:
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
 
@@ -277,6 +301,20 @@ def package_init_make_info():
 
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
 
 def check_url_status_worker(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
@@ -322,6 +360,12 @@ def calculate_stats(packages):
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
 
@@ -488,6 +532,20 @@ def dump_html_pkg(f, pkg):
     f.write("  <td class=\"%s\">%s</td>\n" %
             (" ".join(td_class), url_str))
 
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
 
 
@@ -504,6 +562,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
+<td class=\"centered\">CPE Valid</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -530,6 +589,12 @@ def dump_html_stats(f, stats):
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
@@ -572,6 +637,8 @@ def __main__():
         package_list = args.packages.split(",")
     else:
         package_list = None
+    cpedb = CPEDB()
+    cpedb.get_xml_dict()
     print("Build package list ...")
     packages = get_pkglist(args.npackages, package_list)
     print("Getting package make info ...")
@@ -585,6 +652,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
+        pkg.set_cpe_info(cpedb)
     print("Checking URL status")
     check_package_urls(packages)
     print("Calculate stats")
-- 
1.9.1
