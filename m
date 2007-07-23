From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:02:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-lib
Message-ID: <20070723120236.83182A6AA7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:02:35 -0700 (Mon, 23 Jul 2007)
New Revision: 19222

Log:
cleanup alsa-lib

Modified:
   trunk/buildroot/package/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-07-23 12:01:05 UTC (rev 19221)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-07-23 12:02:35 UTC (rev 19222)
@@ -3,10 +3,10 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VER:=1.0.14a
-ALSA_LIB_SOURCE:=alsa-lib-$(ALSA_LIB_VER).tar.bz2
+ALSA_LIB_VERSION:=1.0.14a
+ALSA_LIB_SOURCE:=alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE:=ftp://ftp.alsa-project.org/pub/lib
-ALSA_LIB_DIR:=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VER)
+ALSA_LIB_DIR:=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VERSION)
 ALSA_LIB_CAT:=$(BZCAT)
 ALSA_LIB_BINARY:=libasound.so.2.0.0
 ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
@@ -16,12 +16,13 @@
 
 $(ALSA_LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA_LIB_SOURCE)
 	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/alsa-lib/ alsa-lib-$(ALSA_LIB_VER)\*.patch*
+	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/alsa-lib/ alsa-lib-$(ALSA_LIB_VERSION)\*.patch*
 	$(CONFIG_UPDATE) $(ALSA_LIB_DIR)
-	@touch $@
+	touch $@
 
 $(ALSA_LIB_DIR)/.configured: $(ALSA_LIB_DIR)/.unpacked
 	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -36,25 +37,25 @@
 		--disable-docs \
 		$(DISABLE_NLS) \
 	);
-	@touch $@
+	touch $@
 
 $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY): $(ALSA_LIB_DIR)/.configured
 	$(MAKE) -C $(ALSA_LIB_DIR)
-	@touch -c $@
+	touch -c $@
 
 $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY): $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
-	@touch -c $@
+	touch -c $@
 
 $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
-	@mkdir -p $(TARGET_DIR)/usr/share/alsa
-	@mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
+	mkdir -p $(TARGET_DIR)/usr/share/alsa
+	mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
 	cp -dpf  $(STAGING_DIR)/lib/libasound.so*  $(TARGET_DIR)/usr/lib/
 	cp -rdpf $(STAGING_DIR)/usr/share/alsa/*   $(TARGET_DIR)/usr/share/alsa/
 	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libasound.so*
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/alsa-lib/*.so
-	@touch -c $@
+	touch -c $@
 
 alsa-lib: linux26 uclibc $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
 
