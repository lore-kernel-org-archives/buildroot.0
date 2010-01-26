From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Jan 2010 13:17:43 +0100
Subject: [Buildroot] [git commit master] sdl: needs tslib to be compiled
	first when selected.
Message-ID: <20100126121837.EF60377665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48b628b8613d5f9a40c426be766285ca1bdaae58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If SDL is built before tslib, then SDL can't detect it at configure
time and so touchscreen's support in SDL is crappy.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 package/sdl/sdl.mk |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8c1b7aa..25b955c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	Updated/fixed packages: autoconf, bind, binutils, bootutils, busybox,
 	directfb, e2fsprogs, gstreamer, gst-plugins-bad, hal, iptables,
 	iw, jpeg, kismet, libfuse, libpcap, libungif, lighttpd, mesa, mpg123,
-	mtd-utils, neon, openvpn, pcre, qt, rpm, sdl_ttf, sqlite, sshfs,
+	mtd-utils, neon, openvpn, pcre, qt, rpm, sdl, sdl_ttf, sqlite, sshfs,
 	tremor, u-boot, usb_modeswitch, usbutils, wpa_supplicant, xfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/sdl/sdl.mk b/package/sdl/sdl.mk
index f66ecc4..959be7e 100644
--- a/package/sdl/sdl.mk
+++ b/package/sdl/sdl.mk
@@ -41,6 +41,10 @@ else
 SDL_X11=--enable-video-x11=no
 endif
 
+ifeq ($(BR2_PACKAGE_TSLIB),y)
+SDL_DEPENDENCIES += tslib
+endif
+
 $(DL_DIR)/$(SDL_SOURCE):
 	$(call DOWNLOAD,$(SDL_SITE),$(SDL_SOURCE))
 
-- 
1.6.3.3
