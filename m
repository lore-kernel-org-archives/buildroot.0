From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Jan 2019 20:39:28 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "leveldb: fix parallel build"
Message-ID: <20190129193929.27076-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit abba4e701246f69bc22ca9045e9932abfe9228e9.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/leveldb/0003-fix-parallel-build.patch | 36 ---------------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 package/leveldb/0003-fix-parallel-build.patch

diff --git a/package/leveldb/0003-fix-parallel-build.patch b/package/leveldb/0003-fix-parallel-build.patch
deleted file mode 100644
index 8aafbc2e02..0000000000
--- a/package/leveldb/0003-fix-parallel-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 293e1b08317567b2e479d24530986676ae4d2221 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 8 Oct 2018 23:08:19 +0200
-Subject: [PATCH] fix parallel build
-
-Build of leveldb sometimes fails on:
-Fatal error: can't create out-shared/db/db_bench.o: No such file or directory
-
-Fix this, by creating $(SHARED_OUTDIR) before building
-(SHARED_OUTDIR)/db/db_bench.o
-
-Fixes:
- - http://autobuild.buildroot.net/results/945bb8096c1f98f307161a6def5a9f7f25b2454a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable as upstream switched to cmake]
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index f7cc7d7..edb56a5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -386,7 +386,7 @@ $(STATIC_OUTDIR)/write_batch_test:db/write_batch_test.cc $(STATIC_LIBOBJECTS) $(
- $(STATIC_OUTDIR)/memenv_test:$(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS)
- 	$(XCRUN) $(CXX) $(LDFLAGS) $(STATIC_OUTDIR)/helpers/memenv/memenv_test.o $(STATIC_OUTDIR)/libmemenv.a $(STATIC_OUTDIR)/libleveldb.a $(TESTHARNESS) -o $@ $(LIBS)
- 
--$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
-+$(SHARED_OUTDIR)/db_bench:$(SHARED_OUTDIR) $(SHARED_OUTDIR)/db/db_bench.o $(SHARED_LIBS) $(TESTUTIL)
- 	$(XCRUN) $(CXX) $(LDFLAGS) $(CXXFLAGS) $(PLATFORM_SHARED_CFLAGS) $(SHARED_OUTDIR)/db/db_bench.o $(TESTUTIL) $(SHARED_OUTDIR)/$(SHARED_LIB3) -o $@ $(LIBS)
- 
- .PHONY: run-shared
--- 
-2.17.1
-
-- 
2.14.1
