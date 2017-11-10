From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:09 -0500
Subject: [Buildroot] [NEXT 17/17] libpjsip: add speex codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-17-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 4 ++++
 package/libpjsip/libpjsip.mk | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 8cde5370ae..3e410d4f02 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -90,6 +90,10 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_OPUS
 	bool "Opus"
 	select BR2_PACKAGE_OPUS
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX
+	bool "Speex"
+	select BR2_PACKAGE_SPEEX
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index c053d5e80b..87339fd067 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,8 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
 	--disable-opencore-amr \
 	--disable-libwebrtc \
@@ -138,4 +136,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-opus
 endif
 
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
