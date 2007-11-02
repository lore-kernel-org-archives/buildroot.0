From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Nov 2007 15:37:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20071102223759.69F2FA6137@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-02 15:37:58 -0700 (Fri, 02 Nov 2007)
New Revision: 20353

Log:
Avoid autoconf, to allow libmad build to complete

Modified:
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-11-02 20:11:12 UTC (rev 20352)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-11-02 22:37:58 UTC (rev 20353)
@@ -18,6 +18,8 @@
 	$(CONFIG_UPDATE) $(LIBMAD_DIR)
 	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch
 	toolchain/patch-kernel.sh $(LIBMAD_DIR) package/libmad/ libmad-$(LIBMAD_VERSION)\*.patch.$(ARCH)
+	# Prevent automake from running.
+	(cd $(LIBMAD_DIR); touch -c config* aclocal.m4 Makefile*);
 	touch $@
 
 $(LIBMAD_DIR)/.configured: $(LIBMAD_DIR)/.unpacked
@@ -45,19 +47,22 @@
 	(cd $(LIBMAD_DIR); libtoolize --force)
 	$(MAKE) -C $(LIBMAD_DIR)
 
-$(STAGING_DIR)/usr/lib/libmad.so: $(LIBMAD_DIR)/libmad.la
+$(STAGING_DIR)/usr/lib/libmad.so.0: $(LIBMAD_DIR)/libmad.la
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBMAD_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libmad.la
 
-$(TARGET_DIR)/usr/lib/libmad.so: $(STAGING_DIR)/usr/lib/libmad.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libmad*
+$(TARGET_DIR)/usr/lib/libmad.so.0: $(STAGING_DIR)/usr/lib/libmad.so.0
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so.* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libmad.so.*
 
-$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so
+$(TARGET_DIR)/usr/lib/libmad.a: $(STAGING_DIR)/usr/lib/libmad.so.0
 	mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/usr/include/mad.h $(TARGET_DIR)/usr/include/
-	cp -dpf $(STAGING_DIR)/usr/lib/libmad.*a $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.la $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.so $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libmad.a $(TARGET_DIR)/usr/lib/
 
-libmad: uclibc $(TARGET_DIR)/usr/lib/libmad.so
+libmad: uclibc $(TARGET_DIR)/usr/lib/libmad.so.0
 
 libmad-headers: $(TARGET_DIR)/usr/lib/libmad.a
 
