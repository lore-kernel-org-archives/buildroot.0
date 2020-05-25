From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 22:04:35 +0200
Subject: [Buildroot] [git commit] package/fio: fix build on sh4
Message-ID: <20200525194748.76F5B91AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e0beffb74efd6a0a1bd4fd1e631b5a757d7c61b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6dc82572ae1369aa5c9954b6e61777766c5aa3b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...002-Makefile-fix-build-of-io_uring-on-sh4.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/fio/0002-Makefile-fix-build-of-io_uring-on-sh4.patch b/package/fio/0002-Makefile-fix-build-of-io_uring-on-sh4.patch
new file mode 100644
index 0000000000..69bda93d37
--- /dev/null
+++ b/package/fio/0002-Makefile-fix-build-of-io_uring-on-sh4.patch
@@ -0,0 +1,33 @@
+From e1985f9097f37748efdc29239eb3fb6a00b12f27 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 23 May 2020 19:07:40 +0200
+Subject: [PATCH] Makefile: fix build of io_uring on sh4
+
+SuperH compile currently fails with:
+
+/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/8.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: t/io_uring.o: in function `submitter_fn':
+/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/fio-3.19/t/io_uring.c:131: undefined reference to `arch_flags'
+/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/8.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/build/fio-3.19/t/io_uring.c:367: undefined reference to `arch_flags'
+collect2: error: ld returned 1 exit status
+
+Fix that by ensuring we have a stub arch.o with the necessary arch flags
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/axboe/fio/commit/e1985f9097f37748efdc29239eb3fb6a00b12f27]
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index f1e984f5f..e39621954 100644
+--- a/Makefile
++++ b/Makefile
+@@ -283,6 +283,7 @@ T_PIPE_ASYNC_OBJS = t/read-to-pipe-async.o
+ T_PIPE_ASYNC_PROGS = t/read-to-pipe-async
+ 
+ T_IOU_RING_OBJS = t/io_uring.o
++T_IOU_RING_OBJS += t/arch.o
+ T_IOU_RING_PROGS = t/io_uring
+ 
+ T_MEMLOCK_OBJS = t/memlock.o
