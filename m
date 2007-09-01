From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:12:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libfloat
Message-ID: <20070901171223.81C08A65E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:12:23 -0700 (Sat, 01 Sep 2007)
New Revision: 19751

Log:
- add rule for static libfloat


Modified:
   trunk/buildroot/package/libfloat/libfloat.mk


Changeset:
Modified: trunk/buildroot/package/libfloat/libfloat.mk
===================================================================
--- trunk/buildroot/package/libfloat/libfloat.mk	2007-09-01 17:11:24 UTC (rev 19750)
+++ trunk/buildroot/package/libfloat/libfloat.mk	2007-09-01 17:12:23 UTC (rev 19751)
@@ -32,12 +32,12 @@
 	$(MAKE) -C $(LIBFLOAT_DIR) clean
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) $(DL_DIR) $(LIBFLOAT_PATCH)
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) package/libfloat/ libfloat\*.patch
-	touch $(LIBFLOAT_DIR)/.unpacked
+	touch $@
 
 $(LIBFLOAT_DIR)/libfloat.so.1: $(LIBFLOAT_DIR)/.unpacked $(TARGET_CC)
 	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_CROSS)ld -C $(LIBFLOAT_DIR)
 
-$(STAGING_DIR)/lib/libfloat.so: $(LIBFLOAT_DIR)/libfloat.so.1
+$(STAGING_DIR)/lib/libfloat.so $(STAGING_DIR)/lib/libfloat.a: $(LIBFLOAT_DIR)/libfloat.so.1
 	cp -dpf $(LIBFLOAT_DIR)/libfloat.a $(STAGING_DIR)/lib/libfloat.a
 	cp -dpf $(LIBFLOAT_DIR)/libfloat.so.1 $(STAGING_DIR)/lib/libfloat.so.1
 	(cd $(STAGING_DIR)/lib; ln -snf libfloat.so.1 libfloat.so)
@@ -47,7 +47,7 @@
 	(cd $(TARGET_DIR)/lib; ln -snf libfloat.so.1 libfloat.so)
 	(cd $(TARGET_DIR)/usr/lib; ln -snf /lib/libfloat.so libfloat.so)
 
-libfloat: $(STAGING_DIR)/lib/libfloat.so
+libfloat: gcc $(STAGING_DIR)/lib/libfloat.so
 
 libfloat-clean:
 	-$(MAKE) -C $(LIBFLOAT_DIR) clean
