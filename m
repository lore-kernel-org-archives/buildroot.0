From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 00:57:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20070723075732.CCF59A6110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 00:57:31 -0700 (Mon, 23 Jul 2007)
New Revision: 19198

Log:
Update libmad configuration + cleanup

Modified:
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-07-23 07:56:00 UTC (rev 19197)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-07-23 07:57:31 UTC (rev 19198)
@@ -15,7 +15,8 @@
 
 $(LIBMAD_DIR)/.unpacked: $(DL_DIR)/$(LIBMAD_SOURCE)
 	$(LIBMAD_CAT) $(DL_DIR)/$(LIBMAD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBMAD_DIR)/.unpacked
+	$(CONFIG_UPDATE) $(LIBMAD_DIR)
+	touch $@
 
 $(LIBMAD_DIR)/.configured: $(LIBMAD_DIR)/.unpacked
 	(cd $(LIBMAD_DIR); rm -rf config.cache; \
@@ -29,11 +30,12 @@
 		--sysconfdir=/etc \
 		$(DISABLE_NLS) \
 	);
-	touch $(LIBMAD_DIR)/.configured
+	touch $@
 
 $(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
 	rm -f $@
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBMAD_DIR)
+	@touch -c $@
 
 $(STAGING_DIR)/usr/lib/libmad.so: $(LIBMAD_DIR)/libmad.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
@@ -41,6 +43,7 @@
 $(TARGET_DIR)/usr/lib/libmad.so: $(STAGING_DIR)/usr/lib/libmad.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so* $(TARGET_DIR)/usr/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libmad.so*
+	@touch -c $@
 
 $(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so
 	mkdir -p $(TARGET_DIR)/usr/include
