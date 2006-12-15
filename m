From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 07:19:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20061215151947.9772D485A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 07:19:46 -0800 (Fri, 15 Dec 2006)
New Revision: 16948

Log:
- bump version, mv the libmagic.a to the staging dir and peruse one sourcedir
  for both host and target build. Thanks to Ulrich Hecht.


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2006-12-15 15:15:35 UTC (rev 16947)
+++ trunk/buildroot/package/file/file.mk	2006-12-15 15:19:46 UTC (rev 16948)
@@ -3,11 +3,12 @@
 # file
 #
 #############################################################
-FILE_VER:=4.17
+FILE_VER:=4.19
 FILE_SOURCE:=file-$(FILE_VER).tar.gz
 FILE_SITE:=ftp://ftp.astron.com/pub/file
-FILE_DIR1:=$(TOOL_BUILD_DIR)/file-$(FILE_VER)
-FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VER)
+FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VER)
+FILE_DIR1:=$(TOOL_BUILD_DIR)/file-$(FILE_VER)-host
+FILE_DIR2:=$(BUILD_DIR)/file-$(FILE_VER)-target
 FILE_CAT:=$(ZCAT)
 FILE_BINARY:=src/file
 FILE_TARGET_BINARY:=usr/bin/file
@@ -23,13 +24,11 @@
 # build file for use on the host system
 #
 #############################################################
-$(FILE_DIR1)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
-	$(FILE_CAT) $(DL_DIR)/$(FILE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(FILE_DIR1)/.unpacked
-
-$(FILE_DIR1)/.configured: $(FILE_DIR1)/.unpacked
+$(FILE_DIR1)/.configured: $(FILE_SOURCE_DIR)/.unpacked
+	mkdir -p $(FILE_DIR1)
 	(cd $(FILE_DIR1); rm -rf config.cache; \
-		./configure \
+		CC="$(HOSTCC)" \
+		$(FILE_SOURCE_DIR)/configure \
 		--prefix=$(FILE_DIR1)/install \
 	);
 	touch $(FILE_DIR1)/.configured
@@ -51,17 +50,18 @@
 # build file for use on the target system
 #
 #############################################################
-file-unpacked: $(FILE_DIR2)/.unpacked
-$(FILE_DIR2)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
+file-unpacked: $(FILE_SOURCE_DIR)/.unpacked
+$(FILE_SOURCE_DIR)/.unpacked: $(DL_DIR)/$(FILE_SOURCE)
 	$(FILE_CAT) $(DL_DIR)/$(FILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FILE_DIR2) package/file/ file\*.patch
-	touch $(FILE_DIR2)/.unpacked
+	toolchain/patch-kernel.sh $(FILE_SOURCE_DIR) package/file/ file\*.patch
+	touch $(FILE_SOURCE_DIR)/.unpacked
 
-$(FILE_DIR2)/.configured: $(FILE_DIR2)/.unpacked
+$(FILE_DIR2)/.configured: $(FILE_SOURCE_DIR)/.unpacked
+	mkdir -p $(FILE_DIR2)
 	(cd $(FILE_DIR2); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		./configure \
+		$(FILE_SOURCE_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -90,6 +90,9 @@
 	-($(STRIP) $(TARGET_DIR)/usr/lib/libmagic.so.*.* > /dev/null 2>&1)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	mv $(TARGET_DIR)/usr/lib/libmagic.a $(STAGING_DIR)/lib
+	rm -f $(TARGET_DIR)/usr/lib/libmagic.la
+	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/include
 
 file: zlib uclibc $(TARGET_DIR)/$(FILE_TARGET_BINARY)
 
