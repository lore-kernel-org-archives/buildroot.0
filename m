From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:42 +0100
Subject: [Buildroot] [PATCH 08/10] support/script/pkg-stats: show CPE ID in
 results
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gregory CLEMENT <gregory.clement@bootlin.com>

This commit improves the pkg-stats script to show the CPE ID of
packages, if available. For now, it doesn't use CPE IDs to match CVEs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 44 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 503cc45c16..0a48cf9581 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -76,6 +76,7 @@ class Package:
     all_license_files = list()
     all_versions = dict()
     all_ignored_cves = dict()
+    all_cpeids = dict ()
     # This is the list of all possible checks. Add new checks to this list so
     # a tool that post-processeds the json output knows the checks before
     # iterating over the packages.
@@ -96,6 +97,7 @@ class Package:
         self.current_version = None
         self.url = None
         self.url_worker = None
+        self.cpeid = None
         self.cves = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
         self.status = {}
@@ -210,6 +212,14 @@ class Package:
         if var in self.all_versions:
             self.current_version = self.all_versions[var]
 
+    def set_cpeid(self):
+        """
+        Fills in the .cpeid field
+        """
+        var = self.pkgvar()
+        if var in self.all_cpeids:
+            self.cpeid = self.all_cpeids[var]
+
     def set_check_package_warnings(self):
         """
         Fills in the .warnings and .status['pkg-check'] fields
@@ -333,7 +343,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
     variable_list = variables.decode().splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -371,6 +381,9 @@ def package_init_make_info():
             pkgvar = pkgvar[:-12]
             Package.all_ignored_cves[pkgvar] = value.split()
 
+        elif pkgvar.endswith("_CPE_ID"):
+            pkgvar = pkgvar[:-7]
+            Package.all_cpeids[pkgvar] = value
 
 check_url_count = 0
 
@@ -578,6 +591,10 @@ def calculate_stats(packages):
         stats["total-cves"] += len(pkg.cves)
         if len(pkg.cves) != 0:
             stats["pkg-cves"] += 1
+        if pkg.cpeid:
+            stats["cpe-id"] += 1
+        else:
+            stats["no-cpe-id"] += 1
     return stats
 
 
@@ -800,6 +817,19 @@ def dump_html_pkg(f, pkg):
         f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
     f.write("  </td>\n")
 
+    # CPE ID
+    td_class = ["left"]
+    if pkg.cpeid:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    if pkg.cpeid:
+        f.write("  <code>%s</code>\n" % pkg.cpeid)
+    else:
+        f.write("  N/A\n")
+    f.write("  </td>\n")
+
     f.write(" </tr>\n")
 
 
@@ -818,6 +848,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CPE ID</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -860,6 +891,10 @@ def dump_html_stats(f, stats):
             stats["pkg-cves"])
     f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
             stats["total-cves"])
+    f.write("<tr><td>Packages with CPE ID</td><td>%s</td></tr>\n" %
+            stats["cpe-id"])
+    f.write("<tr><td>Packages without CPE ID</td><td>%s</td></tr>\n" %
+            stats["no-cpe-id"])
     f.write("</table>\n")
 
 
@@ -932,11 +967,17 @@ def parse_args():
                           help='List of packages (comma separated)')
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath)
+    parser.add_argument("--cpeid", action='store_true')
     args = parser.parse_args()
     if not args.html and not args.json:
         parser.error('at least one of --html or --json (or both) is required')
     return args
 
+def cpeid_name(pkg):
+    try:
+        return pkg.cpeid.split(':')[1]
+    except:
+        return ''
 
 def __main__():
     args = parse_args()
@@ -965,6 +1006,7 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
+        pkg.set_cpeid()
         pkg.set_url()
         pkg.set_developers(developers)
     print("Checking URL status")
-- 
2.26.2
