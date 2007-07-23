From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 00:54:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-lib
Message-ID: <20070723075415.0C7BDA467A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 00:54:13 -0700 (Mon, 23 Jul 2007)
New Revision: 19196

Log:
Add alsa-lib package

Added:
   trunk/buildroot/package/alsa-lib/
   trunk/buildroot/package/alsa-lib/Config.in
   trunk/buildroot/package/alsa-lib/alsa-lib.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-22 20:09:54 UTC (rev 19195)
+++ trunk/buildroot/package/Config.in	2007-07-23 07:54:13 UTC (rev 19196)
@@ -246,6 +246,7 @@
 	  Support for audio libraries and applications
 
 if BR2_AUDIO_SUPPORT
+source "package/alsa-lib/Config.in"
 source "package/asterisk/Config.in"
 source "package/aumix/Config.in"
 source "package/libid3tag/Config.in"

Added: trunk/buildroot/package/alsa-lib/Config.in
===================================================================
--- trunk/buildroot/package/alsa-lib/Config.in	                        (rev 0)
+++ trunk/buildroot/package/alsa-lib/Config.in	2007-07-23 07:54:13 UTC (rev 19196)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ALSA_LIB
+	bool "alsa-lib"
+	default n
+	help
+	  The Advanced Linux Sound Architecture (ALSA) provides audio and MIDI
+	  functionality to the Linux operating system.
+
+	  http://www.alsa-project.org/

Added: trunk/buildroot/package/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	                        (rev 0)
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007-07-23 07:54:13 UTC (rev 19196)
@@ -0,0 +1,74 @@
+#############################################################
+#
+# alsa-lib
+#
+#############################################################
+ALSA_LIB_VER:=1.0.14a
+ALSA_LIB_SOURCE:=alsa-lib-$(ALSA_LIB_VER).tar.bz2
+ALSA_LIB_SITE:=ftp://ftp.alsa-project.org/pub/lib
+ALSA_LIB_DIR:=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VER)
+ALSA_LIB_CAT:=$(BZCAT)
+ALSA_LIB_BINARY:=libasound.so.2.0.0
+ALSA_LIB_TARGET_BINARY:=usr/lib/$(ALSA_LIB_BINARY)
+
+$(DL_DIR)/$(ALSA_LIB_SOURCE):
+	$(WGET) -P $(DL_DIR) $(ALSA_LIB_SITE)/$(ALSA_LIB_SOURCE)
+
+$(ALSA_LIB_DIR)/.unpacked: $(DL_DIR)/$(ALSA_LIB_SOURCE)
+	$(ALSA_LIB_CAT) $(DL_DIR)/$(ALSA_LIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(ALSA_LIB_DIR) package/alsa-lib/ alsa-lib-$(ALSA_LIB_VER)\*.patch*
+	$(CONFIG_UPDATE) $(ALSA_LIB_DIR)
+	@touch $@
+
+$(ALSA_LIB_DIR)/.configured: $(ALSA_LIB_DIR)/.unpacked
+	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--enable-shared \
+		--enable-static \
+		--disable-docs \
+		$(DISABLE_NLS) \
+	);
+	@touch $@
+
+$(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY): $(ALSA_LIB_DIR)/.configured
+	$(MAKE) -C $(ALSA_LIB_DIR)
+	@touch -c $@
+
+$(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY): $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
+	@touch -c $@
+
+$(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
+	@mkdir -p $(TARGET_DIR)/usr/share/alsa
+	@mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
+	cp -dpf  $(STAGING_DIR)/lib/libasound.so*  $(TARGET_DIR)/usr/lib/
+	cp -rdpf $(STAGING_DIR)/usr/share/alsa/*   $(TARGET_DIR)/usr/share/alsa/
+	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libasound.so*
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/alsa-lib/*.so
+	@touch -c $@
+
+alsa-lib: linux26 uclibc $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
+
+alsa-lib-clean:
+	rm -f $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
+	-$(MAKE) -C $(ALSA_LIB_DIR) clean
+
+alsa-lib-dirclean:
+	rm -rf $(ALSA_LIB_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_ALSA_LIB)),y)
+TARGETS+=alsa-lib
+endif
