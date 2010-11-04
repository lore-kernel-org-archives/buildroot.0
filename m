From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] gst-plugins-base: tighten alsa
	dependency
Message-ID: <20101104230332.8D8838DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96ddeacb6034c3119da6c9de3fd26114ff31e4d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa support needs pcm+mixer support in alsa, but this isn't checked by
configure, so do it in the .mk instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   37 ++++++++++---------
 .../gst-plugins-base/gst-plugins-base.mk           |   10 ++++-
 2 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6ca25bd..cc22bac 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,24 +29,25 @@
 	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, directfb,
 	dmraid, docker, dosfstools, dropbear, e2fsprogs, expat, ezxml,
 	fbset, fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk,
-	genext2fs, gperf, gst-plugins-ugly, gtk2-themes, gtkperf,
-	gvfs, haserl, hdparm, hostapd, hwdata, ifplugd, imagemagick,
-	iperf, ipsec-tools, iproute2, iptables, iw, jpeg, kexec,
-	kismet, less, libcgi, libcurl, libdaemon, libdnet, liberation,
-	libevent, libeXosip2, libglade, libgtk2, libiconv, libidn,
-	libintl, libmms, libmpd, libnl, liboil, libosip2, libpcap,
-	libpng, libtool, libungif, libxml2, libxslt, lighttpd, lite,
-	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
-	metacity, mplayer, mtd-utils, mysql_client, nano, nbd, ncftp,
-	neon, netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp,
-	openntpd, openssh, openssl, openvpn, oprofile, pango, patch,
-	pcre, php, pkg-config, pppd, prboom, radvd, rdesktop, ruby,
-	qt, quagga, samba, sawman, sdl_mixer, sdl_sound, setserial,
-	shared-mime-info, speex, sqlite, squashfs,
-	startup-notification, strace, sylpheed, taglib, tcpdump,
-	thttpd, tiff, tn5250, torsmo, udev, udpcast, usbmount,
-	usbutils, vsftpd, vtun, which, wpa_supplicant, xapp_twm,
-	xapp_xbacklight, xapp_xcursorgen, xapp_xinput, xapp_xmore,
+	genext2fs, gperf, gst-plugins-base, gst-plugins-ugly,
+	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
+	ifplugd, imagemagick, iperf, ipsec-tools, iproute2, iptables,
+	iw, jpeg, kexec, kismet, less, libcgi, libcurl, libdaemon,
+	libdnet, liberation, libevent, libeXosip2, libglade, libgtk2,
+	libiconv, libidn, libintl, libmms, libmpd, libnl, liboil,
+	libosip2, libpcap, libpng, libtool, libungif, libxml2,
+	libxslt, lighttpd, lite, lm-sensors, lockfile-progs,
+	logrotate, m4, mdadm, mesa3d, metacity, mplayer, mtd-utils,
+	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
+	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openssl,
+	openvpn, oprofile, pango, patch, pcre, php, pkg-config, pppd,
+	prboom, radvd, rdesktop, ruby, qt, quagga, samba, sawman,
+	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
+	sqlite, squashfs, startup-notification, strace, sylpheed,
+	taglib, tcpdump, thttpd, tiff, tn5250, torsmo, udev, udpcast,
+	usbmount, usbutils, vsftpd, vtun, which, wpa_supplicant,
+	xapp_twm, xapp_xbacklight, xapp_xcursorgen, xapp_xinput,
+	xapp_xmore,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 91d9f1b..e91d5fc 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -25,8 +25,14 @@ GST_PLUGINS_BASE_CONF_OPT = \
 		--disable-vorbistest \
 		--disable-freetypetest
 
-GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil \
-		$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)
+GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil
+
+# alsa support needs pcm+mixer support, but configure fails to check for it
+ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
+GST_PLUGINS_BASE_DEPENDENCIES += alsa-lib
+else
+GST_PLUGINS_BASE_CONF_OPT += --disable-alsa
+endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-adder
-- 
1.7.1
