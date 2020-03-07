From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 21:37:23 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: set status to
 'na' for virtual packages
Message-ID: <20200309140909.E9F8D8E780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb879c1954f0b8c3ab42f494ac9b9be37b148a4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If there is no infra set or infra is virtual the status is set to 'na'.

This is done for the follwing checks:
 - license
 - license-files
 - hash
 - hash-license
 - patches
 - version

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a15d0ec24b..59b6f388bd 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -131,6 +131,15 @@ class Package:
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
@@ -152,6 +161,11 @@ class Package:
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
@@ -165,6 +179,11 @@ class Package:
         """
         Fills in the .status['hash'] field
         """
+        if not self.has_valid_infra:
+            self.status['hash'] = ("na", "no valid package infra")
+            self.status['hash-license'] = ("na", "no valid package infra")
+            return
+
         hashpath = self.path.replace(".mk", ".hash")
         if os.path.exists(hashpath):
             self.status['hash'] = ("ok", "found")
@@ -175,6 +194,10 @@ class Package:
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
@@ -554,6 +577,10 @@ def check_package_latest_version(packages):
     for pkg, r in zip(packages, results):
         pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
 
+        if not pkg.has_valid_infra:
+            pkg.status['version'] = ("na", "no valid package infra")
+            continue
+
         if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
             pkg.status['version'] = ('warning', "Release Monitoring API error")
         elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
