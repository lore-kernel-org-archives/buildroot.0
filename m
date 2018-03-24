From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Mar 2018 00:43:23 +0300
Subject: [Buildroot] [PATCH] xfsprogs: fix build with older kernel headers
Message-ID: <6ade51cc420b2cf54f99a21528d1e9a50b276944.1521927803.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xfsprogs uses a local definition of struct fsxattr when the kernel
provided one in linux/fs.h is too old. The preprocessor trickery that
allows to include linux/fs.h without colliding with the local
definitions breaks when source files include linux/fs.h on their own.
Add a patch that removes these local includes.

Fixes:
http://autobuild.buildroot.net/results/3aa/3aad812582d94b76d204436d2879bfa732c34da6/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...scrub-fix-build-with-older-kernel-headers.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch

diff --git a/package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch b/package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch
new file mode 100644
index 000000000000..9e1300d0cd94
--- /dev/null
+++ b/package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch
@@ -0,0 +1,63 @@
+From 7ea1df02d0f2549b6249c8bee1f6ae02bf1251a9 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 25 Mar 2018 00:01:23 +0300
+Subject: [PATCH] xfs_scrub: fix build with older kernel headers
+
+The OVERRIDE_SYSTEM_FSXATTR macro in include/linux.h is meant to
+override the linux/fs.h kernel header provided struct fsxattr for
+kernels older than v4.7. A few source files include linux/fs.h before
+the local linux.h, making this override ineffective. Remove these header
+includes from the source files, and rely on the linux.h include alone.
+
+This fixes the following build failures:
+
+In file included from ../include/xfs.h:37:0,
+                 from disk.c:40:
+../include/xfs/linux.h:185:8: error: redefinition of 'struct fsxattr'
+ struct fsxattr {
+        ^~~~~~~
+
+In file included from ../include/xfs.h:37:0,
+                 from ../include/project.h:22,
+                 from ../include/input.h:24,
+                 from phase1.c:38:
+../include/xfs/linux.h:185:8: error: redefinition of 'struct fsxattr'
+ struct fsxattr {
+        ^~~~~~~
+
+Cc: Darrick J. Wong <darrick.wong@oracle.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://patchwork.kernel.org/patch/10306419/
+
+ scrub/disk.c   | 1 -
+ scrub/phase1.c | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/scrub/disk.c b/scrub/disk.c
+index e12175c8656c..54d7a2a77c45 100644
+--- a/scrub/disk.c
++++ b/scrub/disk.c
+@@ -28,7 +28,6 @@
+ #include <sys/ioctl.h>
+ #include <sys/statvfs.h>
+ #include <sys/vfs.h>
+-#include <linux/fs.h>
+ #ifdef HAVE_SG_IO
+ # include <scsi/sg.h>
+ #endif
+diff --git a/scrub/phase1.c b/scrub/phase1.c
+index 6cd544233c94..d15689e1b544 100644
+--- a/scrub/phase1.c
++++ b/scrub/phase1.c
+@@ -32,7 +32,6 @@
+ #include <stdbool.h>
+ #include <pthread.h>
+ #include <errno.h>
+-#include <linux/fs.h>
+ #include "libfrog.h"
+ #include "workqueue.h"
+ #include "input.h"
+-- 
+2.16.2
+
-- 
2.16.2
