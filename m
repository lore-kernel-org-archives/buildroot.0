From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 18:26:29 -0300
Subject: [Buildroot] [PATCH 4/6] php-yaml: new package
In-Reply-To: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1390944391-3892-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in            |  1 +
 package/php-yaml/Config.in   |  8 ++++++++
 package/php-yaml/php-yaml.mk | 26 ++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/php-yaml/Config.in
 create mode 100644 package/php-yaml/php-yaml.mk

diff --git a/package/Config.in b/package/Config.in
index 5c91d9a..ffe11bb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ source "package/php/Config.in"
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
-- 
1.8.3.2
