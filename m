From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] libdvdread: needs largefile support
	in toolchain
Message-ID: <20100526122003.C02DE1EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e155ef3cabc89bf229b6653ed374e53a874b3805
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So in turn does libdvdnav and the dvdnav element in gst-plugins-bad.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |   15 ++++++++-------
 package/multimedia/gst-plugins-bad/Config.in |    6 +++++-
 package/multimedia/libdvdnav/Config.in       |    4 ++++
 package/multimedia/libdvdread/Config.in      |    4 ++++
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index f26d8b1..5b78d07 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,13 +4,14 @@
 
 	Updated/fixed packages: aumix, atk, avahi, bmon, busybox, cairo,
 	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
-	gettext, gmpc, gob2, grep, gstreamer, gvfs, hal, iconv, icu,
-	libcgicc, libglade, libglib2, libgtk2, libidn, libmms, libmpd,
-	libpcap, libsoup, lmbench, lsof, ltrace, lvm2, make,
-	metacity, mtd-utils, mutt, nbd, netsnmp, ntp, pango, pciutils,
-	pcmanfm, php, pkg-config, psmisc, qt, samba, shared-mime-info,
-	sshfs, startup-notification, swfdec, sylpheed, uemacs,
-	util-linux, vpnc, webkit, xstroke
+	gettext, gmpc, gob2, grep, gstreamer, gst-plugins-bad, gvfs,
+	hal, iconv, icu, libcgicc, libdvdnav, libdvdread, libglade,
+	libglib2, libgtk2, libidn, libmms, libmpd, libpcap, libsoup,
+	lmbench, lsof, ltrace, lvm2, make, metacity, mtd-utils, mutt,
+	nbd, netsnmp, ntp, pango, pciutils, pcmanfm, php, pkg-config,
+	psmisc, qt, samba, shared-mime-info, sshfs,
+	startup-notification, swfdec, sylpheed, uemacs, util-linux,
+	vpnc, webkit, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 3d2480a..e25b756 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -58,7 +58,11 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV
 	bool "dvdnav"
-        select BR2_PACKAGE_LIBDVDNAV
+	depends on BR2_LARGEFILE # libdvdread
+	select BR2_PACKAGE_LIBDVDNAV
+
+comment "dvdnav requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
diff --git a/package/multimedia/libdvdnav/Config.in b/package/multimedia/libdvdnav/Config.in
index c4d73a0..5ba31e8 100644
--- a/package/multimedia/libdvdnav/Config.in
+++ b/package/multimedia/libdvdnav/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBDVDNAV
 	bool "libdvdnav"
+	depends on BR2_LARGEFILE # libdvdread
         select BR2_PACKAGE_LIBDVDREAD
 	help
 	  libdvdnav is a library that allows easy use of sophisticated
@@ -7,3 +8,6 @@ config BR2_PACKAGE_LIBDVDNAV
 	  playback and even interactive DVD games.
 
 	  http://www.mplayerhq.hu
+
+comment "libdvdnav requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/multimedia/libdvdread/Config.in b/package/multimedia/libdvdread/Config.in
index dea59eb..b63f082 100644
--- a/package/multimedia/libdvdread/Config.in
+++ b/package/multimedia/libdvdread/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDVDREAD
 	bool "libdvdread"
+	depends on BR2_LARGEFILE
 	help
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
 	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
+
+comment "libdvdread requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3
