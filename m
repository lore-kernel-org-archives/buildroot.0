From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 15:28:32 +0200
Subject: [Buildroot] [git commit] package/boost: drop no longer needed patch
 0004-workaround-musl-bug.patch
Message-ID: <20190803132545.2FDB8867E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13d470fe91c6095f14e69ff319d2ac39fc0d3e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 0004-workaround-musl-bug.patch was added because musl's <sched.h>
was using memset(), but without including <string.h>. So including
just <sched.h> was causing a build failure.

However, this issue in musl has been fixed in upstream musl commit
48be5b6313d7b827acf555769e93b389fa9f6307 ("fix use of memset without
declaration in sched.h cpu set macros"). This commit was part of musl
1.1.17, which has been released a while ago. Both 2019.02.x, 2019.05.x
and master use a newer musl version.

So the workaround in Boost can be dropped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/boost/0004-workaround-musl-bug.patch | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/package/boost/0004-workaround-musl-bug.patch b/package/boost/0004-workaround-musl-bug.patch
deleted file mode 100644
index 8613f2fec3..0000000000
--- a/package/boost/0004-workaround-musl-bug.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0506e46640989e1f919388ad36890bd6063cd43a Mon Sep 17 00:00:00 2001
-From: Zach van Rijn <me@zv.io>
-Date: Sat, 26 Aug 2017 01:32:56 -0400
-Subject: [PATCH] explicitly include <string.h> for memset()
-
-[Thomas: taken from
-https://github.com/boostorg/fiber/pull/142/commits/0506e46640989e1f919388ad36890bd6063cd43a. It
-is not going to be applied upstream because the actual bug is in musl,
-but it's a good enough workaround for now.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- libs/fiber/src/numa/linux/pin_thread.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libs/fiber/src/numa/linux/pin_thread.cpp b/libs/fiber/src/numa/linux/pin_thread.cpp
-index ae696be3..e9b3c423 100644
---- a/libs/fiber/src/numa/linux/pin_thread.cpp
-+++ b/libs/fiber/src/numa/linux/pin_thread.cpp
-@@ -9,6 +9,7 @@
- extern "C" {
- #include <pthread.h>
- #include <sched.h>
-+#include <string.h>
- }
- 
- #include <system_error>
