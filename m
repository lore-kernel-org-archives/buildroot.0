From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 13:09:01 -0500
Subject: [Buildroot] [NEXT v3 4/8] libpjsip: enable v4l2 support
In-Reply-To: <20171120180905.5903-1-aduskett@gmail.com>
References: <20171120180905.5903-1-aduskett@gmail.com>
Message-ID: <20171120180905.5903-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Remove the option to enable or disable v4l2 support in favor of
    just depending on libv4l if it's selected by the user.

Changes v2 -> v3:
  - Re-add the option to enable or disable support

 package/libpjsip/Config.in   | 10 ++++++++++
 package/libpjsip/libpjsip.mk |  9 +++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index a1676aa..80b94e4 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -34,6 +34,16 @@ config BR2_PACKAGE_LIBPJSIP_FFMPEG
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
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index d3d00f1..6de12e3 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -41,7 +41,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
-	--disable-v4l2 \
 	--disable-openh264 \
 	--disable-libyuv \
 	--disable-ipp \
@@ -91,4 +90,10 @@ else
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
