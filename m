From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 30 Jul 2007 03:13:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/slang
Message-ID: <20070730101351.56DB4A6079@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-30 03:13:50 -0700 (Mon, 30 Jul 2007)
New Revision: 19336

Log:
- install libslang.a into the correct dir (/usr/lib)
- remove installed stuff from the staging-dir on -clean


Modified:
   trunk/buildroot/package/slang/slang.mk


Changeset:
Modified: trunk/buildroot/package/slang/slang.mk
===================================================================
--- trunk/buildroot/package/slang/slang.mk	2007-07-30 10:06:24 UTC (rev 19335)
+++ trunk/buildroot/package/slang/slang.mk	2007-07-30 10:13:50 UTC (rev 19336)
@@ -23,7 +23,7 @@
 	$(MAKE1) CFLAGS="-Os -g $(SLANG_CFLAGS)" CC=$(TARGET_CC) -C $(SLANG_DIR)
 
 $(STAGING_DIR)/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
-	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/lib
+	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/usr/lib
 	cp -dpf $(SLANG_DIR)/libslang.so $(STAGING_DIR)/lib
 	cp -dpf $(SLANG_DIR)/slang.h $(STAGING_DIR)/usr/include
 	cp -dpf $(SLANG_DIR)/slcurses.h $(STAGING_DIR)/usr/include
@@ -33,20 +33,20 @@
 $(TARGET_DIR)/lib/libslang.so.1: $(STAGING_DIR)/lib/libslang.so.1
 	cp -dpf $(STAGING_DIR)/lib/libslang.so* $(TARGET_DIR)/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libslang.so*
-	touch -c $@
 
 slang: uclibc $(STAGING_DIR)/lib/libslang.so.1 $(TARGET_DIR)/lib/libslang.so.1
 
 slang-source: $(DL_DIR)/$(SLANG_SOURCE)
 
 slang-clean:
-	rm -f $(TARGET_DIR)/lib/libslang.so*
+	rm -f $(TARGET_DIR)/lib/libslang.so* $(STAGING_DIR)/usr/lib/libslang.a \
+		$(STAGING_DIR)/usr/include/slang.h \
+		$(STAGING_DIR)/usr/include/slcurses.h
 	-$(MAKE) -C $(SLANG_DIR) clean
 
 slang-dirclean:
 	rm -rf $(SLANG_DIR)
 
-
 #############################################################
 #
 # Toplevel Makefile options
