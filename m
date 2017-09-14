From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Thu, 14 Sep 2017 16:02:38 +0100
Subject: [Buildroot] [PATCH 3/3] mpv: add support for Raspberry Pi "rpi"
	output
In-Reply-To: <20170914150238.31289-1-mahyar.koshkouei@gmail.com>
References: <20170914150238.31289-1-mahyar.koshkouei@gmail.com>
Message-ID: <20170914150238.31289-2-mahyar.koshkouei@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpv now compiles with the "rpi" video driver that provides hardware
acceleration on the Raspberry Pi.

Tested working on a Raspberry Pi 1 Model B+.

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
---
 .../mpv/0003-rpi-build-Fix-linking-errors.patch    | 43 ++++++++++++++++++++++
 package/mpv/mpv.mk                                 |  9 ++++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 package/mpv/0003-rpi-build-Fix-linking-errors.patch

diff --git a/package/mpv/0003-rpi-build-Fix-linking-errors.patch b/package/mpv/0003-rpi-build-Fix-linking-errors.patch
new file mode 100644
index 0000000000..1f09d73e8e
--- /dev/null
+++ b/package/mpv/0003-rpi-build-Fix-linking-errors.patch
@@ -0,0 +1,43 @@
+From d2ed64023a992be0b2cf2563a086006f5073446b Mon Sep 17 00:00:00 2001
+From: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
+Date: Thu, 14 Sep 2017 09:40:47 +0100
+Subject: [PATCH] rpi build: Fix linking errors
+
+Fixed an issue whereby libbcm_host, libvchostif and libbrcmGLESv2
+libraries were not being linked to, causing undefined references during
+configuration and build stages.
+
+This issue may be reproduced by cross compiling mpv with rpi video
+output enabled "--enable-rpi", using buildroot.
+
+Tested working by compiling and playing 1080p h264 encoded video on a
+Raspberry Pi 1 Model B+.
+
+Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
+---
+Status: pull request https://github.com/mpv-player/mpv/pull/4869
+
+ wscript | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/wscript b/wscript
+index 9d885884d7..e8513d87c9 100644
+--- a/wscript
++++ b/wscript
+@@ -745,10 +745,11 @@ video_output_features = [
+                             "-fgnu89-inline",
+                      linkflags="-L/opt/vc/lib",
+                      header_name="bcm_host.h",
+-                     lib=['mmal_core', 'mmal_util', 'mmal_vc_client', 'bcm_host']),
++                     lib=['mmal_core', 'mmal_util', 'mmal_vc_client',
++                         'bcm_host', 'vchostif']),
+             # We still need all OpenGL symbols, because the vo_opengl code is
+             # generic and supports anything from GLES2/OpenGL 2.1 to OpenGL 4 core.
+-            check_cc(lib="EGL"),
++            check_cc(linkflags="-lbrcmGLESv2", lib="EGL"),
+             check_cc(lib="GLESv2"),
+         ),
+     } , {
+-- 
+2.14.1
+
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 730ced6c64..dfc3fa8f3b 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -26,7 +26,6 @@ MPV_CONF_OPTS = \
 	--disable-cuda-hwaccel \
 	--disable-libv4l2 \
 	--disable-opensles \
-	--disable-rpi \
 	--disable-rsound \
 	--disable-rubberband \
 	--disable-uchardet \
@@ -169,6 +168,14 @@ else
 MPV_CONF_OPTS += --disable-sdl1 --disable-sdl2
 endif
 
+# Raspberry Pi support
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE)$(BR2_PACKAGE_RPI_USERLAND),yy)
+MPV_CONF_OPTS += --enable-rpi --enable-gl
+FFMPEG_DEPENDENCIES += rpi-firmware rpi-userland
+else
+MPV_CONF_OPTS += --disable-rpi
+endif
+
 # va-api support
 # This requires one or more of the egl-drm, wayland, x11 backends
 # For now we support wayland and x11
-- 
2.14.1
