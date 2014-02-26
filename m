From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2014 09:52:41 +0100
Subject: [Buildroot] [git commit branch/next] php-gnupg: new package
Message-ID: <20140226085437.BA9429B7F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f6a380b1800f209ddefd729cc13837932451a65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in              |    1 +
 package/php-gnupg/Config.in    |    9 +++++++++
 package/php-gnupg/php-gnupg.mk |   23 +++++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 543c7a6..fd081fd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -400,6 +400,7 @@ source "package/php/Config.in"
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
