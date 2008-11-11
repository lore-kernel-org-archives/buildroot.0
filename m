From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 11 Nov 2008 03:43:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20081111114328.277F03C960@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-11-11 03:43:27 -0800 (Tue, 11 Nov 2008)
New Revision: 23999

Log:
package/tiff/tiff.mk: Change to Autotools.in format

Bounce tiff into Autotools.in format.
Did not use install to target as this puts loads of executables into TARGET.
So just copied tiff.so instead.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2008-11-11 11:33:45 UTC (rev 23998)
+++ trunk/buildroot/package/tiff/tiff.mk	2008-11-11 11:43:27 UTC (rev 23999)
@@ -4,85 +4,23 @@
 #
 #############################################################
 TIFF_VERSION:=3.8.2
-TIFF_SOURCE:=tiff_$(TIFF_VERSION).orig.tar.gz
-TIFF_SOURCE2:=tiff-$(TIFF_VERSION).tar.gz
-TIFF_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/t/tiff/
-TIFF_DIR:=$(BUILD_DIR)/tiff-$(TIFF_VERSION)
-TIFF_CAT:=$(ZCAT)
+TIFF_SITE:=ftp://ftp.remotesensing.org/pub/libtiff
+TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
+TIFF_LIBTOOL_PATCH = NO
+TIFF_INSTALL_STAGING = YES
+TIFF_INSTALL_TARGET = NO
+TIFF_CONF_OPT = \
+	--enable-shared \
+	--enable-static \
+	--disable-cxx \
+	--without-x \
 
-$(DL_DIR)/$(TIFF_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(TIFF_SITE)/$(TIFF_SOURCE)
+TIFF_DEPENDENCIES = uclibc pkgconfig zlib jpeg
 
-tiff-source: $(DL_DIR)/$(TIFF_SOURCE)
+$(eval $(call AUTOTARGETS,package,tiff))
 
-$(TIFF_DIR)/.unpacked: $(DL_DIR)/$(TIFF_SOURCE)
-	$(TIFF_CAT) $(DL_DIR)/$(TIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(TIFF_CAT) $(TIFF_DIR)/$(TIFF_SOURCE2) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TIFF_DIR) package/tiff/ tiff\*.patch
-	$(CONFIG_UPDATE) $(TIFF_DIR)
-	$(CONFIG_UPDATE) $(TIFF_DIR)/config
-	touch $(TIFF_DIR)/.unpacked
+$(TIFF_HOOK_POST_BUILD):
+	-cp -a $(TIFF_DIR)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so
+	touch $@
 
-$(TIFF_DIR)/.configured: $(TIFF_DIR)/.unpacked \
-	$(STAGING_DIR)/usr/lib/libjpeg.a $(STAGING_DIR)/usr/lib/libz.so
-	(cd $(TIFF_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
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
-		--enable-static \
-		--disable-cxx \
-		--without-x \
-		--with-jpeg-include-dir=$(STAGING_DIR)/usr/include \
-		--with-jpeg-lib-dir=$(STAGING_DIR)/lib \
-		--with-zlib-include-dir=$(STAGING_DIR)/usr/include \
-		--with-zlib-lib-dir=$(STAGING_DIR)/lib \
-	)
-	touch $(TIFF_DIR)/.configured
-
-$(TIFF_DIR)/libtiff/.libs/libtiff.a: $(TIFF_DIR)/.configured
-	$(MAKE) -C $(TIFF_DIR)
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libtiff.so: $(TIFF_DIR)/libtiff/.libs/libtiff.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(TIFF_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libtiff.la
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libtiff.so: $(STAGING_DIR)/usr/lib/libtiff.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libtiff.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-
-tiff: uclibc $(TARGET_DIR)/usr/lib/libtiff.so
-
-tiff-clean:
-	-rm -f $(TARGET_DIR)/usr/lib/libtiff.so*
-	-$(MAKE) -C $(TIFF_DIR) DESTDIR=$(STAGING_DIR) uninstall
-	-$(MAKE) -C $(TIFF_DIR) clean
-
-tiff-dirclean:
-	rm -rf $(TIFF_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_TIFF)),y)
-TARGETS+=tiff
-endif
