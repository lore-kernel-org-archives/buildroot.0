From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 13:09:00 -0500
Subject: [Buildroot] [NEXT v3 3/8] libpjsip: enable ffmpeg support
In-Reply-To: <20171120180905.5903-1-aduskett@gmail.com>
References: <20171120180905.5903-1-aduskett@gmail.com>
Message-ID: <20171120180905.5903-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-video has no effect at all on Linux (only on Android and Darwin).
--disable-video has the effect of disabling SDL, FFmpeg, v4l2, openh264, and
libyuv. Since all of these are enabled/disabled explicitly already, there is no
need to specify --disable-video. To do so correctly is non-trivial when we want
to support e.g. FFmpeg OR v4l2.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable FFmpeg support in favor of
    just depending on FFmpeg if it's selected by the user.
  - Add explination as to why with-ffmpeg is being passed to libpjsip (Arnout)
  
Changes v2 -> v3:
  - Re-add the option to enable or disable support
  - Add a better commit message (Arnout)
  - Add a more thorough comment in the make file explaining why passing
    --enable-ffmpeg actually disables it. (Arnout)
  - Remove the =$(STAGING_DIR)/usr from --with-ffmpeg (Arnout)

 package/libpjsip/Config.in   |  9 +++++++++
 package/libpjsip/libpjsip.mk | 14 +++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 4d4777a..a1676aa 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -25,6 +25,15 @@ config BR2_PACKAGE_LIBPJSIP_PORTAUDIO
 	# disable sound, which would be useless.
 	select BR2_PACKAGE_LIBPJSIP_ALSA
 
+comment "video"
+
+config BR2_PACKAGE_LIBPJSIP_FFMPEG
+	bool "ffmpeg support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	select BR2_PACKAGE_FFMPEG
+	help
+	  Enable ffmpeg support
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 850b3c0..d3d00f1 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-speex-codec \
 	--disable-speex-aec \
 	--disable-resample \
-	--disable-video \
 	--disable-opencore-amr \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
@@ -42,7 +41,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
-	--disable-ffmpeg \
 	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
@@ -81,6 +79,16 @@ else
 LIBPJSIP_CONF_OPTS += --without-external-pa
 endif
 
-
+# When --enable-ffmpeg is given, the code to enable FFmpeg is not executed.
+# Also, when cross-compiling and no --with-ffmpeg option is given, FFmpeg is
+# disabled. Therefore, a --with-ffmpeg option needs to be given. Normally it
+# is used to pass the path to the directory where FFmpeg is installed, but
+# since we install it directly under sysroot we can pass it empty.
+ifeq ($(BR2_PACKAGE_LIBPJSIP_FFMPEG),y)
+LIBPJSIP_DEPENDENCIES += ffmpeg
+LIBPJSIP_CONF_OPTS += --with-ffmpeg
+else
+LIBPJSIP_CONF_OPTS += --disable-ffmpeg
+endif
 
 $(eval $(autotools-package))
-- 
2.13.6
