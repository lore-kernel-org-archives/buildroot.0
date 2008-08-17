From: Malek <souf_oued@yahoo.fr>
Date: Sun, 17 Aug 2008 10:40:50 +0000
Subject: [Buildroot] [PATCH] speex: convert to Makefile.autotools.in and
 bump version to 1.2rc1
Message-ID: <48A80032.6000106@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts speex to use Makefile.autotools.in and bump the 
version to 1.2rc1

Malek

--- buildroot/package/speex/speex.mk.orig	2008-08-17 10:31:42.000000000 
+0000
+++ buildroot/package/speex/speex.mk	2008-08-17 10:24:58.000000000 +0000
@@ -3,107 +3,25 @@
  # speex
  #
  #############################################################
-
-SPEEX_VERSION=1.2beta2
-
-# Don't alter below this line unless you (think) you know
-# what you are doing! Danger, Danger!
-
+SPEEX_VERSION=1.2rc1
  SPEEX_SOURCE=speex-$(SPEEX_VERSION).tar.gz
-SPEEX_CAT:=$(ZCAT)
  SPEEX_SITE=http://downloads.us.xiph.org/releases/speex
-SPEEX_DIR=$(BUILD_DIR)/speex-$(SPEEX_VERSION)
+SPEEX_AUTORECONF = NO
+SPEEX_INSTALL_STAGING = YES
+SPEEX_INSTALL_TARGET = YES
+SPEEX_DEPENDENCIES = libogg
+SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib 
--with-ogg-includes=$(STAGING_DIR)/usr/include \
+		--disable-static --enable-fixed-point $(DISABLE_NLS)

  ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
-SPEEX_FOR_ARM5E:=--enable-arm5e-asm
+	SPEEX_CONF_OPT += --enable-arm5e-asm
  endif

-$(DL_DIR)/$(SPEEX_SOURCE):
-	$(WGET) -P $(DL_DIR) $(SPEEX_SITE)/$(SPEEX_SOURCE)
-
-$(SPEEX_DIR)/.unpacked: $(DL_DIR)/$(SPEEX_SOURCE)
-	$(SPEEX_CAT) $(DL_DIR)/$(SPEEX_SOURCE) | tar -C $(BUILD_DIR) 
$(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SPEEX_DIR) package/speex/ 
speex-$(SPEEX_VERSION)\*.patch
-	$(CONFIG_UPDATE) $(SPEEX_DIR)
-	touch $(SPEEX_DIR)/.unpacked
-
-$(SPEEX_DIR)/Makefile: $(SPEEX_DIR)/.unpacked
-	rm -f $(SPEEX_DIR)/Makefile
-	mkdir -p $(SPEEX_DIR)
-	(cd $(SPEEX_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		$(SPEEX_DIR)/configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--includedir=/usr/include \
-		--enable-shared \
-		--enable-fixed-point \
-		$(SPEEX_FOR_ARM5E) \
-		$(DISABLE_NLS); \
-	)
-	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" 
$(SPEEX_DIR)/Makefile
-	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" 
$(SPEEX_DIR)/Makefile
-	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" 
$(SPEEX_DIR)/libspeex/Makefile
-	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" 
$(SPEEX_DIR)/libspeex/Makefile
-	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/libspeex/Makefile
-	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" 
$(SPEEX_DIR)/src/Makefile
-	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" 
$(SPEEX_DIR)/src/Makefile
-	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/src/Makefile
-	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" 
$(SPEEX_DIR)/include/Makefile
-	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" 
$(SPEEX_DIR)/include/Makefile
-	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/include/Makefile
-	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" 
$(SPEEX_DIR)/include/speex/Makefile
-	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" 
$(SPEEX_DIR)/include/speex/Makefile
-	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/include/speex/Makefile
-	$(SED) "s,^OGG_CFLAGS.*,OGG_CFLAGS= -I$(STAGING_DIR)/usr/include,g" 
$(SPEEX_DIR)/doc/Makefile
-	$(SED) "s,^OGG_LIBS.*,OGG_LIBS= -L$(STAGING_DIR)/usr/lib -logg,g" 
$(SPEEX_DIR)/doc/Makefile
-	$(SED) "s,-I/usr/include,,g" $(SPEEX_DIR)/doc/Makefile
-
-
-
-$(SPEEX_DIR)/speex: $(SPEEX_DIR)/Makefile
-	rm -f $@
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SPEEX_DIR)
-
-$(SPEEX_DIR)/.installed: $(SPEEX_DIR)/speex
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SPEEX_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" 
$(STAGING_DIR)/usr/lib/libspeex.la
-	touch $@
-
-$(TARGET_DIR)/usr/bin/speexdec: $(SPEEX_DIR)/.installed
-	cp -dpf $(STAGING_DIR)/usr/bin/speexdec $(TARGET_DIR)/usr/bin/speexdec
-
-$(TARGET_DIR)/usr/bin/speexenc: $(TARGET_DIR)/usr/bin/speexdec
-	cp -dpf $(STAGING_DIR)/usr/bin/speexenc $(TARGET_DIR)/usr/bin/speexenc
-
-$(TARGET_DIR)/usr/lib/libspeex.so: $(TARGET_DIR)/usr/bin/speexenc
-	cp -dpf $(STAGING_DIR)/usr/lib/libspeex.so* $(TARGET_DIR)/usr/lib
-
-speex-bins:
-
-speex: uclibc libogg $(TARGET_DIR)/usr/lib/libspeex.so
-
-speex-source: $(DL_DIR)/$(SPEEX_SOURCE)
-
-speex-clean:
-	-$(MAKE) -C $(SPEEX_DIR) clean
-	-rm -f $(STAGING_DIR)/usr/lib/libspeex.so*
-	rm -f $(STAGING_DIR)/usr/bin/speexenc $(STAGING_DIR)/usr/bin/speexdec
-	-rm -f $(TARGET_DIR)/usr/lib/libspeex.so*
-	rm -f $(TARGET_DIR)/usr/bin/speexenc $(TARGET_DIR)/usr/bin/speexdec
-
-
-speex-dirclean:
-	rm -rf $(SPEEX_DIR)
+$(eval $(call AUTOTARGETS,package,speex))

-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_SPEEX)),y)
-TARGETS+=speex
-endif
+$(SPEEX_TARGET_BUILD): $(SPEEX_TARGET_CONFIGURE)
+	$(call MESSAGE,"Building")
+	$(SED) 
's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' 
$(SPEEX_DIR)/libtool
+	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' 
$(SPEEX_DIR)/libtool
+	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$(Q)touch $@
-------------- next part --------------
A non-text attachment was scrubbed...
Name: speex.patch
Type: text/x-patch
Size: 5061 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080817/19f485f8/attachment-0001.bin 
