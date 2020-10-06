From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:50 +0200
Subject: [Buildroot] [PATCH 17/17] support/script/pkg-stats: Allow to use
 CPEID for managing CVEs
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-18-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add CPEID information by retrieving it from the package.

Also introduce a new argument --cpeid to use valid cpeid instead of
buildroot name and version to check if a pacakge is affected by a
CVEs.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/pkg-stats | 46 +++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 69edeedec0..e2e328847f 100755
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
+        self.cpeid = ''
         self.cves = list()
         self.cves_to_check = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
@@ -211,6 +213,14 @@ class Package:
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
@@ -334,7 +344,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
     variable_list = variables.decode().splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -372,6 +382,9 @@ def package_init_make_info():
             pkgvar = pkgvar[:-12]
             Package.all_ignored_cves[pkgvar] = value.split()
 
+        elif pkgvar.endswith("_CPE_ID"):
+            pkgvar = pkgvar[:-7]
+            Package.all_cpeids[pkgvar] = value
 
 check_url_count = 0
 
@@ -528,7 +541,7 @@ async def check_package_latest_version(packages):
         await asyncio.wait(tasks)
 
 
-def check_package_cves(nvd_path, packages):
+def check_package_cves(nvd_path, packages, use_cpeid):
     if not os.path.isdir(nvd_path):
         os.makedirs(nvd_path)
 
@@ -536,7 +549,11 @@ def check_package_cves(nvd_path, packages):
         for pkg_name in cve.pkg_names:
             if pkg_name in packages:
                 pkg = packages[pkg_name]
-                affected = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves)
+                print("check_package", pkg.cpeid)
+                if use_cpeid:
+                    affected = cve.affects_cpeid(pkg.cpeid, pkg.ignored_cves)
+                else:
+                    affected = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves)
                 if  affected == cve.CVE_UNKNOWN:
                     pkg.cves_to_check.append(cve.identifier)
                 if  affected == cve.CVE_AFFECTS:
@@ -818,6 +835,16 @@ def dump_html_pkg(f, pkg):
         f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
     f.write("  </td>\n")
 
+    # CPEID valid
+    td_class = ["left"]
+    if len(pkg.cpeid) != 0:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    f.write("  %s\n" % pkg.cpeid)
+    f.write("  </td>\n")
+
     f.write(" </tr>\n")
 
 
@@ -837,6 +864,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
 <td class=\"centered\">CVEs to check</td>
+<td class=\"centered\">CPEID valid</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -955,11 +983,17 @@ def parse_args():
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
@@ -988,6 +1022,7 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
+        pkg.set_cpeid()
         pkg.set_url()
         pkg.set_developers(developers)
     print("Checking URL status")
@@ -998,7 +1033,10 @@ def __main__():
     loop.run_until_complete(check_package_latest_version(packages))
     if args.nvd_path:
         print("Checking packages CVEs")
-        check_package_cves(args.nvd_path, {p.name: p for p in packages})
+        if args.cpeid:
+            check_package_cves(args.nvd_path, {cpeid_name(p): p for p in packages}, args.cpeid)
+        else:
+            check_package_cves(args.nvd_path, {p.name: p for p in packages}, args.cpeid)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
-- 
2.28.0
