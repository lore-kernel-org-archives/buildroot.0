From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:41:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: store patch files for the package
Message-ID: <20200828155253.81B848653A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f72379943bc73726b5591f6571a6cda10bf6a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Remove the patch_count attribute and use a class property instead.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1916b0a8d89e071d8adfeaa9b8626c13b0e615c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 95ec9e86bd..87018eabd3 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -64,7 +64,7 @@ class Package:
         self.has_license = False
         self.has_license_files = False
         self.has_hash = False
-        self.patch_count = 0
+        self.patch_files = []
         self.warnings = 0
         self.current_version = None
         self.url = None
@@ -93,6 +93,10 @@ class Package:
                 self.url_status = "Missing"
                 fp.close()
 
+    @property
+    def patch_count(self):
+        return len(self.patch_files)
+
     def set_infra(self):
         """
         Fills in the .infras field
@@ -131,10 +135,9 @@ class Package:
         """
         Fills in the .patch_count field
         """
-        self.patch_count = 0
         pkgdir = os.path.dirname(self.path)
         for subdir, _, _ in os.walk(pkgdir):
-            self.patch_count += len(fnmatch.filter(os.listdir(subdir), '*.patch'))
+            self.patch_files = fnmatch.filter(os.listdir(subdir), '*.patch')
 
     def set_current_version(self):
         """
