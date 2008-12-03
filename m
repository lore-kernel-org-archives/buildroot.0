From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:28:24 -0500 (EST)
Subject: [Buildroot] [PATCH] have zlib respect BR2_PREFER_STATIC_LIB
Message-ID: <alpine.LFD.2.00.0812031427390.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The ARM uClinux BFLT format apparently doesn't support shared libs nor
-fPIC.  So let's distinguish between shared and non shared builds by
having split rules for libz.a and libz.so based on BR2_PREFER_STATIC_LIB.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: package/zlib/zlib.mk
===================================================================
--- package/zlib/zlib.mk	(revision 24219)
+++ package/zlib/zlib.mk	(working copy)
@@ -18,13 +18,23 @@
 	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+ZLIB_PIC := -fPIC
+ZLIB_SHARED := --shared
+ZLIB_TARGET := $(TARGET_DIR)/usr/lib/libz.so
+else
+ZLIB_PIC :=
+ZLIB_SHARED :=
+ZLIB_TARGET := $(STAGING_DIR)/usr/lib/libz.a
+endif
+
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.patched
 	(cd $(ZLIB_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
 		./configure \
-		--shared \
+		$(ZLIB_SHARED) \
 		--prefix=/usr \
 		--exec-prefix=$(STAGING_DIR)/usr/bin \
 		--libdir=$(STAGING_DIR)/usr/lib \
@@ -32,14 +42,17 @@
 	)
 	touch $@
 
-$(ZLIB_DIR)/libz.so: $(ZLIB_DIR)/.configured
+$(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
 	$(MAKE) -C $(ZLIB_DIR) all libz.a
 	touch -c $@
 
-$(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
+$(STAGING_DIR)/usr/lib/libz.a: $(ZLIB_DIR)/libz.a
 	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/zlib.h
 	$(INSTALL) $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
+	touch -c $@
+
+$(STAGING_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
 	touch -c $@
 
@@ -49,7 +62,7 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.so
+$(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(STAGING_DIR)/usr/include/zlib.h $(TARGET_DIR)/usr/include/zlib.h
 	$(INSTALL) $(STAGING_DIR)/usr/include/zconf.h $(TARGET_DIR)/usr/include/
 	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/libz.a
@@ -57,7 +70,7 @@
 
 zlib-headers: $(TARGET_DIR)/usr/lib/libz.a
 
-zlib: uclibc $(TARGET_DIR)/usr/lib/libz.so
+zlib: uclibc $(ZLIB_TARGET)
 
 zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)
 
