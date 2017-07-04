From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:34:03 +0200
Subject: [Buildroot] [git commit] php: use the new gettext logic
Message-ID: <20170704233518.4A02F8007C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0747f21e126d4eea94bd0ee0478612b2560fe73e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection. Thanks to this, we can drop
   the BR2_USE_WCHAR dependency

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/Config.ext | 7 +++----
 package/php/php.mk     | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index bb6ada6..6b3d869 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -164,13 +164,12 @@ comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
 	bool "Gettext"
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	depends on BR2_SYSTEM_ENABLE_NLS
 	help
 	  Gettext support
 
-comment "Gettext support needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "Gettext support needs NLS enabled"
+	depends on !BR2_SYSTEM_ENABLE_NLS
 
 config BR2_PACKAGE_PHP_EXT_ICONV
 	bool "iconv"
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
