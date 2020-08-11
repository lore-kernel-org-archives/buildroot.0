From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:30:52 +0200
Subject: [Buildroot] [git commit branch/next] support/scripts/pkg-stats:
 show progress of upstream URL and latest version
Message-ID: <20200811202453.E2F0F7F8BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f0868fa640af0be1fed81eb9c70b30cf0857d33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit slightly improves the output of pkg-stats by showing the
progress of the upstream URL checks and latest version retrieval, on a
package basis:

Checking URL status
[0001/0062] curlpp
[0002/0062] cmocka
[0003/0062] snappy
[0004/0062] nload
[...]
[0060/0062] librtas
[0061/0062] libsilk
[0062/0062] jhead
Getting latest versions ...
[0001/0064] libglob
[0002/0064] perl-http-daemon
[0003/0064] shadowsocks-libev
[...]
[0061/0064] lua-flu
[0062/0064] python-aiohttp-security
[0063/0064] ljlinenoise
[0064/0064] matchbox-lib

Note that the above sample was run on 64 packages. Only 62 packages
appear for the URL status check, because packages that do not have any
URL in their Config.in file, or don't have any Config.in file at all,
are not checked and therefore not accounted.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 70e7fa7a0c..303af2f588 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -498,20 +498,31 @@ def package_init_make_info():
             Package.all_ignored_cves[pkgvar] = value.split()
 
 
-async def check_url_status(session, pkg, retry=True):
+check_url_count = 0
+
+
+async def check_url_status(session, pkg, npkgs, retry=True):
+    global check_url_count
+
     try:
         async with session.get(pkg.url) as resp:
             if resp.status >= 400:
                 pkg.status['url'] = ("error", "invalid {}".format(resp.status))
+                check_url_count += 1
+                print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
                 return
     except (aiohttp.ClientError, asyncio.TimeoutError):
         if retry:
-            return await check_url_status(session, pkg, retry=False)
+            return await check_url_status(session, pkg, npkgs, retry=False)
         else:
             pkg.status['url'] = ("error", "invalid (err)")
+            check_url_count += 1
+            print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
             return
 
     pkg.status['url'] = ("ok", "valid")
+    check_url_count += 1
+    print("[%04d/%04d] %s" % (check_url_count, npkgs, pkg.name))
 
 
 async def check_package_urls(packages):
@@ -520,7 +531,7 @@ async def check_package_urls(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.status['url'][0] == 'ok']
         for pkg in packages:
-            tasks.append(check_url_status(sess, pkg))
+            tasks.append(check_url_status(sess, pkg, len(packages)))
         await asyncio.wait(tasks)
 
 
@@ -592,17 +603,27 @@ async def check_package_get_latest_version_by_guess(session, pkg, retry=True):
             return False
 
 
-async def check_package_latest_version_get(session, pkg):
+check_latest_count = 0
+
+
+async def check_package_latest_version_get(session, pkg, npkgs):
+    global check_latest_count
 
     if await check_package_get_latest_version_by_distro(session, pkg):
+        check_latest_count += 1
+        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
     if await check_package_get_latest_version_by_guess(session, pkg):
+        check_latest_count += 1
+        print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
         return
 
     check_package_latest_version_set_status(pkg,
                                             RM_API_STATUS_NOT_FOUND,
                                             None, None)
+    check_latest_count += 1
+    print("[%04d/%04d] %s" % (check_latest_count, npkgs, pkg.name))
 
 
 async def check_package_latest_version(packages):
@@ -628,7 +649,7 @@ async def check_package_latest_version(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.has_valid_infra]
         for pkg in packages:
-            tasks.append(check_package_latest_version_get(sess, pkg))
+            tasks.append(check_package_latest_version_get(sess, pkg, len(packages)))
         await asyncio.wait(tasks)
 
 
