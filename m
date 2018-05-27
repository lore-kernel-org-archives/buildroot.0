From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 19:31:07 +0200
Subject: [Buildroot] [git commit] xfsprogs: bump to 4.16.1
Message-ID: <20180527180417.93E97826A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4da86cd4be7606015d0bb9bb2540ca62b2630369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Resolves build failures like:
http://autobuild.buildroot.net/results/953/95307f0f56c7ead1bd1f0ab0049aeb8b30fdc11c/

libunistring to libicu conversion required modifications to
0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch and
the libicu usage doesn't require the
0005-xfs_scrub-fix-cross-compile-with-libunistring.patch patch. I
verified that the configuration time setup of the LIBICU library
works correctly and doesn't require us to remove it.

Upstream has reworked/included the following:
0003-workqueue-add-missing-pthreads-header.patch
0004-xfs_scrub-add-missing-paths-header.patch
0006-xfs_scrub-fix-build-with-older-kernel-headers.patch

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...o-not-do-dynamic-linking-of-libtool-libra.patch |  6 ++-
 ...003-workqueue-add-missing-pthreads-header.patch | 41 --------------
 .../0004-xfs_scrub-add-missing-paths-header.patch  | 37 -------------
 ...scrub-fix-cross-compile-with-libunistring.patch | 37 -------------
 ...scrub-fix-build-with-older-kernel-headers.patch | 63 ----------------------
 package/xfsprogs/xfsprogs.hash                     |  2 +-
 package/xfsprogs/xfsprogs.mk                       |  9 ++--
 7 files changed, 11 insertions(+), 184 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
index 74636c2ebb..9030a2aac3 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -14,6 +14,8 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Sent upstream: https://www.spinics.net/lists/xfs/msg36149.html]
 [baruch: update for v4.15.1; extend to include scrub]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[matt: update for v4.16.1; adjusted libunistring -> libicu]
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 ---
  mdrestore/Makefile | 2 +-
  scrub/Makefile     | 2 +-
@@ -38,8 +40,8 @@ index 063279400262..949f6fd8ba94 100644
 +++ b/scrub/Makefile
 @@ -70,7 +70,7 @@ xfs_scrub.c
  
- LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
- LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
+ LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBICU_LIBS) $(LIBRT)
+ LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG)
 -LLDFLAGS = -static
 +LLDFLAGS = -static-libtool-libs
  
diff --git a/package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch b/package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch
deleted file mode 100644
index e19261f033..0000000000
--- a/package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c05fc32d43b3870b63539c57428e1c52e3e7c3cd Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 16 Mar 2018 07:14:56 +0200
-Subject: [PATCH] workqueue: add missing pthreads header
-
-Fix the following build failure with musl libc:
-
-In file included from read_verify.c:25:0:
-../include/workqueue.h:39:2: error: unknown type name 'pthread_t'
-  pthread_t  *threads;
-  ^~~~~~~~~
-../include/workqueue.h:42:2: error: unknown type name 'pthread_mutex_t'
-  pthread_mutex_t  lock;
-  ^~~~~~~~~~~~~~~
-../include/workqueue.h:43:2: error: unknown type name 'pthread_cond_t'
-  pthread_cond_t  wakeup;
-  ^~~~~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://marc.info/?l=linux-xfs&m=152117771313565&w=2
-
- include/workqueue.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/workqueue.h b/include/workqueue.h
-index b4b3541701df..edb2f8ac5991 100644
---- a/include/workqueue.h
-+++ b/include/workqueue.h
-@@ -22,6 +22,8 @@
- #ifndef	_WORKQUEUE_H_
- #define	_WORKQUEUE_H_
- 
-+#include <pthread.h>
-+
- struct workqueue;
- 
- typedef void workqueue_func_t(struct workqueue *wq, uint32_t index, void *arg);
--- 
-2.16.2
-
diff --git a/package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch b/package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch
deleted file mode 100644
index 7695cf35a7..0000000000
--- a/package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 27747dcbfbde8a767b1a873716fce1d3aaf17c2f Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 16 Mar 2018 07:16:19 +0200
-Subject: [PATCH] xfs_scrub: add missing paths header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix the following build failure with musl libc:
-
-xfs_scrub.c: In function ???main???:
-xfs_scrub.c:670:11: error: ???_PATH_MOUNTED??? undeclared (first use in this function)
-    mtab = _PATH_MOUNTED;
-           ^~~~~~~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://marc.info/?l=linux-xfs&m=152117771313566&w=2
-
- scrub/xfs_scrub.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/scrub/xfs_scrub.c b/scrub/xfs_scrub.c
-index ab26e6335948..eedbe34ec7b3 100644
---- a/scrub/xfs_scrub.c
-+++ b/scrub/xfs_scrub.c
-@@ -21,6 +21,7 @@
- #include <pthread.h>
- #include <stdbool.h>
- #include <stdlib.h>
-+#include <paths.h>
- #include <sys/time.h>
- #include <sys/resource.h>
- #include <sys/statvfs.h>
--- 
-2.16.2
-
diff --git a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch b/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
deleted file mode 100644
index dfb66c6630..0000000000
--- a/package/xfsprogs/0005-xfs_scrub-fix-cross-compile-with-libunistring.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 45d9ba0f01cceb75f72d157a9e4d9aaeb753a9c4 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 20 Mar 2018 14:13:28 +0200
-Subject: [PATCH] xfs_scrub: fix cross compile with libunistring
-
-Commit 4bbed4ecc2a (xfs_scrub: warn about normalized Unicode name collisions)
-added -lunistring to the list of the xfs_scrub dependencies. When cross
-compiling make fails to find the library on the target sysroot:
-
-make[3]: *** No rule to make target `-lunistring', needed by `xfs_scrub'.  Stop.
-
-Remove -lunistring from make dependencies of xfs_scrub to fix that.
-
-Cc: Darrick J. Wong <darrick.wong@oracle.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://patchwork.kernel.org/patch/10296957/
-
- scrub/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scrub/Makefile b/scrub/Makefile
-index 949f6fd8ba94..979603f524ff 100644
---- a/scrub/Makefile
-+++ b/scrub/Makefile
-@@ -69,7 +69,7 @@ vfs.c \
- xfs_scrub.c
- 
- LLDLIBS += $(LIBHANDLE) $(LIBFROG) $(LIBPTHREAD) $(LIBUNISTRING) $(LIBRT)
--LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBUNISTRING) $(LIBRT)
-+LTDEPENDENCIES += $(LIBHANDLE) $(LIBFROG) $(LIBRT)
- LLDFLAGS = -static-libtool-libs
- 
- ifeq ($(HAVE_MALLINFO),yes)
--- 
-2.16.2
-
diff --git a/package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch b/package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch
deleted file mode 100644
index 9e1300d0cd..0000000000
--- a/package/xfsprogs/0006-xfs_scrub-fix-build-with-older-kernel-headers.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 7ea1df02d0f2549b6249c8bee1f6ae02bf1251a9 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 25 Mar 2018 00:01:23 +0300
-Subject: [PATCH] xfs_scrub: fix build with older kernel headers
-
-The OVERRIDE_SYSTEM_FSXATTR macro in include/linux.h is meant to
-override the linux/fs.h kernel header provided struct fsxattr for
-kernels older than v4.7. A few source files include linux/fs.h before
-the local linux.h, making this override ineffective. Remove these header
-includes from the source files, and rely on the linux.h include alone.
-
-This fixes the following build failures:
-
-In file included from ../include/xfs.h:37:0,
-                 from disk.c:40:
-../include/xfs/linux.h:185:8: error: redefinition of 'struct fsxattr'
- struct fsxattr {
-        ^~~~~~~
-
-In file included from ../include/xfs.h:37:0,
-                 from ../include/project.h:22,
-                 from ../include/input.h:24,
-                 from phase1.c:38:
-../include/xfs/linux.h:185:8: error: redefinition of 'struct fsxattr'
- struct fsxattr {
-        ^~~~~~~
-
-Cc: Darrick J. Wong <darrick.wong@oracle.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://patchwork.kernel.org/patch/10306419/
-
- scrub/disk.c   | 1 -
- scrub/phase1.c | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/scrub/disk.c b/scrub/disk.c
-index e12175c8656c..54d7a2a77c45 100644
---- a/scrub/disk.c
-+++ b/scrub/disk.c
-@@ -28,7 +28,6 @@
- #include <sys/ioctl.h>
- #include <sys/statvfs.h>
- #include <sys/vfs.h>
--#include <linux/fs.h>
- #ifdef HAVE_SG_IO
- # include <scsi/sg.h>
- #endif
-diff --git a/scrub/phase1.c b/scrub/phase1.c
-index 6cd544233c94..d15689e1b544 100644
---- a/scrub/phase1.c
-+++ b/scrub/phase1.c
-@@ -32,7 +32,6 @@
- #include <stdbool.h>
- #include <pthread.h>
- #include <errno.h>
--#include <linux/fs.h>
- #include "libfrog.h"
- #include "workqueue.h"
- #include "input.h"
--- 
-2.16.2
-
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index c58dbb0766..4df2e8d9e4 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,3 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256 27c36de9346a274143ad06c65b2fdbafd2806f3f37fa2c1235a08ed920d2bf3c  xfsprogs-4.15.1.tar.xz
+sha256 3d5c2da46112b86cbd967fee43cea731d38a1b2aaf601b57674ed34e808652df  xfsprogs-4.16.1.tar.xz
 sha256 ee304b1b1da08b261f1d1f31d229fc70d2d0c552c7429e9e84c0fac878d94209  doc/COPYING
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index dffcc28ab7..814e0cf218 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.15.1
+XFSPROGS_VERSION = 4.16.1
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
@@ -20,8 +20,11 @@ XFSPROGS_CONF_OPTS = \
 	INSTALL_GROUP=root \
 	--enable-static
 
-ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
-XFSPROGS_DEPENDENCIES += libunistring
+ifeq ($(BR2_PACKAGE_ICU),y)
+XFSPROGS_DEPENDENCIES += icu
+XFSPROGS_CONF_OPTS += --enable-libicu
+else
+XFSPROGS_CONF_OPTS += --disable-libicu
 endif
 
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
