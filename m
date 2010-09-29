From: Martin Banky <martin.banky@gmail.com>
Date: Wed, 29 Sep 2010 22:40:31 +0200
Subject: [Buildroot] [git commit master 1/1] lockfile-progs: convert to
	gentargets and bump to 0.1.15
Message-ID: <20100929204138.326888B770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9793ea56615616589e2eccdab65c49aa501c2ed4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: no strip, remove unused _BINARY var]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   18 ++++----
 ...ch => lockfile-progs-0.1.15-sus3v-legacy.patch} |    0
 package/lockfile-progs/lockfile-progs.mk           |   47 +++++--------------
 3 files changed, 22 insertions(+), 43 deletions(-)
 rename package/lockfile-progs/{lockfile-progs-0.1.11-sus3v-legacy.patch => lockfile-progs-0.1.15-sus3v-legacy.patch} (100%)

diff --git a/CHANGES b/CHANGES
index 907eab1..0ce74e4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -30,15 +30,15 @@
 	libcgi, libcurl, libdaemon, libdnet, liberation, libevent,
 	libglade, libgtk2, libiconv, libidn, libmms, libnl, liboil,
 	libpcap, libpng, libtool, libungif, libxml2, libxslt,
-	lighttpd, lite, lm-sensors, logrotate, m4, mdadm, mesa3d,
-	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
-	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
-	openssh, openvpn, oprofile, pango, patch, pcre, php,
-	pkg-config, prboom, radvd, rdesktop, ruby, qt, samba, sawman,
-	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
-	sqlite, squashfs, strace, sylpheed, taglib, tcpdump, thttpd,
-	tiff, tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
-	which, wpa_supplicant,
+	lighttpd, lite, lm-sensors, lockfile-progs, logrotate, m4,
+	mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano, nbd,
+	ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
+	ntp, openntpd, openssh, openvpn, oprofile, pango, patch, pcre,
+	php, pkg-config, prboom, radvd, rdesktop, ruby, qt, samba,
+	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
+	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
+	thttpd, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	vsftpd, vtun, which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch b/package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
similarity index 100%
rename from package/lockfile-progs/lockfile-progs-0.1.11-sus3v-legacy.patch
rename to package/lockfile-progs/lockfile-progs-0.1.15-sus3v-legacy.patch
diff --git a/package/lockfile-progs/lockfile-progs.mk b/package/lockfile-progs/lockfile-progs.mk
index 3925ca3..c7b5565 100644
--- a/package/lockfile-progs/lockfile-progs.mk
+++ b/package/lockfile-progs/lockfile-progs.mk
@@ -3,42 +3,21 @@
 # lockfile-progs
 #
 #############################################################
-LOCKFILE_PROGS_VERSION=0.1.11-0.1
-LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
-LOCKFILE_PROGS_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
-LOCKFILE_PROGS_CAT:=$(ZCAT)
-LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-0.1.11
-LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create
+LOCKFILE_PROGS_VERSION = 0.1.15
+LOCKFILE_PROGS_SOURCE = lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
+LOCKFILE_PROGS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/l/lockfile-progs/
 
-$(DL_DIR)/$(LOCKFILE_PROGS_SOURCE):
-	 $(call DOWNLOAD,$(LOCKFILE_PROGS_SITE),$(LOCKFILE_PROGS_SOURCE))
+define LOCKFILE_PROGS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-lockfile-progs-source: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
+define LOCKFILE_PROGS_INSTALL_TARGET_CMDS
+	cp -a $(@D)/bin/lockfile* $(TARGET_DIR)/usr/bin
+endef
 
-$(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
-	$(LOCKFILE_PROGS_CAT) $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR) package/lockfile-progs/ \*.patch
-	touch $(LOCKFILE_PROGS_DIR)/.unpacked
-
-$(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LOCKFILE_PROGS_DIR)
-	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
-
-lockfile-progs: liblockfile $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
-
-lockfile-progs-clean:
+define LOCKFILE_PROGS_CLEAN_CMDS
 	-rm -f $(TARGET_DIR)/usr/bin/lockfile-*
-	-$(MAKE) -C $(LOCKFILE_PROGS_DIR) clean
-
-lockfile-progs-dirclean:
-	rm -rf $(LOCKFILE_PROGS_DIR)
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LOCKFILE_PROGS),y)
-TARGETS+=lockfile-progs
-endif
+$(eval $(call GENTARGETS,package,lockfile-progs))
-- 
1.7.1
