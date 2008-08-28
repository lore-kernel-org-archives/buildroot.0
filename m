From: laird at uclibc.org <laird@uclibc.org>
Date: Thu, 28 Aug 2008 04:52:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxslt
Message-ID: <20080828115217.4ECAB3C83A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-28 04:52:17 -0700 (Thu, 28 Aug 2008)
New Revision: 23275

Log:
libxslt: Convert to Makefile.autotools.in format

Converted to Makefile.autotools.in format
Version bumped to 1.1.24
Enabled crypto support dependant on gcrypt being chosen/not
Post process xslt-config file like freetype-config/xm2-config.



Modified:
   trunk/buildroot/package/libxslt/libxslt.mk


Changeset:
Modified: trunk/buildroot/package/libxslt/libxslt.mk
===================================================================
--- trunk/buildroot/package/libxslt/libxslt.mk	2008-08-28 10:56:38 UTC (rev 23274)
+++ trunk/buildroot/package/libxslt/libxslt.mk	2008-08-28 11:52:17 UTC (rev 23275)
@@ -3,104 +3,33 @@
 # libxslt
 #
 #############################################################
-LIBXSLT_VERSION=1.1.21
-LIBXSLT_SOURCE=libxslt-$(LIBXSLT_VERSION).tar.gz
-LIBXSLT_SITE=ftp://xmlsoft.org/libxslt
-LIBXSLT_DIR=$(BUILD_DIR)/libxslt-$(LIBXSLT_VERSION)
+LIBXSLT_VERSION = 1.1.24
+LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.gz
+LIBXSLT_SITE = ftp://xmlsoft.org/libxslt
+LIBXSLT_INSTALL_STAGING = YES
+LIBXSLT_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(LIBXSLT_SOURCE):
-	$(WGET) -P $(DL_DIR) $(LIBXSLT_SITE)/$(LIBXSLT_SOURCE)
+# If we have enabled libgcrypt then use it, else disable crypto support.
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBXSLT_DEPENDENCIES_EXTRA=libgcrypt
+else
+LIBXSLT_XTRA_CONF_OPT = --without-crypto
+endif
 
-$(LIBXSLT_DIR)/.unpacked: $(DL_DIR)/$(LIBXSLT_SOURCE)
-	gzip -d -c $(DL_DIR)/$(LIBXSLT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBXSLT_DIR) package/libxslt/ libxslt-$(LIBXSLT_VERSION)\*.patch*
-	$(CONFIG_UPDATE) $(LIBXSLT_DIR)
-	touch $@
+LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
+		--enable-static $(LIBXSLT_XTRA_CONF_OPT) \
+		$(DISABLE_NLS) $(DISABLE_IPV6) \
+		--without-debugging --without-python \
+		--without-threads \
+		--with-libxml-include-prefix=$(STAGING_DIR)/usr/include/libxml2
 
-#PKG_CONFIG_PATH="$(STAGING_DIR)/lib/pkconfig:$(STAGING_DIR)/usr/lib/pkgconfig" \
-#PKG_CONFIG="$(STAGING_DIR)/usr/bin/pkg-config" \
-#PKG_CONFIG_SYSROOT=$(STAGING_DIR) \
-#
+LIBXSLT_DEPENDENCIES = uclibc $(LIBXSLT_DEPENDENCIES_EXTRA)
 
-$(LIBXSLT_DIR)/.configured: $(LIBXSLT_DIR)/.unpacked
-	(cd $(LIBXSLT_DIR); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-		CFLAGS="$(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE" \
-		EXSLT_LIBDIR=$(STAGING_DIR)/usr/lib \
-		XSLT_LIBDIR=$(STAGING_DIR)/usr/lib \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--enable-shared \
-		$(DISABLE_NLS) \
-		--enable-static \
-		--enable-ipv6=no \
-		--without-debugging \
-		--without-python \
-		--without-threads \
-		--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib \
-		CFLAGS="-I$(STAGING_DIR)/usr/include/libxml2" \
-	);
-	touch $@
+$(eval $(call AUTOTARGETS,package,libxslt))
 
-$(LIBXSLT_DIR)/libxslt.so: $(LIBXSLT_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBXSLT_DIR)
+$(LIBXSLT_HOOK_POST_INSTALL):
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xslt-config
+	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/xslt-config
 	touch $@
-	
-$(STAGING_DIR)/usr/lib/libxslt.so: $(LIBXSLT_DIR)/libxslt.so
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C "$(LIBXSLT_DIR)" install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libxslt.la
-	-rm -rf $(STAGING_DIR)/usr/man/man1/xslt*
-	-rm -rf $(STAGING_DIR)/usr/man/man3/libxslt*
-	-rm -rf $(STAGING_DIR)/usr/man/man3/libexslt*
-	touch $@
 
-$(TARGET_DIR)/usr/lib/libxslt.so: $(STAGING_DIR)/usr/lib/libxslt.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libxslt.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(TARGET_DIR)/usr/lib/libxslt.so*
-	touch $@
-
-$(TARGET_DIR)/usr/lib/libxsltx.a: $(STAGING_DIR)/usr/lib/libxslt.so
-	mkdir -p $(TARGET_DIR)/usr/include/libxslt
-	cp -dpf $(LIBXSLT_DIR)/libxslt/*.h $(TARGET_DIR)/usr/include/libxslt
-	cp -dpf $(STAGING_DIR)/usr/lib/libxslt.a $(TARGET_DIR)/usr/lib/
-	(cd $(TARGET_DIR)/usr/lib; ln -fs ../../lib/libxslt.so.$(LIBXSLT_VERSION) libxslt.so)
-	touch -c $@
-
-#	rm -f $(TARGET_DIR)/lib/libxslt.so.$(LIBXSLT_VERSION)
-
-libxslt-headers: $(TARGET_DIR)/usr/lib/libxslt.a
-
-libxslt: uclibc pkgconfig libgcrypt $(TARGET_DIR)/usr/lib/libxslt.so
-
-libxslt-source: $(DL_DIR)/$(LIBXSLT_SOURCE)
-
-libxslt-clean:
-	rm -f $(TARGET_DIR)/lib/libxslt.so*
-	-$(MAKE) -C $(LIBXSLT_DIR) clean
-
-libxslt-dirclean:
-	rm -rf $(LIBXSLT_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_LIBXSLT)),y)
-TARGETS+=libxslt
-endif
