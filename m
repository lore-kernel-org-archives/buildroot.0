From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 18:26:30 -0300
Subject: [Buildroot] [PATCH 5/6] php-ssh2: new package
In-Reply-To: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1390944391-3892-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in            |  1 +
 package/php-ssh2/Config.in   |  8 ++++++++
 package/php-ssh2/php-ssh2.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/php-ssh2/Config.in
 create mode 100644 package/php-ssh2/php-ssh2.mk

diff --git a/package/Config.in b/package/Config.in
index ffe11bb..7878b53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ source "package/php/Config.in"
 if BR2_PACKAGE_PHP
 if !BR2_PREFER_STATIC_LIB
 menu "External php extensions"
+source "package/php-ssh2/Config.in"
 source "package/php-yaml/Config.in"
 source "package/php-zmq/Config.in"
 endmenu
diff --git a/package/php-ssh2/Config.in b/package/php-ssh2/Config.in
new file mode 100644
index 0000000..b457900
--- /dev/null
+++ b/package/php-ssh2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PHP_SSH2
+	bool "php-ssh2"
+	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_LIBSSH2
+	help
+	  PHP bindings for the libssh2 library.
+
+	  http://pecl.php.net/package/ssh2
diff --git a/package/php-ssh2/php-ssh2.mk b/package/php-ssh2/php-ssh2.mk
new file mode 100644
index 0000000..f2067a4
--- /dev/null
+++ b/package/php-ssh2/php-ssh2.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-ssh2
+#
+################################################################################
+
+PHP_SSH2_VERSION = 0.12
+PHP_SSH2_SOURCE = ssh2-$(PHP_SSH2_VERSION).tgz
+PHP_SSH2_SITE = http://pecl.php.net/get
+PHP_SSH2_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-ssh2=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_SSH2_DEPENDENCIES = libssh2 php host-autoconf
+PHP_SSH2_LICENSE = PHP
+PHP_SSH2_LICENSE_FILES = LICENSE
+
+define PHP_SSH2_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_SSH2_PRE_CONFIGURE_HOOKS += PHP_SSH2_PHPIZE
+
+$(eval $(autotools-package))
-- 
1.8.3.2
