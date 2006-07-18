From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 02:01:21 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk12
Message-ID: <20060718085330.89C6A48BD8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 01:53:30 -0700 (Tue, 18 Jul 2006)
New Revision: 15714

Log:
fixup build dependancies and such


Modified:
   trunk/buildroot/package/libgtk12/libgtk12.mk


Changeset:
Modified: trunk/buildroot/package/libgtk12/libgtk12.mk
===================================================================
--- trunk/buildroot/package/libgtk12/libgtk12.mk	2006-07-18 07:59:29 UTC (rev 15713)
+++ trunk/buildroot/package/libgtk12/libgtk12.mk	2006-07-18 08:53:30 UTC (rev 15714)
@@ -24,12 +24,15 @@
 $(LIBGTK12_DIR)/.configured: $(LIBGTK12_DIR)/.unpacked
 	(cd $(LIBGTK12_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		GLIB_CONFIG=$(STAGING_DIR)/bin/glib-config \
 		ac_cv_func_mmap_fixed_mapped=yes \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
+		--prefix=$(STAGING_DIR) \
+		--exec_prefix=$(STAGING_DIR) \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
 		--libexecdir=/usr/lib \
@@ -41,7 +44,6 @@
 		$(DISABLE_NLS) \
 		--x-includes=$(STAGING_DIR)/usr/X11R6/include \
 		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
-		--with-glib-prefix=$(STAGING_DIR) \
 		--enable-debug=no \
 		--disable-glibtest \
 		--disable-xim \
@@ -49,10 +51,11 @@
 	);
 	touch $(LIBGTK12_DIR)/.configured
 
-$(LIBGTK12_DIR)/.libs/$(LIBGTK12_BINARY): $(LIBGTK12_DIR)/.configured
+$(LIBGTK12_DIR)/gtk/.libs/$(LIBGTK12_BINARY): $(LIBGTK12_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(LIBGTK12_DIR)
+	touch -c $(LIBGTK12_DIR)/gtk/.libs/$(LIBGTK12_BINARY)
 
-$(STAGING_DIR)/lib/$(LIBGTK12_BINARY): $(LIBGTK12_DIR)/.libs/$(LIBGTK12_BINARY)
+$(STAGING_DIR)/lib/$(LIBGTK12_BINARY): $(LIBGTK12_DIR)/gtk/.libs/$(LIBGTK12_BINARY)
 	$(MAKE) prefix=$(STAGING_DIR) \
 	    exec_prefix=$(STAGING_DIR) \
 	    bindir=$(STAGING_DIR)/bin \
@@ -68,6 +71,7 @@
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(LIBGTK12_DIR) install;
+	touch -c $(STAGING_DIR)/lib/$(LIBGTK12_BINARY)
 
 $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1: $(STAGING_DIR)/lib/$(LIBGTK12_BINARY)
 	cp -a $(STAGING_DIR)/lib/libgtk.so $(TARGET_DIR)/lib/
@@ -78,6 +82,7 @@
 	cp -a $(STAGING_DIR)/lib/libgdk-1.2.so.0.9.1 $(TARGET_DIR)/lib/
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgdk-1.2.so.0.9.1
+	touch -c $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 
 libgtk12: uclibc libglib12 xorg $(TARGET_DIR)/lib/libgtk-1.2.so.0.9.1
 
