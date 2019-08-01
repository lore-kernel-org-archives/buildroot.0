From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 18:04:09 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: retrieve
 packages latest version using processes
Message-ID: <20190801160204.F106B8A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=294fc3218c2e296ddfe905d795e3b99e4c0cc8f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The major bottleneck in pkg-stats is the time spent waiting for
answers from remote servers. Two functions involve such communication
with remote servers:

- 'check_package_urls' which checks that each package upstream website
  is up, it is efficient due to the use of process-pools thanks to
  Matt Weber.

- 'check_package_latest_version' which fetches the latest package
  version from release-monitoring, it uses a http-pool but runs
  sequentially.

This patch extends the use of process-pools to 'check_latest_version'.
Due to some limitations of multiprocess callbacks, this patch loses
the overall progress of packages in favour of just the current package
name.

Runtimes for this function are ~3m vs ~25m for the linear version.
Tested on an i7 7500U (2/4 cores/threads @3.5GHz) with 15ms ping.

Note: There have already been work trying to parallelize this function
using threads but there were a failure on some configurations [1].
This implementation rely on a dedicated module already in use on this
script, so it's unlikely to see failure with this version.

[1] http://lists.busybox.net/pipermail/buildroot/2018-March/215368.html

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 45a7103099..992c2dd7c5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -38,6 +38,10 @@ RM_API_STATUS_FOUND_BY_DISTRO = 2
 RM_API_STATUS_FOUND_BY_PATTERN = 3
 RM_API_STATUS_NOT_FOUND = 4
 
+# Used to make multiple requests to the same host. It is global
+# because it's used by sub-processes.
+http_pool = None
+
 
 class Package:
     all_licenses = list()
@@ -316,6 +320,15 @@ def release_monitoring_get_latest_version_by_guess(pool, name):
     return (RM_API_STATUS_NOT_FOUND, None, None)
 
 
+def check_package_latest_version_worker(name):
+    """Wrapper to try both by name then by guess"""
+    print(name)
+    res = release_monitoring_get_latest_version_by_distro(http_pool, name)
+    if res[0] == RM_API_STATUS_NOT_FOUND:
+        res = release_monitoring_get_latest_version_by_guess(http_pool, name)
+    return res
+
+
 def check_package_latest_version(packages):
     """
     Fills in the .latest_version field of all Package objects
@@ -331,18 +344,15 @@ def check_package_latest_version(packages):
     - id: string containing the id of the project corresponding to this
       package, as known by release-monitoring.org
     """
-    pool = HTTPSConnectionPool('release-monitoring.org', port=443,
-                               cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
-                               timeout=30)
-    count = 0
-    for pkg in packages:
-        v = release_monitoring_get_latest_version_by_distro(pool, pkg.name)
-        if v[0] == RM_API_STATUS_NOT_FOUND:
-            v = release_monitoring_get_latest_version_by_guess(pool, pkg.name)
-
-        pkg.latest_version = v
-        print("[%d/%d] Package %s" % (count, len(packages), pkg.name))
-        count += 1
+    global http_pool
+    http_pool = HTTPSConnectionPool('release-monitoring.org', port=443,
+                                    cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
+                                    timeout=30)
+    worker_pool = Pool(processes=64)
+    results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
+    for pkg, r in zip(packages, results):
+        pkg.latest_version = r
+    del http_pool
 
 
 def calculate_stats(packages):
