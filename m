From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:48 -0400
Subject: [Buildroot] [PATCH v4 2/7] libpjsip: add codecs without dependencies
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180312092953.24258-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpjsip has several codecs, all of which can be disabled or enabled
individually. A few reasons for adding each codec as an individual choice
are:

1) Many products might not want some of the more obscure codecs such as
   ILBC or L16.

2) libpjsip has functions that will enumerate all the codecs that were built.
   If all the codecs where built, this would require a developer to have to
   parse out the codecs they don't want.

As such, turn libpjsip into a menuconfig and add each supported codec as an
individual choice.

Start with the codecs that are built into libpjsip and have no external
dependencies.  These codecs are:
- G.711
- G.722
- G.722.1
- iLBC
- L16

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Combine all dependency-less codecs into a single patch.
  - Add a more-detailed commit message explaining the reasoning for
    enabling each codec as a individual option. (Arnout)

Changes v2 -> v3:
  - None

Changes v3 -> v4:
  - None
  
 package/libpjsip/Config.in   | 17 +++++++++++++++++
 package/libpjsip/libpjsip.mk | 32 +++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 0e03ebf7a3..829ed1ede7 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -18,6 +18,23 @@ config BR2_PACKAGE_LIBPJSIP_ALSA
 	bool "alsa support"
 	select BR2_PACKAGE_ALSA_LIB
 
+comment "dependency-less codecs"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_G711
+	bool "G.711"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_G722
+	bool "G.722"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_G7221
+	bool "G.722.1"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
+	bool "iLBC"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_L16
+	bool "L16"
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index a584e8c73a..7b643f5fa5 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -31,15 +31,10 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-video \
 	--disable-opencore-amr \
-	--disable-g7221-codec \
-	--disable-ilbc-codec \
 	--disable-libwebrtc \
 	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
-	--disable-g711-codec \
-	--disable-l16-codec \
-	--disable-g722-codec \
 	--disable-libsamplerate \
 	--disable-sdl \
 	--disable-ffmpeg \
@@ -73,4 +68,31 @@ else
 LIBPJSIP_CONF_OPTS += --disable-sound
 endif
 
+# Codecs can only be disabled. If explicitly enabled, the check is
+# omitted (but successful), and there is no configure trace "Checking
+# if [codec] codec is disabled...no". So we only explicitly disable it
+# and we do not explicitly enable it, so we get the configure log in
+# both cases.
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G711),y)
+LIBPJSIP_CONF_OPTS += --disable-g711-codec
+endif
+
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G722),y)
+LIBPJSIP_CONF_OPTS += --disable-g722-codec
+endif
+
+# libpjsip can only use a bundled version of libg7221
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_G7221),y)
+LIBPJSIP_CONF_OPTS += --disable-g7221-codec
+endif
+
+# libpjsip can only use a bundled version of libilbc
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_ILBC),y)
+LIBPJSIP_CONF_OPTS += --disable-ilbc-codec
+endif
+
+ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_L16),y)
+LIBPJSIP_CONF_OPTS += --disable-l16-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
