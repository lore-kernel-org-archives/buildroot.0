From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:32:05 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix Python 3.8
 deprecation warning
Message-ID: <20210117141307.9EFA6822C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffb262040500151261107321e0e7d2f8b4632bd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Python 3.8, the following deprecation warnings are emitted:

/home/thomas/projets/buildroot/./support/scripts/pkg-stats:418: DeprecationWarning: The explicit passing of coroutine objects to asyncio.wait() is deprecated since Python 3.8, and scheduled for removal in Python 3.11.

/home/thomas/projets/buildroot/./support/scripts/pkg-stats:536: DeprecationWarning: The explicit passing of coroutine objects to asyncio.wait() is deprecated since Python 3.8, and scheduled for removal in Python 3.11.

The correct way to pass coroutines is to use asyncio.create_task(),
but this is rather new method (Python 3.7), and using it breaks
compatibility with older Python versions. As suggested at
https://docs.python.org/3/library/asyncio-task.html#asyncio.create_task,
use the more cryptic, but also more compatible asyncio.ensure_future()
method.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 99e0ecb828..2119f51cd5 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -434,7 +434,7 @@ async def check_package_urls(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.status['url'][0] == 'ok']
         for pkg in packages:
-            tasks.append(check_url_status(sess, pkg, len(packages)))
+            tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages))))
         await asyncio.wait(tasks)
 
 
@@ -552,7 +552,7 @@ async def check_package_latest_version(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.has_valid_infra]
         for pkg in packages:
-            tasks.append(check_package_latest_version_get(sess, pkg, len(packages)))
+            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages))))
         await asyncio.wait(tasks)
 
 
