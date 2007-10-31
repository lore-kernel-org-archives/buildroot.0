From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 23:35:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libogg
Message-ID: <20071031063507.7082CA456F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 23:35:06 -0700 (Tue, 30 Oct 2007)
New Revision: 20343

Log:
Add libogg media container package for vorbis

Added:
   trunk/buildroot/package/libogg/
   trunk/buildroot/package/libogg/Config.in
   trunk/buildroot/package/libogg/libogg.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-10-30 22:10:17 UTC (rev 20342)
+++ trunk/buildroot/package/Config.in	2007-10-31 06:35:06 UTC (rev 20343)
@@ -273,6 +273,7 @@
 source "package/aumix/Config.in"
 source "package/libid3tag/Config.in"
 source "package/libmad/Config.in"
+source "package/libogg/Config.in"
 source "package/libsndfile/Config.in"
 source "package/libvorbis/Config.in"
 source "package/madplay/Config.in"

Added: trunk/buildroot/package/libogg/Config.in
===================================================================
--- trunk/buildroot/package/libogg/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libogg/Config.in	2007-10-31 06:35:06 UTC (rev 20343)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBOGG
+	bool "libogg"
+	default n
+	help
+	  Ogg is the name of Xiph.org's container format for audio, video, and metadata
+
+config BR2_PACKAGE_LIBOGG_HEADERS
+	bool "libogg target headers"
+	default n
+	depends on BR2_PACKAGE_LIBOGG
+	help
+	  Add target headers for the Ogg open source container format
+	  - Not yet implemented

Added: trunk/buildroot/package/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/libogg/libogg.mk	                        (rev 0)
+++ trunk/buildroot/package/libogg/libogg.mk	2007-10-31 06:35:06 UTC (rev 20343)
@@ -0,0 +1,85 @@
+#############################################################
+#
+# libogg
+#
+#############################################################
+LIBOGG_VERSION:=1.1.3
+LIBOGG_NAME:=libogg-$(LIBOGG_VERSION)
+LIBOGG_SOURCE:=$(LIBOGG_NAME).tar.gz
+LIBOGG_SITE:=http://downloads.xiph.org/releases/ogg/$(LIBOGG-SOURCE)
+LIBOGG_DIR:=$(BUILD_DIR)/libogg-$(LIBOGG_VERSION)
+LIBOGG_BINARY:=libogg
+LIBOGG_TARGET_BINARY:=usr/lib/libogg
+LIBOGG_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(LIBOGG_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBOGG_SITE)/$(LIBOGG_SOURCE)
+
+$(LIBOGG_DIR)/.source: $(DL_DIR)/$(LIBOGG_SOURCE)
+	$(LIBOGG_CAT) $(DL_DIR)/$(LIBOGG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(LIBOGG_DIR)/.configured: $(LIBOGG_DIR)/.source
+	(cd $(LIBOGG_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
+		PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+		PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--enable-shared \
+		--enable-static \
+		--disable-oggtest \
+		$(DISABLE_NLS) \
+	)
+	touch $@
+
+$(LIBOGG_DIR)/.libs: $(LIBOGG_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBOGG_DIR)
+	touch $@
+
+$(TARGET_DIR)/usr/lib/libogg.so: $(LIBOGG_DIR)/.libs
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBOGG_DIR) install
+ifneq ($(strip $(BR2_HAVE_MANPAGES)),y)
+	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
+endif
+	touch $@
+
+$(TARGET_DIR)/usr/lib/libogg.a: $(TARGET_DIR)/usr/lib/libogg.so
+	cp -dpf $(LIBOGG_DIR)/lib/libogg.a $(TARGET_DIR)/usr/lib/
+	touch $@
+
+libogg-header: $(TARGET_DIR)/usr/lib/libogg.a
+	mkdir -p $(TARGET_DIR)/usr/include/ogg
+	cp -dpf $(LIBOGG_DIR)/include/ogg/*.h \
+		$(TARGET_DIR)/usr/include/ogg
+
+libogg: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libogg.so
+
+libogg-source: $(DL_DIR)/$(LIBOGG_SOURCE)
+
+libogg-clean:
+	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBOGG_DIR) uninstall
+	-$(MAKE) -C $(LIBOGG_DIR) clean
+
+libogg-dirclean:
+	rm -rf $(LIBOGG_DIR)
+
+############################################################
+#
+# Toplevel Makefile options
+#
+############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBOGG)),y)
+TARGETS+=libogg
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_LIBOGG_HEADERS)),y)
+TARGETS+=libogg-header
+endif
