From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 10:21:28 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: clarify when a
 CVE/CPE should report as N/A
Message-ID: <20210519080212.F24B787C20@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50791af71fd33cc7048ae2ad85ee02fd2a227ae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- If a package doesn't have any versioning, ignore and state that
 - If a package is virtual, CVE=ignore and CPE state virtual
 - For any of these NA cases, don't provide search link and color box
   green

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0c34388066..cc91d13167 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -229,7 +229,10 @@ class Package:
         """
         var = self.pkgvar()
         if not self.is_actual_package:
-            self.status['cpe'] = ("na", "no valid package infra")
+            self.status['cpe'] = ("na", "N/A - virtual pkg")
+            return
+        if not self.current_version:
+            self.status['cpe'] = ("na", "no version information available")
             return
 
         if var in self.all_cpeids:
@@ -587,7 +590,7 @@ def check_package_cves(nvd_path, packages):
     cpe_product_pkgs = defaultdict(list)
     for pkg in packages:
         if not pkg.is_actual_package:
-            pkg.status['cve'] = ("na", "no valid package infra")
+            pkg.status['cve'] = ("na", "N/A")
             continue
         if not pkg.current_version:
             pkg.status['cve'] = ("na", "no version information available")
@@ -909,6 +912,8 @@ def dump_html_pkg(f, pkg):
         td_class.append("cve-ok")
     elif pkg.is_status_error("cve"):
         td_class.append("cve-nok")
+    elif pkg.is_status_na("cve") and not pkg.is_actual_package:
+        td_class.append("cve-ok")
     else:
         td_class.append("cve-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
@@ -936,18 +941,23 @@ def dump_html_pkg(f, pkg):
         td_class.append("cpe-ok")
     elif pkg.is_status_error("cpe"):
         td_class.append("cpe-nok")
+    elif pkg.is_status_na("cpe") and not pkg.is_actual_package:
+        td_class.append("cpe-ok")
     else:
         td_class.append("cpe-unknown")
     f.write("  <td class=\"%s\">\n" % " ".join(td_class))
     if pkg.cpeid:
         f.write("  <code>%s</code>\n" % pkg.cpeid)
     if not pkg.is_status_ok("cpe"):
-        if pkg.cpeid:
-            f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
-                    (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+        if pkg.is_actual_package and pkg.current_version:
+            if pkg.cpeid:
+                f.write("  <br/>%s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
+                        (pkg.status['cpe'][1], ":".join(pkg.cpeid.split(":")[0:5])))
+            else:
+                f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %  # noqa: E501
+                        (pkg.status['cpe'][1], pkg.name))
         else:
-            f.write("  %s <a href=\"https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=%s\">(Search)</a>\n" %
-                    (pkg.status['cpe'][1], pkg.name))
+            f.write("  %s\n" % pkg.status['cpe'][1])
 
     f.write("  </td>\n")
 
