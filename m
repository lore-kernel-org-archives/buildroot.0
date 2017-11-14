From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 11:07:09 -0500
Subject: [Buildroot] [NEXT v2 4/7] libpjsip: enable ffmpeg support
In-Reply-To: <20171114160712.20086-1-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
Message-ID: <20171114160712.20086-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If FFmpeg is selected, libpjsip should depend on it.
Specifying --with-ffmpeg= is necessary because passing --enable-FFmpeg
actually disables FFmpeg when cross compiling.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable FFmpeg support in favor of
    just depending on FFmpeg if it's selected by the user.
  - Add explination as to why with-ffmpeg is being passed to libpjsip (Arnout)

 package/libpjsip/libpjsip.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 3c9d789..982e088 100644
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
@@ -41,7 +40,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
-	--disable-ffmpeg \
 	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
@@ -75,4 +73,13 @@ LIBPJSIP_DEPENDENCIES += portaudio
 LIBPJSIP_CONF_OPTS += --with-external-pa
 endif
 
+# Passing --enable-ffmpeg actually disables it. Instead, --with-ffmpeg
+# must be passed to compile ffmpeg support.
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+LIBPJSIP_DEPENDENCIES += ffmpeg
+LIBPJSIP_CONF_OPTS += --with-ffmpeg=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-ffmpeg
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
