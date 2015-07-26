From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:32 +0200
Subject: [Buildroot] [RFC 22/37] package/libevas-generic-loaders: add libraw
	dependency
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-23-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/libevas-generic-loaders/Config.in                  | 5 +++++
 package/libevas-generic-loaders/libevas-generic-loaders.mk | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libevas-generic-loaders/Config.in b/package/libevas-generic-loaders/Config.in
index ffa23ce..071b214 100644
--- a/package/libevas-generic-loaders/Config.in
+++ b/package/libevas-generic-loaders/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
 if BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 
+config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW
+	bool "Libraw loader"
+	help
+	  This option enables the Evas generic Libraw loader
+
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	bool "SVG loader"
 	select BR2_PACKAGE_LIBRSVG
diff --git a/package/libevas-generic-loaders/libevas-generic-loaders.mk b/package/libevas-generic-loaders/libevas-generic-loaders.mk
index 4b31305..7397111 100644
--- a/package/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -14,14 +14,19 @@ LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
 LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = efl zlib
 
-# For now, we only support the SVG loader
 # poppler >= 0.32 is not supported with libevas-generic-loaders 1.14.0
 LIBEVAS_GENERIC_LOADERS_CONF_OPTS += \
 	--disable-poppler \
 	--disable-spectre \
-	--disable-libraw \
 	--disable-gstreamer
 
+ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_LIBRAW),y)
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += libraw
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-libraw
+else
+LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --disable-libraw
+endif
+
 ifeq ($(BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG),y)
 LIBEVAS_GENERIC_LOADERS_DEPENDENCIES += librsvg cairo
 LIBEVAS_GENERIC_LOADERS_CONF_OPTS += --enable-svg
-- 
2.4.3
