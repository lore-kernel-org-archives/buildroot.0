From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:47:59 -0300
Subject: [Buildroot] [PATCH 10/20] nbd: bump to version 3.0
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd-fix-non-lfs.patch         |   37 -----------------------------
 package/nbd/nbd-server-susv3-legacy.patch |   11 --------
 package/nbd/nbd.mk                        |    5 +++-
 3 files changed, 4 insertions(+), 49 deletions(-)
 delete mode 100644 package/nbd/nbd-fix-non-lfs.patch
 delete mode 100644 package/nbd/nbd-server-susv3-legacy.patch

diff --git a/package/nbd/nbd-fix-non-lfs.patch b/package/nbd/nbd-fix-non-lfs.patch
deleted file mode 100644
index 41a80cd..0000000
--- a/package/nbd/nbd-fix-non-lfs.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8dd182693e9995bc1aeb907f9fd4ec06c18fc56f Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Mon, 5 Dec 2011 23:27:30 +0100
-Subject: [PATCH] lfs.h: fix !LFS builds
-
-Commit 448637fba4 (Fix 32/64 bit confusion) broke !LFS builds as it
-added the PARAM_OFFT defines inside the wrong conditional.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lfs.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lfs.h b/lfs.h
-index 64a03de..68d3b81 100644
---- a/lfs.h
-+++ b/lfs.h
-@@ -6,14 +6,14 @@
- #define _FILE_OFFSET_BITS 64
- #ifndef _LARGEFILE_SOURCE
- #define _LARGEFILE_SOURCE
-+#endif
- #define PARAM_OFFT PARAM_INT64
- #else
- #define PARAM_OFFT PARAM_INT
--#endif
-+#endif /* NBD_LFS */
- #ifdef HAVE_SYNC_FILE_RANGE
- #define USE_SYNC_FILE_RANGE
- #define _GNU_SOURCE
- #endif /* HAVE_SYNC_FILE_RANGE */
--#endif /* NBD_LFS */
- 
- #endif /* LFS_H */
--- 
-1.7.7.1
-
diff --git a/package/nbd/nbd-server-susv3-legacy.patch b/package/nbd/nbd-server-susv3-legacy.patch
deleted file mode 100644
index 58d38e1..0000000
--- a/package/nbd/nbd-server-susv3-legacy.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- nbd-2.9.11/nbd-server.c	2009-10-01 16:10:15.000000000 +0200
-+++ nbd-2.9.11/nbd-server.c	2009-10-01 16:10:32.000000000 +0200
-@@ -264,7 +264,7 @@
-   
-   	inet_aton(opts->clientname, &client);
- 	while (fgets(line,LINELEN,f)!=NULL) {
--		if((tmp=index(line, '/'))) {
-+		if((tmp=strchr(line, '/'))) {
- 			if(strlen(line)<=tmp-line) {
- 				msg4(LOG_CRIT, ERRMSG, line, opts->server->authname);
- 				return 0;
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index d9d0a85..21071fa 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,11 +4,14 @@
 #
 #############################################################
 
-NBD_VERSION = 2.9.24
+NBD_VERSION = 3.0
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.bz2
 NBD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
 NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
+# We have linux/falloc.h
+# but uClibc lacks fallocate(2) which is a glibc-ism
+NBD_CONF_ENV = ac_cv_header_linux_falloc_h=no
 
 ifneq ($(BR2_NBD_CLIENT),y)
 	NBD_TOREMOVE += nbd-client
-- 
1.7.3.4
