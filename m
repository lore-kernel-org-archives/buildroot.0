From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 15:45:00 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libvorbis
Message-ID: <20090219154501.26183766F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-19 15:45:00 +0000 (Thu, 19 Feb 2009)
New Revision: 25387

Log:
libvorbis: convert to Makefile.autotools.in format

Patch by Sven Neumann <s.neumann@phase-zero.de>
Closes #107

Modified:
   trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk	2009-02-19 12:08:11 UTC (rev 25386)
+++ trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk	2009-02-19 15:45:00 UTC (rev 25387)
@@ -3,61 +3,21 @@
 # libvorbis
 #
 #############################################################
-LIBVORBIS_VERSION:=1.2.0
-LIBVORBIS_SOURCE:=libvorbis-$(LIBVORBIS_VERSION).tar.gz
-LIBVORBIS_SITE:=http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
-LIBVORBIS_DIR:=$(BUILD_DIR)/libvorbis-$(LIBVORBIS_VERSION)
-LIBVORBIS_BINARY:=libvorbis
-LIBVORBIS_TARGET_BINARY:=usr/bin/libvorbis
-LIBVORBIS_CAT:=$(ZCAT)
 
-$(DL_DIR)/$(LIBVORBIS_SOURCE):
-	$(call DOWNLOAD,$(LIBVORBIS_SITE),$(LIBVORBIS_SOURCE))
+LIBVORBIS_VERSION = 1.2.0
+LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
+LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
+LIBVORBIS_AUTORECONF = NO
+LIBVORBIS_INSTALL_STAGING = YES
+LIBVORBIS_INSTALL_TARGET = YES
 
-$(LIBVORBIS_DIR)/.source: $(DL_DIR)/$(LIBVORBIS_SOURCE)
-	$(LIBVORBIS_CAT) $(DL_DIR)/$(LIBVORBIS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
+LIBVORBIS_CONF_OPT = --disable-oggtest
 
-$(LIBVORBIS_DIR)/.configured: $(LIBVORBIS_DIR)/.source
-	(cd $(LIBVORBIS_DIR); rm -rf config.cache; \
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
+LIBVORBIS_DEPENDENCIES = uclibc pkgconfig libogg
 
-$(LIBVORBIS_DIR)/.libs: $(LIBVORBIS_DIR)/.configured
-	$(MAKE) -C $(@D)
-	touch $@
+$(eval $(call AUTOTARGETS,package/multimedia,libvorbis))
 
-$(STAGING_DIR)/usr/lib/libvorbis.so: $(LIBVORBIS_DIR)/.libs
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBVORBIS_DIR) install
 
-$(TARGET_DIR)/usr/lib/libvorbis.so: $(STAGING_DIR)/usr/lib/libvorbis.so
-	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libvorbis*.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libvorbis*.so*
-
-libvorbis: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/libvorbis.so
-
-libvorbis-source: $(DL_DIR)/$(LIBVORBIS_SOURCE)
-
-libvorbis-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBVORBIS_DIR) uninstall
-	-$(MAKE) -C $(LIBVORBIS_DIR) clean
-
-libvorbis-dirclean:
-	rm -rf $(LIBVORBIS_DIR)
-
 ############################################################
 #
 # Tremor (Integer decoder for Vorbis)
