From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Apr 2016 10:17:09 -0300
Subject: [Buildroot] [PATCH] mpv: jack/sdl/sdl2 require 64-bit sync
	intrinsics
Message-ID: <1461849429-3365-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/578/578beb2f3b34fc83109e79d8db7de7219dd8340e/
http://autobuild.buildroot.net/results/21c/21ce67041792d29082f5bba76299da19dd1856eb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpv/mpv.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 605e891..1c2498d 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -33,7 +33,8 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth \
 	--disable-vapoursynth-lazy \
-	--disable-vdpau
+	--disable-vdpau \
+	--disable-libmpv-static --disable-static-build
 
 # ALSA support requires pcm+mixer
 ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
@@ -52,7 +53,8 @@ MPV_CONF_OPTS += --disable-gbm
 endif
 
 # jack support
-ifeq ($(BR2_PACKAGE_JACK2),y)
+# It also requires 64-bit sync intrinsics
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_JACK2),yy)
 MPV_CONF_OPTS += --enable-jack
 MPV_DEPENDENCIES += jack2
 else
@@ -166,10 +168,11 @@ endif
 
 # SDL support
 # Both can't be used at the same time, prefer newer API
-ifeq ($(BR2_PACKAGE_SDL2),y)
+# It also requires 64-bit sync intrinsics
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_SDL2),yy)
 MPV_CONF_OPTS += --enable-sdl2 --disable-sdl1
 MPV_DEPENDENCIES += sdl2
-else ifeq ($(BR2_PACKAGE_SDL),y)
+else ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_SDL),yy)
 MPV_CONF_OPTS += --enable-sdl1 --disable-sdl2
 MPV_DEPENDENCIES += sdl
 else
-- 
2.7.3
