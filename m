From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Apr 2016 12:55:28 +0100
Subject: [Buildroot] [PATCH v2 8/8] php-yaml: re add package,
	now compatible with PHP 7
Message-ID: <1460980528-1091-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in              |  1 +
 package/php-yaml/Config.in     |  8 ++++++++
 package/php-yaml/php-yaml.hash |  2 ++
 package/php-yaml/php-yaml.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/php-yaml/Config.in
 create mode 100644 package/php-yaml/php-yaml.hash
 create mode 100644 package/php-yaml/php-yaml.mk

diff --git a/package/Config.in b/package/Config.in
index c04fbf6..ecaf164 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -615,6 +615,7 @@ menu "External php extensions"
 	source "package/php-imagick/Config.in"
 	source "package/php-memcached/Config.in"
 	source "package/php-ssh2/Config.in"
+	source "package/php-yaml/Config.in"
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
diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
new file mode 100644
index 0000000..a40677e
--- /dev/null
+++ b/package/php-yaml/php-yaml.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 d49acf2b7843258957a16df0d7ced56c0e1fc3eaa54f54289e4012edc002814c  yaml-2.0.0RC7.tgz
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
new file mode 100644
index 0000000..2711890
--- /dev/null
+++ b/package/php-yaml/php-yaml.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# php-yaml
+#
+################################################################################
+
+PHP_YAML_VERSION = 2.0.0RC7
+PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
+PHP_YAML_SITE = https://pecl.php.net/get
+PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
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
2.7.3
