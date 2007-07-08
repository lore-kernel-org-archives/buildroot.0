From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 11:14:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070708181452.3E963A6AAC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 11:14:51 -0700 (Sun, 08 Jul 2007)
New Revision: 19041

Log:
- bump version and make it compile


Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-08 16:28:54 UTC (rev 19040)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-07-08 18:14:51 UTC (rev 19041)
@@ -3,28 +3,40 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VER:=1.4.13
-LIGHTTPD_SOURCE:=lighttpd-$(LIGHTTPD_VER).tar.gz
-LIGHTTPD_SITE:=http://www.lighttpd.net/download
-LIGHTTPD_DIR:=$(BUILD_DIR)/lighttpd-$(LIGHTTPD_VER)
+LIGHTTPD_VERSION:=1.4.15
+LIGHTTPD_SOURCE:=lighttpd_$(LIGHTTPD_VERSION).orig.tar.gz
+LIGHTTPD_PATCH:=lighttpd_$(LIGHTTPD_VERSION)-1.diff.gz
+LIGHTTPD_SITE:=http://ftp.debian.org/debian/pool/main/l/lighttpd
+LIGHTTPD_DIR:=$(BUILD_DIR)/lighttpd-$(LIGHTTPD_VERSION)
 LIGHTTPD_CAT:=$(ZCAT)
 LIGHTTPD_BINARY:=src/lighttpd
 LIGHTTPD_TARGET_BINARY:=usr/sbin/lighttpd
 
+ifneq ($(BR2_LARGEFILE),y)
+LIGHTTPD_LFS:=--disable-lfs
+endif
+
 $(DL_DIR)/$(LIGHTTPD_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_SOURCE)
+ifneq ($(LIGHTTPD_PATCH),)
+LIGHTTPD_PATCH_FILE:=$(DL_DIR)/$(LIGHTTPD_PATCH)
+$(LIGHTTPD_PATCH_FILE):
+	 $(WGET) -P $(DL_DIR) $(LIGHTTPD_SITE)/$(LIGHTTPD_PATCH)
+endif
+lighttpd-source: $(DL_DIR)/$(LIGHTTPD_SOURCE) $(LIGHTTPD_PATCH_FILE)
 
-lighttpd-source: $(DL_DIR)/$(LIGHTTPD_SOURCE)
-
-#############################################################
-#
-# build lighttpd for use on the target system
-#
-#############################################################
 $(LIGHTTPD_DIR)/.unpacked: $(DL_DIR)/$(LIGHTTPD_SOURCE)
 	$(LIGHTTPD_CAT) $(DL_DIR)/$(LIGHTTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIGHTTPD_DIR) package/lighttpd/ lighttpd\*.patch
-	touch  $(LIGHTTPD_DIR)/.unpacked
+ifneq ($(LIGHTTPD_PATCH),)
+	(cd $(LIGHTTPD_DIR)&&$(LIGHTTPD_CAT) $(LIGHTTPD_PATCH_FILE)|patch -p1)
+endif
+	if [ -d $(LIGHTTPD_DIR)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(LIGHTTPD_DIR) $(LIGHTTPD_DIR)/debian/patches \*.dpatch ; \
+	fi
+	$(CONFIG_UPDATE) $(@D)
+	$(SED) 's/-lfs/-largefile/g;s/_lfs/_largefile/g' $(LIGHTTPD_DIR)/configure
+	touch $@
 
 $(LIGHTTPD_DIR)/.configured: $(LIGHTTPD_DIR)/.unpacked
 	(cd $(LIGHTTPD_DIR); rm -rf config.cache; \
@@ -42,8 +54,10 @@
 		--with-openssl \
 		--without-pcre \
 		--program-prefix="" \
+		$(DISABLE_IPV6) \
+		$(DISABLE_LARGEFILE) \
 	);
-	touch  $(LIGHTTPD_DIR)/.configured
+	touch $@
 
 $(LIGHTTPD_DIR)/$(LIGHTTPD_BINARY): $(LIGHTTPD_DIR)/.configured
 	$(MAKE) -C $(LIGHTTPD_DIR)
