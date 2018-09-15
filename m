From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 15 Sep 2018 14:58:56 +0200
Subject: [Buildroot] [PATCH] gpm: fix major() build failure due to glibc 2.28
Message-ID: <20180915125856.82310-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when major()
is used.

This commit adds a patch to directly include <sys/sysmacros.h> into
open_console.c file where major() macro is used.

Fixes:
http://autobuild.buildroot.net/results/f53/f5373a567de619375746f1dcfe312971b85bb810/
http://autobuild.buildroot.net/results/227/227a7edf9304d85645d3e7fa0f930fe2e9b6e752/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...ix-major-build-failure-due-to-glibc-.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gpm/0005-open_console.c-fix-major-build-failure-due-to-glibc-.patch

diff --git a/package/gpm/0005-open_console.c-fix-major-build-failure-due-to-glibc-.patch b/package/gpm/0005-open_console.c-fix-major-build-failure-due-to-glibc-.patch
new file mode 100644
index 0000000000..310503e332
--- /dev/null
+++ b/package/gpm/0005-open_console.c-fix-major-build-failure-due-to-glibc-.patch
@@ -0,0 +1,32 @@
+From 6463cdec7e784c3c963fae867f50c2708e21e8f7 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Sat, 15 Sep 2018 14:37:37 +0200
+Subject: [PATCH] open_console.c: fix major() build failure due to glibc 2.28
+
+glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
+and therefore <sys/sysmacros.h> must be included explicitly when
+major() is used.
+
+This commit adds a patch to directly include <sys/sysmacros.h> into
+open_console.c file where major() macro is used.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/daemon/open_console.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/daemon/open_console.c b/src/daemon/open_console.c
+index 98297c9..d7acd40 100644
+--- a/src/daemon/open_console.c
++++ b/src/daemon/open_console.c
+@@ -22,6 +22,7 @@
+ #include <fcntl.h>                  /* open and co.      */
+ #include <sys/stat.h>               /* stat()            */
+ #include <sys/ioctl.h>              /* ioctl             */
++#include <sys/sysmacros.h>
+ 
+ /* Linux specific (to be outsourced in gpm2 */
+ #include <linux/serial.h>           /* for serial console check */
+-- 
+2.17.1
+
-- 
2.17.1
