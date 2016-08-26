From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:59:54 +0200
Subject: [Buildroot] [git commit branch/next] blktrace: re-enable on uClibc
Message-ID: <20160826140036.0177A7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8972c398ff8b6b3550735c9e15fd61cdc7297049
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With a small patch, blktrace can work on uClibc: we simply need to link
with librt to use the posix_spawn*() functions.

[Thomas: add reference to upstream commit.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../blktrace/0001-iowatcher-link-with-lrt.patch    | 31 ++++++++++++++++++++++
 package/blktrace/Config.in                         |  5 ----
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/package/blktrace/0001-iowatcher-link-with-lrt.patch b/package/blktrace/0001-iowatcher-link-with-lrt.patch
new file mode 100644
index 0000000..689a678
--- /dev/null
+++ b/package/blktrace/0001-iowatcher-link-with-lrt.patch
@@ -0,0 +1,31 @@
+From 80d87b99d72034441ea4fbab81f5c80c1ef3b067 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 23 Aug 2016 16:36:14 +0200
+Subject: [PATCH] iowatcher: link with -lrt
+
+Some C libraries (notably uClibc) have the posix_spawn*() functions in
+librt, so let's link iowatcher with -lrt.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Upstream-status: merged
+ (http://git.kernel.org/cgit/linux/kernel/git/axboe/blktrace.git/commit/?id=d1ab783430f5a832e973ed9a293da146c04c6702)
+---
+ iowatcher/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iowatcher/Makefile b/iowatcher/Makefile
+index 7b5101c..502476d 100644
+--- a/iowatcher/Makefile
++++ b/iowatcher/Makefile
+@@ -19,7 +19,7 @@ all: $(ALL)
+ 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
+ 
+ iowatcher: blkparse.o plot.o main.o tracers.o mpstat.o fio.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm -lrt
+ 
+ depend:
+ 	@$(CC) -MM $(ALL_CFLAGS) *.c 1> .depend
+-- 
+2.7.4
+
diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index 958f004..38c0947 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
-	# Uses posix_spawn()
-	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBAIO
 	help
@@ -10,6 +8,3 @@ config BR2_PACKAGE_BLKTRACE
 	  up to user space.
 
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
-
-comment "blktrace needs a glibc or musl toolchain"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
