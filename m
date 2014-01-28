From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jan 2014 18:26:28 -0300
Subject: [Buildroot] [PATCH 3/6] php-zmq: new package
In-Reply-To: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1390944391-3892-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in          | 10 ++++++++++
 package/php-zmq/Config.in  | 17 +++++++++++++++++
 package/php-zmq/php-zmq.mk | 25 +++++++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/php-zmq/Config.in
 create mode 100644 package/php-zmq/php-zmq.mk

diff --git a/package/Config.in b/package/Config.in
index f4c1c17..5c91d9a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,16 @@ source "package/cpanminus/Config.in"
 endmenu
 endif
 source "package/php/Config.in"
+if BR2_PACKAGE_PHP
+if !BR2_PREFER_STATIC_LIB
+menu "External php extensions"
+source "package/php-zmq/Config.in"
+endmenu
+endif
+if BR2_PREFER_STATIC_LIB
+comment "External PHP extensions need a toolchain w/ dynamic library"
+endif
+endif
 source "package/python/Config.in"
 if BR2_PACKAGE_PYTHON
 menu "external python modules"
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
new file mode 100644
index 0000000..f32b5a3
--- /dev/null
+++ b/package/php-zmq/Config.in
@@ -0,0 +1,17 @@
+comment "php-zmq needs a toolchain w/ C++, IPv6, largefile, wchar, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
+
+config BR2_PACKAGE_PHP_ZMQ
+	bool "php-zmq"
+	depends on BR2_PACKAGE_PHP
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INET_IPV6
+	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ZEROMQ
+	help
+	  ZeroMQ messaging bindings for PHP
+
+	  http://pecl.php.net/package/zmq
diff --git a/package/php-zmq/php-zmq.mk b/package/php-zmq/php-zmq.mk
new file mode 100644
index 0000000..2b48a63
--- /dev/null
+++ b/package/php-zmq/php-zmq.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# php-zmq
+#
+################################################################################
+
+PHP_ZMQ_VERSION = 1.1.2
+PHP_ZMQ_SOURCE = zmq-$(PHP_ZMQ_VERSION).tgz
+PHP_ZMQ_SITE = http://pecl.php.net/get
+# phpize does the autoconf magic
+PHP_ZMQ_DEPENDENCIES = php zeromq host-autoconf host-pkgconf
+PHP_ZMQ_CONF_OPT = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
+PHP_ZMQ_LICENSE = BSD-3c
+PHP_ZMQ_LICENSE_FILES = LICENSE
+
+define PHP_ZMQ_PHPIZE
+	(cd $(@D); \
+		PHP_AUTOCONF=$(HOST_DIR)/usr/bin/autoconf \
+		PHP_AUTOHEADER=$(HOST_DIR)/usr/bin/autoheader \
+		$(STAGING_DIR)/usr/bin/phpize)
+endef
+
+PHP_ZMQ_PRE_CONFIGURE_HOOKS += PHP_ZMQ_PHPIZE
+
+$(eval $(autotools-package))
-- 
1.8.3.2
