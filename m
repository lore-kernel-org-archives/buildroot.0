From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 21 Sep 2018 10:35:57 -0500
Subject: [Buildroot] [PATCH v2 2/2] support/scripts/pkg-stats: URL check
 using threads
In-Reply-To: <1537544157-2992-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537544157-2992-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537544157-2992-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds a pool of worker threads to accelerate connection testing.

CC: Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/pkg-stats | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 37f89ef..f5c8353 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -25,6 +25,7 @@ import re
 import subprocess
 import sys
 import requests  # URL checking
+from multiprocessing import Pool
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 
@@ -46,6 +47,7 @@ class Package:
         self.current_version = None
         self.url = None
         self.url_status = None
+        self.url_worker = None
 
     def pkgvar(self):
         return self.name.upper().replace("-", "_")
@@ -277,14 +279,26 @@ def package_init_make_info():
 
         Package.all_versions[pkgvar] = value
 
-def check_url_status(pkg):
-    if pkg.url_status != "Missing" and pkg.url_status != "No Config.in":
+
+def check_url_status_worker(url, url_status):
+    if url_status != "Missing" and url_status != "No Config.in":
         try:
-            url_status_code = requests.head(pkg.url, timeout=5).status_code
+            url_status_code = requests.head(url, timeout=5).status_code
             if url_status_code >= 400:
-                pkg.url_status = "Invalid(%s)" % str(url_status_code)
+                return "Invalid(%s)" % str(url_status_code)
         except requests.exceptions.RequestException as e:
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
+
 
 def calculate_stats(packages):
     stats = defaultdict(int)
@@ -573,7 +587,8 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
-        check_url_status(pkg)
+    print("Checking URL status")
+    check_package_urls(packages)
     print("Calculate stats")
     stats = calculate_stats(packages)
     print("Write HTML")
-- 
1.9.1
