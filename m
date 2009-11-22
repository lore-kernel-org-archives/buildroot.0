From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Nov 2009 23:24:14 +0100
Subject: [Buildroot] [git commit master] package/nbd: fix build with
	!BR2_LARGEFILE
Message-ID: <20091122222604.A908C777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0017d6b3b5e77fc89c531375b5bab7598ae89443
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nbd/nbd-fix-build-with-disable-lfs.patch |   30 ++++++++++++++++++++++
 package/nbd/nbd.mk                               |    1 +
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/nbd/nbd-fix-build-with-disable-lfs.patch

diff --git a/package/nbd/nbd-fix-build-with-disable-lfs.patch b/package/nbd/nbd-fix-build-with-disable-lfs.patch
new file mode 100644
index 0000000..5b270aa
--- /dev/null
+++ b/package/nbd/nbd-fix-build-with-disable-lfs.patch
@@ -0,0 +1,30 @@
+From 6d452ab0247770a446cfa6dd9b8b4ddea6c8fa4b Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sun, 22 Nov 2009 23:01:52 +0100
+Subject: [PATCH] lfs.h: fix build with --disable-lfs
+
+Running ./configure with --disable-lfs #define's NBD_LFS to 0 and
+doesn't #undef it, so the LFS check should use #if rather than #ifdef
+similar to how it is done in cliserv.h
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ lfs.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/lfs.h b/lfs.h
+index 8f90f81..929ce08 100644
+--- a/lfs.h
++++ b/lfs.h
+@@ -2,7 +2,7 @@
+ #define LFS_H
+ 
+ #include "config.h"
+-#ifdef NBD_LFS
++#if NBD_LFS
+ #define _FILE_OFFSET_BITS 64
+ #define _LARGEFILE_SOURCE
+ #endif /* NBD_LFS */
+-- 
+1.6.3.3
+
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index df8e167..bcb8677 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -39,6 +39,7 @@ $(NBD_DIR)/.configured: $(NBD_DIR)/.patched
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
+		$(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs) \
 	)
 	touch $@
 
-- 
1.6.3.3
