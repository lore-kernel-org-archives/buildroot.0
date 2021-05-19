From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 18 May 2021 21:46:37 -0500
Subject: [Buildroot] [PATCH v2 2/3] support/scripts/pkg-stats: add
 is_actual_package() and rework has_valid_infra()
In-Reply-To: <20210519024638.63607-1-matthew.weber@collins.com>
References: <20210519024638.63607-1-matthew.weber@collins.com>
Message-ID: <20210519024638.63607-2-matthew.weber@collins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

has_valid_infra() is incorrectly named; it probably should be named
is_actual_package(), and has_valid_infra() would be changed to
actually represent having an actual infra.

This resolves packages reporting as having no valid package infra and
cleans up reporting cases of CPE and CVEs where there isn't a valid version
or package definition outside Buildroot

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
Changes v1 -> v2
 - None
---
 support/scripts/pkg-stats | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 42c36f7f94..0c34388066 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -131,7 +131,15 @@ class Package:
 
     @property
     def has_valid_infra(self):
+        if self.infras is None:
+            return False
+        return len(self.infras) > 0
+
+    @property
+    def is_actual_package(self):
         try:
+            if not self.has_valid_infra:
+                return False
             if self.infras[0][1] == 'virtual':
                 return False
         except IndexError:
@@ -159,7 +167,7 @@ class Package:
         """
         Fills in the .status['license'] and .status['license-files'] fields
         """
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['license'] = ("na", "no valid package infra")
             self.status['license-files'] = ("na", "no valid package infra")
             return
@@ -177,7 +185,7 @@ class Package:
         """
         Fills in the .status['hash'] field
         """
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['hash'] = ("na", "no valid package infra")
             self.status['hash-license'] = ("na", "no valid package infra")
             return
@@ -192,7 +200,7 @@ class Package:
         """
         Fills in the .patch_count, .patch_files and .status['patches'] fields
         """
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['patches'] = ("na", "no valid package infra")
             return
 
@@ -220,7 +228,7 @@ class Package:
         Fills in the .cpeid field
         """
         var = self.pkgvar()
-        if not self.has_valid_infra:
+        if not self.is_actual_package:
             self.status['cpe'] = ("na", "no valid package infra")
             return
 
@@ -551,13 +559,13 @@ async def check_package_latest_version(packages):
       package, as known by release-monitoring.org
     """
 
-    for pkg in [p for p in packages if not p.has_valid_infra]:
+    for pkg in [p for p in packages if not p.is_actual_package]:
         pkg.status['version'] = ("na", "no valid package infra")
 
     tasks = []
     connector = aiohttp.TCPConnector(limit_per_host=5)
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
-        packages = [p for p in packages if p.has_valid_infra]
+        packages = [p for p in packages if p.is_actual_package]
         for pkg in packages:
             tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages))))
         await asyncio.wait(tasks)
@@ -578,7 +586,7 @@ def check_package_cves(nvd_path, packages):
 
     cpe_product_pkgs = defaultdict(list)
     for pkg in packages:
-        if not pkg.has_valid_infra:
+        if not pkg.is_actual_package:
             pkg.status['cve'] = ("na", "no valid package infra")
             continue
         if not pkg.current_version:
-- 
2.17.1
