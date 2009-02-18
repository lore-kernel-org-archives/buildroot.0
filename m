From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Feb 2009 14:16:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20090218141639.0119076A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-18 14:16:38 +0000 (Wed, 18 Feb 2009)
New Revision: 25364

Log:
tslib: convert to Makefile.autotools.in format

Patch by Sven Neumann <s.neumann@phase-zero.de>
Closes #61.

Modified:
   trunk/buildroot/package/tslib/Config.in
   trunk/buildroot/package/tslib/tslib.mk


Changeset:
Modified: trunk/buildroot/package/tslib/Config.in
===================================================================
--- trunk/buildroot/package/tslib/Config.in	2009-02-18 14:16:34 UTC (rev 25363)
+++ trunk/buildroot/package/tslib/Config.in	2009-02-18 14:16:38 UTC (rev 25364)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_TSLIB
 	bool "libts - The Touchscreen tslib Library"
 	help
-
 	    http://tslib.berlios.de/
 
 	    Tslib is an abstraction layer for touchscreen panel events.

Modified: trunk/buildroot/package/tslib/tslib.mk
===================================================================
--- trunk/buildroot/package/tslib/tslib.mk	2009-02-18 14:16:34 UTC (rev 25363)
+++ trunk/buildroot/package/tslib/tslib.mk	2009-02-18 14:16:38 UTC (rev 25364)
@@ -1,109 +1,22 @@
 #############################################################
 #
-# libts
+# tslib
 #
 #############################################################
 TSLIB_VERSION:=1.0
 TSLIB_SOURCE:=tslib-$(TSLIB_VERSION).tar.bz2
 TSLIB_SITE:=http://download.berlios.de/tslib
-TSLIB_CAT:=$(BZCAT)
-TSLIB_DIR:=$(BUILD_DIR)/tslib-$(TSLIB_VERSION)
+TSLIB_AUTORECONF = YES
+TSLIB_LIBTOOL_PATCH = NO
+TSLIB_INSTALL_STAGING = YES
+TSLIB_INSTALL_TARGET = YES
+TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-$(DL_DIR)/$(TSLIB_SOURCE):
-	$(call DOWNLOAD,$(TSLIB_SITE),$(TSLIB_SOURCE))
+TSLIB_CONF_OPT = \
+	--enable-shared	\
+	--prefix=/usr	\
+	--sysconfdir=/etc
 
-tslib-source: $(DL_DIR)/$(TSLIB_SOURCE)
+TSLIB_DEPENDENCIES = uclibc
 
-$(TSLIB_DIR)/.patched: $(DL_DIR)/$(TSLIB_SOURCE)
-	$(TSLIB_CAT) $(DL_DIR)/$(TSLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TSLIB_DIR) package/tslib/ tslib\*.patch
-	touch $@
-
-$(TSLIB_DIR)/.configured: $(TSLIB_DIR)/.patched
-	(cd $(TSLIB_DIR); rm -rf config.cache; PATH=$(TARGET_PATH) ./autogen.sh)
-	$(CONFIG_UPDATE) $(TSLIB_DIR)
-	(cd $(TSLIB_DIR) && \
-	$(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) " \
-	./configure \
-	--target=$(GNU_TARGET_NAME) \
-	--host=$(GNU_TARGET_NAME) \
-	--build=$(GNU_HOST_NAME) \
-	--prefix=$(STAGING_DIR)/usr \
-	--exec_prefix=$(STAGING_DIR)/usr \
-	--sysconfdir=/etc \
-	--datadir=/usr/share \
-	--localstatedir=/var \
-	--includedir=$(STAGING_DIR)/usr/include \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--disable-static \
-	--disable-linear-h2200 \
-	--disable-ucb1x00 \
-	--disable-corgi \
-	--disable-collie \
-	--disable-h3600 \
-	--disable-mk712 \
-	--disable-arctic2 \
-	--enable-input \
-	)
-	$(SED) 's:rpl\_malloc:malloc:g' $(TSLIB_DIR)/config.h
-	touch $@
-
-$(TSLIB_DIR)/.compiled: $(TSLIB_DIR)/.configured
-	$(MAKE) -C $(TSLIB_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libts.so: $(TSLIB_DIR)/.compiled
-	$(MAKE) -C $(TSLIB_DIR) \
-	    prefix=$(STAGING_DIR)/usr \
-	    exec_prefix=$(STAGING_DIR)/usr \
-	    bindir=$(STAGING_DIR)/usr/bin \
-	    sbindir=$(STAGING_DIR)/usr/sbin \
-	    libexecdir=$(STAGING_DIR)/usr/libexec \
-	    datadir=$(STAGING_DIR)/usr/share \
-	    sysconfdir=$(STAGING_DIR)/etc \
-	    localstatedir=$(STAGING_DIR)/var \
-	    libdir=$(STAGING_DIR)/usr/lib \
-	    includedir=$(STAGING_DIR)/usr/include \
-	    infodir=$(STAGING_DIR)/info \
-	    mandir=$(STAGING_DIR)/man \
-	    install
-
-$(TARGET_DIR)/usr/lib/libts.so: $(STAGING_DIR)/usr/lib/libts.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libts*.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libts.so*
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(STAGING_DIR)/usr/lib/ts/*.so
-	cp -dpf $(STAGING_DIR)/usr/lib/ts/*.so $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/bin/ts_calibrate $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_calibrate
-	cp -dpf $(STAGING_DIR)/usr/bin/ts_finddev $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_finddev
-	cp -dpf $(STAGING_DIR)/usr/bin/inputattach $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/inputattach
-	cp -dpf $(STAGING_DIR)/usr/bin/ts_test $(TARGET_DIR)/usr/bin/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_test
-	cp -dpf package/tslib/ts.conf $(TARGET_DIR)/etc/
-
-tslib: uclibc host-automake host-autoconf $(TARGET_DIR)/usr/lib/libts.so
-
-tslib-build: uclibc $(TSLIB_DIR)/.configured
-	rm -f $(TSLIB_DIR)/.compiled
-	$(MAKE) -C $(TSLIB_DIR)
-	touch $(TSLIB_DIR)/.compiled
-
-tslib-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(TSLIB_DIR) uninstall
-	rm -f $(STAGING_DIR)/lib/libts.* $(STAGING_DIR)/usr/lib/libts.*
-	-$(MAKE) -C $(TSLIB_DIR) clean
-
-tslib-dirclean:
-	rm -rf $(TSLIB_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-TARGETS+=tslib
-endif
+$(eval $(call AUTOTARGETS,package,tslib))
