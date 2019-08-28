From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 28 Aug 2019 09:02:50 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-stats: query release-monitoring.org
 with upstream name
Message-ID: <20190828070251.22886-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, this upstream name is our BR name.
But with perl-package infrastructure, the variables *_DISTNAME
give the CPAN name which is known by release-monitoring.org

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/pkg-stats | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 992c2dd7c..e03f714a6 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -47,6 +47,7 @@ class Package:
     all_licenses = list()
     all_license_files = list()
     all_versions = dict()
+    all_upstream_names = dict()
 
     def __init__(self, name, path):
         self.name = name
@@ -58,6 +59,7 @@ class Package:
         self.patch_count = 0
         self.warnings = 0
         self.current_version = None
+        self.upstream_name = name
         self.url = None
         self.url_status = None
         self.url_worker = None
@@ -134,6 +136,14 @@ class Package:
         if var in self.all_versions:
             self.current_version = self.all_versions[var]
 
+    def set_upstream_name(self):
+        """
+        Fills in the .upstream_name field
+        """
+        var = self.pkgvar()
+        if var in self.all_upstream_names:
+            self.upstream_name = self.all_upstream_names[var]
+
     def set_check_package_warnings(self):
         """
         Fills in the .warnings field
@@ -227,7 +237,7 @@ def get_pkglist(npackages, package_list):
 def package_init_make_info():
     # Fetch all variables at once
     variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
-                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION"])
+                                         "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_DISTNAME"])
     variable_list = variables.splitlines()
 
     # We process first the host package VERSION, and then the target
@@ -261,6 +271,11 @@ def package_init_make_info():
             pkgvar = pkgvar[:-8]
             Package.all_versions[pkgvar] = value
 
+        elif pkgvar.endswith("_DISTNAME"):
+            # exist only with the perl-package infra
+            pkgvar = pkgvar[:-9]
+            Package.all_upstream_names[pkgvar] = value
+
 
 def check_url_status_worker(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
@@ -349,7 +364,7 @@ def check_package_latest_version(packages):
                                     cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
                                     timeout=30)
     worker_pool = Pool(processes=64)
-    results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
+    results = worker_pool.map(check_package_latest_version_worker, (pkg.upstream_name for pkg in packages))
     for pkg, r in zip(packages, results):
         pkg.latest_version = r
     del http_pool
@@ -742,6 +757,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
+        pkg.set_upstream_name()
     print("Checking URL status")
     check_package_urls(packages)
     print("Getting latest versions ...")
-- 
2.20.1
