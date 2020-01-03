From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:40 +0100
Subject: [Buildroot] [PATCH 03/11] support/scripts/pkg-stats: store patch
 info in a hash
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch changes the variable to store the patch count to a hash. This
variable holds the patch count of the packages as well a list of the patch
file names.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9cfbcf1acc..92fc01d655 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -56,7 +56,7 @@ class Package:
         self.has_license = False
         self.has_license_files = False
         self.has_hash = False
-        self.patch_count = 0
+        self.patches = {'count':0, 'files': None}
         self.warnings = 0
         self.current_version = None
         self.url = None
@@ -115,17 +115,16 @@ class Package:
         """
         Fills in the .has_hash field
         """
-        hashpath = self.path.replace(".mk", ".hash")
+        hashpath = os.path.join(self.pkg_path, self.name + '.hash')
         self.has_hash = os.path.exists(hashpath)
 
     def set_patch_count(self):
         """
         Fills in the .patch_count field
         """
-        self.patch_count = 0
-        pkgdir = os.path.dirname(self.path)
-        for subdir, _, _ in os.walk(pkgdir):
-            self.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))
+        for subdir, _, _ in os.walk(self.pkg_path):
+            self.patches['files'] = fnmatch.filter(os.listdir(subdir), '*.patch')
+            self.patches['count'] = len(self.patches['files'])
 
     def set_current_version(self):
         """
@@ -160,7 +159,7 @@ class Package:
 
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
-            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
+            (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patches['count'])
 
 
 def get_pkglist(npackages, package_list):
@@ -390,7 +389,7 @@ def calculate_stats(packages):
             stats["version-uptodate"] += 1
         else:
             stats["version-not-uptodate"] += 1
-        stats["patches"] += pkg.patch_count
+        stats["patches"] += pkg.patches['count']
     return stats
 
 
@@ -495,14 +494,14 @@ def dump_html_pkg(f, pkg):
 
     # Patch count
     td_class = ["centered"]
-    if pkg.patch_count == 0:
+    if pkg.patches['count'] == 0:
         td_class.append("nopatches")
-    elif pkg.patch_count < 5:
+    elif pkg.patches['count'] < 5:
         td_class.append("somepatches")
     else:
         td_class.append("lotsofpatches")
     f.write("  <td class=\"%s\">%s</td>\n" %
-            (" ".join(td_class), str(pkg.patch_count)))
+            (" ".join(td_class), str(pkg.patches['count'])))
 
     # Infrastructure
     infra = infra_str(pkg.infras)
-- 
2.20.1
