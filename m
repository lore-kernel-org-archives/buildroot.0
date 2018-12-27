From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 27 Dec 2018 12:49:02 -0500
Subject: [Buildroot] [PATCH 1/2] php: fix building curl extension.
Message-ID: <20181227174903.39339-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The configure option "--with-curl=$(STAGING_DIR)/usr" is broken.
PHP will detect libcurl.pc, which will pass the configure checks, but will then
prepend $(STAGING_DIR)/usr to the paths in libcurl.pc.

Thus php will then search $(STAGING_DIR)/usr/$(STAGING_DIR)/usr/lib/ for
curl libraries during linking, which causes linking errors.

Removing "=$(STAGING_DIR)/usr" from --with-curl fixes the issue.

Fixes:
http://autobuild.buildroot.net/results/44b/44b9ea1edca85b222a117a8e241a26b8dce33929/
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index b95ceb5c9d..338361f58a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -259,7 +259,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
-PHP_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr
+PHP_CONF_OPTS += --with-curl
 PHP_DEPENDENCIES += libcurl
 endif
 
-- 
2.19.2
