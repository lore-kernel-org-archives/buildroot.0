From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 21 Sep 2020 12:15:14 +0200
Subject: [Buildroot] [PATCH v5 2/3] support/script/cve-checker: Manage the
 CVEs that need to be check
In-Reply-To: <20200921101515.132359-1-gregory.clement@bootlin.com>
References: <20200921101515.132359-1-gregory.clement@bootlin.com>
Message-ID: <20200921101515.132359-3-gregory.clement@bootlin.com>
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
 support/scripts/cve-checker | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve-checker b/support/scripts/cve-checker
index 998ea5b8af..b32e036d76 100755
--- a/support/scripts/cve-checker
+++ b/support/scripts/cve-checker
@@ -30,6 +30,7 @@ class Package:
         self.name = name
         self.version = version
         self.cves = list()
+        self.cves_to_check = list()
         self.ignored_cves = ignored_cves
 
 
@@ -40,8 +41,12 @@ def check_package_cves(nvd_path, packages):
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
             pkg = packages.get(pkg_name, '')
-            if pkg and cve.affects(pkg.name, pkg.version, pkg.ignored_cves) == cve.CVE_AFFECTS:
-                pkg.cves.append(cve.identifier)
+            if pkg:
+                affected = cve.affects(pkg.name, pkg.version, pkg.ignored_cves)
+                if (affected == cve.CVE_UNKNOWN):
+                    pkg.cves_to_check.append(cve.identifier)
+                elif affected == cve.CVE_AFFECTS:
+                    pkg.cves.append(cve.identifier)
 
 
 html_header = """
@@ -106,6 +111,17 @@ def dump_html_pkg(f, pkg):
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
 
 
@@ -116,6 +132,7 @@ def dump_html_all_pkgs(f, packages):
 <td>Package</td>
 <td class=\"centered\">Version</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CVEs to check</td>
 </tr>
 """)
     for pkg in packages:
-- 
2.28.0
