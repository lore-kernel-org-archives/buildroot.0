From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 30 Jul 2007 03:06:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/slang
Message-ID: <20070730100625.824E0A606F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-30 03:06:24 -0700 (Mon, 30 Jul 2007)
New Revision: 19335

Log:
- use correct dirs for the staging_dir (Cristian Ionescu-Idbohrn)


Modified:
   trunk/buildroot/package/slang/slang.mk


Changeset:
Modified: trunk/buildroot/package/slang/slang.mk
===================================================================
--- trunk/buildroot/package/slang/slang.mk	2007-07-29 17:51:32 UTC (rev 19334)
+++ trunk/buildroot/package/slang/slang.mk	2007-07-30 10:06:24 UTC (rev 19335)
@@ -21,20 +21,19 @@
 
 $(SLANG_DIR)/libslang.so: $(SLANG_DIR)
 	$(MAKE1) CFLAGS="-Os -g $(SLANG_CFLAGS)" CC=$(TARGET_CC) -C $(SLANG_DIR)
-	touch -c $(SLANG_DIR)/libslang.so;
 
 $(STAGING_DIR)/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
-	cp -a $(SLANG_DIR)/libslang.a $(STAGING_DIR)/lib;
-	cp -a $(SLANG_DIR)/libslang.so $(STAGING_DIR)/lib;
-	cp -a $(SLANG_DIR)/slang.h $(STAGING_DIR)/include;
-	cp -a $(SLANG_DIR)/slcurses.h $(STAGING_DIR)/include;
-	(cd $(STAGING_DIR)/lib; ln -fs libslang.so libslang.so.1);
-	touch -c $(STAGING_DIR)/lib/libslang.so.1
+	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/lib
+	cp -dpf $(SLANG_DIR)/libslang.so $(STAGING_DIR)/lib
+	cp -dpf $(SLANG_DIR)/slang.h $(STAGING_DIR)/usr/include
+	cp -dpf $(SLANG_DIR)/slcurses.h $(STAGING_DIR)/usr/include
+	(cd $(STAGING_DIR)/lib; ln -fs libslang.so libslang.so.1)
+	touch -c $@
 
 $(TARGET_DIR)/lib/libslang.so.1: $(STAGING_DIR)/lib/libslang.so.1
-	cp -a $(STAGING_DIR)/lib/libslang.so* $(TARGET_DIR)/lib;
+	cp -dpf $(STAGING_DIR)/lib/libslang.so* $(TARGET_DIR)/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libslang.so*
-	touch -c $(TARGET_DIR)/lib/libslang.so.1
+	touch -c $@
 
 slang: uclibc $(STAGING_DIR)/lib/libslang.so.1 $(TARGET_DIR)/lib/libslang.so.1
 
