From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  2 Feb 2018 09:06:00 -0500
Subject: [Buildroot] [PATCH v2 2/3] php: add SAPI API librari option
In-Reply-To: <20180202140601.21285-1-aduskett@gmail.com>
References: <20180202140601.21285-1-aduskett@gmail.com>
Message-ID: <20180202140601.21285-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option forces PHP to build libphp7.so. The size of the library is around
3.5MB, which is why this is a configuration option and not something that
is enabled or disabled automatically.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - Changed BR2_PACKAGE_PHP_EMBED_SAPI to BR2_PACKAGE_PHP_ENABLE_EMBED to
    reflect the configure option name change in PHP 7.2.
  - Updated approximate library size from 4MB to 3.5MB.
  - Changed --embed-sapi to --enable-embed to reflect the configure option
    name change in PHP 7.2.
  - Added a check for static libs as the SAPI API library can be built either
    static or shared.
  - Updated wording in the help section of Config.in

 package/php/Config.in | 7 +++++++
 package/php/php.mk    | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/php/Config.in b/package/php/Config.in
index 0fb80063af..d327d08366 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -41,6 +41,13 @@ config BR2_PACKAGE_PHP_SAPI_FPM
 	help
 	  PHP-FPM (FastCGI Process Manager)
 
+config BR2_PACKAGE_PHP_ENABLE_EMBED
+	bool "SAPI API library"
+	help
+	  Enable building of embedded SAPI library. The name of the
+	  library on the target is libphp7.so and is approximately
+	  3.5MB in size.
+
 source "package/php/Config.ext"
 
 endif
diff --git a/package/php/php.mk b/package/php/php.mk
index 152ec7d780..511cdfa8cc 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -82,6 +82,14 @@ PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CLI),--enable-cli,--disable-cli)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_CGI),--enable-cgi,--disable-cgi)
 PHP_CONF_OPTS += $(if $(BR2_PACKAGE_PHP_SAPI_FPM),--enable-fpm,--disable-fpm)
 
+ifeq ($(BR2_PACKAGE_PHP_ENABLE_EMBED),y)
+ifeq ($(BR2_STATIC_LIBS),)
+PHP_CONF_OPTS += --enable-embed=shared
+else
+PHP_CONF_OPTS += --enable-embed=static
+endif
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_SAPI_APACHE),y)
 PHP_DEPENDENCIES += apache
 PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs
-- 
2.14.3
