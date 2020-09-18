From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 18 Sep 2020 12:22:24 +0200
Subject: [Buildroot] [PATCH v4 1/2] support/script/pkg-stats: Manage the
 CVEs that need to be check
In-Reply-To: <20200918102225.76756-1-gregory.clement@bootlin.com>
References: <20200918102225.76756-1-gregory.clement@bootlin.com>
Message-ID: <20200918102225.76756-2-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When looking for if a package is affected, the version comparison can
fail. This means that we don't know if the version of the package used
is affected or not and we need to check manually the version.

This patch exposes this new information in json and html format.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/pkg-stats | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 503cc45c16..69edeedec0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -97,6 +97,7 @@ class Package:
         self.url = None
         self.url_worker = None
         self.cves = list()
+        self.cves_to_check = list()
         self.latest_version = {'status': RM_API_STATUS_ERROR, 'version': None, 'id': None}
         self.status = {}
 
@@ -535,7 +536,10 @@ def check_package_cves(nvd_path, packages):
         for pkg_name in cve.pkg_names:
             if pkg_name in packages:
                 pkg = packages[pkg_name]
-                if cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves) == cve.CVE_AFFECTS:
+                affected = cve.affects(pkg.name, pkg.current_version, pkg.ignored_cves)
+                if  affected == cve.CVE_UNKNOWN:
+                    pkg.cves_to_check.append(cve.identifier)
+                if  affected == cve.CVE_AFFECTS:
                     pkg.cves.append(cve.identifier)
 
 
@@ -576,8 +580,11 @@ def calculate_stats(packages):
             stats["version-not-uptodate"] += 1
         stats["patches"] += pkg.patch_count
         stats["total-cves"] += len(pkg.cves)
+        stats["total-cves-to-check"] += len(pkg.cves_to_check)
         if len(pkg.cves) != 0:
             stats["pkg-cves"] += 1
+        if len(pkg.cves_to_check) != 0:
+            stats["pkg-cves_to_check"] += 1
     return stats
 
 
@@ -800,6 +807,17 @@ def dump_html_pkg(f, pkg):
         f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
     f.write("  </td>\n")
 
+    # CVEs to check
+    td_class = ["centered"]
+    if len(pkg.cves_to_check) == 0:
+        td_class.append("correct")
+    else:
+        td_class.append("wrong")
+    f.write("  <td class=\"%s\">\n" % " ".join(td_class))
+    for cve in pkg.cves_to_check:
+        f.write("   <a href=\"https://security-tracker.debian.org/tracker/%s\">%s<br/>\n" % (cve, cve))
+    f.write("  </td>\n")
+
     f.write(" </tr>\n")
 
 
@@ -818,6 +836,7 @@ def dump_html_all_pkgs(f, packages):
 <td class=\"centered\">Warnings</td>
 <td class=\"centered\">Upstream URL</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CVEs to check</td>
 </tr>
 """)
     for pkg in sorted(packages):
@@ -856,6 +875,10 @@ def dump_html_stats(f, stats):
             stats["version-not-uptodate"])
     f.write("<tr><td>Packages with no known upstream version</td><td>%s</td></tr>\n" %
             stats["version-unknown"])
+    f.write("<tr><td>Packages that might be affected by CVEs, where version needs to be checked</td><td>%s</td></tr>\n" %
+            stats["pkg-cves_to_check"])
+    f.write("<tr><td>Total number of CVEs that might affect all packages, where version needs to be checked</td><td>%s</td></tr>\n" %
+            stats["total-cves_to_check"])
     f.write("<tr><td>Packages affected by CVEs</td><td>%s</td></tr>\n" %
             stats["pkg-cves"])
     f.write("<tr><td>Total number of CVEs affecting all packages</td><td>%s</td></tr>\n" %
-- 
2.28.0
