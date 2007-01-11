From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 23:36:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20070111073601.0A4A64857F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 23:35:59 -0800 (Wed, 10 Jan 2007)
New Revision: 17244

Log:
fix build deps


Modified:
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2007-01-11 07:27:37 UTC (rev 17243)
+++ trunk/buildroot/package/cairo/cairo.mk	2007-01-11 07:35:59 UTC (rev 17244)
@@ -8,7 +8,7 @@
 CAIRO_SITE:=http://cairographics.org/releases
 CAIRO_CAT:=$(ZCAT)
 CAIRO_DIR:=$(BUILD_DIR)/cairo-$(CAIRO_VERSION)
-CAIRO_BINARY:=libcairo-1.0.a
+CAIRO_BINARY:=libcairo.a
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CAIRO_BE:=yes
@@ -119,11 +119,11 @@
 	);
 	touch $(CAIRO_DIR)/.configured
 
-$(CAIRO_DIR)/cairo/.libs/$(CAIRO_BINARY): $(CAIRO_DIR)/.configured
+$(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY): $(CAIRO_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(CAIRO_DIR)
-	touch -c $(CAIRO_DIR)/cairo/.libs/$(CAIRO_BINARY)
+	touch -c $(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY)
 
-$(STAGING_DIR)/lib/$(CAIRO_BINARY): $(CAIRO_DIR)/cairo/.libs/$(CAIRO_BINARY)
+$(STAGING_DIR)/lib/$(CAIRO_BINARY): $(CAIRO_DIR)/src/.libs/$(CAIRO_BINARY)
 	$(MAKE) prefix=$(STAGING_DIR) \
 	    exec_prefix=$(STAGING_DIR) \
 	    bindir=$(STAGING_DIR)/bin \
@@ -139,6 +139,7 @@
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(CAIRO_DIR) install;
+	touch -c $(STAGING_DIR)/lib/$(CAIRO_BINARY)
 
 $(TARGET_DIR)/lib/libcairo.so.2.9.3: $(STAGING_DIR)/lib/$(CAIRO_BINARY)
 	cp -a $(STAGING_DIR)/lib/libcairo.so $(TARGET_DIR)/lib/
@@ -146,7 +147,7 @@
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libcairo.so.2.*
 	touch -c $(TARGET_DIR)/lib/libcairo.so.2.9.3
 
-cairo: uclibc gettext libintl pkgconfig libglib2 xorg cairo $(TARGET_DIR)/lib/libcairo.so.2.9.3
+cairo: uclibc gettext libintl pkgconfig libglib2 xorg $(TARGET_DIR)/lib/libcairo.so.2.9.3
 
 cairo-clean:
 	rm -f $(TARGET_DIR)/lib/$(CAIRO_BINARY)
