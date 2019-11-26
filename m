From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 23:26:19 +0100
Subject: [Buildroot] [git commit branch/next] package/php: add option for
 libargon2 support
Message-ID: <20191126221851.05B6C815B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d229c12acd904313d026fdedaa63c03dc3a3dd4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
