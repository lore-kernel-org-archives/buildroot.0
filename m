From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:46 +0100
Subject: [Buildroot] [PATCH 09/11] support/scripts/pkg-stats;
 use url status from dict for check
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-10-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index b0c2db2b93..dd3c6566a0 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -364,23 +364,23 @@ def package_init_make_info():
 
 
 def check_url_status_worker(url, url_status):
-    if url_status != "Missing" and url_status != "No Config.in":
+    if url_status[0] == "ok":
         try:
             url_status_code = requests.head(url, timeout=30).status_code
             if url_status_code >= 400:
-                return "Invalid(%s)" % str(url_status_code)
+                return ('error', 'invalid({})'.format(url_status_code))
         except requests.exceptions.RequestException:
-            return "Invalid(Err)"
-        return "Ok"
+            return ('error', 'invalid(Err)')
+        return ("ok", "Valid")
     return url_status
 
 
 def check_package_urls(packages):
     Package.pool = Pool(processes=64)
     for pkg in packages:
-        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
+        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.status['url']))
     for pkg in packages:
-        pkg.url_status = pkg.url_worker.get(timeout=3600)
+        pkg.status['url'] = pkg.url_worker.get(timeout=3600)
 
 
 def release_monitoring_get_latest_version_by_distro(pool, name):
-- 
2.20.1
