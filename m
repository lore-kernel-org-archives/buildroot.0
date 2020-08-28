From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:48:25 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: use aiohttp for upstream URL checking
Message-ID: <20200828155254.60319811FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc51041e6b72588aaf4ea3c3b4b80e5c66039d65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This commit reworks the code that checks if the upstream URL of each
package (specified by its Config.in file) using the aiohttp
module. This makes the implementation much more elegant, and avoids
the problematic multiprocessing Pool which is causing issues in some
situations.

Suggested-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5c3221ac20c1bc374a44a727d0f552041a4a7247)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 46 +++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3423c44815..70e7fa7a0c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -25,14 +25,13 @@ import os
 from collections import defaultdict
 import re
 import subprocess
-import requests  # URL checking
+import requests  # NVD database download
 import json
 import ijson
 import distutils.version
 import time
 import gzip
 import sys
-from multiprocessing import Pool
 
 sys.path.append('utils/')
 from getdeveloperlib import parse_developers  # noqa: E402
@@ -499,26 +498,30 @@ def package_init_make_info():
             Package.all_ignored_cves[pkgvar] = value.split()
 
 
-def check_url_status_worker(url, url_status):
-    if url_status[0] == 'ok':
-        try:
-            url_status_code = requests.head(url, timeout=30).status_code
-            if url_status_code >= 400:
-                return ("error", "invalid {}".format(url_status_code))
-        except requests.exceptions.RequestException:
-            return ("error", "invalid (err)")
-        return ("ok", "valid")
-    return url_status
+async def check_url_status(session, pkg, retry=True):
+    try:
+        async with session.get(pkg.url) as resp:
+            if resp.status >= 400:
+                pkg.status['url'] = ("error", "invalid {}".format(resp.status))
+                return
+    except (aiohttp.ClientError, asyncio.TimeoutError):
+        if retry:
+            return await check_url_status(session, pkg, retry=False)
+        else:
+            pkg.status['url'] = ("error", "invalid (err)")
+            return
 
+    pkg.status['url'] = ("ok", "valid")
 
-def check_package_urls(packages):
-    pool = Pool(processes=64)
-    for pkg in packages:
-        pkg.url_worker = pool.apply_async(check_url_status_worker, (pkg.url, pkg.status['url']))
-    for pkg in packages:
-        pkg.status['url'] = pkg.url_worker.get(timeout=3600)
-        del pkg.url_worker
-    pool.terminate()
+
+async def check_package_urls(packages):
+    tasks = []
+    connector = aiohttp.TCPConnector(limit_per_host=5)
+    async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
+        packages = [p for p in packages if p.status['url'][0] == 'ok']
+        for pkg in packages:
+            tasks.append(check_url_status(sess, pkg))
+        await asyncio.wait(tasks)
 
 
 def check_package_latest_version_set_status(pkg, status, version, identifier):
@@ -1068,7 +1071,8 @@ def __main__():
         pkg.set_url()
         pkg.set_developers(developers)
     print("Checking URL status")
-    check_package_urls(packages)
+    loop = asyncio.get_event_loop()
+    loop.run_until_complete(check_package_urls(packages))
     print("Getting latest versions ...")
     loop = asyncio.get_event_loop()
     loop.run_until_complete(check_package_latest_version(packages))
