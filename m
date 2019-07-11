From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 11 Jul 2019 11:54:48 +0200
Subject: [Buildroot] [PATCH 2/2] support/script/pkg-stats: run 'get latest
 version' in a process-pool
In-Reply-To: <20190711095448.7417-1-victor.huesca@bootlin.com>
References: <20190711095448.7417-1-victor.huesca@bootlin.com>
Message-ID: <20190711095448.7417-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The major bottleneck in pkg-stats is the time spent waiting for
responses from distant servers. There is tow parts that imply
such communication with remote servers in pkg-stats:
- the function checking that package URLs are responding
- the function that fetch the latest package version from
release-monitoring.
The 1st one already make use of process-pools for speed-up but the 2nd
does not.

This patch simply add support of process-pools to this
`check_package_latest_version` function in addition to http-pool.

There have already been work trying to parallelize this function
using threads but there were a failure on some configurations [1].
This implementation rely on a dedicated module already in use on this
script, so it's unlikely to see failure on this one.

In terms of performances I achieve to run this function in ~3m vs ~25m
for the linear version.

[1] http://lists.busybox.net/pipermail/buildroot/2018-March/215368.html

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 support/scripts/pkg-stats | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2ed41dffa9..14033941ba 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -322,9 +322,9 @@ def check_package_urls(packages):
         pkg.url_status = pkg.url_worker.get(timeout=3600)
 
 
-def release_monitoring_get_latest_version_by_distro(pool, name):
+def release_monitoring_get_latest_version_by_distro(name):
     try:
-        req = pool.request('GET', "/api/project/Buildroot/%s" % name)
+        req = Package.pool.request('GET', "/api/project/Buildroot/%s" % name)
     except HTTPError:
         return (RM_API_STATUS_ERROR, None, None)
 
@@ -339,9 +339,9 @@ def release_monitoring_get_latest_version_by_distro(pool, name):
         return (RM_API_STATUS_FOUND_BY_DISTRO, None, data['id'])
 
 
-def release_monitoring_get_latest_version_by_guess(pool, name):
+def release_monitoring_get_latest_version_by_guess(name):
     try:
-        req = pool.request('GET', "/api/projects/?pattern=%s" % name)
+        req = Package.pool.request('GET', "/api/projects/?pattern=%s" % name)
     except HTTPError:
         return (RM_API_STATUS_ERROR, None, None)
 
@@ -375,18 +375,20 @@ def check_package_latest_version(packages):
     - id: string containing the id of the project corresponding to this
       package, as known by release-monitoring.org
     """
-    pool = HTTPSConnectionPool('release-monitoring.org', port=443,
-                               cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
-                               timeout=30)
-    count = 0
+    Package.pool = HTTPSConnectionPool('release-monitoring.org', port=443,
+                                       cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
+                                       timeout=30)
+    worker_pool = Pool(processes=64)
+    for pkg in packages:
+        pkg.url_worker = worker_pool.apply_async(release_monitoring_get_latest_version_by_distro, (pkg.name, ))
+
     for pkg in packages:
-        v = release_monitoring_get_latest_version_by_distro(pool, pkg.name)
-        if v[0] == RM_API_STATUS_NOT_FOUND:
-            v = release_monitoring_get_latest_version_by_guess(pool, pkg.name)
+        status, _, _ = pkg.url_worker.get()
+        if status == RM_API_STATUS_NOT_FOUND:
+            pkg.url_worker = worker_pool.apply_async(release_monitoring_get_latest_version_by_guess, (pkg.name, ))
 
-        pkg.latest_version = v
-        print("[%d/%d] Package %s" % (count, len(packages), pkg.name))
-        count += 1
+    for count, pkg in enumerate(packages):
+        pkg.latest_version = pkg.url_worker.get()
 
 
 def calculate_stats(packages):
@@ -773,7 +775,7 @@ def __main__():
         pkg.set_check_package_warnings()
         pkg.set_current_version()
         pkg.set_url()
-    print("Checking URL status")
+    print("Checking URL status ...")
     check_package_urls(packages)
     print("Getting latest versions ...")
     check_package_latest_version(packages)
-- 
2.21.0
