From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 12 Apr 2014 14:37:02 +0400
Subject: [Buildroot] [PATCH] php: fix wrong -L and -I paths added by iconv
	tests
Message-ID: <1397299022-31655-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit f2a2c4cce "php: fix iconv related build failure" have removed
logic that used to detect the correct PHP_ICONV_PREFIX with an
assumption that "ICONV_DIR is fine". Currently the ICONV_DIR is only
fine when BR2_PACKAGE_LIBICONV is set to 'y', otherwise php is
configured with plain --with-iconv. This results in empty
PHP_ICONV_PREFIX and -L/lib and -I/include added to CFLAGS and LDFLAGS
respectively, which leads to build failures when e.g. /lib contains
files with the same names as the toolchain sysroot needed for linking.

Fix that by always specifying --with-iconv=$(STAGING_DIR)/usr when iconv
is configured for PHP.

Fixes: http://autobuild.buildroot.net/results/959/959b77fa2c1f13b1958b234803437e09734e882e/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/php/php.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ba1200b..bb86829 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -108,11 +108,9 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
 	PHP_CONF_OPT += --with-iconv=$(STAGING_DIR)/usr
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
 	PHP_DEPENDENCIES += libiconv
-else
-	PHP_CONF_OPT += --with-iconv
 endif
 endif
 
-- 
1.7.7.6
