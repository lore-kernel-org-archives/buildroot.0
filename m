From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  2 Mar 2020 15:50:12 +0100
Subject: [Buildroot] [PATCH v4 10/12] support/scripts/pkg-stats: set status
 to 'na' for virtual packages
In-Reply-To: <20200302145013.9574-1-heiko.thiery@gmail.com>
References: <20200302145013.9574-1-heiko.thiery@gmail.com>
Message-ID: <20200302145013.9574-11-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If there is no infra set or infra is virtual the status is set to 'na'.

This is done for the follwing checks:
 - license
 - license-files
 - hash
 - hash-license
 - patches
 - version

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index c9287b416e..4cf1a919f3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -132,6 +132,15 @@ class Package:
     def patch_count(self):
         return len(self.patch_files)
 
+    @property
+    def has_valid_infra(self):
+        try:
+            if self.infras[0][1] == 'virtual':
+                return False
+        except IndexError:
+                return False
+        return True
+
     def set_infra(self):
         """
         Fills in the .infras field
@@ -153,6 +162,11 @@ class Package:
         """
         Fills in the .status['license'] and .status['license-files'] fields
         """
+        if not self.has_valid_infra:
+            self.status['license'] = ("na", "no valid package infra")
+            self.status['license-files'] = ("na", "no valid package infra")
+            return
+
         var = self.pkgvar()
         self.status['license'] = ("error", "missing")
         self.status['license-files'] = ("error", "missing")
@@ -167,6 +181,11 @@ class Package:
         """
         Fills in the .status['hash'] field
         """
+        if not self.has_valid_infra:
+            self.status['hash'] = ("na", "no valid package infra")
+            self.status['hash-license'] = ("na", "no valid package infra")
+            return
+
         hashpath = self.path.replace(".mk", ".hash")
         self.status['hash-license'] = ("na", "no hash file")
         if os.path.exists(hashpath):
@@ -187,6 +206,10 @@ class Package:
         """
         Fills in the .patch_count, .patch_files and .status['patches'] fields
         """
+        if not self.has_valid_infra:
+            self.status['patches'] = ("na", "no valid package infra")
+            return
+
         pkgdir = os.path.dirname(self.path)
         for subdir, _, _ in os.walk(pkgdir):
             self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
@@ -564,6 +587,10 @@ def check_package_latest_version(packages):
     for pkg, r in zip(packages, results):
         pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
 
+        if not pkg.has_valid_infra:
+            pkg.status['version'] = ("na", "no valid package infra")
+            continue
+
         if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
             pkg.status['version'] = ('warning', "Release Monitoring API error")
         elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
-- 
2.20.1
