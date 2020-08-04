From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 Aug 2020 21:52:46 +0200
Subject: [Buildroot] [PATCH v2 1/3] support/scripts/pkg-stats: use aiohttp
 for latest version retrieval
In-Reply-To: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
References: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200804195248.1238754-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit reworks the code that retrieves the latest upstream
version of each package from release-monitoring.org using the aiohttp
module. This makes the implementation much more elegant, and avoids
the problematic multiprocessing Pool which is causing issues in some
situations.

Suggested-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 142 +++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 64 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ec4d538758..31ff101781 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -16,7 +16,9 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
+import aiohttp
 import argparse
+import asyncio
 import datetime
 import fnmatch
 import os
@@ -26,13 +28,10 @@ import subprocess
 import requests  # URL checking
 import json
 import ijson
-import certifi
 import distutils.version
 import time
 import gzip
 import sys
-from urllib3 import HTTPSConnectionPool
-from urllib3.exceptions import HTTPError
 from multiprocessing import Pool
 
 sys.path.append('utils/')
@@ -54,10 +53,6 @@ CVE_AFFECTS = 1
 CVE_DOESNT_AFFECT = 2
 CVE_UNKNOWN = 3
 
-# Used to make multiple requests to the same host. It is global
-# because it's used by sub-processes.
-http_pool = None
-
 
 class Defconfig:
     def __init__(self, name, path):
@@ -526,54 +521,88 @@ def check_package_urls(packages):
     pool.terminate()
 
 
-def release_monitoring_get_latest_version_by_distro(pool, name):
-    try:
-        req = pool.request('GET', "/api/project/Buildroot/%s" % name)
-    except HTTPError:
-        return (RM_API_STATUS_ERROR, None, None)
-
-    if req.status != 200:
-        return (RM_API_STATUS_NOT_FOUND, None, None)
+def check_package_latest_version_set_status(pkg, status, version, identifier):
+    pkg.latest_version = {
+        "status": status,
+        "version": version,
+        "id": identifier,
+    }
 
-    data = json.loads(req.data)
+    if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
+        pkg.status['version'] = ('warning', "Release Monitoring API error")
+    elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
+        pkg.status['version'] = ('warning', "Package not found on Release Monitoring")
 
-    if 'version' in data:
-        return (RM_API_STATUS_FOUND_BY_DISTRO, data['version'], data['id'])
+    if pkg.latest_version['version'] is None:
+        pkg.status['version'] = ('warning', "No upstream version available on Release Monitoring")
+    elif pkg.latest_version['version'] != pkg.current_version:
+        pkg.status['version'] = ('error', "The newer version {} is available upstream".format(pkg.latest_version['version']))
     else:
-        return (RM_API_STATUS_FOUND_BY_DISTRO, None, data['id'])
+        pkg.status['version'] = ('ok', 'up-to-date')
 
 
-def release_monitoring_get_latest_version_by_guess(pool, name):
+async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
+    url = "https://release-monitoring.org//api/project/Buildroot/%s" % pkg.name
     try:
-        req = pool.request('GET', "/api/projects/?pattern=%s" % name)
-    except HTTPError:
-        return (RM_API_STATUS_ERROR, None, None)
+        async with session.get(url) as resp:
+            if resp.status != 200:
+                return False
 
-    if req.status != 200:
-        return (RM_API_STATUS_NOT_FOUND, None, None)
+            data = await resp.json()
+            version = data['version'] if 'version' in data else None
+            check_package_latest_version_set_status(pkg,
+                                                    RM_API_STATUS_FOUND_BY_DISTRO,
+                                                    version,
+                                                    data['id'])
+            return True
+
+    except (aiohttp.ClientError, asyncio.exceptions.TimeoutError):
+        if retry:
+            return await check_package_get_latest_version_by_distro(session, pkg, retry=False)
+        else:
+            return False
 
-    data = json.loads(req.data)
 
-    projects = data['projects']
-    projects.sort(key=lambda x: x['id'])
+async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
+    url = "https://release-monitoring.org/api/projects/?pattern=%s" % pkg.name
+    try:
+        async with session.get(url) as resp:
+            if resp.status != 200:
+                return False
+
+            data = await resp.json()
+            # filter projects that have the right name and a version defined
+            projects = [p for p in data['projects'] if p['name'] == pkg.name and 'version' in p]
+            projects.sort(key=lambda x: x['id'])
+
+            if len(projects) > 0:
+                check_package_latest_version_set_status(pkg,
+                                                        RM_API_STATUS_FOUND_BY_DISTRO,
+                                                        projects[0]['version'],
+                                                        projects[0]['id'])
+                return True
+
+    except (aiohttp.ClientError, asyncio.exceptions.TimeoutError):
+        if retry:
+            return await check_package_get_latest_version_by_guess(session, pkg, retry=False)
+        else:
+            return False
+
 
-    for p in projects:
-        if p['name'] == name and 'version' in p:
-            return (RM_API_STATUS_FOUND_BY_PATTERN, p['version'], p['id'])
+async def check_package_latest_version_get(session, pkg):
 
-    return (RM_API_STATUS_NOT_FOUND, None, None)
+    if await check_package_get_latest_version_by_distro(session, pkg):
+        return
 
+    if await check_package_get_latest_version_by_guess(session, pkg):
+        return
 
-def check_package_latest_version_worker(name):
-    """Wrapper to try both by name then by guess"""
-    print(name)
-    res = release_monitoring_get_latest_version_by_distro(http_pool, name)
-    if res[0] == RM_API_STATUS_NOT_FOUND:
-        res = release_monitoring_get_latest_version_by_guess(http_pool, name)
-    return res
+    check_package_latest_version_set_status(pkg,
+                                            RM_API_STATUS_NOT_FOUND,
+                                            None, None)
 
 
-def check_package_latest_version(packages):
+async def check_package_latest_version(packages):
     """
     Fills in the .latest_version field of all Package objects
 
@@ -587,33 +616,18 @@ def check_package_latest_version(packages):
     - id: string containing the id of the project corresponding to this
       package, as known by release-monitoring.org
     """
-    global http_pool
-    http_pool = HTTPSConnectionPool('release-monitoring.org', port=443,
-                                    cert_reqs='CERT_REQUIRED', ca_certs=certifi.where(),
-                                    timeout=30)
-    worker_pool = Pool(processes=64)
-    results = worker_pool.map(check_package_latest_version_worker, (pkg.name for pkg in packages))
-    for pkg, r in zip(packages, results):
-        pkg.latest_version = dict(zip(['status', 'version', 'id'], r))
 
+    for pkg in packages:
         if not pkg.has_valid_infra:
             pkg.status['version'] = ("na", "no valid package infra")
-            continue
-
-        if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
-            pkg.status['version'] = ('warning', "Release Monitoring API error")
-        elif pkg.latest_version['status'] == RM_API_STATUS_NOT_FOUND:
-            pkg.status['version'] = ('warning', "Package not found on Release Monitoring")
-
-        if pkg.latest_version['version'] is None:
-            pkg.status['version'] = ('warning', "No upstream version available on Release Monitoring")
-        elif pkg.latest_version['version'] != pkg.current_version:
-            pkg.status['version'] = ('error', "The newer version {} is available upstream".format(pkg.latest_version['version']))
-        else:
-            pkg.status['version'] = ('ok', 'up-to-date')
 
-    worker_pool.terminate()
-    del http_pool
+    tasks = []
+    connector = aiohttp.TCPConnector(limit_per_host=5)
+    async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
+        packages = [p for p in packages if p.has_valid_infra]
+        for pkg in packages:
+            tasks.append(check_package_latest_version_get(sess, pkg))
+        await asyncio.wait(tasks)
 
 
 def check_package_cves(nvd_path, packages):
@@ -1057,7 +1071,7 @@ def __main__():
     print("Checking URL status")
     check_package_urls(packages)
     print("Getting latest versions ...")
-    check_package_latest_version(packages)
+    asyncio.run(check_package_latest_version(packages))
     if args.nvd_path:
         print("Checking packages CVEs")
         check_package_cves(args.nvd_path, {p.name: p for p in packages})
-- 
2.26.2
