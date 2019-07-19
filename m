From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 16:35:54 +0200
Subject: [Buildroot] [PATCH v2 3/5] support/scripts/pkg-stats: add current
 progress in 'check_url_status'
In-Reply-To: <20190719143556.14907-1-victor.huesca@bootlin.com>
References: <20190719143556.14907-1-victor.huesca@bootlin.com>
Message-ID: <20190719143556.14907-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'check_url_status' function can take a few minutes to process
depending on how many packages are involved. The current implementation
uses process-pool to speed-up the completion time but does not allow to
trace which package as complete nor to track the overall progress with
for example: '[42/2243] Package jpeg'

This patch adds a progress feedback to 'check_url_status' to report the
current package and the overall progression. It rely on the pool's
callback and follow the same scheme as 'check_package_latest_version'.

This patch also remove the unnecessary 'url_worker' Package's attribute
in favor of a local list of workers. This imply removing this field form
the excluded fields from 'dump_json'.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 08730b8d43..8b59cd1e76 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -57,7 +57,6 @@ class Package:
         self.current_version = None
         self.url = None
         self.url_status = None
-        self.url_worker = None
         self.latest_version = (RM_API_STATUS_ERROR, None, None)
 
     def pkgvar(self):
@@ -319,7 +318,7 @@ def package_init_make_info():
         Package.all_versions[pkgvar] = value
 
 
-def check_url_status_worker(url, url_status):
+def check_url_status(url, url_status):
     if url_status != "Missing" and url_status != "No Config.in":
         try:
             url_status_code = requests.head(url, timeout=30).status_code
@@ -332,11 +331,12 @@ def check_url_status_worker(url, url_status):
 
 
 def check_package_urls(packages):
-    Package.pool = Pool(processes=64)
-    for pkg in packages:
-        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
-    for pkg in packages:
-        pkg.url_status = pkg.url_worker.get(timeout=3600)
+    pool = Pool(processes=64)
+    cb = progress_callback(lambda i, n, res, name: print("[%d/%d] (url) Package %s: %s" % (i, n, name, res)), 1, len(packages))
+    results = [apply_async(pool, check_url_status, (pkg.url, pkg.url_status),
+                           callback=cb, cb_args=(pkg.name,)) for pkg in packages]
+    for pkg, r in zip(packages, results):
+        pkg.url_status = r.get()
 
 
 def release_monitoring_get_latest_version_by_distro(pool, name):
@@ -735,7 +735,7 @@ def dump_html(packages, stats, date, commit, output):
 def dump_json(packages, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
-    excluded_fields = ['url_worker', 'name']
+    excluded_fields = ['name']
     pkgs = {
         pkg.name: {
             k: v
-- 
2.21.0
