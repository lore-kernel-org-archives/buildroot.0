From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 15:39:47 +0100
Subject: [Buildroot] [git commit] xfsprogs: turn patches into proper Git
	patches
Message-ID: <20161218144041.AE80980F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f51f053930bdd693e63b30b8c9a81dbe85a79eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The first patch was Git formatted, but additional information at the top
made it unapplicable by Git, fix this.

The second patch was not Git formatted at all.

Since upstream uses Git, it makes sense to have Git formatted patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-do-not-do-dynamic-linking-of-libtool-libra.patch | 13 +++----------
 ...libxfs-do-not-try-to-run-the-crc32selftest.patch} | 20 +++++++++++++++-----
 ...003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch | 12 +++++-------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
index 3f79dbb..7243654 100644
--- a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -1,12 +1,4 @@
-mdrestore: do not do dynamic linking of libtool libraries
-
-This patch has been sent upstream:
-
-  http://oss.sgi.com/pipermail/xfs/2015-November/045136.html
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From a406326f724006d62085a0aeae1072b4145caa9d Mon Sep 17 00:00:00 2001
+From 0031d25e858ef6336d6b14713edf1695d74cd97a Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 25 Nov 2015 10:50:00 +0000
 Subject: [PATCH] mdrestore: do not do dynamic linking of libtool libraries
@@ -18,6 +10,7 @@ linking for libuuid only. Otherwise the build will fail like this:
 ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
 
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Sent upstream: http://oss.sgi.com/pipermail/xfs/2015-November/045136.html]
 ---
  mdrestore/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -36,5 +29,5 @@ index 5171306..1b34a0e 100644
  default: depend $(LTCOMMAND)
  
 -- 
-2.4.10
+2.7.4
 
diff --git a/package/xfsprogs/0002-no-crc32-checks.patch b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
similarity index 66%
rename from package/xfsprogs/0002-no-crc32-checks.patch
rename to package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
index 6f97092..3839713 100644
--- a/package/xfsprogs/0002-no-crc32-checks.patch
+++ b/package/xfsprogs/0002-libxfs-do-not-try-to-run-the-crc32selftest.patch
@@ -1,4 +1,7 @@
-libxfs: do not try to run the crc32selftest
+From e10089b31afab3ba86904e89c740cd7051dd5066 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 18 Dec 2016 15:37:27 +0100
+Subject: [PATCH] libxfs: do not try to run the crc32selftest
 
 Even though the crc32selftest is natively compiled (because it is to be
 executed), it fails in cross-compilation as the host may lack the
@@ -14,11 +17,15 @@ Note that there's a remaining bug-in-hiding, because the crc32 table
 generator is natively built, but with the target CFLAGS.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ libxfs/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff -durN xfsprogs-4.3.0.orig/libxfs/Makefile xfsprogs-4.3.0/libxfs/Makefile
---- xfsprogs-4.3.0.orig/libxfs/Makefile	2015-09-22 03:42:41.000000000 +0200
-+++ xfsprogs-4.3.0/libxfs/Makefile	2015-12-07 18:45:27.190082913 +0100
-@@ -105,9 +105,9 @@
+diff --git a/libxfs/Makefile b/libxfs/Makefile
+index 6499731..5a07723 100644
+--- a/libxfs/Makefile
++++ b/libxfs/Makefile
+@@ -118,9 +118,9 @@ LTLIBS = $(LIBPTHREAD) $(LIBRT)
  # don't try linking xfs_repair with a debug libxfs.
  DEBUG = -DNDEBUG
  
@@ -30,3 +37,6 @@ diff -durN xfsprogs-4.3.0.orig/libxfs/Makefile xfsprogs-4.3.0/libxfs/Makefile
  
  crc32table.h: gen_crc32table.c
  	@echo "    [CC]     gen_crc32table"
+-- 
+2.7.4
+
diff --git a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
index 6617935..4f485a0 100644
--- a/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
+++ b/package/xfsprogs/0003-xfsprogs-don-t-use-CFLAGS-with-BUILD_CC.patch
@@ -1,4 +1,4 @@
-From 5b3dd8eb1f7720c68dab032c3d89d4e3102d6347 Mon Sep 17 00:00:00 2001
+From 626f51bf3f12fe294f622900615c72e25ee144c6 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Tue, 15 Dec 2015 20:51:35 -0300
 Subject: [PATCH] xfsprogs: don't use CFLAGS with BUILD_CC
@@ -8,16 +8,14 @@ When cross-compiling CFLAGS might not be suitable for the host
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
-Status: reported http://oss.sgi.com/bugzilla/show_bug.cgi?id=1132
-
  libxfs/Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libxfs/Makefile b/libxfs/Makefile
-index ecf1921..3979077 100644
+index 5a07723..0c37d3e 100644
 --- a/libxfs/Makefile
 +++ b/libxfs/Makefile
-@@ -111,7 +111,7 @@ default: crc32selftest ltdepend $(LTLIBRARY)
+@@ -124,7 +124,7 @@ default: ltdepend $(LTLIBRARY)
  
  crc32table.h: gen_crc32table.c
  	@echo "    [CC]     gen_crc32table"
@@ -26,7 +24,7 @@ index ecf1921..3979077 100644
  	@echo "    [GENERATE] $@"
  	$(Q) ./gen_crc32table > crc32table.h
  
-@@ -122,7 +122,7 @@ crc32table.h: gen_crc32table.c
+@@ -135,7 +135,7 @@ crc32table.h: gen_crc32table.c
  # disk.
  crc32selftest: gen_crc32table.c crc32table.h crc32.c
  	@echo "    [TEST]    CRC32"
@@ -36,5 +34,5 @@ index ecf1921..3979077 100644
  
  # set up include/xfs header directory
 -- 
-2.4.10
+2.7.4
 
