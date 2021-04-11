From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 20:04:41 +0200
Subject: [Buildroot] [git commit] package/bridge-utils: fix build on musl
Message-ID: <20210411180008.7C72F83707@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa75b053baef70c9dd5e598c7593bdf50a0c4396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build on musl is broken since bump to version 1.7.1 in commit
5f2d38df4f85f7999cf6d00da089991cba93fee6

Fixes:
 - http://autobuild.buildroot.org/results/0f080ff6913595ee2732b93206e5001c837c1bcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bridge-utils/0001-fix-build-on-musl.patch | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/bridge-utils/0001-fix-build-on-musl.patch b/package/bridge-utils/0001-fix-build-on-musl.patch
new file mode 100644
index 0000000000..1a5d1eb23b
--- /dev/null
+++ b/package/bridge-utils/0001-fix-build-on-musl.patch
@@ -0,0 +1,51 @@
+From 1d5a2e0f88e0c53fede03632fa92ffade5e79ac5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 11 Apr 2021 10:04:59 +0200
+Subject: [PATCH] fix build on musl
+
+Build on musl is broken since version 1.7.1 and commit
+a1f20223cfcf7b9eae8c9e7e7a07e7bf1377f65b:
+
+libbridge_devif.c: In function 'fpopen':
+libbridge_devif.c:33:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
+   33 |  char path[PATH_MAX];
+      |            ^~~~~~~~
+      |            AF_MAX
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0f080ff6913595ee2732b93206e5001c837c1bcc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to Stephen Hemminger <sthemmin@microsoft.com>]
+---
+ libbridge/libbridge_devif.c | 1 +
+ libbridge/libbridge_init.c  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
+index 8b7d954..6c679f6 100644
+--- a/libbridge/libbridge_devif.c
++++ b/libbridge/libbridge_devif.c
+@@ -21,6 +21,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <limits.h>
+ #include <string.h>
+ #include <dirent.h>
+ #include <fcntl.h>
+diff --git a/libbridge/libbridge_init.c b/libbridge/libbridge_init.c
+index c914971..83a97cd 100644
+--- a/libbridge/libbridge_init.c
++++ b/libbridge/libbridge_init.c
+@@ -20,6 +20,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <limits.h>
+ #include <string.h>
+ #include <dirent.h>
+ #include <sys/types.h>
+-- 
+2.30.2
+
