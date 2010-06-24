From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Jun 2010 17:34:01 +0200
Subject: [Buildroot] [git commit master 1/1] nbd: Bump nbd to version 2.9.15
	and remove klcc issue.
Message-ID: <20100624153556.E45168191D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6074f08b8d39bcb3ccd5abf77bc262b7b9d739ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the version of nbd to 2.9.15.
The new version avoids problems with klcc installed on the host system
and also includes two former buildroot patches:
- nbd-fix-build-with-disable-lfs.patch
- nbd-server-fix-read-eagain.patch

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                          |    2 +-
 package/nbd/nbd-fix-build-with-disable-lfs.patch |   30 ----------------------
 package/nbd/nbd-server-fix-read-eagain.patch     |   21 ---------------
 package/nbd/nbd.mk                               |    2 +-
 4 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 package/nbd/nbd-fix-build-with-disable-lfs.patch
 delete mode 100644 package/nbd/nbd-server-fix-read-eagain.patch

diff --git a/CHANGES b/CHANGES
index b001d62..fc1a7fb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,7 +15,7 @@
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
 	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
-	lmbench, lrzsz, ncurses, module-init-tools, netperf,
+	lmbench, lrzsz, ncurses, module-init-tools, nbd, netperf,
 	ntfsprogs, openssl, php, qt, sqlite, squashfs, tn5250,
 	usbutils, xkeyboard-config
 
diff --git a/package/nbd/nbd-fix-build-with-disable-lfs.patch b/package/nbd/nbd-fix-build-with-disable-lfs.patch
deleted file mode 100644
index 5b270aa..0000000
--- a/package/nbd/nbd-fix-build-with-disable-lfs.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6d452ab0247770a446cfa6dd9b8b4ddea6c8fa4b Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Sun, 22 Nov 2009 23:01:52 +0100
-Subject: [PATCH] lfs.h: fix build with --disable-lfs
-
-Running ./configure with --disable-lfs #define's NBD_LFS to 0 and
-doesn't #undef it, so the LFS check should use #if rather than #ifdef
-similar to how it is done in cliserv.h
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lfs.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/lfs.h b/lfs.h
-index 8f90f81..929ce08 100644
---- a/lfs.h
-+++ b/lfs.h
-@@ -2,7 +2,7 @@
- #define LFS_H
- 
- #include "config.h"
--#ifdef NBD_LFS
-+#if NBD_LFS
- #define _FILE_OFFSET_BITS 64
- #define _LARGEFILE_SOURCE
- #endif /* NBD_LFS */
--- 
-1.6.3.3
-
diff --git a/package/nbd/nbd-server-fix-read-eagain.patch b/package/nbd/nbd-server-fix-read-eagain.patch
deleted file mode 100644
index b1f966c..0000000
--- a/package/nbd/nbd-server-fix-read-eagain.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- nbd-2.9.11.orig/nbd-server.c
-+++ nbd-2.9.11/nbd-server.c
-@@ -304,10 +304,14 @@
- 	ssize_t res;
- 	while (len > 0) {
- 		DEBUG("*");
--		if ((res = read(f, buf, len)) <= 0)
--			err("Read failed: %m");
--		len -= res;
--		buf += res;
-+		if ((res = read(f, buf, len)) <= 0) {
-+			if(errno != EAGAIN) {
-+				err("Read failed: %m");
-+			}
-+		} else {
-+			len -= res;
-+			buf += res;
-+		}
- 	}
- }
- 
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 8bffaf8..fa8dd4f 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NBD_VERSION = 2.9.11
+NBD_VERSION = 2.9.15
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
-- 
1.7.1
