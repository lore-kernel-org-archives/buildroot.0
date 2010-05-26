From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 23:19:44 +0200
Subject: [Buildroot] [git commit master] gst-plugins-base: make sure
	alsa-lib is detected if present
Message-ID: <20100526212219.7128B8F5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50685f1ce37be8bcd38b73ae3470516e9afb2033
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure alsa-lib is built before gst-plugins-base if enabled, so
configure detects the presence of alsa and builds alsasink/src.

Reported-by: Phil Edworthy <Phil.Edworthy@renesas.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   18 +++++++++---------
 .../gst-plugins-base/gst-plugins-base.mk           |    3 ++-
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 83242aa..6dcf97c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,15 +4,15 @@
 
 	Updated/fixed packages: aumix, atk, avahi, bmon, busybox, cairo,
 	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
-	gettext, gmpc, gob2, grep, gstreamer, gst-plugins-bad, gvfs,
-	hal, iconv, icu, libcgicc, libdvdnav, libdvdread, libglade,
-	libglib2, libgtk2, libidn, libmms, libmpd, libpcap, libsoup,
-	lmbench, lsof, ltrace, lvm2, make, metacity, mtd-utils, mutt,
-	nbd, netsnmp, ntfsprogs, ntp, olsr, pango, pciutils, pcmanfm,
-	php, pkg-config, psmisc, qt, samba, shared-mime-info,
-	squashfs, squashfs3, sshfs, startup-notification, swfdec,
-	sylpheed, uemacs, util-linux, valgrind, vpnc, vsftpd, webkit,
-	xstroke
+	gettext, gmpc, gob2, grep, gstreamer, gst-plugins-bad,
+	gst-plugins-base, gvfs, hal, iconv, icu, libcgicc, libdvdnav,
+	libdvdread, libglade, libglib2, libgtk2, libidn, libmms,
+	libmpd, libpcap, libsoup, lmbench, lsof, ltrace, lvm2, make,
+	metacity, mtd-utils, mutt, nbd, netsnmp, ntfsprogs, ntp, olsr,
+	pango, pciutils, pcmanfm, php, pkg-config, psmisc, qt, samba,
+	shared-mime-info, squashfs, squashfs3, sshfs,
+	startup-notification, swfdec, sylpheed, uemacs, util-linux,
+	valgrind, vpnc, vsftpd, webkit, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 4d7f6db..5cb8cb8 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -23,7 +23,8 @@ GST_PLUGINS_BASE_CONF_OPT = \
 		--disable-vorbistest \
 		--disable-freetypetest
 
-GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil
+GST_PLUGINS_BASE_DEPENDENCIES = gstreamer liboil \
+		$(if $(BR2_PACKAGE_ALSA_LIB),alsa-lib)
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_ADDER),y)
 GST_PLUGINS_BASE_CONF_OPT += --enable-adder
-- 
1.6.3.3
