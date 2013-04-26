From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 26 Apr 2013 09:39:50 -0300
Subject: [Buildroot] [PATCH] php: fix libxml2 build failure
Message-ID: <1366979990-10086-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libxml2 build test uses the PHP_TEST_BUILD macro which in turn uses
AC_TRY_RUN which is bad for cross compilations.
Force php_cv_libxml_build_works to yes when libxml2 is selected. Fixes:
http://autobuild.buildroot.net/results/8b45a1260ab6ae15dc59a5d6b5b98698ec3e7bbe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/php.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index ba428a6..2a452d1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -66,6 +66,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
+	PHP_CONF_ENV += php_cv_libxml_build_works=yes
 	PHP_CONF_OPT += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
 	PHP_DEPENDENCIES += libxml2
 endif
-- 
1.8.1.5
