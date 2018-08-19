From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 14:44:00 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lynx: bump version to
 2.8.9rel.1
Message-ID: <20180819124400.455-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://lynx.invisible-island.net/current/CHANGES

Removed patch 0001, quoted from Changelog:
* when cross-compiling, trim LDFLAGS from makefile rule linking makeuctb,
  because it is a build tool, which should generally use BUILD_LDFLAGS
  (patch by Thomas Petazzoni)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-t-build-host-tools-with-target-LDFL.patch | 41 -------------------
 package/lynx/lynx.hash                        |  2 +-
 package/lynx/lynx.mk                          |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch

diff --git a/package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch b/package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch
deleted file mode 100644
index cc057cee13..0000000000
--- a/package/lynx/0001-src-chrtrans-don-t-build-host-tools-with-target-LDFL.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From bb47abe9e7996147f6b7b325f5c9b2143abf8f13 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 7 May 2018 22:00:52 +0200
-Subject: [PATCH] src/chrtrans: don't build host tools with target LDFLAGS
-
-In a cross-compilation context, the LDFLAGS variable contains linker
-flags used when building things for the target. However, the makeuctb
-tool is built for the host machine, and therefore should not use the
-same LDFLAGS as the target, which is why BUILD_LDFLAGS exist.
-
-Using LDFLAGS when building a tool for the host can cause problems
-when some flags in LDFLAGS are not supported by the host machine. For
-example, if you're linking statically lynx for the target, but the
-build machine does not support static linking:
-
-gcc -I../.. -I../../src -I../../src/chrtrans -I../../WWW/Library/Implementation -I../../     -static  -o makeuctb makeuctb.o
-/usr/bin/ld: cannot find -lc
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: submitted on the mailing list
----
- src/chrtrans/makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/chrtrans/makefile.in b/src/chrtrans/makefile.in
-index aab358f..6e0ef03 100644
---- a/src/chrtrans/makefile.in
-+++ b/src/chrtrans/makefile.in
-@@ -123,7 +123,7 @@ OBJS		= makeuctb$o
- C_SRC		= $(OBJS:$o=.c)
- 
- $(MAKEUCTB) : $(OBJS)
--	$(BUILD_CC) $(CC_OPTS) $(LDFLAGS) $(BUILD_LDFLAGS) -o $@ $(OBJS) $(INTLLIB) $(BUILD_LIBS)
-+	$(BUILD_CC) $(CC_OPTS) $(BUILD_LDFLAGS) -o $@ $(OBJS) $(INTLLIB) $(BUILD_LIBS)
- 
- makeuctb$o : $(srcdir)/UCkd.h $(srcdir)/makeuctb.c
- 
--- 
-2.14.3
-
diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
index c39475aa23..76d7614a7c 100644
--- a/package/lynx/lynx.hash
+++ b/package/lynx/lynx.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  04318a100b052d079d0018fa371aa28cfb41ab68db3a959f3b75c2170eea1bc8  lynx2.8.9dev.16.tar.bz2
+sha256  387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595  lynx2.8.9rel.1.tar.bz2
 sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index a95326a14a..735d5b317f 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LYNX_VERSION = 2.8.9dev.16
+LYNX_VERSION = 2.8.9rel.1
 LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
 LYNX_SITE = ftp://ftp.invisible-island.net/lynx/tarballs
 LYNX_LICENSE = GPL-2.0
-- 
2.18.0
