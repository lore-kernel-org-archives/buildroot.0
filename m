From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 30 Mar 2008 00:06:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib12
Message-ID: <20080330070621.7FC9C3C4A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-30 00:06:12 -0700 (Sun, 30 Mar 2008)
New Revision: 21571

Log:
libglib12 cleanup

Modified:
   trunk/buildroot/package/libglib12/libglib12.mk


Changeset:
Modified: trunk/buildroot/package/libglib12/libglib12.mk
===================================================================
--- trunk/buildroot/package/libglib12/libglib12.mk	2008-03-30 06:38:46 UTC (rev 21570)
+++ trunk/buildroot/package/libglib12/libglib12.mk	2008-03-30 07:06:12 UTC (rev 21571)
@@ -13,13 +13,11 @@
 $(DL_DIR)/$(LIBGLIB12_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LIBGLIB12_SITE)/$(LIBGLIB12_SOURCE)
 
-libglib12-source: $(DL_DIR)/$(LIBGLIB12_SOURCE)
-
 $(LIBGLIB12_DIR)/.unpacked: $(DL_DIR)/$(LIBGLIB12_SOURCE)
 	$(LIBGLIB12_CAT) $(DL_DIR)/$(LIBGLIB12_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBGLIB12_DIR) package/libglib12/ \*.patch*
 	$(CONFIG_UPDATE) $(LIBGLIB12_DIR)
-	touch $(LIBGLIB12_DIR)/.unpacked
+	touch $@
 
 $(LIBGLIB12_DIR)/.configured: $(LIBGLIB12_DIR)/.unpacked
 	(cd $(LIBGLIB12_DIR); rm -rf config.cache; \
@@ -44,7 +42,7 @@
 		--enable-shared \
 		$(DISABLE_NLS) \
 	)
-	touch $(LIBGLIB12_DIR)/.configured
+	touch $@
 
 $(LIBGLIB12_DIR)/.libs/$(LIBGLIB12_BINARY): $(LIBGLIB12_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBGLIB12_DIR)
@@ -76,6 +74,10 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgmodule-1.2.so.0.0.10
 
+libglib12-source: $(DL_DIR)/$(LIBGLIB12_SOURCE)
+
+libglib12-unpacked: $(LIBGLIB12_DIR)/.unpacked
+
 libglib12: uclibc $(TARGET_DIR)/lib/libglib-1.2.so.0.0.10
 
 libglib12-clean:
