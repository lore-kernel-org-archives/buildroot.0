From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 14:34:29 +0100
Subject: [Buildroot] [git commit master 1/1] slang: convert to gentargets
Message-ID: <20101105133442.79A308DBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2d925fc790d4c469861df7918bfee63f4043ffbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 +-
 package/slang/slang.mk |   93 +++++++++++++++++++++++------------------------
 2 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/CHANGES b/CHANGES
index 94d13d3..7089561 100644
--- a/CHANGES
+++ b/CHANGES
@@ -46,8 +46,8 @@
 	openssl, openvpn, oprofile, pango, patch, pcre, php,
 	pkg-config, portmap, pppd, pptp-linux, prboom, proftpd, radvd,
 	rdesktop, readline, rp-pppoe, ruby, qt, quagga, samba, sawman,
-	sdl_mixer, sdl_sound, sed, setserial, shared-mime-info, speex,
-	sqlite, squashfs, startup-notification, strace, sylpheed,
+	sdl_mixer, sdl_sound, sed, setserial, shared-mime-info, slang,
+	speex, sqlite, squashfs, startup-notification, strace, sylpheed,
 	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
 	udpcast, usbmount, usbutils, vsftpd, vtun, which,
 	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 43e910b..f6e6eb1 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -3,51 +3,50 @@
 # slang
 #
 #############################################################
-SLANG_VERSION:=1.4.5
-SLANG_SOURCE=slang-$(SLANG_VERSION)-mini.tar.bz2
-SLANG_CAT:=$(BZCAT)
-SLANG_SITE:=http://www.uclibc.org/
-SLANG_DIR=$(BUILD_DIR)/slang-$(SLANG_VERSION)-mini
-
-$(DL_DIR)/$(SLANG_SOURCE):
-	$(call DOWNLOAD,$(SLANG_SITE),$(SLANG_SOURCE))
-
-$(SLANG_DIR): $(DL_DIR)/$(SLANG_SOURCE)
-	$(SLANG_CAT) $(DL_DIR)/$(SLANG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-
-$(SLANG_DIR)/libslang.so: $(SLANG_DIR)
-	$(MAKE1) CFLAGS="-Os -g -fPIC $(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(SLANG_DIR)
-
-$(STAGING_DIR)/usr/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
-	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/usr/lib
-	cp -dpf $(SLANG_DIR)/libslang.so $(STAGING_DIR)/usr/lib
-	cp -dpf $(SLANG_DIR)/slang.h $(STAGING_DIR)/usr/include
-	cp -dpf $(SLANG_DIR)/slcurses.h $(STAGING_DIR)/usr/include
+SLANG_VERSION = 1.4.5
+SLANG_SOURCE = slang-$(SLANG_VERSION)-mini.tar.bz2
+SLANG_SITE = http://www.uclibc.org/
+SLANG_INSTALL_STAGING = YES
+
+define SLANG_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
+
+define SLANG_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/libslang.a $(STAGING_DIR)/usr/lib/libslang.a
+	$(INSTALL) -D -m 0755 $(@D)/libslang.so $(STAGING_DIR)/usr/lib/libslang.so
+	$(INSTALL) -D -m 0644 $(@D)/slang.h $(STAGING_DIR)/usr/include/slang.h
+	$(INSTALL) -D -m 0644 $(@D)/slcurses.h $(STAGING_DIR)/usr/include/slcurses.h
 	(cd $(STAGING_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libslang.so.1: $(STAGING_DIR)/usr/lib/libslang.so.1
-	cp -dpf $(STAGING_DIR)/usr/lib/libslang.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libslang.so*
-
-slang: $(STAGING_DIR)/usr/lib/libslang.so.1 $(TARGET_DIR)/usr/lib/libslang.so.1
-
-slang-source: $(DL_DIR)/$(SLANG_SOURCE)
-
-slang-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libslang.so* $(STAGING_DIR)/usr/lib/libslang.a \
-		$(STAGING_DIR)/usr/include/slang.h \
-		$(STAGING_DIR)/usr/include/slcurses.h
-	-$(MAKE) -C $(SLANG_DIR) clean
-
-slang-dirclean:
-	rm -rf $(SLANG_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SLANG),y)
-TARGETS+=slang
-endif
+endef
+
+define SLANG_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/libslang.a $(TARGET_DIR)/usr/lib/libslang.a
+	$(INSTALL) -D -m 0755 $(@D)/libslang.so $(TARGET_DIR)/usr/lib/libslang.so
+	$(INSTALL) -D -m 0644 $(@D)/slang.h $(TARGET_DIR)/usr/include/slang.h
+	$(INSTALL) -D -m 0644 $(@D)/slcurses.h $(TARGET_DIR)/usr/include/slcurses.h
+	(cd $(TARGET_DIR)/usr/lib; ln -fs libslang.so libslang.so.1)
+endef
+
+define SLANG_UNINSTALL_STAGING_CMDS
+	rm -f $(STAGING_DIR)/usr/lib/libslang.a
+	rm -f $(STAGING_DIR)/usr/lib/libslang.so
+	rm -f $(STAGING_DIR)/usr/lib/libslang.so.1
+	rm -f $(STAGING_DIR)/usr/include/slang.h
+	rm -f $(STAGING_DIR)/usr/include/slcurses.h
+endef
+
+define SLANG_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/libslang.a
+	rm -f $(TARGET_DIR)/usr/lib/libslang.so
+	rm -f $(TARGET_DIR)/usr/lib/libslang.so.1
+	rm -f $(TARGET_DIR)/usr/include/slang.h
+	rm -f $(TARGET_DIR)/usr/include/slcurses.h
+endef
+
+define SLANG_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,slang))
-- 
1.7.1
