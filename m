From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Feb 2014 17:16:05 -0300
Subject: [Buildroot] [PATCH] php-gnupg: new package
Message-ID: <1393359365-21266-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in              |  1 +
 package/php-gnupg/Config.in    |  9 +++++++++
 package/php-gnupg/php-gnupg.mk | 23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 package/php-gnupg/Config.in
 create mode 100644 package/php-gnupg/php-gnupg.mk

diff --git a/package/Config.in b/package/Config.in
index 65b6c67..2c33e11 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ source "package/php/Config.in"
 if BR2_PACKAGE_PHP
 if !BR2_PREFER_STATIC_LIB
 menu "External php extensions"
+source "package/php-gnupg/Config.in"
 source "package/php-imagick/Config.in"
 source "package/php-ssh2/Config.in"
 source "package/php-yaml/Config.in"
diff --git a/package/php-gnupg/Config.in b/package/php-gnupg/Config.in
new file mode 100644
index 0000000..49fb43b
--- /dev/null
+++ b/package/php-gnupg/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PHP_GNUPG
+	bool "php-gnupg"
+	depends on BR2_PACKAGE_PHP
+	depends on BR2_USE_MMU # libassuan
+	select BR2_PACKAGE_LIBGPGME
+	help
+	  PHP wrapper around the gpgme library.
+
+	  http://pecl.php.net/package/gnupg
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
new file mode 100644
index 0000000..5fc1dc4
--- /dev/null
+++ b/package/php-gnupg/php-gnupg.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# php-gnupg
+#
+################################################################################
+
+PHP_GNUPG_VERSION = 1.3.3
+PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
+PHP_GNUPG_SITE = http://pecl.php.net/get
+# phpize does the autoconf magic
+PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
+PHP_GNUPG_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
+PHP_GNUPG_LICENSE = BSD-2c
+PHP_GNUPG_LICENSE_FILES = LICENSE
+
+define PHP_GNUPG_PHPIZE
+	(cd $(@D); \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_GNUPG_PRE_CONFIGURE_HOOKS += PHP_GNUPG_PHPIZE
+
+$(eval $(autotools-package))
-- 
1.8.3.2
