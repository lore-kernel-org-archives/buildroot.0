From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 15:59:08 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: clear
 multiprocessing pools after use
Message-ID: <20200309140909.897A28E780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28adf09b8993970eadd63d7a8401d3c2bf3b7235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the CVE checking phase, we can still see a huge amount of
Python processes (actually 128) running on the host, even though
the CVE step is entirely ran in the main thread.

These are actually the worker processes spawned to check for the
packages URL statuses and the latest versions from release-monitoring.
This is because of an issue in Python's multiprocessing implementation:
https://bugs.python.org/issue34172

The problem was already there before the CVE matching step was
introduced, but because pkg-stat was terminating right after the
release-monitoring step, it went unnoticed.

Also, do not hold a reference to the multiprocessing pool from
the Package class, as this is not needed.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index e414ec50f2..8a67e509e1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -402,11 +402,13 @@ def check_url_status_worker(url, url_status):
 
 
 def check_package_urls(packages):
-    Package.pool = Pool(processes=64)
+    pool = Pool(processes=64)
     for pkg in packages:
-        pkg.url_worker = pkg.pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
+        pkg.url_worker = pool.apply_async(check_url_status_worker, (pkg.url, pkg.url_status))
     for pkg in packages:
         pkg.url_status = pkg.url_worker.get(timeout=3600)
+        del pkg.url_worker
+    pool.terminate()
 
 
 def release_monitoring_get_latest_version_by_distro(pool, name):
@@ -479,6 +481,7 @@ def check_package_latest_version(packages):
     results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
     for pkg, r in zip(packages, results):
         pkg.latest_version = r
+    worker_pool.terminate()
     del http_pool
 
 
