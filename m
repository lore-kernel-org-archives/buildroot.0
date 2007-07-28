From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:57:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/madplay
Message-ID: <20070728155709.9A6F1A464D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:57:09 -0700 (Sat, 28 Jul 2007)
New Revision: 19294

Log:
Cleanup + ALSA support for madplay

Modified:
   trunk/buildroot/package/madplay/Config.in
   trunk/buildroot/package/madplay/madplay.mk


Changeset:
Modified: trunk/buildroot/package/madplay/Config.in
===================================================================
--- trunk/buildroot/package/madplay/Config.in	2007-07-28 15:43:29 UTC (rev 19293)
+++ trunk/buildroot/package/madplay/Config.in	2007-07-28 15:57:09 UTC (rev 19294)
@@ -4,9 +4,15 @@
 	select BR2_PACKAGE_LIBMAD
 	select BR2_PACKAGE_LIBID3TAG
 	help
-	  MAD is a high-quality fixed-point MPEG audio decoder with
-	  24-bit output. The implementation is entirely new, based on
-	  the ISO/IEC standards, and performs especially well on systems
-	  without native floating-point support.
+	  Command-line front-end to libmad, a high-quality MPEG audio decoder.
+	  It currently supports MPEG-1 and the MPEG-2 extension to lower
+	  sampling frequencies, as well as the de facto MPEG 2.5 format. All
+	  three audio layers ? Layer I, Layer II, and Layer III (i.e. MP3) ?
+	  are fully implemented.
 
 	  http://www.underbit.com/products/mad/
+
+config BR2_PACKAGE_MADPLAY_ALSA
+	bool
+	default y
+	depends on BR2_PACKAGE_MADPLAY && BR2_PACKAGE_ALSA_LIB

Modified: trunk/buildroot/package/madplay/madplay.mk
===================================================================
--- trunk/buildroot/package/madplay/madplay.mk	2007-07-28 15:43:29 UTC (rev 19293)
+++ trunk/buildroot/package/madplay/madplay.mk	2007-07-28 15:57:09 UTC (rev 19294)
@@ -3,52 +3,65 @@
 # madplay
 #
 #############################################################
-
-MADPLAY_VERSION=0.15.2b
-MADPLAY_SOURCE=madplay-$(MADPLAY_VERSION).tar.gz
-MADPLAY_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
-MADPLAY_DIR=$(BUILD_DIR)/madplay-$(MADPLAY_VERSION)
+MADPLAY_VERSION:=0.15.2b
+MADPLAY_SOURCE:=madplay-$(MADPLAY_VERSION).tar.gz
+MADPLAY_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mad
 MADPLAY_CAT:=$(ZCAT)
+MADPLAY_DIR:=$(BUILD_DIR)/madplay-$(MADPLAY_VERSION)
+MADPLAY_BIN:=madplay
+MADPLAY_TARGET_BIN:=usr/bin/$(MADPLAY_BIN)
 
+# Check if ALSA is built, then we should configure after alsa-lib so
+# ./configure can find alsa-lib.
+ifeq ($(strip $(BR2_PACKAGE_MADPLAY_ALSA)),y)
+MADPLAY_USE_ALSA:=--with-alsa
+MADPLAY_ALSA_DEP:=alsa-lib
+endif
+
 $(DL_DIR)/$(MADPLAY_SOURCE):
-	$(WGET) -P $(DL_DIR) $(MADPLAY_SITE)/$(MADPLAY_SOURCE)
+	 $(WGET) -P $(DL_DIR) $(MADPLAY_SITE)/$(MADPLAY_SOURCE)
 
 $(MADPLAY_DIR)/.unpacked: $(DL_DIR)/$(MADPLAY_SOURCE)
 	$(MADPLAY_CAT) $(DL_DIR)/$(MADPLAY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(MADPLAY_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(MADPLAY_DIR) package/madplay madplay\*.patch\*
+	$(CONFIG_UPDATE) $(MADPLAY_DIR)
+	touch $@
 
 $(MADPLAY_DIR)/.configured: $(MADPLAY_DIR)/.unpacked
 	(cd $(MADPLAY_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
+		CFLAGS="$(TARGET_CFLAGS) $(BR2_MADPLAY_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
+		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
+		$(MADPLAY_USE_ALSA) \
 		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
 	);
-	touch $(MADPLAY_DIR)/.configured
+	touch $@
 
-$(MADPLAY_DIR)/src/madplay: $(MADPLAY_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(MADPLAY_DIR)
+$(MADPLAY_DIR)/$(MADPLAY_BIN): $(MADPLAY_DIR)/.configured
+	$(MAKE) -C $(MADPLAY_DIR)
 
-$(MADPLAY_DIR)/.installed: $(MADPLAY_DIR)/src/madplay
-	$(MAKE) -C $(MADPLAY_DIR) DESTDIR=$(TARGET_DIR) install
-	touch $(MADPLAY_DIR)/.installed
+$(TARGET_DIR)/$(MADPLAY_TARGET_BIN): $(MADPLAY_DIR)/$(MADPLAY_BIN)
+	$(INSTALL) -D $(MADPLAY_DIR)/$(MADPLAY_BIN) $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
 
-madplay: uclibc libmad $(MADPLAY_DIR)/.installed
+madplay: uclibc $(MADPLAY_ALSA_DEP) libmad libid3tag $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
 
-madplay-source: $(DL_DIR)/$(MADPLAY_SOURCE)
-
 madplay-clean:
-	@if [ -d $(MADPLAY_DIR)/Makefile ] ; then \
-		$(MAKE) -C $(MADPLAY_DIR) clean ; \
-	fi;
+	rm -f $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
+	$(MAKE) -C $(MADPLAY_DIR) clean
 
 madplay-dirclean:
 	rm -rf $(MADPLAY_DIR)
+
+madplay-source: $(DL_DIR)/$(MADPLAY_SOURCE)
+
 #############################################################
 #
 # Toplevel Makefile options
