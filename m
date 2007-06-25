From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 07:53:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
Message-ID: <20070625145325.B7A91A45F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 07:53:24 -0700 (Mon, 25 Jun 2007)
New Revision: 18929

Log:
- bump version and correct installation path


Modified:
   trunk/buildroot/package/bzip2/bzip2.mk


Changeset:
Modified: trunk/buildroot/package/bzip2/bzip2.mk
===================================================================
--- trunk/buildroot/package/bzip2/bzip2.mk	2007-06-25 11:22:26 UTC (rev 18928)
+++ trunk/buildroot/package/bzip2/bzip2.mk	2007-06-25 14:53:24 UTC (rev 18929)
@@ -3,7 +3,7 @@
 # bzip2
 #
 #############################################################
-BZIP2_VER:=1.0.3
+BZIP2_VER:=1.0.4
 BZIP2_SOURCE:=bzip2-$(BZIP2_VER).tar.gz
 BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VER)
 BZIP2_DIR:=$(BUILD_DIR)/bzip2-$(BZIP2_VER)
@@ -27,23 +27,24 @@
 endif
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile
 	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile-libbz2_so
-	touch $(BZIP2_DIR)/.unpacked
+	touch $@
 
 $(STAGING_DIR)/lib/libbz2.so.$(BZIP2_VER): $(BZIP2_DIR)/.unpacked
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) -C $(BZIP2_DIR) -f Makefile-libbz2_so
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) -C $(BZIP2_DIR) libbz2.a
-	cp $(BZIP2_DIR)/bzlib.h $(STAGING_DIR)/include/
+	cp $(BZIP2_DIR)/bzlib.h $(STAGING_DIR)/usr/include/
 	cp $(BZIP2_DIR)/libbz2.so.$(BZIP2_VER) $(STAGING_DIR)/lib/
-	cp $(BZIP2_DIR)/libbz2.a $(STAGING_DIR)/lib/
-	(cd $(STAGING_DIR)/lib/; ln -snf libbz2.so.$(BZIP2_VER) libbz2.so)
-	(cd $(STAGING_DIR)/lib/; ln -snf libbz2.so.$(BZIP2_VER) libbz2.so.1.0)
+	cp $(BZIP2_DIR)/libbz2.a $(STAGING_DIR)/usr/lib/
+	(cd $(STAGING_DIR)/usr/lib/ ; ln -snf ../../lib/libbz2.so.$(BZIP2_VER) libbz2.so)
+	(cd $(STAGING_DIR)/lib ; ln -snf libbz2.so.$(BZIP2_VER) libbz2.so.1.0; \
+	 ln -snf libbz2.so.$(BZIP2_VER) libbz2.so.1)
 
 $(BZIP2_BINARY): $(STAGING_DIR)/lib/libbz2.so.$(BZIP2_VER)
 	$(TARGET_CONFIGURE_OPTS) \
 	$(MAKE) CC=$(TARGET_CC) -C $(BZIP2_DIR) bzip2 bzip2recover
-	touch -c $(BZIP2_BINARY)
+	touch -c $@
 
 $(BZIP2_TARGET_BINARY): $(BZIP2_BINARY)
 	(cd $(TARGET_DIR)/usr/bin; \
@@ -68,21 +69,25 @@
 
 $(TARGET_DIR)/usr/lib/libbz2.a: $(STAGING_DIR)/lib/libbz2.a
 	mkdir -p $(TARGET_DIR)/usr/include
-	cp $(STAGING_DIR)/include/bzlib.h $(TARGET_DIR)/usr/include/
+	cp $(STAGING_DIR)/usr/include/bzlib.h $(TARGET_DIR)/usr/include/
 	cp $(STAGING_DIR)/lib/libbz2.a $(TARGET_DIR)/usr/lib/
 	rm -f $(TARGET_DIR)/lib/libbz2.so
 	(cd $(TARGET_DIR)/usr/lib; \
 		ln -fs /usr/lib/libbz2.so.1.0 libbz2.so; \
 	)
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libbz2.so.1.0
-	touch -c $(TARGET_DIR)/usr/lib/libbz2.a
+	touch -c $@
 
 bzip2-headers: $(TARGET_DIR)/usr/lib/libbz2.a
 
 bzip2: uclibc $(BZIP2_TARGET_BINARY)
 
 bzip2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BZIP2_DIR) uninstall
+	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BZIP2_DIR) uninstall
+	rm -f $(TARGET_DIR)/usr/lib/libbz2.* $(TARGET_DIR)/lib/libbz2.* \
+		$(TARGET_DIR)/usr/include/bzlib.h \
+		$(STAGING_DIR)/usr/include/bzlib.h \
+		$(STAGING_DIR)/usr/lib/libbz2.* $(STAGING_DIR)/lib/libbz2.*
 	-$(MAKE) -C $(BZIP2_DIR) clean
 
 bzip2-dirclean:
