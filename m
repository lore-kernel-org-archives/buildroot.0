From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Feb 2011 09:14:29 +0100
Subject: [Buildroot] [git commit master 1/1] quagga: fix build with snmp
	support
Message-ID: <20110224081510.1E9AC8F662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fd2bd9e3df276301f867b05bd9f47ab3ab7b4ef4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3277

Quagga's snmp support tries to link with libcrypto from openssl by
default.
That's a bad no no since snmp might have ssl support disabled
and openssl won't be around.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    9 +++++----
 package/quagga/quagga.mk |    4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3858296..687561e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,10 +11,10 @@
 	libcgicc, libdaemon, libdrm, libevent, libgail, libglib2,
 	libgpg-error, libmicrohttpd, librsvg, libsoup, libxcp,
 	makedevs, matchbox-fakekey, matchbox-startup-monitor, mdadm,
-	metacity, mpd, nasm, nfs-utils, olsr, popt, pthread-stubs,
-	quagga, rpm, samba, sdl, sdl_gfx, sdl_image, sdl_mixer,
-	sdl_sound, sdl_ttf, squashfs, taglib, tcpreplay, tiff,
-	wpa_supplicant, xcb-util,
+	metacity, mpd, nasm, nfs-utils, olsr, openssl, popt,
+	pthread-stubs, quagga, rpm, samba, sdl, sdl_gfx, sdl_image,
+	sdl_mixer, sdl_sound, sdl_ttf, squashfs, taglib, tcpreplay,
+	tiff, wpa_supplicant, xcb-util,
 	xdriver_xf86-input-{acepad,aiptek,evdev,joystick,keyboard},
 	xdriver_xf86-input-{mouse,synaptics,void},
 	xdriver_xf86-video-{chips,dummy,geode,glide,intel,nv,wsfb},
@@ -27,6 +27,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#3205: Failing chmod when running "make" in buildroot (openssl)...
+	#3277: quagga fails to build with SNMP support
 	#3283: See why nfs-utils needs fakeroot, and convert to autotools
 
 2011.02-rc1, Released February 14th, 2011:
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index d2b1444..a807f0f 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -67,6 +67,10 @@ endif
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
 QUAGGA_CONF_OPT+=--enable-snmp
 QUAGGA_DEPENDENCIES+=netsnmp
+# SNMP support tries -lcrypto by default, disable it if we ain't got openssl
+ifneq ($(BR2_PACKAGE_OPENSSL),y)
+QUAGGA_CONF_OPT+=--without-crypto
+endif
 else
 QUAGGA_CONF_OPT+=--disable-snmp
 endif
-- 
1.7.3.4
