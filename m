From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:20:59 -0500
Subject: [Buildroot] [NEXT 07/17] libpjsip: add ffmpeg option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 11 +++++++++++
 package/libpjsip/libpjsip.mk |  8 +++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 20b8568d52..1ad7d77f2a 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -35,6 +35,17 @@ endif # BR2_PACKAGE_LIBPJSIP_SOUND
 config BR2_PACKAGE_LIBPJSIP_VIDEO
 	bool "Enable video"
 
+if BR2_PACKAGE_LIBPJSIP_VIDEO
+
+config BR2_PACKAGE_LIBPJSIP_FFMPEG
+	bool "ffmpeg support"
+	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
+	select BR2_PACKAGE_FFMPEG
+	help
+	  Enable ffmpeg support
+
+endif # BR2_PACKAGE_LIBPJSIP_VIDEO
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index f45d9d1caf..5421789948 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -40,7 +40,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
-	--disable-ffmpeg \
 	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
@@ -86,4 +85,11 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_VIDEO),y)
 LIBPJSIP_CONF_OPTS += --disable-video
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_FFMPEG),y)
+LIBPJSIP_DEPENDENCIES += ffmpeg
+LIBPJSIP_CONF_OPTS += --with-ffmpeg=$(STAGING_DIR)/usr/lib
+else
+LIBPJSIP_CONF_OPTS += --disable-ffmpeg
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
