From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 14:26:56 +0200
Subject: [Buildroot] [git commit] php: add patch to fix static library build
Message-ID: <20160810125340.4C61E7FFD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f74932e1eedaa97a6dbb51b2c345e6e1a585e1fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to PHP which fixes the build for
BR2_STATIC_LIBS=y configurations.

Fixes:

  http://autobuild.buildroot.net/results/885f418cc26c6832a8a9abf703aecbeea8fbe550/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...pt-enclose-phpdbg_load_module_or_extensio.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch b/package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch
new file mode 100644
index 0000000..006a034
--- /dev/null
+++ b/package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch
@@ -0,0 +1,47 @@
+From 9ca3de0446fcd31b1561b333020ae0674a83bec7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 9 Aug 2016 11:39:10 +0200
+Subject: [PATCH] phpdbg_prompt: enclose phpdbg_load_module_or_extension() in
+ HAVE_LIBDL
+
+The phpdbg_load_module_or_extension() function relies on libdl
+functionality, so it should be enclosed in HAVE_LIBDL to avoid the
+following build failure when libdl support is not available:
+
+php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c20): undefined reference to `_DL_LOAD'
+php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c36): undefined reference to `_GET_DL_ERROR'
+php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c6a): undefined reference to `_DL_FETCH_SYMBOL'
+php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1c7e): undefined reference to `_DL_FETCH_SYMBOL'
+php-7.0.9/sapi/phpdbg/phpdbg_prompt.c:(.text+0x1dc6): undefined reference to `_DL_UNLOAD'
+
+This function is only called in the "dl" debug command, inside an
+HAVE_LIBDL condition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ sapi/phpdbg/phpdbg_prompt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sapi/phpdbg/phpdbg_prompt.c b/sapi/phpdbg/phpdbg_prompt.c
+index 6f73d30..6768dc5 100644
+--- a/sapi/phpdbg/phpdbg_prompt.c
++++ b/sapi/phpdbg/phpdbg_prompt.c
+@@ -1019,6 +1019,7 @@ static int add_zendext_info(zend_extension *ext) /* {{{ */ {
+ }
+ /* }}} */
+ 
++#ifdef HAVE_LIBDL
+ PHPDBG_API const char *phpdbg_load_module_or_extension(char **path, char **name) /* {{{ */ {
+ 	DL_HANDLE handle;
+ 	char *extension_dir;
+@@ -1158,6 +1159,7 @@ quit:
+ 	DL_UNLOAD(handle);
+ 	return NULL;
+ }
++#endif
+ /* }}} */
+ 
+ PHPDBG_COMMAND(dl) /* {{{ */
+-- 
+2.7.4
+
