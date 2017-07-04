From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:43 +0200
Subject: [Buildroot] [PATCH 063/100] php: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-64-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection. Thanks to this, we can drop
   the BR2_USE_WCHAR dependency

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext | 5 -----
 package/php/php.mk     | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index bb6ada6..5fe3513 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -164,14 +164,9 @@ comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "Gettext"
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Gettext support
 
-comment "Gettext support needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
 config BR2_PACKAGE_PHP_EXT_ICONV
 	bool "iconv"
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
diff --git a/package/php/php.mk b/package/php/php.mk
index fe531a4..1a1ed21 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -160,7 +160,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
 PHP_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
+PHP_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
-- 
2.9.4
