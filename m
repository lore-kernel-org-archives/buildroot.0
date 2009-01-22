From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 22:58:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/slang
Message-ID: <20090122225831.793CC765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 22:58:29 +0000 (Thu, 22 Jan 2009)
New Revision: 24970

Log:
Use /usr/lib for slang instead of /lib

Modified:
   trunk/buildroot/package/slang/slang.mk


Changeset:
Modified: trunk/buildroot/package/slang/slang.mk
===================================================================
--- trunk/buildroot/package/slang/slang.mk	2009-01-22 18:46:00 UTC (rev 24969)
+++ trunk/buildroot/package/slang/slang.mk	2009-01-22 22:58:29 UTC (rev 24970)
@@ -18,24 +18,24 @@
 $(SLANG_DIR)/libslang.so: $(SLANG_DIR)
 	$(MAKE1) CFLAGS="-Os -g -fPIC $(TARGET_CFLAGS)" CC=$(TARGET_CC) -C $(SLANG_DIR)
 
-$(STAGING_DIR)/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
+$(STAGING_DIR)/usr/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
 	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/usr/lib
-	cp -dpf $(SLANG_DIR)/libslang.so $(STAGING_DIR)/lib
+	cp -dpf $(SLANG_DIR)/libslang.so $(STAGING_DIR)/usr/lib
 	cp -dpf $(SLANG_DIR)/slang.h $(STAGING_DIR)/usr/include
 	cp -dpf $(SLANG_DIR)/slcurses.h $(STAGING_DIR)/usr/include
-	(cd $(STAGING_DIR)/lib; ln -fs libslang.so libslang.so.1)
+	(cd $(STAGING_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
 	touch -c $@
 
-$(TARGET_DIR)/lib/libslang.so.1: $(STAGING_DIR)/lib/libslang.so.1
-	cp -dpf $(STAGING_DIR)/lib/libslang.so* $(TARGET_DIR)/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libslang.so*
+$(TARGET_DIR)/usr/lib/libslang.so.1: $(STAGING_DIR)/usr/lib/libslang.so.1
+	cp -dpf $(STAGING_DIR)/usr/lib/libslang.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libslang.so*
 
-slang: uclibc $(STAGING_DIR)/lib/libslang.so.1 $(TARGET_DIR)/lib/libslang.so.1
+slang: uclibc $(STAGING_DIR)/usr/lib/libslang.so.1 $(TARGET_DIR)/usr/lib/libslang.so.1
 
 slang-source: $(DL_DIR)/$(SLANG_SOURCE)
 
 slang-clean:
-	rm -f $(TARGET_DIR)/lib/libslang.so* $(STAGING_DIR)/usr/lib/libslang.a \
+	rm -f $(TARGET_DIR)/usr/lib/libslang.so* $(STAGING_DIR)/usr/lib/libslang.a \
 		$(STAGING_DIR)/usr/include/slang.h \
 		$(STAGING_DIR)/usr/include/slcurses.h
 	-$(MAKE) -C $(SLANG_DIR) clean
