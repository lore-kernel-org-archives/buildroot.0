From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 10:11:47 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: URL check using
 threads
Message-ID: <20181009081141.82ED58B3A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b657e264c593ce587bb88e02977f00529310487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds a pool of worker threads to accelerate connection testing.

~7.5MB and 2% CPU per thread on a Intel i5-3230M CPU @ 2.60GHz.

Runtime is ~3min in parallel vs ~15min.

CC: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 1f983feb5c..d0b06b1e74 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -25,6 +25,7 @@ import re
 import subprocess
 import sys
 import requests  # URL checking
+from multiprocessing import Pool
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 URL_RE = re.compile("\s*https?://\S*\s*$")
@@ -47,6 +48,7 @@ class Package:
         self.current_version = None
         self.url = None
         self.url_status = None
+        self.url_worker = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -276,14 +278,24 @@ def package_init_make_info():
         Package.all_versions[pkgvar] = value
 
 
-def check_url_status(pkg):
-    if pkg.url_status != "Missing" and pkg.url_status != "No Config.in":
+def check_url_status_worker(url, url_status):
+    if url_status != "Missing" and url_status != "No Config.in":
         try:
-            url_status_code = requests.head(pkg.url, timeout=5).status_code
+            url_status_code = requests.head(url, timeout=30).status_code
             if url_status_code >= 400:
-                pkg.url_status = "Invalid(%s)" % str(url_status_code)
+                return "Invalid(%s)" % str(url_status_code)
         except requests.exceptions.RequestException:
-            return
+            return "Invalid(Err)"
+        return "Ok"
+    return url_status
+
+
+def check_package_urls(packages):
+    Package.pool = Pool(processes=64)
+    for pkg in packages:
+        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
+    for pkg in packages:
+        pkg.url_status = pkg.url_worker.get(timeout=3600)
 
 
 def calculate_stats(packages):
@@ -573,7 +585,8 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
-        check_url_status(pkg)
+    print("Checking URL status")
+    check_package_urls(packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     print("Write HTML")
