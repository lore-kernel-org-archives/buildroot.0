From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 15:51:33 +0100
Subject: [Buildroot] [PATCH v3 next 2/5] php-gnupg: re add package,
	now compatible with PHP 7
In-Reply-To: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1464015096-48578-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Related: https://bugs.php.net/bug.php?id=71138

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - Bump version to 30fab6eaf9eb61c65b3b46987442be058cbd7823

Changes v1 -> v2:
 - This patch didn't exist.

 package/Config.in                |  1 +
 package/php-gnupg/Config.in      |  9 +++++++++
 package/php-gnupg/php-gnupg.hash |  2 ++
 package/php-gnupg/php-gnupg.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/php-gnupg/Config.in
 create mode 100644 package/php-gnupg/php-gnupg.hash
 create mode 100644 package/php-gnupg/php-gnupg.mk

diff --git a/package/Config.in b/package/Config.in
index f7327ad..edc23ba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -613,6 +613,7 @@ if BR2_PACKAGE_PHP
 if !BR2_STATIC_LIBS
 menu "External php extensions"
 	source "package/php-geoip/Config.in"
+	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
 	source "package/php-zmq/Config.in"
 endmenu
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
diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
new file mode 100644
index 0000000..f0654b5
--- /dev/null
+++ b/package/php-gnupg/php-gnupg.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 6f1a4b5a95fe501519de76d66602e46290cc452fc48f3a5ec2eacaffe68d9a01  php-gnupg-30fab6eaf9eb61c65b3b46987442be058cbd7823.tar.gz
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
new file mode 100644
index 0000000..c1c6680
--- /dev/null
+++ b/package/php-gnupg/php-gnupg.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# php-gnupg
+#
+################################################################################
+
+PHP_GNUPG_VERSION = 30fab6eaf9eb61c65b3b46987442be058cbd7823
+PHP_GNUPG_SITE = $(call github,Sean-Der,pecl-encryption-gnupg,$(PHP_GNUPG_VERSION))
+# phpize does the autoconf magic
+PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
+PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
+PHP_GNUPG_LICENSE = BSD-2c
+PHP_GNUPG_LICENSE_FILES = LICENSE
+
+define PHP_GNUPG_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_GNUPG_PRE_CONFIGURE_HOOKS += PHP_GNUPG_PHPIZE
+
+$(eval $(autotools-package))
-- 
2.7.3
