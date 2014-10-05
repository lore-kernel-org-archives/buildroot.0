From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:58 +0200
Subject: [Buildroot] [PATCH v2 10/16] package/php: Add support for mcrypt
	module
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/Config.ext |    5 +++++
 package/php/php.mk     |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index f745cc9..4649375 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -56,6 +56,11 @@ config BR2_PACKAGE_PHP_EXT_HASH
 	help
 	  HASH message digest framework
 
+config BR2_PACKAGE_PHP_EXT_MCRYPT
+	bool "mcrypt"
+	help
+	  mcrypt support
+
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/php/php.mk b/package/php/php.mk
index 648dc55..0cf4058 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -78,6 +78,11 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath) \
 		$(if $(BR2_PACKAGE_PHP_EXT_PHAR),--enable-phar)
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_MCRYPT),y)
+	PHP_CONF_OPTS += --with-mcrypt=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += libmcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 	PHP_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += openssl
-- 
1.7.10.4
