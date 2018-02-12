From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 12 Feb 2018 12:01:12 -0500
Subject: [Buildroot] [master 1/1] php: disable valgrind
Message-ID: <20180212170112.12313-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduced in PHP7.2, if a host has valgrind headers installed, PHP will detect
them and set HAVE_VALGRIND to 1.
Disable this entry after configuring.

fixes:
http://autobuild.buildroot.net/results/d59/d59b5961890aeddcd6d59ed52243be6554d1fe21

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/php/php.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index a4481c45c7..e6bc1e47e1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -232,6 +232,11 @@ define PHP_DISABLE_PCRE_JIT
 	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
 endef
 
+define PHP_DISABLE_VALGRIND
+	$(SED) '/^#define HAVE_VALGRIND/d' $(@D)/main/php_config.h
+endef
+PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
+
 ### Use external PCRE if it's available
 ifeq ($(BR2_PACKAGE_PCRE),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
-- 
2.14.3
