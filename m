From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Nov 2017 15:21:06 -0500
Subject: [Buildroot] [NEXT 14/17] libpjsip: add bcg729 codec
In-Reply-To: <20171110202109.25215-1-aduskett@gmail.com>
References: <20171110202109.25215-1-aduskett@gmail.com>
Message-ID: <20171110202109.25215-14-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now add codecs with external dependencies.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libpjsip/Config.in   | 5 +++++
 package/libpjsip/libpjsip.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 884a88bd50..171f34f9cd 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -73,6 +73,11 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
 config BR2_PACKAGE_LIBPJSIP_CODEC_L16
 	bool "L16"
 
+comment "Codecs with external dependencies"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_BCG729
+	bool "BCG729"
+
 endif # BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 2da9a975bc..10c172d419 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -119,4 +119,12 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_L16),y)
 LIBPJSIP_CONF_OPTS += --disable-l16-codec
 endif
 
+# Codecs with external dependencies
+ifeq ($(BR2_PACKAGE_LIBPJSIP_CODEC_BCG729),y)
+LIBPJSIP_DEPENDENCIES += bcg729
+LIBPJSIP_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr/lib
+else
+LIBPJSIP_CONF_OPTS += --disable-bcg729
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
