From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Nov 2017 13:09:03 -0500
Subject: [Buildroot] [NEXT v3 6/8] libpjsip: add codecs with dependencies
In-Reply-To: <20171120180905.5903-1-aduskett@gmail.com>
References: <20171120180905.5903-1-aduskett@gmail.com>
Message-ID: <20171120180905.5903-6-aduskett@gmail.com>
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
- opencore-amr

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Combine all codecs with external dependencies into a single patch.
  
Changes v2 -> v3:
  - Add opencore-amr codec.

 package/libpjsip/Config.in   | 26 ++++++++++++++++++++++++++
 package/libpjsip/libpjsip.mk | 40 +++++++++++++++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 7fb5a87..64e0257 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -61,6 +61,32 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
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
+config BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR
+	bool "Opencore-amr"
+	select BR2_PACKAGE_OPENCORE_AMR
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
index 48edf62..d16d060 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,13 +25,8 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-gsm-codec \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
-	--disable-opencore-amr \
 	--disable-libwebrtc \
-	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
 	--disable-libsamplerate \
@@ -118,4 +113,39 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_L16),y)
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
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR),y)
+LIBPJSIP_DEPENDENCIES += opencore-amr
+LIBPJSIP_CONF_OPTS += --with-opencore-amr
+else
+LIBPJSIP_CONF_OPTS += --disable-opencore-amr
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
