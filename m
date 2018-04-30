From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:32:11 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/php: security
 bump to version 7.2.5
Message-ID: <20180501073418.5E2F58271A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a00f7c87de0c14db9519c0b3470337057f563816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Changelog: http://www.php.net/ChangeLog-7.php#7.2.5

This release fixes several security-related bugs for which no CVE id's
are assigned at the time of writing:

https://bugs.php.net/bug.php?id=76129
https://bugs.php.net/bug.php?id=76130
https://bugs.php.net/bug.php?id=76248
https://bugs.php.net/bug.php?id=76249

Removed patch 0008, applied upstream:
https://github.com/php/php-src/commit/2842aa2a078eb1cad55540b61e7edf111395150d

Re-numbered patch 0009 -> 0008.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e14dc96df9998f35879854c60e61bcb898423900)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...expat_compat.h-add-missing-php.h-include.patch} |  0
 ...i.c-build-empty-php_load_zend_extension_c.patch | 62 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch b/package/php/0008-ext-xml-expat_compat.h-add-missing-php.h-include.patch
similarity index 100%
rename from package/php/0009-ext-xml-expat_compat.h-add-missing-php.h-include.patch
rename to package/php/0008-ext-xml-expat_compat.h-add-missing-php.h-include.patch
diff --git a/package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch b/package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
deleted file mode 100644
index bc5149d1d6..0000000000
--- a/package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b7bbdfbcb0869b5c068143d4e27bab9eac4ae72b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 26 Feb 2018 19:30:55 +0100
-Subject: [PATCH] main/php_ini.c: build empty php_load_zend_extension_cb() when
- !HAVE_LIBDL
-
-Commit 0782a7fc6314c8bd3cbfd57f12d0479bf9cc8dc7 ("Fixed bug #74866
-extension_dir = "./ext" now use current directory for base") modified
-the php_load_zend_extension_cb() function to use php_load_shlib(), and
-pass a handle to the newly introduced zend_load_extension_handle()
-function instead of passing the extension path to
-zend_load_extension().
-
-While doing so, it introduced a call to php_load_shlib() from code
-that is built even when HAVE_LIBDL is not defined. However,
-php_load_shlib() is not implemented when HAVE_LIBDL is not defined,
-for obvious reasons.
-
-It turns out that zend_load_extension_handle() anyway doesn't do
-anything when ZEND_EXTENSIONS_SUPPORT is defined to 0, and
-ZEND_EXTENSIONS_SUPPORT is not defined when HAVE_LIBDL is not defined
-(Zend/zend_portability.h).
-
-Fixes the following build failure when building on a system that
-doesn't have libdl:
-
-main/php_ini.o: In function `php_load_zend_extension_cb':
-php_ini.c:(.text+0x478): undefined reference to `php_load_shlib'
-php_ini.c:(.text+0x4b0): undefined reference to `php_load_shlib'
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/php/php-src/pull/3161
----
- main/php_ini.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/main/php_ini.c b/main/php_ini.c
-index ba58eb1180..fca263e5f0 100644
---- a/main/php_ini.c
-+++ b/main/php_ini.c
-@@ -350,6 +350,7 @@ static void php_load_php_extension_cb(void *arg)
- 
- /* {{{ php_load_zend_extension_cb
-  */
-+#ifdef HAVE_LIBDL
- static void php_load_zend_extension_cb(void *arg)
- {
- 	char *filename = *((char **) arg);
-@@ -409,6 +410,9 @@ static void php_load_zend_extension_cb(void *arg)
- 		efree(libpath);
- 	}
- }
-+#else
-+static void php_load_zend_extension_cb(void *arg) { }
-+#endif
- /* }}} */
- 
- /* {{{ php_init_config
--- 
-2.14.3
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 4cd5acaef9..4ddef44274 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 7916b1bd148ddfd46d7f8f9a517d4b09cd8a8ad9248734e7c8dd91ef17057a88  php-7.2.4.tar.xz
+sha256 af70a33b3f7a51510467199b39af151333fbbe4cc21923bad9c7cf64268cddb2  php-7.2.5.tar.xz
 
 # License file
 sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 91756794ee..4c3a87118e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.4
+PHP_VERSION = 7.2.5
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
