From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 22:39:11 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libnss: fix build
 failure on aarch64_be
Message-ID: <20190917203621.AA4C58EA30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dffa1853d68dbe6749d20220540646f83dff616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
http://autobuild.buildroot.net/results/bfd29593bb6c53d3e9e2d02d2ed6bea360d99c00/

In libnss there is a bug leading to build failure due to double declared
functions. This is due to 2 different #ifdef statements treating the
same function-set.

Add patch to fix this by making the 2 #ifdef statements equal.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 82187f94814b3b46fdc23fe6f84a5c6fae85c86d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-build-failure-on-aarch64_be-while-bu.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch b/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
new file mode 100644
index 0000000000..ed415c13d4
--- /dev/null
+++ b/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
@@ -0,0 +1,36 @@
+From 6b3819159949ed7fc099e588e2e0669407135121 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Tue, 10 Sep 2019 11:29:02 +0200
+Subject: [PATCH] Bug 1580126 - Fix build failure on aarch64_be while building
+ freebl/gcm
+
+Build failure is caused by different #ifdef conditions in gcm.c and
+gcm-aarch64.c that leads to double declaration of the same gcm_*
+functions.
+
+Fix #ifdef condition in gcm-aarch64.c making it the same as the one in
+gcm.c.
+
+[Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=1580126]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/gcm-aarch64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/gcm-aarch64.c b/nss/lib/freebl/gcm-aarch64.c
+index 65ea9fb5f..3f3c046d7 100644
+--- a/nss/lib/freebl/gcm-aarch64.c
++++ b/nss/lib/freebl/gcm-aarch64.c
+@@ -9,7 +9,8 @@
+ #include "secerr.h"
+ 
+ /* old gcc doesn't support some poly64x2_t intrinsic */
+-#if defined(__clang__) || (defined(__GNUC__) && __GNUC__ > 6)
++#if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
++    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
+ 
+ #include <arm_neon.h>
+ 
+-- 
+2.17.1
+
