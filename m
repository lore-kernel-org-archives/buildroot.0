From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 24 Jul 2020 17:43:55 +0200
Subject: [Buildroot] [PATCH v3 7/8] support/script/cve-checker: Manage the
 CVEs that need to be check
In-Reply-To: <20200724154356.2607639-1-gregory.clement@bootlin.com>
References: <20200724154356.2607639-1-gregory.clement@bootlin.com>
Message-ID: <20200724154356.2607639-8-gregory.clement@bootlin.com>
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
index 19fd104b56..712ec1ded0 100755
--- a/support/scripts/cve-checker
+++ b/support/scripts/cve-checker
@@ -32,6 +32,7 @@ class Package:
         self.name = name
         self.version = version
         self.cves = list()
+        self.cves_to_check = list()
         self.ignored_cves = ignored_cves
 
 def check_package_cves(nvd_path, packages):
@@ -41,8 +42,12 @@ def check_package_cves(nvd_path, packages):
     for cve in cvecheck.CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
             pkg = packages.get(pkg_name, '')
-            if pkg and cve.affects(pkg.name, pkg.version, pkg.ignored_cves):
-                pkg.cves.append(cve.identifier)
+            if pkg:
+                affected = cve.affects(pkg.name, pkg.version, pkg.ignored_cves)
+                if (affected == cve.CVE_UNKNOWN):
+                    pkg.cves_to_check.append(cve.identifier)
+                elif affected == cve.CVE_AFFECTS:
+                    pkg.cves.append(cve.identifier)
 
 html_header = """
 <head>
@@ -161,6 +166,17 @@ def dump_html_pkg(f, pkg):
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
 
 
@@ -171,6 +187,7 @@ def dump_html_all_pkgs(f, packages):
 <td>Package</td>
 <td class=\"centered\">Version</td>
 <td class=\"centered\">CVEs</td>
+<td class=\"centered\">CVEs to check</td>
 </tr>
 """)
     for pkg in packages:
-- 
2.27.0
