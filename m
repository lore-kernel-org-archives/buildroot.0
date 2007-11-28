From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 28 Nov 2007 00:59:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libxslt
Message-ID: <20071128085917.0D7AC3005E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-28 00:59:17 -0800 (Wed, 28 Nov 2007)
New Revision: 20562

Log:
Add libxslt package

Added:
   trunk/buildroot/package/libxslt/
   trunk/buildroot/package/libxslt/Config.in
   trunk/buildroot/package/libxslt/libxslt.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-28 08:57:26 UTC (rev 20561)
+++ trunk/buildroot/package/Config.in	2007-11-28 08:59:17 UTC (rev 20562)
@@ -79,6 +79,7 @@
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
 source "package/libxml2/Config.in"
+source "package/libxslt/Config.in"
 source "package/lockfile-progs/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"

Added: trunk/buildroot/package/libxslt/Config.in
===================================================================
--- trunk/buildroot/package/libxslt/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libxslt/Config.in	2007-11-28 08:59:17 UTC (rev 20562)
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBXSLT
+	bool "libxslt"
+	default n
+	depends BR2_PACKAGE_PKGCONFIG
+	help
+	  Install the xslt library which is used
+	  to transform XML files to other XML files.
+
+	  XSLT is designed for use as part of XSL, 
+	  which is a stylesheet language for XML. 
+	  In addition to XSLT, XSL includes an XML vocabulary 
+	  for specifying formatting. 
+	  XSL specifies the styling of an XML document by using XSLT
+	  to describe how the document is transformed into another
+	  XML document that uses the formatting vocabulary.
+
+	  http://www.w3.org/TR/xslt
+
+comment "libxslt disabled (requires pkgconfig)"
+	depends !BR2_PACKAGE_PKGCONFIG
+

Added: trunk/buildroot/package/libxslt/libxslt.mk
===================================================================
--- trunk/buildroot/package/libxslt/libxslt.mk	                        (rev 0)
+++ trunk/buildroot/package/libxslt/libxslt.mk	2007-11-28 08:59:17 UTC (rev 20562)
@@ -0,0 +1,99 @@
+#############################################################
+#
+# libxslt
+#
+#############################################################
+LIBXSLT_VERSION=1.1.21
+LIBXSLT_SOURCE=libxslt-$(LIBXSLT_VERSION).tar.gz
+LIBXSLT_SITE=ftp://xmlsoft.org/libxslt
+LIBXSLT_DIR=$(BUILD_DIR)/libxslt-$(LIBXSLT_VERSION)
+
+$(DL_DIR)/$(LIBXSLT_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBXSLT_SITE)/$(LIBXSLT_SOURCE)
+
+$(LIBXSLT_DIR)/.unpacked: $(DL_DIR)/$(LIBXSLT_SOURCE)
+	gzip -d -c $(DL_DIR)/$(LIBXSLT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+#PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
+#PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
+#PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
+#
+
+$(LIBXSLT_DIR)/.configured: $(LIBXSLT_DIR)/.unpacked
+	(cd $(LIBXSLT_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		CFLAGS="$(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/usr/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/include \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--enable-shared \
+		$(DISABLE_NLS) \
+		--enable-static \
+		--enable-ipv6=no \
+		--without-debugging \
+		--without-python \
+		--without-threads \
+	);
+	touch $@
+
+$(LIBXSLT_DIR)/libxslt.so: $(LIBXSLT_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBXSLT_DIR)
+	touch $@
+	
+$(STAGING_DIR)/usr/lib/libxslt.so: $(LIBXSLT_DIR)/libxslt.so
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C "$(LIBXSLT_DIR)" install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libxslt.la
+	-rm -rf $(STAGING_DIR)/usr/man/man1/xslt*
+	-rm -rf $(STAGING_DIR)/usr/man/man3/libxslt*
+	-rm -rf $(STAGING_DIR)/usr/man/man3/libexslt*
+	touch $@
+
+$(TARGET_DIR)/usr/lib/libxslt.so: $(STAGING_DIR)/usr/lib/libxslt.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libxslt.so* $(TARGET_DIR)/usr/lib
+	$(STRIPCMD) $(TARGET_DIR)/usr/lib/libxslt.so*
+	touch $@
+
+$(TARGET_DIR)/usr/lib/libxsltx.a: $(STAGING_DIR)/usr/lib/libxslt.so
+	mkdir -p $(TARGET_DIR)/usr/include/libxslt
+	cp -dpf $(LIBXSLT_DIR)/libxslt/*.h $(TARGET_DIR)/usr/include/libxslt
+	cp -dpf $(STAGING_DIR)/usr/lib/libxslt.a $(TARGET_DIR)/usr/lib/
+	(cd $(TARGET_DIR)/usr/lib; ln -fs ../../lib/libxslt.so.$(LIBXSLT_VERSION) libxslt.so)
+	touch -c $@
+
+#	rm -f $(TARGET_DIR)/lib/libxslt.so.$(LIBXSLT_VERSION)
+
+libxslt-headers: $(TARGET_DIR)/usr/lib/libxslt.a
+
+libxslt: uclibc pkgconfig libgcrypt $(TARGET_DIR)/usr/lib/libxslt.so
+
+libxslt-source: $(DL_DIR)/$(LIBXSLT_SOURCE)
+
+libxslt-clean:
+	rm -f $(TARGET_DIR)/lib/libxslt.so*
+	-$(MAKE) -C $(LIBXSLT_DIR) clean
+
+libxslt-dirclean:
+	rm -rf $(LIBXSLT_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBXSLT)),y)
+TARGETS+=libxslt
+endif
