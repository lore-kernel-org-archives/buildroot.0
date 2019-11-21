From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu, 21 Nov 2019 09:13:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/php: libargon2 support
Message-ID: <20191121081304.2932-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/php/Config.ext | 6 ++++++
 package/php/php.mk     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 0c6ed4b..d5c723c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -70,6 +70,12 @@ config BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  HASH message digest framework
 
+config BR2_PACKAGE_PHP_EXT_LIBARGON2
+	bool "libargon2"
+	select BR2_PACKAGE_LIBARGON2
+	help
+	  libargon2 support
+
 config BR2_PACKAGE_PHP_EXT_LIBSODIUM
 	bool "libsodium"
 	select BR2_PACKAGE_LIBSODIUM
diff --git a/package/php/php.mk b/package/php/php.mk
index 85bf207..007b8a6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -122,6 +122,11 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
 	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_LIBARGON2),y)
+PHP_CONF_OPTS += --with-password-argon2=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += libargon2
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBSODIUM),y)
 PHP_CONF_OPTS += --with-sodium=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libsodium
-- 
2.7.4
