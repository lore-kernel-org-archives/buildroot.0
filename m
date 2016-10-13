From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Oct 2016 19:39:26 -0300
Subject: [Buildroot] [PATCH] php: security bump to version 7.0.12
Message-ID: <1476398366-29332-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See http://www.php.net/ChangeLog-7.php#7.0.12 since there are no CVEs
out yet.

And drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...pt-enclose-phpdbg_load_module_or_extensio.patch | 47 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch

diff --git a/package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch b/package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch
deleted file mode 100644
index 006a034..0000000
--- a/package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 9ca3de0446fcd31b1561b333020ae0674a83bec7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 9 Aug 2016 11:39:10 +0200
-Subject: [PATCH] phpdbg_prompt: enclose phpdbg_load_module_or_extension() in
- HAVE_LIBDL
-
-The phpdbg_load_module_or_extension() function relies on libdl
-functionality, so it should be enclosed in HAVE_LIBDL to avoid the
-following build failure when libdl support is not available:
-
-php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c20): undefined reference to `_DL_LOAD'
-php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c36): undefined reference to `_GET_DL_ERROR'
-php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c6a): undefined reference to `_DL_FETCH_SYMBOL'
-php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c7e): undefined reference to `_DL_FETCH_SYMBOL'
-php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1dc6): undefined reference to `_DL_UNLOAD'
-
-This function is only called in the "dl" debug command, inside an
-HAVE_LIBDL condition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- sapi/phpdbg/phpdbg_prompt.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sapi/phpdbg/phpdbg_prompt.c b/sapi/phpdbg/phpdbg_prompt.c
-index 6f73d30..6768dc5 100644
---- a/sapi/phpdbg/phpdbg_prompt.c
-+++ b/sapi/phpdbg/phpdbg_prompt.c
-@@ -1019,6 +1019,7 @@ static int add_zendext_info(zend_extension *ext) /* {{{ */ {
- }
- /* }}} */
- 
-+#ifdef HAVE_LIBDL
- PHPDBG_API const char *phpdbg_load_module_or_extension(char **path, char **name) /* {{{ */ {
- 	DL_HANDLE handle;
- 	char *extension_dir;
-@@ -1158,6 +1159,7 @@ quit:
- 	DL_UNLOAD(handle);
- 	return NULL;
- }
-+#endif
- /* }}} */
- 
- PHPDBG_COMMAND(dl) /* {{{ */
--- 
-2.7.4
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 0092095..dde6a64 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,2 +1,2 @@
 # From http://php.net/downloads.php
-sha256 d4cccea8da1d27c11b89386f8b8e95692ad3356610d571253d00ca67d524c735  php-7.0.11.tar.xz
+sha256 f3d6c49e1c242e5995dec15e503fde996c327eb86cd7ec45c690e93c971b83ff  php-7.0.12.tar.xz
diff --git a/package/php/php.mk b/package/php/php.mk
index b1b19ad..f925ec1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.0.11
+PHP_VERSION = 7.0.12
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.7.3
