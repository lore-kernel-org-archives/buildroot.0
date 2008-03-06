From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:56:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
Message-ID: <20080306175611.EB4541201CA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:56:10 -0800 (Thu, 06 Mar 2008)
New Revision: 21184

Log:
makefile cleanup for bzip2

Modified:
   trunk/buildroot/package/bzip2/bzip2.mk


Changeset:
Modified: trunk/buildroot/package/bzip2/bzip2.mk
===================================================================
--- trunk/buildroot/package/bzip2/bzip2.mk	2008-03-06 17:55:51 UTC (rev 21183)
+++ trunk/buildroot/package/bzip2/bzip2.mk	2008-03-06 17:56:10 UTC (rev 21184)
@@ -29,7 +29,7 @@
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile-libbz2_so
 	touch $@
 
-$(STAGING_DIR)/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked
+$(STAGING_DIR)/usr/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) \
 		-C $(BZIP2_DIR) -f Makefile-libbz2_so
@@ -37,17 +37,17 @@
 	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) \
 		-C $(BZIP2_DIR) libbz2.a
 	cp $(BZIP2_DIR)/bzlib.h $(STAGING_DIR)/usr/include/
-	cp $(BZIP2_DIR)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/lib/
+	cp $(BZIP2_DIR)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
 	cp $(BZIP2_DIR)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
 		ln -snf ../../lib/libbz2.so.$(BZIP2_VERSION) libbz2.so; \
 	)
-	(cd $(STAGING_DIR)/lib; \
+	(cd $(STAGING_DIR)/usr/lib; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
 	)
 
-$(BZIP2_BINARY): $(STAGING_DIR)/lib/libbz2.so.$(BZIP2_VERSION)
+$(BZIP2_BINARY): $(STAGING_DIR)/usr/lib/libbz2.so.$(BZIP2_VERSION)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) CC=$(TARGET_CC) -C $(BZIP2_DIR) bzip2 bzip2recover
 	touch -c $@
@@ -83,10 +83,10 @@
 	rm -rf $(TARGET_DIR)/share/locale
 	rm -rf $(TARGET_DIR)/usr/share/doc
 
-$(TARGET_DIR)/usr/lib/libbz2.a: $(STAGING_DIR)/lib/libbz2.a
+$(TARGET_DIR)/usr/lib/libbz2.a: $(STAGING_DIR)/usr/lib/libbz2.a
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp $(STAGING_DIR)/usr/include/bzlib.h $(TARGET_DIR)/usr/include/
-	cp $(STAGING_DIR)/lib/libbz2.a $(TARGET_DIR)/usr/lib/
+	cp $(STAGING_DIR)/usr/lib/libbz2.a $(TARGET_DIR)/usr/lib/
 	rm -f $(TARGET_DIR)/lib/libbz2.so
 	(cd $(TARGET_DIR)/usr/lib; \
 		ln -fs /usr/lib/libbz2.so.1.0 libbz2.so; \
