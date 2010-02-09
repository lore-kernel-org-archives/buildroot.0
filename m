From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Feb 2010 12:21:37 +0100
Subject: [Buildroot] [git commit master] package: remove broken asterisk
	package
Message-ID: <20100209112242.D550677735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=640c74037867690532615650839316feb233a227
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Has been marked as broken for more than one year.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                 |    2 +-
 package/multimedia/Config.in            |    1 -
 package/multimedia/asterisk/Config.in   |   14 -----
 package/multimedia/asterisk/asterisk.mk |   89 -------------------------------
 4 files changed, 1 insertions(+), 105 deletions(-)
 delete mode 100644 package/multimedia/asterisk/Config.in
 delete mode 100644 package/multimedia/asterisk/asterisk.mk

diff --git a/CHANGES b/CHANGES
index c2ff21a..6037b24 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,7 +14,7 @@
 	rpm, sawman, sdl, sdl_ttf, sqlite, sshfs, tremor, u-boot,
 	usb_modeswitch, usbutils, webkit, wpa_supplicant, xfsprogs, zlib
 
-	Removed package: openswan
+	Removed package: asterisk, openswan
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 8a55caf..3305f7b 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -1,7 +1,6 @@
 menu "Audio and video libraries and applications"
 source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
-source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/gstreamer/Config.in"
diff --git a/package/multimedia/asterisk/Config.in b/package/multimedia/asterisk/Config.in
deleted file mode 100644
index 47c1544..0000000
--- a/package/multimedia/asterisk/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_ASTERISK
-	bool "asterisk"
-	depends on BROKEN
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_OPENSSL
-	depends on BR2_PACKAGE_MPG123
-	help
-		Asterisk - the Open Source PBX
-
-comment "asterisk	- disabled (required openssl and mpg123)"
-	depends on !BR2_PACKAGE_OPENSSL || ! BR2_PACKAGE_MPG123
-
-
diff --git a/package/multimedia/asterisk/asterisk.mk b/package/multimedia/asterisk/asterisk.mk
deleted file mode 100644
index 24d5cc5..0000000
--- a/package/multimedia/asterisk/asterisk.mk
+++ /dev/null
@@ -1,89 +0,0 @@
-#############################################################
-#
-# asterisk
-#
-##############################################################
-ASTERISK_VERSION:=1.6.0-beta6
-ASTERISK_SOURCE:=asterisk-$(ASTERISK_VERSION).tar.gz
-ASTERISK_SITE:=http://downloads.digium.com/pub/asterisk/old-releases
-ASTERISK_DIR:=$(BUILD_DIR)/asterisk-$(ASTERISK_VERSION)
-ASTERISK_BINARY:=asterisk
-ASTERISK_TARGET_BINARY:=usr/sbin/asterisk
-
-$(DL_DIR)/$(ASTERISK_SOURCE):
-	$(call DOWNLOAD,$(ASTERISK_SITE),$(ASTERISK_SOURCE))
-
-$(ASTERISK_DIR)/.source: $(DL_DIR)/$(ASTERISK_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(ASTERISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ASTERISK_DIR) package/multimedia/asterisk/ asterisk\*.patch
-	touch $@
-
-$(ASTERISK_DIR)/.configured: $(ASTERISK_DIR)/.source
-	touch $@
-
-$(ASTERISK_DIR)/$(ASTERISK_BINARY): $(ASTERISK_DIR)/.configured
-	$(MAKE1) -C $(ASTERISK_DIR) \
-		CROSS_ARCH=Linux \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		CROSS_COMPILE_BIN=$(STAGING_DIR)/bin/ \
-		CROSS_COMPILE_TARGET=$(STAGING_DIR) \
-		CROSS_PROC=$(OPTIMIZE_FOR_CPU) \
-		OPTIMIZE="$(TARGET_OPTIMIZATION)" \
-		OPTIONS=-DLOW_MEMORY \
-		DEBUG= \
-		$(TARGET_CONFIGURE_OPTS)
-
-$(TARGET_DIR)/$(ASTERISK_TARGET_BINARY): $(ASTERISK_DIR)/$(ASTERISK_BINARY)
-	$(MAKE) -C $(ASTERISK_DIR) \
-		CROSS_ARCH=Linux \
-		CROSS_COMPILE=$(TARGET_CROSS) \
-		CROSS_COMPILE_BIN=$(TARGET_CC) \
-		CROSS_COMPILE_TARGET=$(STAGING_DIR) \
-		CROSS_PROC=$(OPTIMIZE_FOR_CPU) \
-		OPTIMIZE="$(TARGET_OPTIMIZATION)" \
-		OPTIONS=-DLOW_MEMORY \
-		DEBUG= \
-		$(TARGET_CONFIGURE_OPTS) \
-		DESTDIR=$(TARGET_DIR) install
-	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/asterisk
-	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/stereorize
-	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/streamplayer
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) \
-		$(TARGET_DIR)/usr/lib/asterisk/modules/*.so
-	$(INSTALL) -m 755 $(ASTERISK_DIR)/contrib/init.d/rc.debian.asterisk \
-		$(TARGET_DIR)/etc/init.d/S60asterisk
-	mv $(TARGET_DIR)/usr/include/asterisk $(STAGING_DIR)/usr/include/
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -Rf $(TARGET_DIR)/usr/share/man
-endif
-	rm -f $(TARGET_DIR)/usr/sbin/safe_asterisk
-	rm -f $(TARGET_DIR)/usr/sbin/autosupport
-	rm -f $(TARGET_DIR)/usr/sbin/astgenkey
-	touch -c $@
-
-asterisk: ncurses zlib openssl mpg123 $(TARGET_DIR)/$(ASTERISK_TARGET_BINARY)
-
-asterisk-source: $(DL_DIR)/$(ASTERISK_SOURCE)
-
-asterisk-clean:
-	rm -Rf $(STAGING_DIR)/usr/include/asterisk
-	rm -Rf $(TARGET_DIR)/etc/asterisk
-	rm -Rf $(TARGET_DIR)/usr/lib/asterisk
-	rm -Rf $(TARGET_DIR)/var/lib/asterisk
-	rm -Rf $(TARGET_DIR)/var/spool/asterisk
-	rm -f $(TARGET_DIR)/etc/init.d/S60asterisk
-	rm -f $(TARGET_DIR)/usr/sbin/stereorize
-	rm -f $(TARGET_DIR)/usr/sbin/streamplayer
-	-$(MAKE) -C $(ASTERISK_DIR) clean
-
-asterisk-dirclean:
-	rm -rf $(ASTERISK_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_ASTERISK),y)
-TARGETS+=asterisk
-endif
-- 
1.6.3.3
