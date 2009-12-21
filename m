From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:19:15 +0000
Subject: [Buildroot] [PATCH 1/1] * Allow neon to be configured with SSL
	support
In-Reply-To: <cover.1261379953.git.nkukard@lbsd.net>
References: <cover.1261379953.git.nkukard@lbsd.net>
Message-ID: <39e2f50fb0967fd3b559e27939014ebeb9ea6d09.1261379953.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 package/neon/Config.in |    6 ++++++
 package/neon/neon.mk   |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index ce72a2f..318e4c6 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -12,6 +12,12 @@ config BR2_PACKAGE_NEON_ZLIB
 	help
 	  build with ZLIB support
 
+config BR2_PACKAGE_NEON_SSL
+	bool "SSL support"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  build with SSL support
+
 choice
 	prompt "XML Support"
 	default BR2_PACKAGE_NEON_NOXML
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1f26a0c..ed5f999 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -22,6 +22,12 @@ NEON_DEPENDENCIES+=zlib
 else
 NEON_CONF_OPT+=--without-zlib
 endif
+ifeq ($(BR2_PACKAGE_NEON_SSL),y)
+NEON_CONF_OPT+=--with-ssl
+NEON_DEPENDENCIES+=openssl
+else
+NEON_CONF_OPT+=--without-ssl
+endif
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
 NEON_CONF_OPT+=--with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
 NEON_CONF_OPT+=--with-libxml2=no
-- 
1.6.4
