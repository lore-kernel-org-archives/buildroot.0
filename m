From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 15:57:27 +0100
Subject: [Buildroot] [git commit branch/next] php-yaml: new package
Message-ID: <20140212192700.818759C987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=534039b3297042acb632652469019347b9966700
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/php-yaml/Config.in   |    8 ++++++++
 package/php-yaml/php-yaml.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9041059..8998882 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -397,6 +397,7 @@ source "package/php/Config.in"
 if BR2_PACKAGE_PHP
 if !BR2_PREFER_STATIC_LIB
 menu "External php extensions"
+source "package/php-yaml/Config.in"
 source "package/php-zmq/Config.in"
 endmenu
 endif
diff --git a/package/php-yaml/Config.in b/package/php-yaml/Config.in
new file mode 100644
index 0000000..8d09ce2
--- /dev/null
+++ b/package/php-yaml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PHP_YAML
+	bool "php-yaml"
+	depends on BR2_PACKAGE_PHP
+	select BR2_PACKAGE_LIBYAML
+	help
+	  PHP YAML-1.1 parser and emitter.
+
+	  http://pecl.php.net/package/yaml
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
new file mode 100644
index 0000000..a53e012
--- /dev/null
+++ b/package/php-yaml/php-yaml.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-yaml
+#
+################################################################################
+
+PHP_YAML_VERSION = 1.1.1
+PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
+PHP_YAML_SITE = http://pecl.php.net/get
+PHP_YAML_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
+	--with-yaml=$(STAGING_DIR)/usr
+# phpize does the autoconf magic
+PHP_YAML_DEPENDENCIES = libyaml php host-autoconf
+PHP_YAML_LICENSE = MIT
+PHP_YAML_LICENSE_FILES = LICENSE
+
+define PHP_YAML_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_YAML_PRE_CONFIGURE_HOOKS += PHP_YAML_PHPIZE
+
+$(eval $(autotools-package))
