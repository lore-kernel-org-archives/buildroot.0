From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 10:30:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libid3tag
Message-ID: <20070728173005.ABE05A6039@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 10:30:05 -0700 (Sat, 28 Jul 2007)
New Revision: 19304

Log:
Cleanup of libid3tag

Modified:
   trunk/buildroot/package/libid3tag/libid3tag.mk


Changeset:
Modified: trunk/buildroot/package/libid3tag/libid3tag.mk
===================================================================
--- trunk/buildroot/package/libid3tag/libid3tag.mk	2007-07-28 17:26:18 UTC (rev 19303)
+++ trunk/buildroot/package/libid3tag/libid3tag.mk	2007-07-28 17:30:05 UTC (rev 19304)
@@ -4,18 +4,22 @@
 #
 #############################################################
 
-LIBID3TAG_VERSION=0.15.1b
-LIBID3TAG_SOURCE=libid3tag-$(LIBID3TAG_VERSION).tar.gz
-LIBID3TAG_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
-LIBID3TAG_DIR=$(BUILD_DIR)/libid3tag-$(LIBID3TAG_VERSION)
+LIBID3TAG_VERSION:=0.15.1b
+LIBID3TAG_SOURCE:=libid3tag-$(LIBID3TAG_VERSION).tar.gz
+LIBID3TAG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
+LIBID3TAG_DIR:=$(BUILD_DIR)/libid3tag-$(LIBID3TAG_VERSION)
 LIBID3TAG_CAT:=$(ZCAT)
+LIBID3TAG_BIN:=libid3tag.so.0.3.0
+LIBID3TAG_TARGET_BIN:=usr/lib/$(LIBID3TAG_BIN)
 
 $(DL_DIR)/$(LIBID3TAG_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBID3TAG_SITE)/$(LIBID3TAG_SOURCE)
 
 $(LIBID3TAG_DIR)/.unpacked: $(DL_DIR)/$(LIBID3TAG_SOURCE)
 	$(LIBID3TAG_CAT) $(DL_DIR)/$(LIBID3TAG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBID3TAG_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(LIBID3TAG_DIR) package/libid3tag/ libid3tag-$(LIBID3TAG_VERSION)\*.patch\*
+	$(CONFIG_UPDATE) $(LIBID3TAG_DIR)
+	touch $@
 
 $(LIBID3TAG_DIR)/.configured: $(LIBID3TAG_DIR)/.unpacked
 	(cd $(LIBID3TAG_DIR); rm -rf config.cache; \
@@ -29,20 +33,21 @@
 		--sysconfdir=/etc \
 		$(DISABLE_NLS) \
 	);
-	touch $(LIBID3TAG_DIR)/.configured
+	touch $@
 
-$(LIBID3TAG_DIR)/libid3tag.la: $(LIBID3TAG_DIR)/.configured
-	rm -f $@
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBID3TAG_DIR)
+$(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN): $(LIBID3TAG_DIR)/.configured
+       $(MAKE) -C $(LIBID3TAG_DIR)
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
 
-$(STAGING_DIR)/usr/lib/libid3tag.so: $(LIBID3TAG_DIR)/libid3tag.la
+$(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN): $(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libid3tag.la
 
-$(TARGET_DIR)/usr/lib/libid3tag.so: $(STAGING_DIR)/usr/lib/libid3tag.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libid3tag.so* $(TARGET_DIR)/usr/lib/
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
+$(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN): $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN)
+       cp -dpf  $(STAGING_DIR)/usr/lib/libid3tag.so*  $(TARGET_DIR)/usr/lib/
+       -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
 
-libid3tag: uclibc $(TARGET_DIR)/usr/lib/libid3tag.so
+libid3tag: uclibc libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
 
 libid3tag-source: $(DL_DIR)/$(LIBID3TAG_SOURCE)
 
@@ -50,7 +55,8 @@
 	@if [ -d $(LIBID3TAG_DIR)/Makefile ] ; then \
 		$(MAKE) -C $(LIBID3TAG_DIR) clean ; \
 	fi;
-	rm -f $(STAGING_DIR)/usr/lib/libid3tag.so*
+	rm -f $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN)
+	rm -f $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
 
 
 libid3tag-dirclean:
