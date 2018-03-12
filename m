From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:51 -0400
Subject: [Buildroot] [PATCH v4 5/7] libpjsip: enable opencore-amr codec
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180312092953.24258-5-aduskett@gmail.com>
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
 package/libpjsip/libpjsip.mk | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 45b05cf2b2..a7bbd866ea 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -49,6 +49,10 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
 comment "GSM codec needs a toolchain w/ shared libraries"
 	depends on BR2_STATIC_LIBS
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR
+	bool "Opencore-amr"
+	select BR2_PACKAGE_OPENCORE_AMR
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 64cdb08d01..2ea0da3f77 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -29,7 +29,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-speex-aec \
 	--disable-resample \
 	--disable-video \
-	--disable-opencore-amr \
 	--disable-libwebrtc \
 	--disable-opus \
 	--disable-oss \
@@ -109,4 +108,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-gsm-codec
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_OPENCORE_AMR),y)
+LIBPJSIP_DEPENDENCIES += opencore-amr
+LIBPJSIP_CONF_OPTS += --with-opencore-amr
+else
+LIBPJSIP_CONF_OPTS += --disable-opencore-amr
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
