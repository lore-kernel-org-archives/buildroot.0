From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:44 +0100
Subject: [Buildroot] [PATCH 07/11] support/scripts/pkg-stats: store
 dependencies of package
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-8-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a5e87a7167..324700adbf 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -92,6 +92,7 @@ class Package:
     all_licenses = dict()
     all_license_files = list()
     all_versions = dict()
+    all_dependencies = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -106,6 +107,7 @@ class Package:
         self.patches = {'count':0, 'files': None}
         self.warnings = 0
         self.current_version = None
+        self.dependencies = None
         self.url = None
         self.url_status = None
         self.url_worker = None
@@ -182,6 +184,14 @@ class Package:
         if var in self.all_versions:
             self.current_version = self.all_versions[var]
 
+    def set_dependencies(self):
+        """
+        Fills in the .dependencies field
+        """
+        var = self.pkgvar()
+        if var in self.all_dependencies:
+            self.dependencies = self.all_dependencies[var]
+
     def set_check_package_warnings(self):
         """
         Fills in the .warnings field
@@ -284,7 +294,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_DEPENDENCIES"])
     variable_list = variables.splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -318,6 +328,11 @@ def package_init_make_info():
             pkgvar = pkgvar[:-8]
             Package.all_versions[pkgvar] = value
 
+        elif pkgvar.endswith("_FINAL_DEPENDENCIES"):
+            value = [v for v in value.split(' ') if not v.startswith('host-')]
+            pkgvar = pkgvar[:-19]
+            Package.all_dependencies[pkgvar] = value
+
 
 def check_url_status_worker(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
@@ -801,6 +816,7 @@ def __main__():
         pkg.set_patch_count()
         pkg.set_check_package_warnings()
         pkg.set_current_version()
+        pkg.set_dependencies()
         pkg.set_url()
         pkg.set_developers(developers)
     print("Checking URL status")
-- 
2.20.1
