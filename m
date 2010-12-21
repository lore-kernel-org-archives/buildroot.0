From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Dec 2010 14:20:17 +0100
Subject: [Buildroot] [git commit master 1/1] xlib_libX11: compile makekeys
	for the host correctly
Message-ID: <20101221132035.52CDD8E148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eb56385b24b590b22951b4499bf3bad4a563433c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Miroslav Ignjatovic in bug #2983, our hack in
xlib_libX11 to build makekeys for the host does not work, for several
reasons:

 * As we are building a tool for the host, we shouldn't pass
   -I$(STAGING_DIR)/usr/include, since the $(STAGING_DIR) contains
   headers of packages for the target.

 * Instead, we should use the headers in $(HOST_DIR)/usr/include. They
   were not used due to a typo: $(HOST_CFLAGS) must be used instead of
   $(HOSTCFLAGS).

 * Finally, in order for makekeys to find the required headers in
   $(HOST_DIR)/usr/include, we must depend on host-xproto_xproto.

This fixes bug #2983.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    5 +++--
 package/x11r7/xlib_libX11/xlib_libX11.mk |    5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 45d2830..846183d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	hostapd, i2c-tools, input-tools, libaio, libconfig, libtheora,
 	lsof, ltp-testsuite, lvm2, m4, memtester, mii-diag, mplayer,
 	mrouted, netplug, openssh, openssl, openvpn, pango, qt, rsync,
-	sdl_gfx, sdl_sound, sysklogd, sysvinit, udev, usbutils, xz,
-	zlib
+	sdl_gfx, sdl_sound, sysklogd, sysvinit, udev, usbutils,
+	xlib_libX11, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone,
 	xl2tp
@@ -23,6 +23,7 @@
 	#1651: Build fail caused by ccache in module-init-tools
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
+	#2983: xlib_libX11 build failed
 
 2010.11, Released November 30th, 2010:
 
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index c95d654..1acc35c 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -9,7 +9,7 @@ XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
 XLIB_LIBX11_INSTALL_STAGING = YES
-XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto
+XLIB_LIBX11_DEPENDENCIES = libxcb xutil_util-macros xlib_xtrans xlib_libXau xlib_libXdmcp xproto_kbproto xproto_xproto xproto_xextproto xproto_inputproto xproto_xf86bigfontproto xproto_bigreqsproto xproto_xcmiscproto host-xproto_xproto
 XLIB_LIBX11_CONF_OPT = \
 	--disable-malloc0returnsnull \
 	--with-xcb \
@@ -33,8 +33,7 @@ endef
 XLIB_LIBX11_POST_EXTRACT_HOOKS += XLIB_LIBX11_DISABLE_MAKEKEYS_BUILD
 
 define XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-	cd $(@D)/src/util && $(HOSTCC) $(HOSTCFLAGS) \
-		-I$(STAGING_DIR)/usr/include -o makekeys makekeys.c
+	cd $(@D)/src/util && $(HOSTCC) $(HOST_CFLAGS) -o makekeys makekeys.c
 endef
 
 XLIB_LIBX11_POST_CONFIGURE_HOOKS += XLIB_LIBX11_BUILD_MAKEKEYS_FOR_HOST
-- 
1.7.2.2
