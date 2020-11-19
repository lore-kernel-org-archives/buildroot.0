From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 15:53:52 +0100
Subject: [Buildroot] [PATCH 2/4] support/scripts/pkg-stats: fix Python 3.8
 deprecation warning
In-Reply-To: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
References: <20201119145354.1175043-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119145354.1175043-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
 
-- 
2.28.0
