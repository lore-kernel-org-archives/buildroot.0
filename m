From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 05:03:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libogg
Message-ID: <20081114130301.8D8203C8D1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-14 05:03:01 -0800 (Fri, 14 Nov 2008)
New Revision: 24040

Log:
libogg: convert to Makefile.autotools.in

Also remove --enable-shared and --enable-static as it's default
and --disable-oggtest and $(DISABLE_NLS) as they are not supported.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/audio/libogg/libogg.mk


Changeset:
Modified: trunk/buildroot/package/audio/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/audio/libogg/libogg.mk	2008-11-14 12:59:14 UTC (rev 24039)
+++ trunk/buildroot/package/audio/libogg/libogg.mk	2008-11-14 13:03:01 UTC (rev 24040)
@@ -3,73 +3,13 @@
 # libogg
 #
 #############################################################
-LIBOGG_VERSION:=1.1.3
-LIBOGG_NAME:=libogg-$(LIBOGG_VERSION)
-LIBOGG_SOURCE:=$(LIBOGG_NAME).tar.gz
-LIBOGG_SITE:=http://downloads.xiph.org/releases/ogg/$(LIBOGG-SOURCE)
-LIBOGG_DIR:=$(BUILD_DIR)/libogg-$(LIBOGG_VERSION)
-LIBOGG_BINARY:=libogg
-LIBOGG_TARGET_BINARY:=usr/lib/libogg
-LIBOGG_CAT:=$(ZCAT)
+LIBOGG_VERSION = 1.1.3
+LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
+LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
+LIBOGG_AUTORECONF = NO
+LIBOGG_INSTALL_STAGING = YES
+LIBOGG_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(LIBOGG_SOURCE):
-	$(WGET) -P $(DL_DIR) $(LIBOGG_SITE)/$(LIBOGG_SOURCE)
+LIBOGG_DEPENDENCIES = uclibc pkgconfig
 
-$(LIBOGG_DIR)/.source: $(DL_DIR)/$(LIBOGG_SOURCE)
-	$(LIBOGG_CAT) $(DL_DIR)/$(LIBOGG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(LIBOGG_DIR)/.configured: $(LIBOGG_DIR)/.source
-	(cd $(LIBOGG_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--enable-shared \
-		--enable-static \
-		--disable-oggtest \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(LIBOGG_DIR)/.libs: $(LIBOGG_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBOGG_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libogg.so: $(LIBOGG_DIR)/.libs
-	mkdir -p $(STAGING_DIR)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOGG_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libogg.la
-
-$(TARGET_DIR)/usr/lib/libogg.so: $(STAGING_DIR)/usr/lib/libogg.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libogg.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libogg.so*
-ifneq ($(strip $(BR2_HAVE_MANPAGES)),y)
-	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
-endif
-
-libogg: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libogg.so
-
-libogg-source: $(DL_DIR)/$(LIBOGG_SOURCE)
-
-libogg-clean:
-	-rm -rf $(TARGET_DIR)/usr/lib/libogg.so*
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBOGG_DIR) uninstall
-	-$(MAKE) -C $(LIBOGG_DIR) clean
-
-libogg-dirclean:
-	rm -rf $(LIBOGG_DIR)
-
-############################################################
-#
-# Toplevel Makefile options
-#
-############################################################
-ifeq ($(strip $(BR2_PACKAGE_LIBOGG)),y)
-TARGETS+=libogg
-endif
+$(eval $(call AUTOTARGETS,package/audio,libogg))
