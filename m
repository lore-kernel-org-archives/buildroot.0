From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Wed,  1 Jun 2016 12:38:11 +0900
Subject: [Buildroot] [PATCH 1/1] webp: allow to enable demux
In-Reply-To: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160601033811.6031-4-akihiko.odaki.4i@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
---
 package/webp/Config.in | 8 ++++++++
 package/webp/webp.mk   | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/webp/Config.in b/package/webp/Config.in
index e385b5e..7c4722f 100644
--- a/package/webp/Config.in
+++ b/package/webp/Config.in
@@ -5,3 +5,11 @@ config BR2_PACKAGE_WEBP
 	  compression for images on the web
 
 	  https://developers.google.com/speed/webp/
+
+config BR2_PACKAGE_WEBP_DEMUX
+	bool "webpdemux"
+	depends on BR2_PACKAGE_WEBP
+	help
+	  "Demux" is a part of WebPMux for extraction and manipulation of an
+	  extended format WebP file, which can have features like color profile,
+	  metadata and animation.
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 5f2cab7..b609024 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -17,6 +17,10 @@ WEBP_CONF_OPTS += \
 	--with-tiffincludedir=$(STAGING_DIR)/usr/include \
 	--with-tifflibdir=$(STAGING_DIR)/usr/lib
 
+ifeq ($(BR2_PACKAGE_WEBP_DEMUX),y)
+WEBP_CONF_OPTS += --enable-libwebpdemux
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WEBP_DEPENDENCIES += libpng
 WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
-- 
2.8.3
