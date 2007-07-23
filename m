From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 01:23:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libungif
Message-ID: <20070723082356.E77ACA6602@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 01:23:54 -0700 (Mon, 23 Jul 2007)
New Revision: 19203

Log:
All libungif package

Added:
   trunk/buildroot/package/libungif/
   trunk/buildroot/package/libungif/Config.in
   trunk/buildroot/package/libungif/libungif.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-23 08:18:45 UTC (rev 19202)
+++ trunk/buildroot/package/Config.in	2007-07-23 08:23:54 UTC (rev 19203)
@@ -287,6 +287,7 @@
 source "package/directfb/Config.in"
 source "package/jpeg/Config.in"
 source "package/libpng/Config.in"
+source "package/libungif/Config.in"
 source "package/sdl/Config.in"
 source "package/tiff/Config.in"
 

Added: trunk/buildroot/package/libungif/Config.in
===================================================================
--- trunk/buildroot/package/libungif/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libungif/Config.in	2007-07-23 08:23:54 UTC (rev 19203)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBUNGIF
+	bool "libungif"
+	default n
+	help
+	  libungif is a library for handling the uncompressed GIF image format.
+
+	  http://sourceforge.net/projects/libungif

Added: trunk/buildroot/package/libungif/libungif.mk
===================================================================
--- trunk/buildroot/package/libungif/libungif.mk	                        (rev 0)
+++ trunk/buildroot/package/libungif/libungif.mk	2007-07-23 08:23:54 UTC (rev 19203)
@@ -0,0 +1,69 @@
+#############################################################
+#
+# libungif
+#
+#############################################################
+LIBUNGIF_VER:=4.1.4
+LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VER).tar.bz2
+LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libungif/$(LIBUNGIF_SOURCE)
+LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VER)
+LIBUNGIF_CAT:=$(BZCAT)
+LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VER)
+LIBUNGIF_TARGET_BINARY:=usr/lib/libungif.so
+
+$(DL_DIR)/$(LIBUNGIF_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBUNGIF_SITE)/$(LIBUNGIF_SOURCE)
+
+$(LIBUNGIF_DIR)/.unpacked: $(DL_DIR)/$(LIBUNGIF_SOURCE)
+	$(LIBUNGIF_CAT) $(DL_DIR)/$(LIBUNGIF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VER)\*.patch\*
+	$(CONFIG_UPDATE) $(LIBUNGIF_DIR)
+	touch $@
+
+$(LIBUNGIF_DIR)/.configured: $(LIBUNGIF_DIR)/.unpacked
+	(cd $(LIBUNGIF_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--sysconfdir=/etc \
+		--enable-shared \
+		--enable-static \
+		--prefix=/usr \
+		--without-x \
+	);
+	touch $@
+
+$(LIBUNGIF_DIR)/lib/.libs/libungif.a: $(LIBUNGIF_DIR)/.configured
+	$(MAKE) -C $(LIBUNGIF_DIR)
+	touch -c $(LIBUNGIF_DIR)/lib/.libs/libungif.a
+
+$(STAGING_DIR)/lib/libungif.a: $(LIBUNGIF_DIR)/lib/.libs/libungif.a
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBUNGIF_DIR) install
+	rm $(STAGING_DIR)/lib/libungif.la
+	touch -c $(STAGING_DIR)/lib/libungif.a
+
+$(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY): $(STAGING_DIR)/lib/libungif.a
+	cp -dpf $(STAGING_DIR)/$(LIBUNGIF_TARGET_BINARY)* $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
+	touch -c $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)
+
+libungif: uclibc $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)
+
+libungif-clean:
+	rm -f $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
+	-$(MAKE) -C $(LIBUNGIF_DIR) clean
+
+libungif-dirclean:
+	rm -rf $(LIBUNGIF_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBUNGIF)),y)
+TARGETS+=libungif
+endif
