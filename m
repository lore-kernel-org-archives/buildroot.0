From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:53 -0400
Subject: [Buildroot] [PATCH v4 7/7] libpjsip: enable speex codec
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180312092953.24258-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add each codec with a dependency as a seperate patch.

 package/libpjsip/Config.in   | 4 ++++
 package/libpjsip/libpjsip.mk | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 028339f319..3687d51824 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -57,6 +57,10 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_OPUS
 	bool "Opus"
 	select BR2_PACKAGE_OPUS
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_SPEEX
+	bool "Speex"
+	select BR2_PACKAGE_SPEEX
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 943a99bc5a..e4b859257b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,8 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-speex-codec \
-	--disable-speex-aec \
 	--disable-resample \
 	--disable-video \
 	--disable-libwebrtc \
@@ -120,4 +118,11 @@ else
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
2.14.3
