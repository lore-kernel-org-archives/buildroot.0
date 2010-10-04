From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 4 Oct 2010 11:44:08 +0200
Subject: [Buildroot] [git commit master 1/1] libeXosip2: convert to
	autotargets and bump to 3.3.0
Message-ID: <20101004094443.539418B8A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=05e4b940c94e883afde697c07a37d8a47c81b33e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |   23 ++++----
 package/libeXosip2/libeXosip2.mk |  109 +++++++------------------------------
 2 files changed, 33 insertions(+), 99 deletions(-)

diff --git a/CHANGES b/CHANGES
index e14801b..96b6397 100644
--- a/CHANGES
+++ b/CHANGES
@@ -31,17 +31,18 @@
 	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
 	ifplugd, iperf, iproute2, iptables, iw, jpeg, kexec, kismet,
 	less, libcgi, libcurl, libdaemon, libdnet, liberation,
-	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
-	liboil, libosip2, libpcap, libpng, libtool, libungif, libxml2,
-	libxslt, lighttpd, lite, lm-sensors, lockfile-progs, logrotate,
-	m4, mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano,
-	nbd, ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
-	ntp, openntpd, openssh, openvpn, oprofile, pango, patch, pcre,
-	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga,
-	samba, sawman, sdl_mixer, sdl_sound, setserial,
-	shared-mime-info, speex, sqlite, squashfs, strace, sylpheed,
-	taglib, tcpdump, thttpd, tiff, tn5250, udev, udpcast,
-	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
+	libevent, libeXosip2, libglade, libgtk2, libiconv, libidn,
+	libmms, libnl, liboil, libosip2, libpcap, libpng, libtool,
+	libungif, libxml2, libxslt, lighttpd, lite, lm-sensors,
+	lockfile-progs, logrotate, m4, mdadm, mesa3d, metacity,
+	mtd-utils, mysql_client, nano, nbd, ncftp, neon, netperf,
+	netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd, openssh,
+	openvpn, oprofile, pango, patch, pcre, php, pkg-config,
+	prboom, radvd, rdesktop, ruby, qt, quagga, samba, sawman,
+	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
+	sqlite, squashfs, strace, sylpheed, taglib, tcpdump, thttpd,
+	tiff, tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
+	which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 30eac9f..415745b 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -3,93 +3,26 @@
 # libeXosip2
 #
 #############################################################
+LIBEXOSIP2_VERSION = 3.3.0
+LIBEXOSIP2_SOURCE = libexosip2_$(LIBEXOSIP2_VERSION).orig.tar.gz
+LIBEXOSIP2_PATCH = libexosip2_$(LIBEXOSIP2_VERSION)-1.diff.gz
+LIBEXOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libe/libexosip2
+LIBEXOSIP2_INSTALL_STAGING = YES
+
+LIBEXOSIP2_DEPENDENCIES = host-pkg-config libosip2
+
+ifneq ($(LIBEXOSIP2_PATCH),)
+define LIBEXOSIP2_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		(cd $(@D)/debian/patches && for i in *; \
+		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBEXOSIP2_VERSION)/,+++ cvs-$(LIBEXOSIP2_VERSION)/,' $$i; \
+		 done; \
+		); \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*; \
+	fi
+endef
+endif
 
-LIBEXOSIP2_VERSION=3.1.0
-LIBEXOSIP2_SOURCE=libeXosip2-$(LIBEXOSIP2_VERSION).tar.gz
-LIBEXOSIP2_SITE=http://www.antisip.com/download/exosip2
-LIBEXOSIP2_DIR=$(BUILD_DIR)/libeXosip2-$(LIBEXOSIP2_VERSION)
-LIBEXOSIP2_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(LIBEXOSIP2_SOURCE):
-	$(call DOWNLOAD,$(LIBEXOSIP2_SITE),$(LIBEXOSIP2_SOURCE))
-
-$(LIBEXOSIP2_DIR)/.unpacked: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
-	$(LIBEXOSIP2_CAT) $(DL_DIR)/$(LIBEXOSIP2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(LIBEXOSIP2_DIR)
-	touch $(LIBEXOSIP2_DIR)/.unpacked
-
-$(LIBEXOSIP2_DIR)/.configured: $(LIBEXOSIP2_DIR)/.unpacked
-	(cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--enable-shared \
-		--enable-static \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(LIBEXOSIP2_DIR)/.compiled: $(LIBEXOSIP2_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBEXOSIP2_DIR)
-	touch $@
-
-#LDFLAGS=$(TARGET_LDFLAGS)
-
-$(STAGING_DIR)/usr/lib/libeXosip2.so: $(LIBEXOSIP2_DIR)/.compiled
-	cp -dpf $(LIBEXOSIP2_DIR)/src/.libs/libeXosip2.so* $(STAGING_DIR)/usr/lib
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libeXosip2.a: $(LIBEXOSIP2_DIR)/.compiled
-	cp -dpf $(LIBEXOSIP2_DIR)/src/.libs/libeXosip2.a $(STAGING_DIR)/usr/lib
-	cp -dpf $(LIBEXOSIP2_DIR)/include/*.h $(STAGING_DIR)/usr/include
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libeXosip2.la: $(LIBEXOSIP2_DIR)/.compiled
-	cp -dpf $(LIBEXOSIP2_DIR)/src/libeXosip2.la $(STAGING_DIR)/usr/lib
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libeXosip2.la
-	touch $@
-
-$(STAGING_DIR)/usr/bin/sip_reg: $(LIBEXOSIP2_DIR)/.compiled
-	cp -dpf $(LIBEXOSIP2_DIR)/tools/.libs/sip_reg $(STAGING_DIR)/usr/bin
-	touch $@
-
-
-$(TARGET_DIR)/usr/lib/libeXosip2.so: $(STAGING_DIR)/usr/lib/libeXosip2.so
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libeXosip2.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libeXosip2.so*
-	touch $@
-
-$(TARGET_DIR)/usr/bin/sip_reg: $(STAGING_DIR)/usr/bin/sip_reg
-	mkdir -p $(TARGET_DIR)/usr/bin
-	cp -dpf $(STAGING_DIR)/usr/bin/sip_reg $(TARGET_DIR)/usr/bin
-	touch $@
-
-
-
-libeXosip2: host-pkg-config libosip2 $(TARGET_DIR)/usr/lib/libeXosip2.so
-
-libeXosip2-source: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
-
-libeXosip2-clean:
-	-$(MAKE) -C $(LIBEXOSIP2_DIR) clean
-	-rm -f $(STAGING_DIR)/usr/lib/libeXosip2.*
-	-rm -f $(TARGET_DIR)/usr/lib/libeXosip2.*
-
-
-libeXosip2-dirclean:
-	rm -rf $(LIBEXOSIP2_DIR)
+LIBEXOSIP2_POST_PATCH_HOOKS += LIBEXOSIP2_DEBIAN_PATCHES
 
-.PHONY: libeXosip2-headers libeXosip2-target-headers
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBEXOSIP2),y)
-TARGETS+=libeXosip2
-endif
+$(eval $(call AUTOTARGETS,package,libeXosip2))
-- 
1.7.1
