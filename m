From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:07 -0500
Subject: [Buildroot] [NEXT 15/17] libpjsip: add gsm codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-15-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 8 ++++++++
 package/libpjsip/libpjsip.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 171f34f9cd..b58d013d49 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -78,6 +78,14 @@ comment "Codecs with external dependencies"
 config BR2_PACKAGE_LIBPJSIP_CODEC_BCG729
 	bool "BCG729"
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
+	bool "GSM"
+	depends on !BR2_STATIC_LIBS # libgsm
+	select BR2_PACKAGE_LIBGSM
+
+comment "GSM codec needs a toolchain w/ shared libraries"
+	depends on BR2_STATIC_LIBS
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 10c172d419..14795208b8 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
 	--disable-resample \
@@ -127,4 +126,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-bcg729
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_GSM),y)
+LIBPJSIP_DEPENDENCIES += libgsm
+LIBPJSIP_CONF_OPTS += --with-external-gsm
+else
+LIBPJSIP_CONF_OPTS += --disable-gsm-codec
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
