From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 29 Jan 2018 12:58:44 -0500
Subject: [Buildroot] [PATCH 2/3] PHP: Add SAPI API library option
In-Reply-To: <20180129175845.23586-1-Adamduskett@outlook.com>
References: <20180129175845.23586-1-Adamduskett@outlook.com>
Message-ID: <20180129175845.23586-2-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option forces php to build libphp7.so. The size of the library is around
4MB in size, which is why this is a configuration option and not something that
is enabled or disabled automatically.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/php/Config.in | 8 ++++++++
 package/php/php.mk    | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 0fb80063af..b0e8fc35e7 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -41,6 +41,14 @@ config BR2_PACKAGE_PHP_SAPI_FPM
 	help
 	  PHP-FPM (FastCGI Process Manager)
 
+config BR2_PACKAGE_PHP_EMBED_SAPI
+	bool "SAPI API library"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Build the SAPI-API library, this will be installed as
+	  libphp7.so on the target. This library is around 4MB
+	  in size.
+
 source "package/php/Config.ext"
 
 endif
diff --git a/package/php/php.mk b/package/php/php.mk
index 941000cd6b..3adc361eb8 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -82,6 +82,10 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_EMBED_SAPI),y)
+PHP_CONF_OPTS += --embed-sapi
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_SAPI_APACHE),y)
 PHP_DEPENDENCIES += apache
 PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs
-- 
2.14.3
