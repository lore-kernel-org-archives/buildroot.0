From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  4 Dec 2020 16:46:00 +0100
Subject: [Buildroot] [PATCH v2 4/5] support/scripts/pkg-stats: improve
 rendering of CVE information
In-Reply-To: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
References: <20201204154601.125932-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201204154601.125932-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit improves pkg-stats to fill in pkg.status['cve'] depending
on the situation for CVEs affecting this package. They are then used
in the HTML rendering.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9ec4d645e6..8a29531cd7 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -571,8 +571,10 @@ def check_package_cves(nvd_path, packages):
     cpe_product_pkgs = defaultdict(list)
     for pkg in packages:
         if not pkg.has_valid_infra:
+            pkg.status['cve'] = ("na", "no valid package infra")
             continue
         if not pkg.current_version:
+            pkg.status['cve'] = ("na", "no version information available")
             continue
         if pkg.cpeid:
             cpe_product = cvecheck.cpe_product(pkg.cpeid)
@@ -583,6 +585,13 @@ def check_package_cves(nvd_path, packages):
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         check_package_cve_affects(cve, cpe_product_pkgs)
 
+    for pkg in packages:
+        if 'cve' not in pkg.status:
+            if pkg.cves:
+                pkg.status['cve'] = ("error", "affected by CVEs")
+            else:
+                pkg.status['cve'] = ("ok", "not affected by CVEs")
+
 def calculate_stats(packages):
     stats = defaultdict(int)
     stats['packages'] = len(packages)
@@ -693,6 +702,18 @@ td.cpe-unknown {
  background: #ffd870;
 }
 
+td.cve-ok {
+  background: #d2ffc4;
+}
+
+td.cve-nok {
+  background: #ff9a69;
+}
+
+td.cve-unknown {
+ background: #ffd870;
+}
+
 </style>
 <title>Statistics of Buildroot packages</title>
 </head>
@@ -851,13 +872,18 @@ def dump_html_pkg(f, pkg):
 
     # CVEs
     td_class = ["centered"]
-    if len(pkg.cves) == 0:
-        td_class.append("correct")
+    if pkg.status['cve'][0] == "ok":
+        td_class.append("cve-ok")
+    elif pkg.status['cve'][0] == "error":
+        td_class.append("cve-nok")
     else:
-        td_class.append("wrong")
+        td_class.append("cve-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
-    for cve in pkg.cves:
-        f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
+    if pkg.status['cve'][0] == "error":
+        for cve in pkg.cves:
+            f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
+    elif pkg.status['cve'][0] == "na":
+        f.write("    %s" % pkg.status['cve'][1])
     f.write("  </td>\n")
 
     # CPE ID
-- 
2.28.0
