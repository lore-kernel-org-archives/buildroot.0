From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 12:39:39 +0200
Subject: [Buildroot] [git commit] webp: allow to enable demux
Message-ID: <20160603122100.5105F807F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e47638f8dca29b0d9b729edbaeaa11a08f9957fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
