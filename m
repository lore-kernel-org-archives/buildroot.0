From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 22 Feb 2020 09:57:13 +0100
Subject: [Buildroot] [PATCH v3 09/12] support/scripts/pkg-stats: add support
 for license hash check
In-Reply-To: <20200222085715.23769-1-heiko.thiery@gmail.com>
References: <20200222085715.23769-1-heiko.thiery@gmail.com>
Message-ID: <20200222085715.23769-10-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Store the names of license files and check if they are in the hash file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ae70f90485..e954dd125e 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -84,7 +84,7 @@ def get_defconfig_list():
 
 class Package:
     all_licenses = dict()
-    all_license_files = list()
+    all_license_files = dict()
     all_versions = dict()
     all_ignored_cves = dict()
 
@@ -94,6 +94,7 @@ class Package:
         self.pkg_path = os.path.dirname(path)
         self.infras = None
         self.license = None
+        self.license_files = None
         self.patch_count = 0
         self.patch_files = []
         self.warnings = 0
@@ -152,6 +153,7 @@ class Package:
             self.license = self.all_licenses[var]
             self.status['license'] = ("ok", "found")
         if var in self.all_license_files:
+            self.license_files = self.all_license_files[var].split(' ')
             self.status['license-files'] = ("ok", "found")
 
     def set_hash_info(self):
@@ -159,8 +161,18 @@ class Package:
         Fills in the .status['hash'] field
         """
         hashpath = self.path.replace(".mk", ".hash")
+        self.status['hash-license'] = ("na", "no hash file")
         if os.path.exists(hashpath):
             self.status['hash'] = ("ok", "found")
+            self.status['hash-license'] = ("error", "no license in hash file")
+            # check if license files are in hash file
+            if self.license_files is not None:
+                self.status['hash-license'] = ("ok", "found")
+                with open(hashpath) as f:
+                    content = f.read()
+                    for license in self.license_files:
+                        if content.find(license) == -1:
+                            self.status['hash-license'] = ("error", "license missing in hash file")
         else:
             self.status['hash'] = ("error", "missing")
 
@@ -441,7 +453,7 @@ def package_init_make_info():
             if pkgvar.endswith("_MANIFEST_LICENSE_FILES"):
                 continue
             pkgvar = pkgvar[:-14]
-            Package.all_license_files.append(pkgvar)
+            Package.all_license_files[pkgvar] = value
 
         elif pkgvar.endswith("_VERSION"):
             if pkgvar.endswith("_DL_VERSION"):
-- 
2.20.1
