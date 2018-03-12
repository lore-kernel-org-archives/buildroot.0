From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:50 -0400
Subject: [Buildroot] [PATCH v4 4/7] libpjsip: enable gsm codec
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180312092953.24258-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add each codec with a dependency as a seperate patch.

 package/libpjsip/Config.in   | 8 ++++++++
 package/libpjsip/libpjsip.mk | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 123eceae06..45b05cf2b2 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -41,6 +41,14 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_BCG729
 	bool "BCG729"
 	select BR2_PACKAGE_BCG729
 
+config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
+	bool "GSM"
+	depends on !BR2_STATIC_LIBS # libgsm
+	select BR2_PACKAGE_LIBGSM
+
+comment "GSM codec needs a toolchain w/ shared libraries"
+	depends on BR2_STATIC_LIBS
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 67c8ad0dfd..64cdb08d01 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -25,7 +25,6 @@ LIBPJSIP_CONF_ENV = \
 	CFLAGS="$(LIBPJSIP_CFLAGS)"
 
 LIBPJSIP_CONF_OPTS = \
-	--disable-gsm-codec \
 	--disable-speex-codec \
 	--disable-speex-aec \
 	--disable-resample \
@@ -103,4 +102,11 @@ else
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
2.14.3
