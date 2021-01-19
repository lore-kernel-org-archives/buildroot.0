From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:23:56 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 support/scripts/pkg-stats: fix Python 3.8 deprecation warning
Message-ID: <20210119141350.152A583A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d160596deda82a581c02c067347923755c774dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

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
(cherry picked from commit ffb262040500151261107321e0e7d2f8b4632bd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2676cc49dd..e472b67784 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -413,7 +413,7 @@ async def check_package_urls(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.status['url'][0] == 'ok']
         for pkg in packages:
-            tasks.append(check_url_status(sess, pkg, len(packages)))
+            tasks.append(asyncio.ensure_future(check_url_status(sess, pkg, len(packages))))
         await asyncio.wait(tasks)
 
 
@@ -531,7 +531,7 @@ async def check_package_latest_version(packages):
     async with aiohttp.ClientSession(connector=connector, trust_env=True) as sess:
         packages = [p for p in packages if p.has_valid_infra]
         for pkg in packages:
-            tasks.append(check_package_latest_version_get(sess, pkg, len(packages)))
+            tasks.append(asyncio.ensure_future(check_package_latest_version_get(sess, pkg, len(packages))))
         await asyncio.wait(tasks)
 
 
