From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:08 -0500
Subject: [Buildroot] [NEXT 16/17] libpjsip: add opus codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-16-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 4 ++++
 package/libpjsip/libpjsip.mk | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index b58d013d49..8cde5370ae 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -86,6 +86,10 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
 comment "GSM codec needs a toolchain w/ shared libraries"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_OPUS
+	bool "Opus"
+	select BR2_PACKAGE_OPUS
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 14795208b8..c053d5e80b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -30,7 +30,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-resample \
 	--disable-opencore-amr \
 	--disable-libwebrtc \
-	--disable-opus \
 	--disable-ext-sound \
 	--disable-libsamplerate \
 	--disable-sdl \
@@ -133,4 +132,10 @@ else
 LIBPJSIP_CONF_OPTS += --disable-gsm-codec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_OPUS),y)
+LIBPJSIP_DEPENDENCIES += opus
+else
+LIBPJSIP_CONF_OPTS += --disable-opus
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
