From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:00 -0500
Subject: [Buildroot] [NEXT 08/17] libpjsip: add v4l2 option
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-8-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 10 ++++++++++
 package/libpjsip/libpjsip.mk |  7 ++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 1ad7d77f2a..0e21aa65a7 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -44,6 +44,16 @@ config BR2_PACKAGE_LIBPJSIP_FFMPEG
 	help
 	  Enable ffmpeg support
 
+config BR2_PACKAGE_LIBPJSIP_V4L2
+	bool "V4L2 support"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l -> media headers
+	select BR2_PACKAGE_LIBV4L
+	help
+	  Enable Video4Linux2 support
+
+comment "v4l2 support needs headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+
 endif # BR2_PACKAGE_LIBPJSIP_VIDEO
 
 endif # BR2_PACKAGE_LIBPJSIP
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 5421789948..ce0ae59acd 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -40,7 +40,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
-	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
 	--disable-ipp \
@@ -92,4 +91,10 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ffmpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_V4L2),y)
+LIBPJSIP_DEPENDENCIES += libv4l
+else
+LIBPJSIP_CONF_OPTS += --disable-v4l2
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
