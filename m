From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 2 Feb 2021 20:16:59 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: check CPE
 existence in CPE dictionnary
Message-ID: <20210202192101.69F8281571@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=201e74bf9daecab9b93f23f78b29ea031652bdb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit extends pkg-stats to leverage the recently introduced
CPEDB class to verify that the CPEs provided by Buildroot packages are
indeed known in the official CPE dictionnary provided by NVD.

Co-Developed-by: Gr??gory Clement <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/pkg-stats | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ac490a8d8f..404903e48f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -32,7 +32,7 @@ brpath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))
 
 sys.path.append(os.path.join(brpath, "utils"))
 from getdeveloperlib import parse_developers  # noqa: E402
-
+from cpedb import CPEDB  # noqa: E402
 
 INFRA_RE = re.compile(r"\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile(r"\s*https?://\S*\s*$")
@@ -225,7 +225,8 @@ class Package:
 
         if var in self.all_cpeids:
             self.cpeid = self.all_cpeids[var]
-            self.status['cpe'] = ("ok", "verified CPE identifier")
+            # Set a preliminary status, it might be overridden by check_package_cpes()
+            self.status['cpe'] = ("warning", "not checked against CPE dictionnary")
         else:
             self.status['cpe'] = ("error", "no verified CPE identifier")
 
@@ -600,6 +601,18 @@ def check_package_cves(nvd_path, packages):
                 pkg.status['cve'] = ("ok", "not affected by CVEs")
 
 
+def check_package_cpes(nvd_path, packages):
+    cpedb = CPEDB(nvd_path)
+    cpedb.get_xml_dict()
+    for p in packages:
+        if not p.cpeid:
+            continue
+        if cpedb.find(p.cpeid):
+            p.status['cpe'] = ("ok", "verified CPE identifier")
+        else:
+            p.status['cpe'] = ("error", "CPE identifier unknown in CPE database")
+
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     stats['packages'] = len(packages)
@@ -898,19 +911,17 @@ def dump_html_pkg(f, pkg):
 
     # CPE ID
     td_class = ["left"]
-    if pkg.status['cpe'][0] == "ok":
+    if pkg.is_status_ok("cpe"):
         td_class.append("cpe-ok")
-    elif pkg.status['cpe'][0] == "error":
+    elif pkg.is_status_error("cpe"):
         td_class.append("cpe-nok")
     else:
         td_class.append("cpe-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
-    if pkg.status['cpe'][0] == "ok":
+    if pkg.cpeid:
         f.write("  <code>%s</code>\n" % pkg.cpeid)
-    elif pkg.status['cpe'][0] == "error":
-        f.write("  N/A\n")
-    else:
-        f.write("  %s\n" % pkg.status['cpe'][1])
+    if not pkg.is_status_ok("cpe"):
+        f.write("  %s%s\n" % ("<br/>" if pkg.cpeid else "", pkg.status['cpe'][1]))
     f.write("  </td>\n")
 
     f.write(" </tr>\n")
@@ -1106,6 +1117,7 @@ def __main__():
     if args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, packages)
+        check_package_cpes(args.nvd_path, packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     if args.html:
