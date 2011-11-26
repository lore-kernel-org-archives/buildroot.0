From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Nov 2011 13:55:11 +0100
Subject: [Buildroot] [git commit] php: fix build breakage
Message-ID: <20111126133046.EBC038F643@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=30ed378a978e322e5b0243409c84b550f945f13a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The zip extension requires zlib, so select it.

[Peter: Only select zlib, not php zlib extension]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext |    1 +
 package/php/php.mk     |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 4f1614e..bd630ee 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -125,6 +125,7 @@ config BR2_PACKAGE_PHP_EXT_SYSVSHM
 
 config BR2_PACKAGE_PHP_EXT_ZIP
 	bool "zip"
+	select BR2_PACKAGE_ZLIB
 	help
 	  Zip read/write support
 
diff --git a/package/php/php.mk b/package/php/php.mk
index a1dde51..7f848b1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -70,7 +70,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SIMPLEXML),y)
 	PHP_CONF_OPT += --enable-simplexml
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_ZLIB),y)
+ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
 	PHP_CONF_OPT += --with-zlib=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += zlib
 endif
