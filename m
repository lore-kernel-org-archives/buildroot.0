From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:27 +0200
Subject: [Buildroot] [PATCH 16/83 v2] package/php: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <91c04604e43d66488a303fde0d389f2961bd2ca4.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the external extensions selection into the bundled extensions'
Config.in.

Make the menu prompt a comment, reword it so that it is more in line
with the following comments.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in      | 16 ----------------
 package/php/Config.ext | 20 ++++++++++++++++++--
 package/php/Config.in  |  2 +-
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a72dd91..8f1c870 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -572,22 +572,6 @@ endif
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
 	source "package/php/Config.in"
-if BR2_PACKAGE_PHP
-if !BR2_STATIC_LIBS
-menu "External php extensions"
-	source "package/php-geoip/Config.in"
-	source "package/php-gnupg/Config.in"
-	source "package/php-imagick/Config.in"
-	source "package/php-memcached/Config.in"
-	source "package/php-ssh2/Config.in"
-	source "package/php-yaml/Config.in"
-	source "package/php-zmq/Config.in"
-endmenu
-endif
-if BR2_STATIC_LIBS
-comment "External PHP extensions need a toolchain w/ dynamic library"
-endif
-endif
 	source "package/python/Config.in"
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 82aaf41..0395cb5 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -1,4 +1,4 @@
-menu "Extensions"
+comment "Generic extensions"
 
 config BR2_PACKAGE_PHP_EXT_CALENDAR
 	bool "Calendar"
@@ -389,4 +389,20 @@ config BR2_PACKAGE_PHP_EXT_XSL
 	help
 	  XSL transformation support
 
-endmenu
+if !BR2_STATIC_LIBS
+
+comment "External extensions"
+
+source "package/php-geoip/Config.in"
+source "package/php-gnupg/Config.in"
+source "package/php-imagick/Config.in"
+source "package/php-memcached/Config.in"
+source "package/php-ssh2/Config.in"
+source "package/php-yaml/Config.in"
+source "package/php-zmq/Config.in"
+
+endif # !STATIC_LIBS
+
+if BR2_STATIC_LIBs
+comment "External PHP extensions need a toolchain w/ dynamic library"
+endif
diff --git a/package/php/Config.in b/package/php/Config.in
index eee8d26..7e79179 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_PHP
+menuconfig BR2_PACKAGE_PHP
 	bool "php"
 	help
 	  PHP  is a widely-used general-purpose scripting
-- 
2.7.4
