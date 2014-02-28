From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 13:34:11 -0000
Subject: [Buildroot] [git commit] php-ssh2: new package
Message-ID: <20140228133411.0FBB69BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=555120da7cc9b5500886dfb8266368cce538c5b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/php-ssh2/Config.in   |    8 ++++++++
 package/php-ssh2/php-ssh2.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8998882..1fd4719 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ source "package/php/Config.in"
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
