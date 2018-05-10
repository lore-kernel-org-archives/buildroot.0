From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 10 May 2018 13:58:54 -0500
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <1525978734-35706-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1525978734-35706-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1525978734-35706-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pkg status now includes CPE as an item reported in the html
output (stat summary and for each pkg)

Option added to allow analysis of a specific Buildroot target's
'make cpe-info' reports accuracy against CPE database.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes
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
 - added except handling to have proper exits
 - cleaned up csv file header skippin
 - condensed partial cve string split
 - updated help txt as suggested
 - reworked output file requirement.  Removed -o as required but
   added check if provided when -c isn't used

v3
 - New patch
---
 support/scripts/pkg-stats | 188 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 170 insertions(+), 18 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 43f7e8d..c28d397 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -24,14 +24,22 @@ from collections import defaultdict
 import re
 import subprocess
 import sys
+import urllib2
+import xmltodict
+import gzip
+from StringIO import StringIO
+import csv
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 
+CPE_XML_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"
+
 
 class Package:
     all_licenses = list()
     all_license_files = list()
     all_versions = dict()
+    all_cpe_id = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -43,6 +51,8 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.cpe_id = None
+        self.has_cpe = False
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -116,6 +126,25 @@ class Package:
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
+            print("BR Infra Not building CPE for pkg: [%s]" % var)
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
 
@@ -254,6 +283,23 @@ def package_init_make_info():
 
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
+
+        if pkgvar == "LINUX":
+            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
+        elif pkgvar == "LINUX_HEADERS":
+            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
+        else:
+            Package.all_cpe_id[pkgvar] = "cpe:2.3:a:" + value + ":*:*:*:*:*:*:*"
+
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -279,6 +325,12 @@ def calculate_stats(packages):
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
 
@@ -422,6 +474,20 @@ def dump_html_pkg(f, pkg):
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
 
 
@@ -437,6 +503,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Hash file</td>
 <td class=\"centered\">Current version</td>
 <td class=\"centered\">Warnings</td>
+<td class=\"centered\">CPE Valid</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -463,6 +530,12 @@ def dump_html_stats(f, stats):
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
@@ -485,42 +558,121 @@ def dump_html(packages, stats, output):
         f.write(html_footer)
 
 
+class CPE:
+    all_cpes = dict()
+
+    def get_xml_dict(self):
+        print("CPE: Fetching xml manifest...")
+        try:
+            compressed_cpe_file = urllib2.urlopen(CPE_XML_URL)
+            print("CPE: Unzipping xml manifest...")
+            cpe_file = gzip.GzipFile(fileobj=StringIO(compressed_cpe_file.read())).read()
+            print("CPE: Converting xml manifest to dict...")
+            self.all_cpes = xmltodict.parse(cpe_file)
+        except urllib2.HTTPError:
+            print("CPE: HTTP Error: %s" % CPE_XML_URL)
+            sys.exit(1)
+        except urllib2.URLError:
+            print("CPE: URL Error: %s" % CPE_XML_URL)
+            sys.exit(1)
+
+    def find_partial(self, cpe_str):
+        print("CPE: Searching for partial [%s]" % cpe_str)
+        for cpe in self.all_cpes['cpe-list']['cpe-item']:
+            if cpe_str in cpe['cpe-23:cpe23-item']['@name']:
+                return cpe['cpe-23:cpe23-item']['@name']
+
+    def find(self, cpe_str):
+        print("CPE: Searching for [%s]" % cpe_str)
+        for cpe in self.all_cpes['cpe-list']['cpe-item']:
+            if cpe['cpe-23:cpe23-item']['@name'] == cpe_str:
+                return cpe['cpe-23:cpe23-item']['@name']
+
+    def get_cpe_no_version(self, cpe):
+        return "".join(cpe.split(":")[:5])
+
+    def get_nvd_url(self, cpe_str):
+        return "https://nvd.nist.gov/products/cpe/search/results?keyword=" + \
+                urllib2.quote(cpe_str) + \
+                "&status=FINAL&orderBy=CPEURI&namingFormat=2.3"
+
+
+def get_target_cpe_report(cpe_report_file, cpe_dict):
+    report_cpe_exact_match = ""
+    report_cpe_needing_update = ""
+    report_cpe_missing = ""
+
+    print("CPE: Checking for matches...")
+    try:
+        with open(cpe_report_file) as cpe_file:
+            cpe_list = csv.reader(cpe_file)
+            next(cpe_list)  # make cpe-info has a one line header
+            for cpe in cpe_list:
+                result = cpe_dict.find(cpe[0])
+                if not result:
+                    result = cpe_dict.find_partial(cpe_dict.get_cpe_no_version(cpe[0]))
+                    if not result:
+                        report_cpe_missing += cpe[0] + "\n"
+                    else:
+                        report_cpe_needing_update += cpe[0] + "\n"
+                else:
+                    report_cpe_exact_match += cpe[0] + "\n"
+    except (OSError, IOError) as e:
+        print("CPE: report csv file (%s): %s" % (e.errno, e.strerror))
+        sys.exit(1)
+
+    print("CPE: Found EXACT match:\n" + report_cpe_exact_match)
+    print("CPE: Found but REQUIRES UPDATE:\n" + report_cpe_needing_update)
+    print("CPE: Not found (proposing the following to be added):\n" + report_cpe_missing)
+
+
 def parse_args():
     parser = argparse.ArgumentParser()
-    parser.add_argument('-o', dest='output', action='store', required=True,
+    parser.add_argument('-o', dest='output', action='store',
                         help='HTML output file')
     parser.add_argument('-n', dest='npackages', type=int, action='store',
                         help='Number of packages')
     parser.add_argument('-p', dest='packages', action='store',
                         help='List of packages (comma separated)')
+    parser.add_argument('-c', dest='cpe_report', action='store',
+                        help='CPE Report generated by make cpe-info (csv format)')
     return parser.parse_args()
 
 
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
-    packages = get_pkglist(args.npackages, package_list)
-    print "Getting package make info ..."
-    package_init_make_info()
-    print "Getting package details ..."
-    for pkg in packages:
-        pkg.set_infra()
-        pkg.set_license()
-        pkg.set_hash_info()
-        pkg.set_patch_count()
-        pkg.set_check_package_warnings()
-        pkg.set_current_version()
-    print "Calculate stats"
-    stats = calculate_stats(packages)
-    print "Write HTML"
-    dump_html(packages, stats, args.output)
+    cpe_dict = CPE()
+    cpe_dict.get_xml_dict()
+    if args.cpe_report:
+        print("Performing Target CPE Report Analysis...")
+        get_target_cpe_report(args.cpe_report, cpe_dict)
+    elif args.output:
+        print("Build package list ...")
+        packages = get_pkglist(args.npackages, package_list)
+        print("Getting package make info ...")
+        package_init_make_info()
+        print("Getting package details ...")
+        for pkg in packages:
+            pkg.set_infra()
+            pkg.set_license()
+            pkg.set_hash_info()
+            pkg.set_patch_count()
+            pkg.set_check_package_warnings()
+            pkg.set_current_version()
+            pkg.set_cpe_info(cpe_dict)
+        print("Calculate stats")
+        stats = calculate_stats(packages)
+        print("Write HTML")
+        dump_html(packages, stats, args.output)
+    else:
+        print("Please provide the -o HTML output file arg")
 
 
 __main__()
-- 
1.9.1
