From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 10:21:01 +0200
Subject: [Buildroot] [git commit] gpm: fix major() build failure due to
 glibc 2.28
Message-ID: <20180916082148.A5A9A839EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7253fc1c3bbf935c88afcf739966fbac2a6a87c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when major()
is used.

This commit adds a patch to directly include <sys/sysmacros.h> into
open_console.c file where major() macro is used.

Patch has been taken from gpm upstream commit:
https://github.com/telmich/gpm/commit/b350aee4ea5785a75cb6ad770f6b768c506ebb70

Fixes:
http://autobuild.buildroot.net/results/f53/f5373a567de619375746f1dcfe312971b85bb810/
http://autobuild.buildroot.net/results/227/227a7edf9304d85645d3e7fa0f930fe2e9b6e752/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gpm/0005-fix-building-w-newer-glibc.patch | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/gpm/0005-fix-building-w-newer-glibc.patch b/package/gpm/0005-fix-building-w-newer-glibc.patch
new file mode 100644
index 0000000000..b451d975e0
--- /dev/null
+++ b/package/gpm/0005-fix-building-w-newer-glibc.patch
@@ -0,0 +1,32 @@
+From b350aee4ea5785a75cb6ad770f6b768c506ebb70 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Mon, 14 Mar 2016 15:39:54 -0400
+Subject: [PATCH] fix building w/newer glibc
+
+Linux C libraries are looking to disentangle sysmacros.h from the
+sys/types.h include, so make sure we pull in the header when it is
+found.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ src/daemon/open_console.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/daemon/open_console.c b/src/daemon/open_console.c
+index 4d6c0af..6dd43e6 100644
+--- a/src/daemon/open_console.c
++++ b/src/daemon/open_console.c
+@@ -24,6 +24,10 @@
+ #include <sys/types.h>              /* major()           */
+ #include <sys/ioctl.h>              /* ioctl             */
+ 
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>          /* major() w/newer glibc */
++#endif
++
+ /* Linux specific (to be outsourced in gpm2 */
+ #include <linux/serial.h>           /* for serial console check */
+ #include <asm/ioctls.h>            /* for serial console check */
+-- 
+2.17.1
+
