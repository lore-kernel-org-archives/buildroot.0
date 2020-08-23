From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 16:44:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: drop BR2_PACKAGE_PHP_EXT_HASH
Message-ID: <20200823144455.3966780-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hash extension can't be disabled since version 7.4.0 and
https://github.com/php/php-src/commit/bf344425812b0f6156d0a8a54ed7bc38054f7636

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy       | 6 ++++++
 package/php/Config.ext | 5 -----
 package/php/php.mk     | 1 -
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cf7aaf75a5..957cbb8b3c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_PACKAGE_PHP_EXT_HASH
+	bool "php hash extension is mandatory"
+	select BR2_LEGACY
+	help
+	  Since php 7.4.0, hash extension can't be disabled.
+
 config BR2_PACKAGE_EFL_GIF
 	bool "efl evas gif loader is mandatory"
 	select BR2_LEGACY
diff --git a/package/php/Config.ext b/package/php/Config.ext
index b628291f78..33a6455366 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -65,11 +65,6 @@ config BR2_PACKAGE_PHP_EXT_ZLIB
 
 comment "Cryptography extensions"
 
-config BR2_PACKAGE_PHP_EXT_HASH
-	bool "hash"
-	help
-	  HASH message digest framework
-
 comment "libargon2 needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
diff --git a/package/php/php.mk b/package/php/php.mk
index 6e0b5c6e8d..daadc10c75 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -97,7 +97,6 @@ PHP_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 	$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SESSION),--enable-session) \
-	$(if $(BR2_PACKAGE_PHP_EXT_HASH),--enable-hash) \
 	$(if $(BR2_PACKAGE_PHP_EXT_DOM),--enable-dom) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SIMPLEXML),--enable-simplexml) \
 	$(if $(BR2_PACKAGE_PHP_EXT_SOAP),--enable-soap) \
-- 
2.28.0
