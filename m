From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 14:34:29 +0100
Subject: [Buildroot] [git commit master 1/1] sed: convert to autotargets
Message-ID: <20101105133442.1C10A8DBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c107a15e92c642ab81737b3faf58345e692feadf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 package/sed/sed.mk |   83 ++++++---------------------------------------------
 2 files changed, 11 insertions(+), 74 deletions(-)

diff --git a/CHANGES b/CHANGES
index 1fdca97..7e841aa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -46,7 +46,7 @@
 	openssl, openvpn, oprofile, pango, patch, pcre, php,
 	pkg-config, portmap, pppd, pptp-linux, prboom, proftpd, radvd,
 	rdesktop, readline, rp-pppoe, ruby, qt, quagga, samba, sawman,
-	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
+	sdl_mixer, sdl_sound, sed, setserial, shared-mime-info, speex,
 	sqlite, squashfs, startup-notification, strace, sylpheed,
 	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
 	udpcast, usbmount, usbutils, vsftpd, vtun, which,
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index d6f53be..1a313eb 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -3,41 +3,11 @@
 # sed
 #
 #############################################################
-SED_VERSION:=4.2.1
-SED_SOURCE:=sed-$(SED_VERSION).tar.gz
-SED_SITE:=$(BR2_GNU_MIRROR)/sed
-SED_CAT:=$(ZCAT)
-SED_DIR2:=$(BUILD_DIR)/sed-$(SED_VERSION)
-SED_BINARY:=sed/sed
-SED_TARGET_BINARY:=bin/sed
-ifeq ($(BR2_LARGEFILE),y)
-SED_CPPFLAGS=-D_FILE_OFFSET_BITS=64
-endif
+SED_VERSION = 4.2.1
+SED_SOURCE = sed-$(SED_VERSION).tar.gz
+SED_SITE = $(BR2_GNU_MIRROR)/sed
 
-$(DL_DIR)/$(SED_SOURCE):
-	mkdir -p $(DL_DIR)
-	$(call DOWNLOAD,$(SED_SITE),$(SED_SOURCE))
-
-sed-source: $(DL_DIR)/$(SED_SOURCE)
-
-$(SED_DIR2)/.unpacked: $(DL_DIR)/$(SED_SOURCE)
-	$(SED_CAT) $(DL_DIR)/$(SED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(SED_DIR2)/build-aux
-	touch $@
-
-$(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
-	(cd $(SED_DIR2); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CPPFLAGS="$(SED_CPPFLAGS)" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
+SED_CONF_OPT = --bindir=/usr/bin \
 		--libdir=/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
@@ -45,45 +15,12 @@ $(SED_DIR2)/.configured: $(SED_DIR2)/.unpacked
 		--localstatedir=/var \
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
-		--include=$(STAGING_DIR)/usr/include \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(SED_DIR2)/$(SED_BINARY): $(SED_DIR2)/.configured
-	$(MAKE) -C $(SED_DIR2)
-
-# This stuff is needed to work around GNU make deficiencies
-sed-target_binary: $(SED_DIR2)/$(SED_BINARY)
-	@if [ -L $(TARGET_DIR)/$(SED_TARGET_BINARY) ]; then \
-		rm -f $(TARGET_DIR)/$(SED_TARGET_BINARY); \
-	fi
-
-	@if [ ! -f $(SED_DIR2)/$(SED_BINARY) \
-	      -o $(TARGET_DIR)/$(SED_TARGET_BINARY) \
-	      -ot $(SED_DIR2)/$(SED_BINARY) ]; then \
-		set -x; \
-		$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(SED_DIR2) install; \
-		mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/; \
-		rm -rf $(TARGET_DIR)/share/locale; \
-		rm -rf $(TARGET_DIR)/usr/share/doc; \
-	fi
+		--include=$(STAGING_DIR)/usr/include
 
-sed: sed-target_binary
+define SED_MOVE_BINARY
+	mv $(TARGET_DIR)/usr/bin/sed $(TARGET_DIR)/bin/
+endef
 
-sed-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC="$(TARGET_CC)" -C $(SED_DIR2) uninstall
-	-$(MAKE) -C $(SED_DIR2) clean
+SED_POST_INSTALL_TARGET_HOOKS = SED_MOVE_BINARY
 
-sed-dirclean:
-	rm -rf $(SED_DIR2)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SED),y)
-TARGETS+=sed
-endif
+$(eval $(call AUTOTARGETS,package,sed))
-- 
1.7.1
