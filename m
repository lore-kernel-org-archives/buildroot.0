From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Dec 2006 02:36:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus berkeleydb
	gzip lzma
Message-ID: <20061221103641.EF908485A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-21 02:36:40 -0800 (Thu, 21 Dec 2006)
New Revision: 17025

Log:
- use global DISABLE_LARGEFILE


Modified:
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Modified: trunk/buildroot/package/argus/argus.mk
===================================================================
--- trunk/buildroot/package/argus/argus.mk	2006-12-21 00:43:06 UTC (rev 17024)
+++ trunk/buildroot/package/argus/argus.mk	2006-12-21 10:36:40 UTC (rev 17025)
@@ -12,11 +12,6 @@
 ARGUS_BINARY:=bin/argus
 ARGUS_TARGET_BINARY:=usr/sbin/argus
 
-ARGUS_CONFIG_OPTS:=
-ifneq ($(strip $(BR2_LARGEFILE)),y)
-ARGUS_CONFIG_OPTS += --disable-largefile
-endif
-
 ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=yes
 ifeq ($(BR2_i386),y)
 ARGUS_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
@@ -63,7 +58,7 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		$(ARGUS_CONFIG_OPTS) \
+		$(DISABLE_LARGEFILE) \
 	);
 	touch $(ARGUS_DIR)/.configured
 

Modified: trunk/buildroot/package/berkeleydb/berkeleydb.mk
===================================================================
--- trunk/buildroot/package/berkeleydb/berkeleydb.mk	2006-12-21 00:43:06 UTC (rev 17024)
+++ trunk/buildroot/package/berkeleydb/berkeleydb.mk	2006-12-21 10:36:40 UTC (rev 17025)
@@ -10,10 +10,6 @@
 DB_DIR:=$(BUILD_DIR)/db-$(DB_VER).NC
 DB_SHARLIB:=libdb-$(DB_SO_VER).so
 
-ifneq ($(BR2_LARGEFILE),y)
-DB_LARGEFILE="--disable-largefile"
-endif
-
 $(DL_DIR)/$(DB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DB_SITE)/$(DB_SOURCE)
 
@@ -48,7 +44,7 @@
 		--disable-tcl \
 		--disable-compat185 \
 		--with-pic \
-                $(DB_LARGEFILE) \
+                $(DISABLE_LARGEFILE) \
 	);
 	$(SED) 's/\.lo/.o/g' $(DB_DIR)/build_unix/Makefile
 	touch $(DB_DIR)/.configured

Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2006-12-21 00:43:06 UTC (rev 17024)
+++ trunk/buildroot/package/gzip/gzip.mk	2006-12-21 10:36:40 UTC (rev 17025)
@@ -12,10 +12,6 @@
 GZIP_BINARY:=$(GZIP_DIR)/gzip
 GZIP_TARGET_BINARY:=$(TARGET_DIR)/bin/zmore
 
-ifneq ($(BR2_LARGEFILE),y)
-GZIP_LARGEFILE="--disable-largefile"
-endif
-
 $(DL_DIR)/$(GZIP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GZIP_SITE)/$(GZIP_SOURCE)
 
@@ -44,7 +40,7 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
-		$(GZIP_LARGEFILE) \
+		$(DISABLE_LARGEFILE) \
 	);
 	touch $(GZIP_DIR)/.configured
 

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2006-12-21 00:43:06 UTC (rev 17024)
+++ trunk/buildroot/package/lzma/lzma.mk	2006-12-21 10:36:40 UTC (rev 17025)
@@ -12,9 +12,7 @@
 LZMA_CFLAGS:=$(TARGET_CFLAGS)
 ifeq ($(BR2_LARGEFILE),y)
 LZMA_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-LZMA_LARGEFILE="--enable-largefile"
 else
-LZMA_LARGEFILE="--disable-largefile"
 endif
 
 $(DL_DIR)/$(LZMA_SOURCE):
@@ -75,7 +73,7 @@
 		--includedir=$(TARGET_DIR)/include \
 		--disable-debug \
 		$(DISABLE_NLS) \
-		$(LZMA_LARGEFILE) \
+		$(DISABLE_LARGEFILE) \
 	);
 	touch $(LZMA_TARGET_DIR)/.configured;
 
