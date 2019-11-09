From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Nov 2019 14:51:28 +0100
Subject: [Buildroot] [git commit branch/next] package/php: add option to
 enable libsodium support
Message-ID: <20191109134817.0F0BE8E703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d842d5ded320a4351650c3633b6eb70a4f33243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php/Config.ext | 6 ++++++
 package/php/php.mk     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index c7f0332fd8..0c6ed4b401 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -70,6 +70,12 @@ config BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  HASH message digest framework
 
+config BR2_PACKAGE_PHP_EXT_LIBSODIUM
+	bool "libsodium"
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  libsodium support
+
 config BR2_PACKAGE_PHP_EXT_MCRYPT
 	bool "mcrypt"
 	select BR2_PACKAGE_LIBMCRYPT
diff --git a/package/php/php.mk b/package/php/php.mk
index b679531238..85bf2075ae 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -122,6 +122,11 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_MBSTRING),--enable-mbstring) \
 	$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_LIBSODIUM),y)
+PHP_CONF_OPTS += --with-sodium=$(STAGING_DIR)/usr
+PHP_DEPENDENCIES += libsodium
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
 PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += libmcrypt
