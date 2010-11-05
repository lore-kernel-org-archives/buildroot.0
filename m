From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] matchbox-common was missing in
	Config.in
Message-ID: <20101105092848.D64498DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c2d6095f9ffb40d73ef0549412092447b7e7d1cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While at it add option to install PDA style desktop folders.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   23 ++++++++++---------
 package/matchbox/Config.in                         |   10 ++++++++
 .../matchbox/matchbox-common/matchbox-common.mk    |    4 +++
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 32bc6a7..8406725 100644
--- a/CHANGES
+++ b/CHANGES
@@ -40,17 +40,18 @@
 	libglade, libgtk2, libiconv, libidn, libintl, libmms, libmpd,
 	libnl, liboil, libosip2, libpcap, libpng, libtool, libungif,
 	libxml2, libxslt, lighttpd, lite, lm-sensors, lockfile-progs,
-	logrotate, m4, mdadm, mesa3d, metacity, mplayer, mtd-utils,
-	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
-	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openssl,
-	openvpn, oprofile, pango, patch, pcre, php, pkg-config,
-	portmap, pppd, pptp-linux, prboom, radvd, rdesktop, readline,
-	rp-pppoe, ruby, qt, quagga, samba, sawman, sdl_mixer, sdl_sound,
-	setserial, shared-mime-info, speex, sqlite, squashfs,
-	startup-notification, strace, sylpheed, sysstat, taglib,
-	tcpdump, thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount,
-	usbutils, vsftpd, vtun, which, wpa_supplicant, xapp_twm,
-	xapp_xbacklight, xapp_xcursorgen, xapp_xinput, xapp_xmore,
+	logrotate, m4, matchbox, mdadm, mesa3d, metacity, mplayer,
+	mtd-utils, mysql_client, nano, nbd, ncftp, neon, netperf,
+	netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd, openssh,
+	openssl, openvpn, oprofile, pango, patch, pcre, php,
+	pkg-config, portmap, pppd, pptp-linux, prboom, radvd,
+	rdesktop, readline, rp-pppoe, ruby, qt, quagga, samba, sawman,
+	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
+	sqlite, squashfs, startup-notification, strace, sylpheed,
+	sysstat, taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev,
+	udpcast, usbmount, usbutils, vsftpd, vtun, which,
+	wpa_supplicant, xapp_twm, xapp_xbacklight, xapp_xcursorgen,
+	xapp_xinput, xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 43189ca..e4b6149 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -22,6 +22,16 @@ config BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  A PDA style application launcher or 'item browser'.
 
+config BR2_PACKAGE_MATCHBOX_COMMON
+	bool "Matchbox session common files"
+	depends on BR2_PACKAGE_MATCHBOX && BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	help
+	  Common desktop folders and matchbox-session script.
+
+config BR2_PACKAGE_MATCHBOX_COMMON_PDA
+	bool "PDA style desktop folders"
+	depends on BR2_PACKAGE_MATCHBOX_COMMON
+
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
 	depends on BR2_PACKAGE_MATCHBOX
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 81a1729..d35d11b 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -9,6 +9,10 @@ MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
 MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
+ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
+	MATCHBOX_COMMON_CONF_OPT += --enable-pda-folders
+endif
+
 #############################################################
 
 $(eval $(call AUTOTARGETS,package/matchbox,matchbox-common))
-- 
1.7.1
