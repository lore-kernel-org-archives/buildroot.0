From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 12:03:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgi
Message-ID: <20070716190347.65C8330063@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 12:03:46 -0700 (Mon, 16 Jul 2007)
New Revision: 19112

Log:
Cleanup of libcgi

Modified:
   trunk/buildroot/package/libcgi/libcgi.mk


Changeset:
Modified: trunk/buildroot/package/libcgi/libcgi.mk
===================================================================
--- trunk/buildroot/package/libcgi/libcgi.mk	2007-07-16 11:14:44 UTC (rev 19111)
+++ trunk/buildroot/package/libcgi/libcgi.mk	2007-07-16 19:03:46 UTC (rev 19112)
@@ -8,7 +8,8 @@
 LIBCGI_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libcgi
 LIBCGI_DIR:=$(BUILD_DIR)/libcgi-$(LIBCGI_VERSION)
 LIBCGI_LIBRARY:=src/libcgi.so
-LIBCGI_TARGET_LIBRARY:=usr/lib/libcgi.so
+LIBCGI_DESTDIR:=usr/lib
+LIBCGI_TARGET_LIBRARY=$(LIBCGI_DESTDIR)/libcgi.so
 
 $(DL_DIR)/$(LIBCGI_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBCGI_SITE)/$(LIBCGI_SOURCE)
@@ -31,7 +32,7 @@
 			--bindir=/usr/bin \
 			--sbindir=/usr/sbin \
 			--libdir=/lib \
-			--libexecdir=/usr/lib \
+			--libexecdir=/$(LIBCGI_DESTDIR) \
 			--sysconfdir=/etc \
 			--datadir=/usr/share \
 			--localstatedir=/var \
@@ -44,19 +45,19 @@
 $(LIBCGI_DIR)/$(LIBCGI_LIBRARY): $(LIBCGI_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBCGI_DIR)
 
-$(STAGING_DIR)/usr/lib/libcgi.so: $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
+$(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY): $(LIBCGI_DIR)/$(LIBCGI_LIBRARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGI_DIR) install
-	touch -c $(STAGING_DIR)/usr/lib/libcgi.so
+	touch -c $@
 
 $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY)
-	cp -dpf $(STAGING_DIR)/$(LIBCGI_TARGET_LIBRARY)* $(TARGET_DIR)/usr/lib/
+	cp -dpf $<* $(TARGET_DIR)/$(LIBCGI_DESTDIR)
 
 libcgi: uclibc $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY)
 
 libcgi-source: $(DL_DIR)/$(LIBCGI_SOURCE)
 
 libcgi-clean:
-	rm $(TARGET_DIR)/usr/lib/libcgi.so*
+	rm -f $(TARGET_DIR)/$(LIBCGI_TARGET_LIBRARY)*
 	-$(MAKE) -C $(LIBCGI_DIR) clean
 
 libcgi-dirclean:
@@ -71,4 +72,3 @@
 ifeq ($(strip $(BR2_PACKAGE_LIBCGI)),y)
 TARGETS+=libcgi
 endif
-
