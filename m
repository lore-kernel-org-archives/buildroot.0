From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 15:51:32 +0100
Subject: [Buildroot] [PATCH v3 next 1/5] php: bump version to 7.0.6
Message-ID: <1464015096-48578-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove MySQL legacy extension.

Remove incompatible external modules:
 - php-gnupg
 - php-memcached
 - php-ssh2
 - php-yaml

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - Bump version from 7.0.5 to 7.0.6.
 - Remove MySQL legacy extension. (Thanks Thomas Petazzoni)
Changes v1 -> v2:
 - Split it in different patches.

 package/Config.in                        |  4 ----
 package/php-gnupg/Config.in              |  9 ---------
 package/php-gnupg/php-gnupg.hash         |  2 --
 package/php-gnupg/php-gnupg.mk           | 26 --------------------------
 package/php-memcached/Config.in          | 15 ---------------
 package/php-memcached/php-memcached.hash |  2 --
 package/php-memcached/php-memcached.mk   | 29 -----------------------------
 package/php-ssh2/Config.in               |  8 --------
 package/php-ssh2/php-ssh2.hash           |  2 --
 package/php-ssh2/php-ssh2.mk             | 27 ---------------------------
 package/php-yaml/Config.in               |  8 --------
 package/php-yaml/php-yaml.hash           |  2 --
 package/php-yaml/php-yaml.mk             | 27 ---------------------------
 package/php/Config.ext                   | 10 ----------
 package/php/php.hash                     |  2 +-
 package/php/php.mk                       |  8 ++------
 16 files changed, 3 insertions(+), 178 deletions(-)
 delete mode 100644 package/php-gnupg/Config.in
 delete mode 100644 package/php-gnupg/php-gnupg.hash
 delete mode 100644 package/php-gnupg/php-gnupg.mk
 delete mode 100644 package/php-memcached/Config.in
 delete mode 100644 package/php-memcached/php-memcached.hash
 delete mode 100644 package/php-memcached/php-memcached.mk
 delete mode 100644 package/php-ssh2/Config.in
 delete mode 100644 package/php-ssh2/php-ssh2.hash
 delete mode 100644 package/php-ssh2/php-ssh2.mk
 delete mode 100644 package/php-yaml/Config.in
 delete mode 100644 package/php-yaml/php-yaml.hash
 delete mode 100644 package/php-yaml/php-yaml.mk

diff --git a/package/Config.in b/package/Config.in
index e64e058..f7327ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -613,11 +613,7 @@ if BR2_PACKAGE_PHP
 if !BR2_STATIC_LIBS
 menu "External php extensions"
 	source "package/php-geoip/Config.in"
-	source "package/php-gnupg/Config.in"
 	source "package/php-imagick/Config.in"
-	source "package/php-memcached/Config.in"
-	source "package/php-ssh2/Config.in"
-	source "package/php-yaml/Config.in"
 	source "package/php-zmq/Config.in"
 endmenu
 endif
diff --git a/package/php-gnupg/Config.in b/package/php-gnupg/Config.in
deleted file mode 100644
index 49fb43b..0000000
--- a/package/php-gnupg/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PHP_GNUPG
-	bool "php-gnupg"
-	depends on BR2_PACKAGE_PHP
-	depends on BR2_USE_MMU # libassuan
-	select BR2_PACKAGE_LIBGPGME
-	help
-	  PHP wrapper around the gpgme library.
-
-	  http://pecl.php.net/package/gnupg
diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
deleted file mode 100644
index ef066a5..0000000
--- a/package/php-gnupg/php-gnupg.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	50065cb81f1ac3ec5fcd796e58c8433071ff24cc14900e6077682717f5239307	gnupg-1.3.6.tgz
diff --git a/package/php-gnupg/php-gnupg.mk b/package/php-gnupg/php-gnupg.mk
deleted file mode 100644
index c5964c2..0000000
--- a/package/php-gnupg/php-gnupg.mk
+++ /dev/null
@@ -1,26 +0,0 @@
-################################################################################
-#
-# php-gnupg
-#
-################################################################################
-
-PHP_GNUPG_VERSION = 1.3.6
-PHP_GNUPG_SOURCE = gnupg-$(PHP_GNUPG_VERSION).tgz
-PHP_GNUPG_SITE = http://pecl.php.net/get
-# phpize does the autoconf magic
-PHP_GNUPG_DEPENDENCIES = php libgpgme host-autoconf host-pkgconf
-PHP_GNUPG_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-gnupg=$(STAGING_DIR)/usr/include --with-gpg=/usr/bin/gpg
-PHP_GNUPG_LICENSE = BSD-2c
-PHP_GNUPG_LICENSE_FILES = LICENSE
-
-define PHP_GNUPG_PHPIZE
-	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
-		$(STAGING_DIR)/usr/bin/phpize)
-endef
-
-PHP_GNUPG_PRE_CONFIGURE_HOOKS += PHP_GNUPG_PHPIZE
-
-$(eval $(autotools-package))
diff --git a/package/php-memcached/Config.in b/package/php-memcached/Config.in
deleted file mode 100644
index cd97c15..0000000
--- a/package/php-memcached/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_PHP_MEMCACHED
-	bool "php-memcached"
-	depends on BR2_INSTALL_LIBSTDCPP # libmemcached
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libmemcached
-	select BR2_PACKAGE_PHP_EXT_SESSION
-	select BR2_PACKAGE_LIBMEMCACHED
-	select BR2_PACKAGE_ZLIB
-	help
-	  PHP extension for interfacing with memcached via
-	  libmemcached library.
-
-	  http://pecl.php.net/package/memcached
-
-comment "php-memcached needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
deleted file mode 100644
index bc2e97a..0000000
--- a/package/php-memcached/php-memcached.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	17b9600f6d4c807f23a3f5c45fcd8775ca2e61d6eda70370af2bef4c6e159f58	memcached-2.2.0.tgz
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
deleted file mode 100644
index 599e22e..0000000
--- a/package/php-memcached/php-memcached.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# php-memcached
-#
-################################################################################
-
-PHP_MEMCACHED_VERSION = 2.2.0
-PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_MEMCACHED_SITE = http://sources.buildroot.net
-PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--disable-memcached-sasl \
-	--with-libmemcached-dir=$(STAGING_DIR)/usr \
-	--with-zlib-dir=$(STAGING_DIR)/usr
-# phpize does the autoconf magic
-PHP_MEMCACHED_DEPENDENCIES = libmemcached php zlib host-autoconf host-pkgconf
-PHP_MEMCACHED_LICENSE = MIT
-PHP_MEMCACHED_LICENSE_FILES = LICENSE
-
-define PHP_MEMCACHED_PHPIZE
-	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
-		$(STAGING_DIR)/usr/bin/phpize)
-endef
-
-PHP_MEMCACHED_PRE_CONFIGURE_HOOKS += PHP_MEMCACHED_PHPIZE
-
-$(eval $(autotools-package))
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
deleted file mode 100644
index b457900..0000000
--- a/package/php-ssh2/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PHP_SSH2
-	bool "php-ssh2"
-	depends on BR2_PACKAGE_PHP
-	select BR2_PACKAGE_LIBSSH2
-	help
-	  PHP bindings for the libssh2 library.
-
-	  http://pecl.php.net/package/ssh2
diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
deleted file mode 100644
index d599662..0000000
--- a/package/php-ssh2/php-ssh2.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	600c82d2393acf3642f19914f06a7afea57ee05cb8c10e8a5510b32188b97f99	ssh2-0.12.tgz
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
deleted file mode 100644
index ace68e0..0000000
--- a/package/php-ssh2/php-ssh2.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# php-ssh2
-#
-################################################################################
-
-PHP_SSH2_VERSION = 0.12
-PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_SSH2_SITE = http://sources.buildroot.net
-PHP_SSH2_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-ssh2=$(STAGING_DIR)/usr
-# phpize does the autoconf magic
-PHP_SSH2_DEPENDENCIES = libssh2 php host-autoconf
-PHP_SSH2_LICENSE = PHP
-PHP_SSH2_LICENSE_FILES = LICENSE
-
-define PHP_SSH2_PHPIZE
-	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
-		$(STAGING_DIR)/usr/bin/phpize)
-endef
-
-PHP_SSH2_PRE_CONFIGURE_HOOKS += PHP_SSH2_PHPIZE
-
-$(eval $(autotools-package))
diff --git a/package/php-yaml/Config.in b/package/php-yaml/Config.in
deleted file mode 100644
index 8d09ce2..0000000
--- a/package/php-yaml/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PHP_YAML
-	bool "php-yaml"
-	depends on BR2_PACKAGE_PHP
-	select BR2_PACKAGE_LIBYAML
-	help
-	  PHP YAML-1.1 parser and emitter.
-
-	  http://pecl.php.net/package/yaml
diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
deleted file mode 100644
index e4f22a6..0000000
--- a/package/php-yaml/php-yaml.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256	762ec3d9eb163ac0d063118df8c5e2ee6746dbe8566d32055e7e066e590937c3	yaml-1.1.1.tgz
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
deleted file mode 100644
index b6f259d..0000000
--- a/package/php-yaml/php-yaml.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# php-yaml
-#
-################################################################################
-
-PHP_YAML_VERSION = 1.1.1
-PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
-# pecl.php.net returns html with db connect failed
-PHP_YAML_SITE = http://sources.buildroot.net
-PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-yaml=$(STAGING_DIR)/usr
-# phpize does the autoconf magic
-PHP_YAML_DEPENDENCIES = libyaml php host-autoconf
-PHP_YAML_LICENSE = MIT
-PHP_YAML_LICENSE_FILES = LICENSE
-
-define PHP_YAML_PHPIZE
-	(cd $(@D); \
-		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
-		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
-		$(STAGING_DIR)/usr/bin/phpize)
-endef
-
-PHP_YAML_PRE_CONFIGURE_HOOKS += PHP_YAML_PHPIZE
-
-$(eval $(autotools-package))
diff --git a/package/php/Config.ext b/package/php/Config.ext
index ee51030..82aaf41 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -111,22 +111,12 @@ config BR2_PACKAGE_PHP_EXT_DBA_INI
 
 endif
 
-config BR2_PACKAGE_PHP_EXT_MYSQL
-	bool "Mysql"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # mysql
-	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_MYSQL
-	help
-	  MySQL support
-
 config BR2_PACKAGE_PHP_EXT_MYSQLI
 	bool "Mysqli"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
 	select BR2_PACKAGE_MYSQL
-	select BR2_PACKAGE_PHP_EXT_MYSQL
 	help
 	  MySQL Improved extension support
 
diff --git a/package/php/php.hash b/package/php/php.hash
index 4feb3ca..4bc0263 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256	566ff1a486cb0485ed477a91ea292423f77a58671270ff73b74e67e3ce7084f9	php-5.6.21.tar.xz
+sha256 1b237a9455e5476a425dbb9d99966bad68107747c601958cb9558a7fb49ab419  php-7.0.6.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index d58c4fd..fbdb738 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 5.6.21
+PHP_VERSION = 7.0.6
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
@@ -178,11 +178,7 @@ PHP_CONF_OPTS += --with-readline=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += readline
 endif
 
-### Native MySQL extensions
-ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQL),y)
-PHP_CONF_OPTS += --with-mysql=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += mysql
-endif
+### Native SQL extensions
 ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
 PHP_CONF_OPTS += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
 PHP_DEPENDENCIES += mysql
-- 
2.7.3
