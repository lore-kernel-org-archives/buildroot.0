From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 13:37:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090223133749.206A176564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-23 13:37:48 +0000 (Mon, 23 Feb 2009)
New Revision: 25428

Log:
alsa-lib: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-23 13:01:26 UTC (rev 25427)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-02-23 13:37:48 UTC (rev 25428)
@@ -3,16 +3,26 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION:=1.0.18
-ALSA_LIB_SOURCE:=alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
-ALSA_LIB_SITE:=ftp://ftp.alsa-project.org/pub/lib
-ALSA_LIB_DIR:=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VERSION)
-ALSA_LIB_CAT:=$(BZCAT)
-ALSA_LIB_BINARY:=libasound.so.2.0.0
-ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
+ALSA_LIB_VERSION = 1.0.18
+ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
+ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
+ALSA_LIB_INSTALL_STAGING = YES
+ALSA_LIB_INSTALL_TARGET = YES
 
 ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
 
+ALSA_LIB_DEPENDENCIES = uclibc
+
+ALSA_LIB_CONF_OPT = --enable-shared \
+		    --enable-static \
+		    --without-versioned
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+# install-exec doesn't install the config files
+ALSA_LIB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+ALSA_LIB_CONF_OPT += --enable-debug
+endif
+
 ifeq ($(BR2_arm),y)
 ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
 endif
@@ -22,82 +32,19 @@
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
-ALSA_LIB_CONFIGURE_OPTS += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
+ALSA_LIB_CONF_OPT += --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_DEPS = libpython
+ALSA_LIB_DEPENDENCIES += libpython
 else
-ALSA_LIB_CONFIGURE_OPTS += --disable-python
+ALSA_LIB_CONF_OPT += --disable-python
 endif
 
 ifeq ($(BR2_SOFT_FLOAT),y)
-	SOFT_FLOAT=--with-softfloat
+ALSA_LIB_CONF_OPT += --with-softfloat
 endif
 
-$(DL_DIR)/$(ALSA_LIB_SOURCE):
-	$(call DOWNLOAD,$(ALSA_LIB_SITE),$(ALSA_LIB_SOURCE))
+ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
+		    LDFLAGS="$(TARGET_LDFLAGS) -lm"
 
-$(ALSA_LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA_LIB_SOURCE)
-	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/multimedia/alsa-lib/ alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
-	$(CONFIG_UPDATE) $(ALSA_LIB_DIR)
-	touch $@
+$(eval $(call AUTOTARGETS,package/multimedia,alsa-lib))
 
-$(ALSA_LIB_DIR)/.configured: $(ALSA_LIB_DIR)/.unpacked
-	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(ALSA_LIB_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS) -lm" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--enable-shared \
-		--enable-static \
-		--disable-docs \
-		--without-versioned \
-		$(ALSA_LIB_CONFIGURE_OPTS) \
-		$(SOFT_FLOAT) \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY): $(ALSA_LIB_DIR)/.configured
-	$(MAKE) -C $(ALSA_LIB_DIR)
-	touch -c $@
-
-$(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY): $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libasound.la
-
-$(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
-	mkdir -p $(TARGET_DIR)/usr/share/alsa $(TARGET_DIR)/usr/lib/alsa-lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libasound.so* $(TARGET_DIR)/usr/lib/
-	cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/
-	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libasound.so*
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/alsa-lib/smixer/*.so
-	touch -c $@
-
-alsa-lib: uclibc $(ALSA_LIB_DEPS) $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
-
-alsa-lib-unpacked: $(ALSA_LIB_DIR)/.unpacked
-
-alsa-lib-source: $(DL_DIR)/$(ALSA_LIB_SOURCE)
-
-alsa-lib-clean:
-	rm -f $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
-	-$(MAKE) -C $(ALSA_LIB_DIR) clean
-
-alsa-lib-dirclean:
-	rm -rf $(ALSA_LIB_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
-TARGETS+=alsa-lib
-endif
