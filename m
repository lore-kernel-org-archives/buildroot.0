From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:31:59 +0200
Subject: [Buildroot] [git commit] php-gnupg: re add package,
	now compatible with PHP 7
Message-ID: <20160601161312.422FC802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e944a30a0d68594cc4e52451e8899258b979a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Related: https://bugs.php.net/bug.php?id=71138

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |  1 +
 package/php-gnupg/Config.in      |  9 +++++++++
 package/php-gnupg/php-gnupg.hash |  2 ++
 package/php-gnupg/php-gnupg.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f21d42e..7421bc2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -614,6 +614,7 @@ if BR2_PACKAGE_PHP
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
