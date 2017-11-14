From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 14 Nov 2017 11:07:12 -0500
Subject: [Buildroot] [NEXT v2 7/7] libpjsip: add codecs with dependencies
In-Reply-To: <20171114160712.20086-1-aduskett@gmail.com>
References: <20171114160712.20086-1-aduskett@gmail.com>
Message-ID: <20171114160712.20086-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add all supported codecs that rely on external dependencies. These codecs are:
- bcg729
- gsm
- opus
- speex

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Combine all codecs with external dependencies into a single patch.

 package/libpjsip/Config.in   | 22 ++++++++++++++++++++++
 package/libpjsip/libpjsip.mk | 32 ++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index d21a5b5..ef05dea 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -29,6 +29,28 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
 config BR2_PACKAGE_LIBPJSIP_CODEC_L16
 	bool "L16"
 
+comment "Codecs with external dependencies"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_BCG729
+	bool "BCG729"
+	select BR2_PACKAGE_BCG729
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
+	bool "GSM"
+	depends on !BR2_STATIC_LIBS # libgsm
+	select BR2_PACKAGE_LIBGSM
+
+comment "GSM codec needs a toolchain w/ shared libraries"
+	depends on BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_OPUS
+	bool "Opus"
+	select BR2_PACKAGE_OPUS
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX
+	bool "Speex"
+	select BR2_PACKAGE_SPEEX
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 69d412a..cfdb3af 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,13 +25,9 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-gsm-codec \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
 	--disable-opencore-amr \
 	--disable-libwebrtc \
-	--disable-opus \
 	--disable-oss \
 	--disable-libsamplerate \
 	--disable-sdl \
@@ -109,4 +105,32 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_L16),y)
 LIBPJSIP_CONF_OPTS += --disable-l16-codec
 endif
 
+# Codecs with external dependencies
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_BCG729),y)
+LIBPJSIP_DEPENDENCIES += bcg729
+LIBPJSIP_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-bcg729
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
+LIBPJSIP_DEPENDENCIES += libgsm
+LIBPJSIP_CONF_OPTS += --with-external-gsm
+else
+LIBPJSIP_CONF_OPTS += --disable-gsm-codec
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_OPUS),y)
+LIBPJSIP_DEPENDENCIES += opus
+else
+LIBPJSIP_CONF_OPTS += --disable-opus
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX),y)
+LIBPJSIP_DEPENDENCIES += speex
+LIBPJSIP_CONF_OPTS += --with-external-speex
+else
+LIBPJSIP_CONF_OPTS += --disable-speex-codec --disable-speex-aec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
