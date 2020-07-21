From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:14:19 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] support/script/pkg-stats:
 handle exception when version comparison fails
Message-ID: <20200721064041.A6E2B87E97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0ea01846a1d021d5e3073ea07195c96aabb29d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

With python 3, when a package has a version number x-y-z instead of
x.y.z, then the version returned by LooseVersion can't be compared
which raises a TypeError exception:

Traceback (most recent call last):
  File "./support/scripts/pkg-stats", line 1062, in <module>
    __main__()
  File "./support/scripts/pkg-stats", line 1051, in __main__
    check_package_cves(args.nvd_path, {p.name: p for p in packages})
  File "./support/scripts/pkg-stats", line 613, in check_package_cves
    if pkg_name in packages and cve.affects(packages[pkg_name]):
  File "./support/scripts/pkg-stats", line 386, in affects
    return pkg_version <= cve_affected_version
  File "/usr/lib64/python3.8/distutils/version.py", line 58, in __le__
    c = self._cmp(other)
  File "/usr/lib64/python3.8/distutils/version.py", line 337, in _cmp
    if self.version < other.version:
TypeError: '<' not supported between instances of 'str' and 'int'

This patch handles this exception by adding a new return value when
the comparison can't be done. The code is adjusted to take of this
change. For now, a return value of CVE_UNKNOWN is handled the same way
as a CVE_DOESNT_AFFECT return value, but this can be improved later
on.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7d2779ecbb142b62f8913d30352b11058f922b2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c1f41fc9e8..170f99e7fc 100755
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
+                    except TypeError:
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
 
 
