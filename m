From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 10:43:33 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/php: fix icu support
Message-ID: <20170610084333.27483-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Propagate icu reverse dependencies.

Php lacks "-std=c++11", provided by icu-config, when compiling icu
support leading to a build failure:

/home/peko/autobuild/instance-1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/unicode/umachine.h:347:13:
 error: 'char16_t' does not name a type
     typedef char16_t UChar;

Fixes
http://autobuild.buildroot.net/results/238/238d0e4bb205c0e7288903c6498e6c1787d86a1b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added icu reverse dependencies, used PHP_CXXFLAGS (Thomas)

 package/php/Config.ext | 9 +++++++--
 package/php/php.mk     | 4 +++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 43cc4b328..bb6ada6a9 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -180,17 +180,22 @@ config BR2_PACKAGE_PHP_EXT_ICONV
 
 config BR2_PACKAGE_PHP_EXT_INTL
 	bool "intl"
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # icu
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # icu
 	depends on !BR2_BINFMT_FLAT # icu
 	depends on BR2_TOOLCHAIN_HAS_THREADS # icu
 	select BR2_PACKAGE_ICU
 	help
 	  Internationalization support
 
-comment "intl support needs a toolchain w/ C++, wchar, threads"
+comment "intl support needs a toolchain w/ C++, wchar, threads, gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_PHP_EXT_MBSTRING
 	bool "mbstring"
diff --git a/package/php/php.mk b/package/php/php.mk
index ed12dd354..fe531a4ae 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -55,6 +55,7 @@ endif
 PHP_CONFIG_SCRIPTS = php-config
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
+PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
 
 # The OPcache extension isn't cross-compile friendly
 # Throw some defines here to avoid patching heavily
@@ -173,6 +174,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
 PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
+PHP_CXXFLAGS += "`$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
 PHP_DEPENDENCIES += icu
 # The intl module is implemented in C++, but PHP fails to use
 # g++ as the compiler for the final link. As a workaround,
@@ -343,6 +345,6 @@ endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
 
-PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)"
+PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(PHP_CXXFLAGS)"
 
 $(eval $(autotools-package))
-- 
2.11.0
