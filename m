From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Mar 2020 18:05:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/php: fix build without zlib
Message-ID: <20200308170556.165375-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build will fail if zlib is not found and mysqlnd compression support
is not disabled since version 7.4.1 and
https://github.com/php/php-src/commit/ee4295b4ce421003c2e1d2af98066826deb23319

Fixes:
 - http://autobuild.buildroot.org/results/9496d81437dba55d22a03762dcfe60d632115ab5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php/php.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index d4829645e8..c0abecad19 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -174,6 +174,8 @@ endif
 ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
 PHP_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += zlib
+else
+PHP_CONF_OPTS += --disable-mysqlnd_compression_support
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
-- 
2.25.0
