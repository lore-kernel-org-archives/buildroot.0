From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Mar 2018 05:29:49 -0400
Subject: [Buildroot] [PATCH v4 3/7] libpjsip: enable bcg729 codec
In-Reply-To: <20180312092953.24258-1-aduskett@gmail.com>
References: <20180312092953.24258-1-aduskett@gmail.com>
Message-ID: <20180312092953.24258-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v4:
  - Add each codec with a dependency as a seperate patch.

 package/libpjsip/Config.in   | 6 ++++++
 package/libpjsip/libpjsip.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 829ed1ede7..123eceae06 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -35,6 +35,12 @@ config BR2_PACKAGE_LIBPJSIP_CODEC_ILBC
 config BR2_PACKAGE_LIBPJSIP_CODEC_L16
 	bool "L16"
 
+comment "Codecs with external dependencies"
+
+config BR2_PACKAGE_LIBPJSIP_CODEC_BCG729
+	bool "BCG729"
+	select BR2_PACKAGE_BCG729
+
 endif #BR2_PACKAGE_LIBPJSIP
 
 comment "libpjsip needs a toolchain w/ C++, threads"
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 7b643f5fa5..67c8ad0dfd 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -95,4 +95,12 @@ ifneq ($(BR2_PACKAGE_LIBPJSIP_CODEC_L16),y)
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
 $(eval $(autotools-package))
-- 
2.14.3
