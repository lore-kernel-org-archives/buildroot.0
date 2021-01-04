From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Jan 2021 21:36:50 +0100
Subject: [Buildroot] [git commit] support/script/pkg-stats: show CPE ID in
 results
Message-ID: <20210104202641.2579C84C6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92e7089a8ca9f7dba5a5d690b7f768352cd6b983
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit improves the pkg-stats script to show the CPE ID of
packages, if available. For now, it doesn't use CPE IDs to match CVEs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 67 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index d44f8241c1..b012e1437a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -78,6 +78,7 @@ class Package:
     all_license_files = list()
     all_versions = dict()
     all_ignored_cves = dict()
+    all_cpeids = dict ()
     # This is the list of all possible checks. Add new checks to this list so
     # a tool that post-processeds the json output knows the checks before
     # iterating over the packages.
@@ -98,6 +99,7 @@ class Package:
         self.current_version = None
         self.url = None
         self.url_worker = None
+        self.cpeid = None
         self.cves = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
         self.status = {}
@@ -213,6 +215,21 @@ class Package:
         if var in self.all_versions:
             self.current_version = self.all_versions[var]
 
+    def set_cpeid(self):
+        """
+        Fills in the .cpeid field
+        """
+        var = self.pkgvar()
+        if not self.has_valid_infra:
+            self.status['cpe'] = ("na", "no valid package infra")
+            return
+
+        if var in self.all_cpeids:
+            self.cpeid = self.all_cpeids[var]
+            self.status['cpe'] = ("ok", "verified CPE identifier")
+        else:
+            self.status['cpe'] = ("error", "no verified CPE identifier")
+
     def set_check_package_warnings(self):
         """
         Fills in the .warnings and .status['pkg-check'] fields
@@ -342,7 +359,7 @@ def get_config_packages():
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
     variable_list = variables.decode().splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -380,6 +397,9 @@ def package_init_make_info():
             pkgvar = pkgvar[:-12]
             Package.all_ignored_cves[pkgvar] = value.split()
 
+        elif pkgvar.endswith("_CPE_ID"):
+            pkgvar = pkgvar[:-7]
+            Package.all_cpeids[pkgvar] = value
 
 check_url_count = 0
 
@@ -587,6 +607,10 @@ def calculate_stats(packages):
         stats["total-cves"] += len(pkg.cves)
         if len(pkg.cves) != 0:
             stats["pkg-cves"] += 1
+        if pkg.cpeid:
+            stats["cpe-id"] += 1
+        else:
+            stats["no-cpe-id"] += 1
     return stats
 
 
@@ -642,6 +666,18 @@ td.version-error {
  background: #ccc;
 }
 
+td.cpe-ok {
+  background: #d2ffc4;
+}
+
+td.cpe-nok {
+  background: #ff9a69;
+}
+
+td.cpe-unknown {
+ background: #ffd870;
+}
+
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -809,6 +845,23 @@ def dump_html_pkg(f, pkg):
         f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
     f.write("  </td>\n")
 
+    # CPE ID
+    td_class = ["left"]
+    if pkg.status['cpe'][0] == "ok":
+        td_class.append("cpe-ok")
+    elif pkg.status['cpe'][0] == "error":
+        td_class.append("cpe-nok")
+    else:
+        td_class.append("cpe-unknown")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    if pkg.status['cpe'][0] == "ok":
+        f.write("  <code>%s</code>\n" % pkg.cpeid)
+    elif pkg.status['cpe'][0] == "error":
+        f.write("  N/A\n")
+    else:
+        f.write("  %s\n" % pkg.status['cpe'][1])
+    f.write("  </td>\n")
+
     f.write(" </tr>\n")
 
 
@@ -827,6 +880,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CPE ID</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -869,6 +923,10 @@ def dump_html_stats(f, stats):
             stats["pkg-cves"])
     f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
             stats["total-cves"])
+    f.write("<tr><td>Packages with CPE ID</td><td>%s</td></tr>\n" %
+            stats["cpe-id"])
+    f.write("<tr><td>Packages without CPE ID</td><td>%s</td></tr>\n" %
+            stats["no-cpe-id"])
     f.write("</table>\n")
 
 
@@ -943,11 +1001,17 @@ def parse_args():
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
@@ -979,6 +1043,7 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
+        pkg.set_cpeid()
         pkg.set_url()
         pkg.set_developers(developers)
     print("Checking URL status")
