From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:39:01 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] chipmunk: fix build on
 musl
Message-ID: <20180928123842.1E89B8A357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d1d52ef207f1b70b7d95586e8fd7952e137ce46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Build fails on:
/home/test/autobuild/run/instance-0/output/build/chipmunk-7.0.2/src/cpHastySpace.c:11:24: fatal error: sys/sysctl.h: No such file or directory

Indeed, sys/sysctl.h is not available on musl so include this header
only if __APPLE__ is defined as sysctlbyname is only used in this case.

Fixes:
 - http://autobuild.buildroot.org/results/e5be2f8eb9315a9054e1c8d854dec37cbb28eed7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2989e3c87a1123350728904fd789ad513e76b073)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../chipmunk/0001-Fix-build-failure-on-musl.patch  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/chipmunk/0001-Fix-build-failure-on-musl.patch b/package/chipmunk/0001-Fix-build-failure-on-musl.patch
new file mode 100644
index 0000000000..4485e937ca
--- /dev/null
+++ b/package/chipmunk/0001-Fix-build-failure-on-musl.patch
@@ -0,0 +1,37 @@
+From 231c1fb97785290aaac89ed74d7cb24eaa74b363 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 2 Sep 2018 12:05:22 +0200
+Subject: [PATCH] Fix build failure on musl
+
+Build fails on:
+/home/test/autobuild/run/instance-0/output/build/chipmunk-7.0.2/src/cpHastySpace.c:11:24: fatal error: sys/sysctl.h: No such file or directory
+
+Indeed, sys/sysctl.h is not available on musl so include this header
+only if __APPLE__ is defined as sysctlbyname is only used in this case.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e5be2f8eb9315a9054e1c8d854dec37cbb28eed7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/slembcke/Chipmunk2D/pull/171]
+---
+ src/cpHastySpace.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cpHastySpace.c b/src/cpHastySpace.c
+index 8dca425..e087df8 100644
+--- a/src/cpHastySpace.c
++++ b/src/cpHastySpace.c
+@@ -8,7 +8,9 @@
+ 
+ //#include <sys/param.h >
+ #ifndef _WIN32
++#ifdef __APPLE__
+ #include <sys/sysctl.h>
++#endif
+ #include <pthread.h>
+ #else
+ #ifndef WIN32_LEAN_AND_MEAN
+-- 
+2.17.1
+
