From: Martin Banky <martin.banky@gmail.com>
Date: Mon, 27 Sep 2010 23:14:31 +0200
Subject: [Buildroot] [git commit master 1/1] lm-sensors: convert to
	gentargets and bump to 3.1.2
Message-ID: <20100927211702.2BA078B6F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe35fdcdeccc162db614e79f984fad4d64fdb2bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove stripping]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |   16 +++++-----
 package/lm-sensors/lm-sensors.mk |   64 ++++++++++---------------------------
 2 files changed, 26 insertions(+), 54 deletions(-)

diff --git a/CHANGES b/CHANGES
index 375a8f7..a446905 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,14 +29,14 @@
 	iptables, jpeg, kexec, kismet, less, libcgi, libcurl, libdnet,
 	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
 	liboil, libpcap, libpng, libtool, libungif, libxml2, libxslt,
-	lighttpd, lite, logrotate, m4, mdadm, mesa3d, metacity,
-	mtd-utils, mysql_client, nano, nbd, ncftp, neon, netperf,
-	netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd, openssh,
-	openvpn, oprofile, pango, patch, pcre, php, pkg-config,
-	prboom, radvd, rdesktop, ruby, qt, samba, sawman, sdl_mixer,
-	sdl_sound, setserial, shared-mime-info, speex, sqlite,
-	squashfs, strace, sylpheed, taglib, tcpdump, thttpd, tiff,
-	tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
+	lighttpd, lite, lm-sensors, logrotate, m4, mdadm, mesa3d,
+	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
+	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
+	openssh, openvpn, oprofile, pango, patch, pcre, php,
+	pkg-config, prboom, radvd, rdesktop, ruby, qt, samba, sawman,
+	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
+	sqlite, squashfs, strace, sylpheed, taglib, tcpdump, thttpd,
+	tiff, tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
 	which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 1844f75..9eb8a87 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -3,58 +3,30 @@
 # lm-sensors
 #
 #############################################################
-LM_SENSORS_VERSION:=3.0.2
-LM_SENSORS_SOURCE:=lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
-LM_SENSORS_SITE:=http://dl.lm-sensors.org/lm-sensors/releases
-LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
-LM_SENSORS_CAT:=$(BZCAT)
-LM_SENSORS_BINARY:=prog/sensors/sensors
-LM_SENSORS_TARGET_BINARY:=usr/bin/sensors
+LM_SENSORS_VERSION = 3.1.2
+LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
+LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
+LM_SENSORS_TARGET_BINARY = usr/bin/sensors
 
-$(DL_DIR)/$(LM_SENSORS_SOURCE):
-	$(call DOWNLOAD,$(LM_SENSORS_SITE),$(LM_SENSORS_SOURCE))
+define LM_SENSORS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH) -C $(@D)
+endef
 
-$(LM_SENSORS_DIR)/.unpacked: $(DL_DIR)/$(LM_SENSORS_SOURCE)
-	$(LM_SENSORS_CAT) $(DL_DIR)/$(LM_SENSORS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LM_SENSORS_DIR) package/lm-sensors/ lm-sensors\*.patch
-	touch $@
-
-$(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY): $(LM_SENSORS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) MACHINE=$(KERNEL_ARCH)\
-		-C $(LM_SENSORS_DIR)
-
-$(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
+define LM_SENSORS_INSTALL_TARGET_CMDS
 	if [ ! -f $(TARGET_DIR)/etc/sensors.conf ]; then \
-		cp -dpf $(LM_SENSORS_DIR)/etc/sensors.conf.eg \
-			$(TARGET_DIR)/etc/sensors.conf; \
-		$(SED) '/^#/d' -e '/^[[:space:]]*$$/d' \
-			$(TARGET_DIR)/etc/sensors.conf; \
+		cp -dpf $(@D)/etc/sensors.conf.eg $(TARGET_DIR)/etc/sensors.conf; \
+		$(SED) '/^#/d' -e '/^[[:space:]]*$$/d' $(TARGET_DIR)/etc/sensors.conf; \
 	fi
-	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
-	cp -dpf $(LM_SENSORS_DIR)/lib/libsensors.so* \
-		$(LM_SENSORS_DIR)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/lib/libsensors.so*
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-lm-sensors-source: $(DL_DIR)/$(LM_SENSORS_SOURCE) $(LM_SENSORS_PATCH_FILE)
-
-lm-sensors-unpacked: $(LM_SENSORS_DIR)/.unpacked
-
-lm-sensors: $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+	cp -dpf $(@D)/prog/sensors/sensors $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY)
+	cp -dpf $(@D)/lib/libsensors.so* \
+		$(@D)/lib/libsensors.a $(TARGET_DIR)/usr/lib/
+endef
 
-lm-sensors-clean:
-	-$(MAKE) -C $(LM_SENSORS_DIR) clean
+define LM_SENSORS_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
 	rm -f $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY) \
 		$(TARGET_DIR)/usr/lib/libsensors* \
 		$(TARGET_DIR)/etc/sensors.conf
+endef
 
-lm-sensors-dirclean:
-	rm -rf $(LM_SENSORS_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-TARGETS+=lm-sensors
-endif
+$(eval $(call GENTARGETS,package,lm-sensors))
-- 
1.7.1
