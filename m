From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 00:19:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libid3tag
Message-ID: <20070920071953.3E5E5A4558@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 00:19:52 -0700 (Thu, 20 Sep 2007)
New Revision: 19903

Log:
- cleanup and fix libid3tag (Hans-Christian Egtvedt)
- fix the make libid3tag-clean target to erase all installed files (me)


Modified:
   trunk/buildroot/package/libid3tag/libid3tag.mk


Changeset:
Modified: trunk/buildroot/package/libid3tag/libid3tag.mk
===================================================================
--- trunk/buildroot/package/libid3tag/libid3tag.mk	2007-09-19 21:31:32 UTC (rev 19902)
+++ trunk/buildroot/package/libid3tag/libid3tag.mk	2007-09-20 07:19:52 UTC (rev 19903)
@@ -6,7 +6,7 @@
 
 LIBID3TAG_VERSION:=0.15.1b
 LIBID3TAG_SOURCE:=libid3tag-$(LIBID3TAG_VERSION).tar.gz
-LIBID3TAG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad/
+LIBID3TAG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
 LIBID3TAG_DIR:=$(BUILD_DIR)/libid3tag-$(LIBID3TAG_VERSION)
 LIBID3TAG_CAT:=$(ZCAT)
 LIBID3TAG_BIN:=libid3tag.so.0.3.0
@@ -35,11 +35,10 @@
 	)
 	touch $@
 
-$(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN): $(LIBID3TAG_DIR)/.configured
+$(LIBID3TAG_DIR)/.libs/$(LIBID3TAG_BIN): $(LIBID3TAG_DIR)/.configured
 	$(MAKE) -C $(LIBID3TAG_DIR)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
 
-$(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN): $(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN)
+$(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN): $(LIBID3TAG_DIR)/.libs/$(LIBID3TAG_BIN)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libid3tag.la
 
@@ -47,18 +46,16 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libid3tag.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libid3tag.so*
 
-libid3tag: uclibc libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
+libid3tag: uclibc zlib libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
 
 libid3tag-source: $(DL_DIR)/$(LIBID3TAG_SOURCE)
 
 libid3tag-clean:
-	@if [ -d $(LIBID3TAG_DIR)/Makefile ]; then \
-		$(MAKE) -C $(LIBID3TAG_DIR) clean; \
-	fi
+	-$(MAKE) -C $(LIBID3TAG_DIR) clean
 	rm -f $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN)
-	rm -f $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
+	rm -f $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN) \
+		$(TARGET_DIR)/usr/lib/libid3tag*
 
-
 libid3tag-dirclean:
 	rm -rf $(LIBID3TAG_DIR)
 #############################################################
