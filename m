From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 11 Oct 2016 16:44:49 -0400
Subject: [Buildroot] [PATCH 1/2] php-amqp: new package
Message-ID: <1476218690-23978-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/Config.in              |  1 +
 package/php-amqp/Config.in     | 14 ++++++++++++++
 package/php-amqp/php-amqp.hash |  2 ++
 package/php-amqp/php-amqp.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/php-amqp/Config.in
 create mode 100644 package/php-amqp/php-amqp.hash
 create mode 100644 package/php-amqp/php-amqp.mk

diff --git a/package/Config.in b/package/Config.in
index 60184ce..f84327d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -623,6 +623,7 @@ endif
 if BR2_PACKAGE_PHP
 if !BR2_STATIC_LIBS
 menu "External php extensions"
+	source "package/php-amqp/Config.in"
 	source "package/php-geoip/Config.in"
 	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
diff --git a/package/php-amqp/Config.in b/package/php-amqp/Config.in
new file mode 100644
index 0000000..253bfa7
--- /dev/null
+++ b/package/php-amqp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PHP_AMQP
+	bool "php-amqp"
+	depends on BR2_PACKAGE_PHP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # rabbitmq-c
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX # rabbitmq-c
+	select BR2_PACKAGE_RABBITMQ_C
+	help
+	  Communicate with any AMQP compliant server.
+
+	  http://pecl.php.net/package/amqp
+
+comment "php-amqp needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
diff --git a/package/php-amqp/php-amqp.hash b/package/php-amqp/php-amqp.hash
new file mode 100644
index 0000000..73c69d9
--- /dev/null
+++ b/package/php-amqp/php-amqp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 38a92eaef1aa863404170bcd15605f7f78140eeec1ff5be6af65c5b8081e2599  amqp-1.7.1.tgz
diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
new file mode 100644
index 0000000..d3ffe16
--- /dev/null
+++ b/package/php-amqp/php-amqp.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-amqp
+#
+################################################################################
+
+PHP_AMQP_VERSION = 1.7.1
+PHP_AMQP_SOURCE = amqp-$(PHP_AMQP_VERSION).tgz
+PHP_AMQP_SITE = https://pecl.php.net/get
+PHP_AMQP_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-amqp=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_AMQP_DEPENDENCIES = rabbitmq-c php host-autoconf
+PHP_AMQP_LICENSE = PHP
+PHP_AMQP_LICENSE_FILES = LICENSE
+
+define PHP_AMQP_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_AMQP_PRE_CONFIGURE_HOOKS += PHP_AMQP_PHPIZE
+
+$(eval $(autotools-package))
-- 
2.7.4
