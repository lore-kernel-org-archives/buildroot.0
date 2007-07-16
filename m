From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 02:32:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgi
Message-ID: <20070716093209.2D478A6ABC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 02:32:07 -0700 (Mon, 16 Jul 2007)
New Revision: 19107

Log:
Stop repeated build of libcgi

Modified:
   trunk/buildroot/package/libcgi/libcgi.mk


Changeset:
Modified: trunk/buildroot/package/libcgi/libcgi.mk
===================================================================
--- trunk/buildroot/package/libcgi/libcgi.mk	2007-07-16 08:12:15 UTC (rev 19106)
+++ trunk/buildroot/package/libcgi/libcgi.mk	2007-07-16 09:32:07 UTC (rev 19107)
@@ -7,8 +7,8 @@
 LIBCGI_SOURCE:=libcgi-$(LIBCGI_VERSION).tar.gz
 LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
 LIBCGI_DIR:=$(BUILD_DIR)/libcgi-$(LIBCGI_VERSION)
-LIBCGI_LIBRARY:=libcgi
-LIBCGI_TARGET_LIBRARY:=usr/bin/libcgi
+LIBCGI_LIBRARY:=src/libcgi.so
+LIBCGI_TARGET_LIBRARY:=usr/lib/libcgi.so
 
 $(DL_DIR)/$(LIBCGI_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBCGI_SITE)/$(LIBCGI_SOURCE)
@@ -44,12 +44,12 @@
 $(LIBCGI_DIR)/$(LIBCGI_LIBRARY): $(LIBCGI_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBCGI_DIR)
 
-$(STAGING_DIR)/lib/libcgi.so: $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
+$(STAGING_DIR)/usr/lib/libcgi.so: $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGI_DIR) install
-	touch -c $(STAGING_DIR)/lib/libcgi.so
+	touch -c $(STAGING_DIR)/usr/lib/libcgi.so
 
-$(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY): $(STAGING_DIR)/lib/libcgi.so
-	cp -dpf $(STAGING_DIR)/lib/libcgi.so* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY)
+	cp -dpf $(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY)* $(TARGET_DIR)/usr/lib/
 
 libcgi: uclibc $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY)
 
@@ -62,6 +62,7 @@
 libcgi-dirclean:
 	rm -rf $(LIBCGI_DIR)
 
+.PHONY:	libcgi
 #############################################################
 #
 # Toplevel Makefile options
