From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Dec 2020 19:31:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/php: needs pcre2
In-Reply-To: <20201227183145.1965023-1-bernd.kuhls@t-online.de>
References: <20201227183145.1965023-1-bernd.kuhls@t-online.de>
Message-ID: <20201227183145.1965023-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 2008 pcre is a hard-dependency of php:
https://github.com/php/php-src/commit/aa64c6727c2d33a647bdbd9769215044f7cf2967

Instead of optionally depending on the pcre2 package and building the
bundled pcre2 code of php in case BR2_PACKAGE_PCRE2 was not selected
we let php depend on pcre2.

While being at it rename the pcre-related configure option due to
upstream commit:
https://github.com/php/php-src/commit/c1a22f3d4e69cb87f8deeed7d03d9434e6901537

Fixes:
http://autobuild.buildroot.net/results/4a5/4a582af6b66c59a61b75a7047d8530202972ebdd/
because the pcre2 package already contains the fix for mips r6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Suggested by Peter:
http://lists.busybox.net/pipermail/buildroot/2020-December/299433.html

 package/php/Config.in |  1 +
 package/php/php.mk    | 31 ++-----------------------------
 2 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/php/Config.in b/package/php/Config.in
index 2469573541..6fa420428b 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PHP
 	       !BR2_PACKAGE_PHP_SAPI_FPM &&  \
 	       BR2_USE_MMU
 	select BR2_PACKAGE_PHP_SAPI_CLI if !BR2_USE_MMU
+	select BR2_PACKAGE_PCRE2
 	help
 	  PHP  is a widely-used general-purpose scripting
 	  language that is especially suited for Web development
diff --git a/package/php/php.mk b/package/php/php.mk
index 0feb96e97a..792e523ebe 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -10,7 +10,7 @@ PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
-PHP_DEPENDENCIES = host-pkgconf
+PHP_DEPENDENCIES = host-pkgconf pcre2
 PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CONF_OPTS = \
@@ -18,6 +18,7 @@ PHP_CONF_OPTS = \
 	--infodir=/usr/share/info \
 	--with-config-file-scan-dir=/etc/php.d \
 	--disable-all \
+	--with-external-pcre \
 	--without-pear \
 	--with-config-file-path=/etc \
 	--disable-phpdbg \
@@ -258,34 +259,6 @@ define PHP_DISABLE_VALGRIND
 endef
 PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 
-### Use external PCRE if it's available
-ifeq ($(BR2_PACKAGE_PCRE2),y)
-PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += pcre2
-
-ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
-PHP_CONF_OPTS += --with-pcre-jit=yes
-PHP_CONF_ENV += ac_cv_have_pcre2_jit=yes
-else
-PHP_CONF_OPTS += --with-pcre-jit=no
-PHP_CONF_ENV += ac_cv_have_pcre2_jit=no
-endif
-
-else
-# The bundled pcre library is not configurable through ./configure options,
-# and by default is configured to be thread-safe, so it wants pthreads. So
-# we must explicitly tell it when we don't have threads.
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
-PHP_CFLAGS += -DSLJIT_SINGLE_THREADED=1
-endif
-# check ext/pcre/pcrelib/sljit/sljitConfigInternal.h for supported archs
-ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
-PHP_CONF_OPTS += --with-pcre-jit
-else
-PHP_CONF_OPTS += --without-pcre-jit
-endif
-endif
-
 ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
 PHP_CONF_OPTS += --with-curl
 PHP_DEPENDENCIES += libcurl
-- 
2.29.2
