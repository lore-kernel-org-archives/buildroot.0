From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:49 +0200
Subject: [Buildroot] [PATCH 16/17] support/script/cve-checker: Allow to use
 cpeid
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-17-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a argument to cve-checker allowing to use the cpeid instead of the
internal name and version from buildroot. It should allow to have
more accurate CVE status.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/cve-checker | 48 +++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
index b32e036d76..d1bce65b0c 100755
--- a/support/scripts/cve-checker
+++ b/support/scripts/cve-checker
@@ -26,23 +26,26 @@ import cve as cvecheck
 
 
 class Package:
-    def __init__(self, name, version, ignored_cves):
+    def __init__(self, name, version, cpeid, ignored_cves):
         self.name = name
         self.version = version
+        self.cpeid = cpeid
         self.cves = list()
         self.cves_to_check = list()
         self.ignored_cves = ignored_cves
 
 
-def check_package_cves(nvd_path, packages):
+def check_package_cves(nvd_path, packages, use_cpeid):
     if not os.path.isdir(nvd_path):
         os.makedirs(nvd_path)
-
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
             pkg = packages.get(pkg_name, '')
             if pkg:
-                affected = cve.affects(pkg.name, pkg.version, pkg.ignored_cves)
+                if use_cpeid:
+                    affected = cve.affects_cpeid(pkg.cpeid, pkg.ignored_cves)
+                else:
+                    affected = cve.affects(pkg.name, pkg.version, pkg.ignored_cves)
                 if (affected == cve.CVE_UNKNOWN):
                     pkg.cves_to_check.append(cve.identifier)
                 elif affected == cve.CVE_AFFECTS:
@@ -91,7 +94,14 @@ if (typeof sorttable === \"object\") {
 
 def dump_html_pkg(f, pkg):
     f.write(" <tr>\n")
-    f.write("  <td>%s</td>\n" % pkg.name)
+    td_class = ["left"]
+    if len(pkg.cpeid) != 0:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    f.write("  %s\n" % pkg.name)
+    f.write("  </td>\n")
 
     # Current version
     if len(pkg.version) > 20:
@@ -122,6 +132,16 @@ def dump_html_pkg(f, pkg):
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
 
 
@@ -133,6 +153,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Version</td>
 <td class=\"centered\">CVEs</td>
 <td class=\"centered\">CVEs to check</td>
+<td class=\"centered\">CPEID valid</td>
 </tr>
 """)
     for pkg in packages:
@@ -158,6 +179,7 @@ def dump_json(packages, date, output):
         pkg.name: {
             "version": pkg.version,
             "cves": pkg.cves,
+            "cpeid": pkg.cpeid,
         } for pkg in packages
     }
     # The actual structure to dump, add date to it
@@ -182,25 +204,37 @@ def parse_args():
     parser.add_argument('--nvd-path', dest='nvd_path',
                         help='Path to the local NVD database', type=resolvepath,
                         required=True)
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
     packages = list()
     content = json.load(sys.stdin)
     for item in content:
         pkg = content[item]
-        p = Package(item, pkg.get('version', ''), pkg.get('ignore_cves', ''))
+        p = Package(item, pkg.get('version', ''), pkg.get('cpeid', ''), pkg.get('ignore_cves', ''))
         packages.append(p)
 
     args = parse_args()
+    if args.cpeid:
+        print("going to use strict cpeid")
     date = datetime.datetime.utcnow()
 
     print("Checking packages CVEs")
-    check_package_cves(args.nvd_path, {p.name: p for p in packages})
+    if args.cpeid:
+        check_package_cves(args.nvd_path, {cpeid_name(p): p for p in packages}, args.cpeid)
+    else:
+        check_package_cves(args.nvd_path, {p.name: p for p in packages}, args.cpeid)
+
 
     if args.html:
         print("Write HTML")
-- 
2.28.0
