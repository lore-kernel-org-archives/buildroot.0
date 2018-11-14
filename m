From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 23:20:50 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] nfs-utils: add patch to
 fix build with glibc 2.28
Message-ID: <20181114221840.D38B383654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92012e5515e63510a70a00a379310ddfc5ae19fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:

  http://autobuild.buildroot.net/results/feb2b42028f7035f791db9cb76d07ead55d7733a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f0cf62abae4e9c4e479b015327b38d837cba9512)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Include-sys-sysmacros.h-where-appropriate.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch b/package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch
new file mode 100644
index 0000000000..a593ca3b6f
--- /dev/null
+++ b/package/nfs-utils/0006-Include-sys-sysmacros.h-where-appropriate.patch
@@ -0,0 +1,50 @@
+From e3918d70b0b4a1d0f5421318e542ec807833da3f Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 2 Nov 2018 10:45:21 +0100
+Subject: [PATCH] Include <sys/sysmacros.h> where appropriate
+
+Since glibc 2.28, the major() and minor() macros need to explicitly
+include <sys/sysmacros.h>.
+
+Patch initially contributed by
+Timothy Pearson <tpearson@raptorengineering.com>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ support/nfs/nfsexport.c | 4 ++++
+ utils/mountd/cache.c    | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/support/nfs/nfsexport.c b/support/nfs/nfsexport.c
+index afd7c90..a7cbc14 100644
+--- a/support/nfs/nfsexport.c
++++ b/support/nfs/nfsexport.c
+@@ -17,6 +17,10 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ 
++#ifdef __GLIBC__
++#include <sys/sysmacros.h>
++#endif
++
+ #include "nfslib.h"
+ #include "misc.h"
+ 
+diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
+index 179ea18..61f9b14 100644
+--- a/utils/mountd/cache.c
++++ b/utils/mountd/cache.c
+@@ -36,6 +36,10 @@
+ #include "blkid/blkid.h"
+ #endif
+ 
++#ifdef __GLIBC__
++#include <sys/sysmacros.h>
++#endif
++
+ /*
+  * Invoked by RPC service loop
+  */
+-- 
+2.14.4
+
