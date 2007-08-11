From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 12:01:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/newt
Message-ID: <20070811190113.8B75BA5D3F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 12:01:12 -0700 (Sat, 11 Aug 2007)
New Revision: 19434

Log:
Move newt files from /lib to /usr/lib etc.

Modified:
   trunk/buildroot/package/newt/newt.mk


Changeset:
Modified: trunk/buildroot/package/newt/newt.mk
===================================================================
--- trunk/buildroot/package/newt/newt.mk	2007-08-11 18:43:58 UTC (rev 19433)
+++ trunk/buildroot/package/newt/newt.mk	2007-08-11 19:01:12 UTC (rev 19434)
@@ -48,27 +48,27 @@
 
 $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION): $(NEWT_DIR)/.configured
 	$(MAKE) CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" CC=$(TARGET_CC) -C  $(NEWT_DIR)
-	touch -c $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION)
+	touch -c $@
 
-$(STAGING_DIR)/lib/libnewt.a: $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION)
-	cp -a $(NEWT_DIR)/libnewt.a $(STAGING_DIR)/lib;
-	cp -a $(NEWT_DIR)/newt.h $(STAGING_DIR)/include;
-	cp -a $(NEWT_DIR)/libnewt.so* $(STAGING_DIR)/lib;
-	(cd $(STAGING_DIR)/lib; ln -fs libnewt.so.$(NEWT_VERSION) libnewt.so);
-	(cd $(STAGING_DIR)/lib; ln -fs libnewt.so.$(NEWT_VERSION) libnewt.so.0.51);
-	touch -c $(STAGING_DIR)/lib/libnewt.a
+$(STAGING_DIR)/usr/lib/libnewt.a: $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION)
+	cp -a $(NEWT_DIR)/libnewt.a $(STAGING_DIR)/usr/lib/;
+	cp -a $(NEWT_DIR)/newt.h $(STAGING_DIR)/usr/include/;
+	cp -a $(NEWT_DIR)/libnewt.so* $(STAGING_DIR)/usr/lib/;
+	(cd $(STAGING_DIR)/usr/lib; ln -fs libnewt.so.$(NEWT_VERSION) libnewt.so);
+	(cd $(STAGING_DIR)/usr/lib; ln -fs libnewt.so.$(NEWT_VERSION) libnewt.so.0.51);
+	touch -c $@
 
-$(TARGET_DIR)/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/lib/libnewt.a
-	cp -a $(STAGING_DIR)/lib/libnewt.so* $(TARGET_DIR)/lib;
-	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libnewt.so*
-	touch -c $(TARGET_DIR)/lib/libnewt.so.$(NEWT_VERSION)
+$(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/usr/lib/libnewt.a
+	cp -a $(STAGING_DIR)/usr/lib/libnewt.so* $(TARGET_DIR)/usr/lib/;
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libnewt.so*
+	touch -c $@
 
-newt: uclibc slang $(TARGET_DIR)/lib/libnewt.so.$(NEWT_VERSION)
+newt: uclibc slang $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION)
 
 newt-source: $(DL_DIR)/$(NEWT_SOURCE)
 
 newt-clean:
-	rm -f $(TARGET_DIR)/lib/libnewt.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnewt.so*
 	-$(MAKE) -C $(NEWT_DIR) clean
 
 newt-dirclean: slang-dirclean
