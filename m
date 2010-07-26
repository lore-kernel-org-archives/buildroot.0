From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Jul 2010 11:10:03 +0200
Subject: [Buildroot] [git commit master 1/1] swfdec: fix build when no
	libglib2-dev package is installed on host
Message-ID: <20100726091100.3EFE183494@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f44935e4d3719ae1d5e3dcf95d507bda1fe6b8e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure it uses the libglib2-host binaries we are building.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                             |    2 +-
 package/multimedia/swfdec/swfdec.mk |    8 ++++++++
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2b3a071..64a60b3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,7 +24,7 @@
 	linux-fusion, lmbench, lrzsz, ltrace, make, module-init-tools,
 	mplayer, mysql_client, nbd, ncurses, neon, netcat, netperf,
 	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
-	sdl_sound, sdl_ttf, squashfs, thttpd, tn5250, tremor,
+	sdl_sound, sdl_ttf, squashfs, swfdec, thttpd, tn5250, tremor,
 	usbutils, webif, xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
diff --git a/package/multimedia/swfdec/swfdec.mk b/package/multimedia/swfdec/swfdec.mk
index d55568f..58bfd15 100644
--- a/package/multimedia/swfdec/swfdec.mk
+++ b/package/multimedia/swfdec/swfdec.mk
@@ -8,6 +8,9 @@ SWFDEC_VERSION_MINOR = 4
 SWFDEC_VERSION = $(SWFDEC_VERSION_MAJOR).$(SWFDEC_VERSION_MINOR)
 SWFDEC_SOURCE = swfdec-$(SWFDEC_VERSION).tar.gz
 SWFDEC_SITE = http://swfdec.freedesktop.org/download/swfdec/$(SWFDEC_VERSION_MAJOR)
+SWFDEC_MAKE_OPT = \
+	GLIB_MKENUMS=$(HOST_DIR)/usr/bin/glib-mkenums \
+	GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal
 
 SWFDEC_LIBTOOL_PATCH = NO
 SWFDEC_INSTALL_STAGING = YES
@@ -28,3 +31,8 @@ SWFDEC_CONF_OPT += --disable-gtk
 endif
 
 $(eval $(call AUTOTARGETS,package/multimedia,swfdec))
+
+# swfdec uses glib-* at install time
+# Notice: must come after AUTOTARGETS as that's where these variables gets set
+SWFDEC_INSTALL_TARGET_OPT += $(SWFDEC_MAKE_OPT)
+SWFDEC_INSTALL_STAGING_OPT += $(SWFDEC_MAKE_OPT)
-- 
1.7.1
