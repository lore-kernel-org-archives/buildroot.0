From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 29 Mar 2018 17:27:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: security bump to version 7.2.4
Message-ID: <20180329152705.16985-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes https://bugs.php.net/bug.php?id=75605, no CVE-ID yet.

Removed patch 0008, applied upstream. Re-numbered patch 0009.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...08-ext-sockets-make-AI_IDN-usage-optional.patch | 55 ----------------------
 ....c-build-empty-php_load_zend_extension_c.patch} |  0
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch
 rename package/php/{0009-main-php_ini.c-build-empty-php_load_zend_extension_c.patch => 0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch} (100%)

diff --git a/package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch b/package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch
deleted file mode 100644
index 7ab086865e..0000000000
--- a/package/php/0008-ext-sockets-make-AI_IDN-usage-optional.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 923cab3a5ee112d3de44b5571e73402f1fa3d619 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 26 Feb 2018 19:06:40 +0100
-Subject: [PATCH] ext/sockets: make AI_IDN usage optional
-
-AI_IDN is not supported by all C libraries (uClibc, musl), so make it
-optional, like AI_ALL.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream-status: https://github.com/php/php-src/pull/3160
----
- ext/sockets/config.m4 | 13 +++++++++++++
- ext/sockets/sockets.c |  2 +-
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/ext/sockets/config.m4 b/ext/sockets/config.m4
-index fe7d22a10a..2bf6a2bd11 100644
---- a/ext/sockets/config.m4
-+++ b/ext/sockets/config.m4
-@@ -69,6 +69,19 @@ if test "$PHP_SOCKETS" != "no"; then
-     AC_DEFINE(HAVE_AI_ALL,1,[Whether you have AI_ALL])
-   fi
- 
-+  dnl Check for AI_IDN flag
-+  AC_CACHE_CHECK([if getaddrinfo supports AI_IDN],[ac_cv_gai_ai_idn],
-+  [
-+    AC_TRY_COMPILE([
-+#include <netdb.h>
-+  ], [int flag = AI_IDN;],
-+     ac_cv_gai_ai_idn=yes, ac_cv_gai_ai_idn=no)
-+  ])
-+
-+  if test "$ac_cv_gai_ai_idn" = yes; then
-+    AC_DEFINE(HAVE_AI_IDN,1,[Whether you have AI_IDN])
-+  fi
-+
-   PHP_NEW_EXTENSION([sockets], [sockets.c multicast.c conversions.c sockaddr_conv.c sendrecvmsg.c], [$ext_shared],, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
-   PHP_INSTALL_HEADERS([ext/sockets/], [php_sockets.h])
- fi
-diff --git a/ext/sockets/sockets.c b/ext/sockets/sockets.c
-index 6db56c2816..ee9651ce09 100644
---- a/ext/sockets/sockets.c
-+++ b/ext/sockets/sockets.c
-@@ -796,7 +796,7 @@ static PHP_MINIT_FUNCTION(sockets)
- 	REGISTER_LONG_CONSTANT("AI_ALL",			AI_ALL,				CONST_CS | CONST_PERSISTENT);
- #endif
- 	REGISTER_LONG_CONSTANT("AI_ADDRCONFIG",		AI_ADDRCONFIG,		CONST_CS | CONST_PERSISTENT);
--#ifdef __USE_GNU
-+#if defined(HAVE_AI_IDN) && defined(__USE_GNU)
- 	REGISTER_LONG_CONSTANT("AI_IDN",			AI_IDN,				CONST_CS | CONST_PERSISTENT);
- 	REGISTER_LONG_CONSTANT("AI_CANONIDN",		AI_CANONIDN,		CONST_CS | CONST_PERSISTENT);
- 	REGISTER_LONG_CONSTANT("AI_IDN_ALLOW_UNASSIGNED",		AI_IDN_ALLOW_UNASSIGNED, CONST_CS | CONST_PERSISTENT);
--- 
-2.14.3
-
diff --git a/package/php/0009-main-php_ini.c-build-empty-php_load_zend_extension_c.patch b/package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
similarity index 100%
rename from package/php/0009-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
rename to package/php/0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
diff --git a/package/php/php.hash b/package/php/php.hash
index 34230df874..4cd5acaef9 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 b3a94f1b562f413c0b96f54bc309706d83b29ac65d9b172bc7ed9fb40a5e651f  php-7.2.3.tar.xz
+sha256 7916b1bd148ddfd46d7f8f9a517d4b09cd8a8ad9248734e7c8dd91ef17057a88  php-7.2.4.tar.xz
 
 # License file
 sha256 00e567a8d50359d93ee1f9afdd9511277660c1e70a0cbf3229f84403aa9aebb1  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index dcb89b03d3..bfd25de875 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.3
+PHP_VERSION = 7.2.4
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.14.2
