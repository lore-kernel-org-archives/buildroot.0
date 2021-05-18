From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 18 May 2021 13:21:55 -0500
Subject: [Buildroot] [PATCH 3/3] support/scripts/pkg-stats: clarify when a
 CVE/CPE should report as N/A
In-Reply-To: <20210518182155.47055-1-matthew.weber@collins.com>
References: <20210518182155.47055-1-matthew.weber@collins.com>
Message-ID: <20210518182155.47055-3-matthew.weber@collins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - If a package doesn't have any versioning, ignore and state that
 - If a package is virtual, CVE=ignore and CPE state virtual
 - For any of these NA cases, don't provide search link

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 support/scripts/pkg-stats | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ca55a301de..3aaf1169cb 100755
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
@@ -942,12 +945,15 @@ def dump_html_pkg(f, pkg):
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
 
-- 
2.17.1
