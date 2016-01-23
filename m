From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 15:41:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/minicom: fix musl build
Message-ID: <1453560118-14646-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ea7/ea72a5aee30a89251c06e6a916499e39128437c0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...0001-Fix-build-issus-surfaced-due-to-musl.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch

diff --git a/package/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch b/package/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
new file mode 100644
index 0000000..09a42eb
--- /dev/null
+++ b/package/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
@@ -0,0 +1,55 @@
+Fix musl build
+
+Downloaded from
+http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-extended/minicom/minicom/0001-Fix-build-issus-surfaced-due-to-musl.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From d62a5862e26ed3fc58d789efe9c40ca6c911d36b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 22:35:31 +0000
+Subject: [PATCH] Fix build issus surfaced due to musl
+
+src/getsdir.h:28:14: error: 'MAXNAMLEN' undeclared here (not in a function)
+   char fname[MAXNAMLEN + 1];  /* filename + terminating null */
+
+src/dial.c:352:22: error: 'KIOCSOUND' undeclared (first use in this function)
+|      ioctl(consolefd, KIOCSOUND, k);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/dial.c    | 2 +-
+ src/getsdir.c | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/dial.c b/src/dial.c
+index a90c1d2..bf02574 100644
+--- a/src/dial.c
++++ b/src/dial.c
+@@ -39,7 +39,7 @@
+ #include "intl.h"
+ 
+ #ifdef VC_MUSIC
+-#  if defined(__GLIBC__)
++#  if defined(__GLIBC__) || defined(__linux__)
+ #    include <sys/ioctl.h>
+ #    include <sys/kd.h>
+ #    include <sys/time.h>
+diff --git a/src/getsdir.c b/src/getsdir.c
+index 2195b27..b61a361 100644
+--- a/src/getsdir.c
++++ b/src/getsdir.c
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/param.h>
+ #include <errno.h>
+ 
+ #include "getsdir.h"
+-- 
+2.5.1
+
-- 
2.7.0.rc3
