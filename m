From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 09:37:08 -0500
Subject: [Buildroot] [PATCH] package/bridge-utils: fix missing PATH_MAX
 include
Message-ID: <20210412143708.45721-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3ec818e676827c03f08c264c6c7a53b025b7ba1d/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...1-Include-header-for-use-of-PATH_MAX.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/bridge-utils/0001-Include-header-for-use-of-PATH_MAX.patch

diff --git a/package/bridge-utils/0001-Include-header-for-use-of-PATH_MAX.patch b/package/bridge-utils/0001-Include-header-for-use-of-PATH_MAX.patch
new file mode 100644
index 0000000000..759b772519
--- /dev/null
+++ b/package/bridge-utils/0001-Include-header-for-use-of-PATH_MAX.patch
@@ -0,0 +1,63 @@
+From 19694aaf08b7ef2f2a1bd549915b133bfbcd422e Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Mon, 12 Apr 2021 09:25:16 -0500
+Subject: [PATCH] Include header for use of PATH_MAX
+
+Since a1f20223cfcf7b9eae8c9e7e7a07e7bf1377f65b in some build
+configurations PATH_MAX is undefined.
+
+Build log from Buildroot testing failure:
+http://autobuild.buildroot.net/results/3ec818e676827c03f08c264c6c7a53b025b7ba1d/build-end.log
+
+...
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/bin/arm-buildroot-linux-musleabihf-gcc -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -I/home/giuliobenetti/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-musleabihf/sysroot/usr/include  -c libbridge_misc.c
+libbridge_init.c: In function 'isbridge':
+libbridge_init.c:49:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
+   49 |  char path[PATH_MAX];
+      |            ^~~~~~~~
+      |            AF_MAX
+libbridge_init.c:49:12: note: each undeclared identifier is reported only once for each function it appears in
+libbridge_init.c:49:7: warning: unused variable 'path' [-Wunused-variable]
+   49 |  char path[PATH_MAX];
+      |       ^~~~
+make[2]: *** [Makefile:37: libbridge_init.o] Error 1
+make[2]: *** Waiting for unfinished jobs....
+libbridge_devif.c: In function 'fpopen':
+libbridge_devif.c:33:12: error: 'PATH_MAX' undeclared (first use in this function); did you mean 'AF_MAX'?
+   33 |  char path[PATH_MAX];
+      |            ^~~~~~~~
+      |            AF_MAX
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ libbridge/libbridge_devif.c | 1 +
+ libbridge/libbridge_init.c  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
+index 8b7d954..95f7769 100644
+--- a/libbridge/libbridge_devif.c
++++ b/libbridge/libbridge_devif.c
+@@ -24,6 +24,7 @@
+ #include <string.h>
+ #include <dirent.h>
+ #include <fcntl.h>
++#include <linux/limits.h>
+ 
+ #include "libbridge.h"
+ #include "libbridge_private.h"
+diff --git a/libbridge/libbridge_init.c b/libbridge/libbridge_init.c
+index c914971..645dda6 100644
+--- a/libbridge/libbridge_init.c
++++ b/libbridge/libbridge_init.c
+@@ -24,6 +24,7 @@
+ #include <dirent.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <linux/limits.h>
+ 
+ #include "libbridge.h"
+ #include "libbridge_private.h"
+-- 
+2.17.1
+
-- 
2.17.1
