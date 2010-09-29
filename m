From: Martin Banky <martin.banky@gmail.com>
Date: Wed, 29 Sep 2010 22:40:31 +0200
Subject: [Buildroot] [git commit master 1/1] liberation: convert to
	gentargets and bump to 1.06.0.20100721
Message-ID: <20100929204138.003D48B770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed947b383ff45ec992b8d51a858e475abd0c6f73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |   24 +++++++++++-----------
 package/liberation/liberation.mk |   39 ++++++++-----------------------------
 2 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/CHANGES b/CHANGES
index 88267a1..907eab1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,18 +27,18 @@
 	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
 	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
 	ifplugd, iperf, iproute2, iptables, jpeg, kexec, kismet, less,
-	libcgi, libcurl, libdaemon, libdnet, libevent, libglade,
-	libgtk2, libiconv, libidn, libmms, libnl, liboil, libpcap,
-	libpng, libtool, libungif, libxml2, libxslt, lighttpd, lite,
-	lm-sensors, logrotate, m4, mdadm, mesa3d, metacity, mtd-utils,
-	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
-	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openvpn,
-	oprofile, pango, patch, pcre, php, pkg-config, prboom, radvd,
-	rdesktop, ruby, qt, samba, sawman, sdl_mixer, sdl_sound,
-	setserial, shared-mime-info, speex, sqlite, squashfs, strace,
-	sylpheed, taglib, tcpdump, thttpd, tiff, tn5250, udev,
-	udpcast, usbmount, usbutils, vsftpd, vtun, which,
-	wpa_supplicant,
+	libcgi, libcurl, libdaemon, libdnet, liberation, libevent,
+	libglade, libgtk2, libiconv, libidn, libmms, libnl, liboil,
+	libpcap, libpng, libtool, libungif, libxml2, libxslt,
+	lighttpd, lite, lm-sensors, logrotate, m4, mdadm, mesa3d,
+	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
+	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
+	openssh, openvpn, oprofile, pango, patch, pcre, php,
+	pkg-config, prboom, radvd, rdesktop, ruby, qt, samba, sawman,
+	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
+	sqlite, squashfs, strace, sylpheed, taglib, tcpdump, thttpd,
+	tiff, tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
+	which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index ad65670..89987d6 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -3,40 +3,19 @@
 # liberation
 #
 #############################################################
-LIBERATION_VERSION = 1.04
+LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
-LIBERATION_SOURCE = liberation-fonts-$(LIBERATION_VERSION).tar.gz
-LIBERATION_DIR = $(BUILD_DIR)/liberation-fonts-$(LIBERATION_VERSION)
-LIBERATION_CAT:=$(ZCAT)
-LIBERATION_TARGET_DIR:=$(TARGET_DIR)/usr/share/fonts/liberation
+LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
-$(DL_DIR)/$(LIBERATION_SOURCE):
-	$(call DOWNLOAD,$(LIBERATION_SITE),$(LIBERATION_SOURCE))
+LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 
-liberation-source: $(DL_DIR)/$(LIBERATION_SOURCE)
-
-$(LIBERATION_DIR)/.unpacked: $(DL_DIR)/$(LIBERATION_SOURCE)
-	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(LIBERATION_TARGET_DIR)/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
+define LIBERATION_INSTALL_TARGET_CMDS
 	mkdir -p $(LIBERATION_TARGET_DIR)
-	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(LIBERATION_TARGET_DIR)
-	touch -c $@
+	$(INSTALL) -m 644 $(@D)/*.ttf $(LIBERATION_TARGET_DIR)
+endef
 
-liberation: $(LIBERATION_TARGET_DIR)/LiberationMono-Bold.ttf
-
-liberation-clean:
+define LIBERATION_CLEAN_CMDS
 	rm -rf $(LIBERATION_TARGET_DIR)
+endef
 
-liberation-dirclean:
-	rm -rf $(LIBERATION_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBERATION),y)
-TARGETS+=liberation
-endif
+$(eval $(call GENTARGETS,package,liberation))
-- 
1.7.1
