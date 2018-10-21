From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 14:52:37 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] leveldb: fix parallel
 build
Message-ID: <20181021125103.4765A8820F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac7b4c7e1044154e3e45f040bd32d81925f70775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Build of leveldb sometimes fails on:
Fatal error: can't create out-shared/db/db_bench.o: No such file or directory

Patch is not upstreamable as upstream switched to cmake

Fixes:
 - http://autobuild.buildroot.net/results/945bb8096c1f98f307161a6def5a9f7f25b2454a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit abba4e701246f69bc22ca9045e9932abfe9228e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leveldb/0003-fix-parallel-build.patch | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/leveldb/0003-fix-parallel-build.patch b/package/leveldb/0003-fix-parallel-build.patch
new file mode 100644
index 0000000000..8aafbc2e02
--- /dev/null
+++ b/package/leveldb/0003-fix-parallel-build.patch
@@ -0,0 +1,36 @@
+From 293e1b08317567b2e479d24530986676ae4d2221 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 8 Oct 2018 23:08:19 +0200
+Subject: [PATCH] fix parallel build
+
+Build of leveldb sometimes fails on:
+Fatal error: can't create out-shared/db/db_bench.o: No such file or directory
+
+Fix this, by creating $(SHARED_OUTDIR) before building
+(SHARED_OUTDIR)/db/db_bench.o
+
+Fixes:
+ - http://autobuild.buildroot.net/results/945bb8096c1f98f307161a6def5a9f7f25b2454a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable as upstream switched to cmake]
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f7cc7d7..edb56a5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -386,7 +386,7 @@ $(STATIC_OUTDIR)/write_batch_test:db/write_batch_test.cc $(STATIC_LIBOBJECTS) $(
+ $(STATIC_OUTDIR)/memenv_test:$(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS)
+ 	$(XCRUN) $(CXX) $(LDFLAGS) $(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS) -o $@ $(LIBS)
+ 
+-$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
++$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR) $(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
+ 	$(XCRUN) $(CXX) $(LDFLAGS) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(SHARED_OUTDIR)/db/db_bench.o $(TESTUTIL) $(SHARED_OUTDIR)/$(SHARED_LIB3) -o $@ $(LIBS)
+ 
+ .PHONY: run-shared
+-- 
+2.17.1
+
