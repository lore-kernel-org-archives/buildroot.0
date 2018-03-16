From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Mar 2018 08:31:20 +0200
Subject: [Buildroot] [PATCH] xfsprogs: fix build with musl
Message-ID: <3dfc3abd899ffac0abac2c6ec55ee158a291dbce.1521181880.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add two patches to fix missing header files that trigger build failure
with musl libc.

Fixes:
http://autobuild.buildroot.net/results/a39/a3989394aba0bd3a52146e2a5e6b87b586efb6c6/
http://autobuild.buildroot.net/results/b3b/b3b3c06ea565125bf9f9ad2ebc16bb21f6c7228f/
http://autobuild.buildroot.net/results/223/2238475d2c21c65960a56f86a08fe35d1021080f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...003-workqueue-add-missing-pthreads-header.patch | 41 ++++++++++++++++++++++
 .../0004-xfs_scrub-add-missing-paths-header.patch  | 37 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch
 create mode 100644 package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch

diff --git a/package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch b/package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch
new file mode 100644
index 000000000000..e19261f0339d
--- /dev/null
+++ b/package/xfsprogs/0003-workqueue-add-missing-pthreads-header.patch
@@ -0,0 +1,41 @@
+From c05fc32d43b3870b63539c57428e1c52e3e7c3cd Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 16 Mar 2018 07:14:56 +0200
+Subject: [PATCH] workqueue: add missing pthreads header
+
+Fix the following build failure with musl libc:
+
+In file included from read_verify.c:25:0:
+../include/workqueue.h:39:2: error: unknown type name 'pthread_t'
+  pthread_t  *threads;
+  ^~~~~~~~~
+../include/workqueue.h:42:2: error: unknown type name 'pthread_mutex_t'
+  pthread_mutex_t  lock;
+  ^~~~~~~~~~~~~~~
+../include/workqueue.h:43:2: error: unknown type name 'pthread_cond_t'
+  pthread_cond_t  wakeup;
+  ^~~~~~~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://marc.info/?l=linux-xfs&m=152117771313565&w=2
+
+ include/workqueue.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/workqueue.h b/include/workqueue.h
+index b4b3541701df..edb2f8ac5991 100644
+--- a/include/workqueue.h
++++ b/include/workqueue.h
+@@ -22,6 +22,8 @@
+ #ifndef	_WORKQUEUE_H_
+ #define	_WORKQUEUE_H_
+ 
++#include <pthread.h>
++
+ struct workqueue;
+ 
+ typedef void workqueue_func_t(struct workqueue *wq, uint32_t index, void *arg);
+-- 
+2.16.2
+
diff --git a/package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch b/package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch
new file mode 100644
index 000000000000..7695cf35a7f0
--- /dev/null
+++ b/package/xfsprogs/0004-xfs_scrub-add-missing-paths-header.patch
@@ -0,0 +1,37 @@
+From 27747dcbfbde8a767b1a873716fce1d3aaf17c2f Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Fri, 16 Mar 2018 07:16:19 +0200
+Subject: [PATCH] xfs_scrub: add missing paths header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix the following build failure with musl libc:
+
+xfs_scrub.c: In function ?main?:
+xfs_scrub.c:670:11: error: ?_PATH_MOUNTED? undeclared (first use in this function)
+    mtab = _PATH_MOUNTED;
+           ^~~~~~~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://marc.info/?l=linux-xfs&m=152117771313566&w=2
+
+ scrub/xfs_scrub.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/scrub/xfs_scrub.c b/scrub/xfs_scrub.c
+index ab26e6335948..eedbe34ec7b3 100644
+--- a/scrub/xfs_scrub.c
++++ b/scrub/xfs_scrub.c
+@@ -21,6 +21,7 @@
+ #include <pthread.h>
+ #include <stdbool.h>
+ #include <stdlib.h>
++#include <paths.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
+ #include <sys/statvfs.h>
+-- 
+2.16.2
+
-- 
2.16.2
