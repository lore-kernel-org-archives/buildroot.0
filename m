From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:37 +0200
Subject: [Buildroot] [PATCH v2 1/9] support/script/pkg-stat: Handle
 exception when version comparison fails
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-12-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With python 3, when a package has a version number x-y-z instead of
x.y.z, then the version returned by LooseVersion can't be compared
which raises an exception.

This patch handles this exception by adding a new return value when
the comparison can't be done. As a third value has been introduce, the
booelan are no more used.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 support/scripts/pkg-stats | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c1f41fc9e8..a75cb68581 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -50,6 +50,10 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
 RM_API_STATUS_NOT_FOUND = 4
 
+CVE_AFFECTS = 1
+CVE_DOESNT_AFFECT = 2
+CVE_UNKNOWN = 3
+
 # Used to make multiple requests to the same host. It is global
 # because it's used by sub-processes.
 http_pool = None
@@ -364,7 +368,7 @@ class CVE:
         by this CVE.
         """
         if br_pkg.is_cve_ignored(self.identifier):
-            return False
+            return CVE_DOESNT_AFFECT
 
         for product in self.each_product():
             if product['product_name'] != br_pkg.name:
@@ -373,7 +377,7 @@ class CVE:
             for v in product['version']['version_data']:
                 if v["version_affected"] == "=":
                     if br_pkg.current_version == v["version_value"]:
-                        return True
+                        return CVE_AFFECTS
                 elif v["version_affected"] == "<=":
                     pkg_version = distutils.version.LooseVersion(br_pkg.current_version)
                     if not hasattr(pkg_version, "version"):
@@ -383,10 +387,18 @@ class CVE:
                     if not hasattr(cve_affected_version, "version"):
                         print("Cannot parse CVE affected version '%s'" % v["version_value"])
                         continue
-                    return pkg_version <= cve_affected_version
+                    try:
+                        affected = pkg_version <= cve_affected_version
+                        break
+                    except:
+                        return CVE_UNKNOWN
+                    if affected:
+                        return CVE_AFFECTS
+                    else:
+                        return CVE_DOESNT_AFFECT
                 else:
                     print("version_affected: %s" % v['version_affected'])
-        return False
+        return CVE_DOESNT_AFFECT
 
 
 def get_pkglist(npackages, package_list):
@@ -610,7 +622,7 @@ def check_package_cves(nvd_path, packages):
 
     for cve in CVE.read_nvd_dir(nvd_path):
         for pkg_name in cve.pkg_names:
-            if pkg_name in packages and cve.affects(packages[pkg_name]):
+            if pkg_name in packages and cve.affects(packages[pkg_name]) == CVE_AFFECTS:
                 packages[pkg_name].cves.append(cve.identifier)
 
 
-- 
2.27.0
