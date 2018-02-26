From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:45:07 +0100
Subject: [Buildroot] [git commit] php: add patch to fix build on static-only
 systems
Message-ID: <20180226224614.12AA1882EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22c12f186200b669ae8aa9ca5296c34c34b32a9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to PHP to fix the build on static-only
system, a regression introduced in PHP recently.

Fixes:

  http://autobuild.buildroot.net/results/fbf7ebbb9502424727006f39e169ec1ee870186d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...i.c-build-empty-php_load_zend_extension_c.patch | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/php/0009-main-php_ini.c-build-empty-php_load_zend_extension_c.patch b/package/php/0009-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
new file mode 100644
index 0000000000..bc5149d1d6
--- /dev/null
+++ b/package/php/0009-main-php_ini.c-build-empty-php_load_zend_extension_c.patch
@@ -0,0 +1,62 @@
+From b7bbdfbcb0869b5c068143d4e27bab9eac4ae72b Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 26 Feb 2018 19:30:55 +0100
+Subject: [PATCH] main/php_ini.c: build empty php_load_zend_extension_cb() when
+ !HAVE_LIBDL
+
+Commit 0782a7fc6314c8bd3cbfd57f12d0479bf9cc8dc7 ("Fixed bug #74866
+extension_dir = "./ext" now use current directory for base") modified
+the php_load_zend_extension_cb() function to use php_load_shlib(), and
+pass a handle to the newly introduced zend_load_extension_handle()
+function instead of passing the extension path to
+zend_load_extension().
+
+While doing so, it introduced a call to php_load_shlib() from code
+that is built even when HAVE_LIBDL is not defined. However,
+php_load_shlib() is not implemented when HAVE_LIBDL is not defined,
+for obvious reasons.
+
+It turns out that zend_load_extension_handle() anyway doesn't do
+anything when ZEND_EXTENSIONS_SUPPORT is defined to 0, and
+ZEND_EXTENSIONS_SUPPORT is not defined when HAVE_LIBDL is not defined
+(Zend/zend_portability.h).
+
+Fixes the following build failure when building on a system that
+doesn't have libdl:
+
+main/php_ini.o: In function `php_load_zend_extension_cb':
+php_ini.c:(.text+0x478): undefined reference to `php_load_shlib'
+php_ini.c:(.text+0x4b0): undefined reference to `php_load_shlib'
+collect2: error: ld returned 1 exit status
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://github.com/php/php-src/pull/3161
+---
+ main/php_ini.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/main/php_ini.c b/main/php_ini.c
+index ba58eb1180..fca263e5f0 100644
+--- a/main/php_ini.c
++++ b/main/php_ini.c
+@@ -350,6 +350,7 @@ static void php_load_php_extension_cb(void *arg)
+ 
+ /* {{{ php_load_zend_extension_cb
+  */
++#ifdef HAVE_LIBDL
+ static void php_load_zend_extension_cb(void *arg)
+ {
+ 	char *filename = *((char **) arg);
+@@ -409,6 +410,9 @@ static void php_load_zend_extension_cb(void *arg)
+ 		efree(libpath);
+ 	}
+ }
++#else
++static void php_load_zend_extension_cb(void *arg) { }
++#endif
+ /* }}} */
+ 
+ /* {{{ php_init_config
+-- 
+2.14.3
+
