From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Nov 2010 14:22:16 +0100
Subject: [Buildroot] [git commit master 1/1] mplayer: tighten alsa dependency
Message-ID: <20101104132338.347378DAFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=209b3425314a868dca9bb21191881d2252b626e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mplayer needs pcm+mixer support in alsa, but this isn't checked by
configure, so do it in mplayer.mk instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                               |   10 +++++-----
 package/multimedia/mplayer/mplayer.mk |   13 ++++++++++---
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index d92425d..e436f87 100644
--- a/CHANGES
+++ b/CHANGES
@@ -37,11 +37,11 @@
 	libintl, libmms, libmpd, libnl, liboil, libosip2, libpcap,
 	libpng, libtool, libungif, libxml2, libxslt, lighttpd, lite,
 	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
-	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
-	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
-	openssh, openssl, openvpn, oprofile, pango, patch, pcre, php,
-	pkg-config, pppd, prboom, radvd, rdesktop, ruby, qt, quagga,
-	samba, sawman, sdl_mixer, sdl_sound, setserial,
+	metacity, mplayer, mtd-utils, mysql_client, nano, nbd, ncftp,
+	neon, netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp,
+	openntpd, openssh, openssl, openvpn, oprofile, pango, patch,
+	pcre, php, pkg-config, pppd, prboom, radvd, rdesktop, ruby,
+	qt, quagga, samba, sawman, sdl_mixer, sdl_sound, setserial,
 	shared-mime-info, speex, sqlite, squashfs,
 	startup-notification, strace, sylpheed, taglib, tcpdump,
 	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount,
diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index ac3a67e..93e38da 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -11,9 +11,15 @@ MPLAYER_CAT:=$(BZCAT)
 MPLAYER_BINARY:=mplayer
 MPLAYER_TARGET_BINARY:=usr/bin/$(MPLAYER_BINARY)
 
-MPLAYER_DEPENDENCIES = \
-	$(if $(BR2_PACKAGE_LIBMAD),libmad) \
-	$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)
+MPLAYER_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBMAD),libmad)
+
+# mplayer needs pcm+mixer support, but configure fails to check for it
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
+MPLAYER_DEPENDENCIES += alsa-lib
+MPLAYER_ALSA:=--enable-alsa
+else
+MPLAYER_ALSA:=--disable-alsa
+endif
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MPLAYER_ENDIAN:=--enable-big-endian
@@ -84,6 +90,7 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		$(MPLAYER_LARGEFILE) \
 		$(MPLAYER_SDL) \
 		$(MPLAYER_FREETYPE) \
+		$(MPLAYER_ALSA) \
 		--enable-cross-compile \
 		--disable-ivtv \
 		--disable-tv \
-- 
1.7.1
