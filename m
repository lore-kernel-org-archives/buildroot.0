From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri,  8 Nov 2019 09:21:12 +0100
Subject: [Buildroot] [PATCH 3/3] php: libargon2 support
In-Reply-To: <20191108082112.5541-1-p.debruijn@unilogic.nl>
References: <20191108082112.5541-1-p.debruijn@unilogic.nl>
Message-ID: <20191108082112.5541-3-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/php/Config.ext | 6 ++++++
 package/php/php.mk     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 0c6ed4b401..d5c723ca39 100644
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
index 85bf2075ae..007b8a64c3 100644
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
2.17.1
