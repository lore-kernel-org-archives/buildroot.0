From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Apr 2015 12:39:29 -0300
Subject: [Buildroot] [PATCH 3/3] php: add opcache option
In-Reply-To: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428507569-28044-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428507569-28044-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a Zend OPcache option and tweak the build system into being
cross-compile friendly.
The OPcache extension allows for a neat intermediate bytecode cache in
memory to avoid reinterpreting/recompiling php scripts on multiple runs.
Make it an option since this takes up valuable RAM.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/php/0004-flock-type-linux.patch | 48 +++++++++++++++++++++++++++++++++
 package/php/Config.ext                  |  5 ++++
 package/php/php.mk                      | 13 +++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 package/php/0004-flock-type-linux.patch

diff --git a/package/php/0004-flock-type-linux.patch b/package/php/0004-flock-type-linux.patch
new file mode 100644
index 0000000..a03c262
--- /dev/null
+++ b/package/php/0004-flock-type-linux.patch
@@ -0,0 +1,48 @@
+OPcache: flock mechanism is obviously linux so force it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.6.7.orig/ext/opcache/config.m4 php-5.6.7/ext/opcache/config.m4
+--- php-5.6.7.orig/ext/opcache/config.m4	2015-04-08 11:08:11.125845540 -0300
++++ php-5.6.7/ext/opcache/config.m4	2015-04-08 11:57:23.648831436 -0300
+@@ -326,38 +326,8 @@
+     msg=yes,msg=no,msg=no)
+   AC_MSG_RESULT([$msg])
+ 
+-flock_type=unknown
+-AC_MSG_CHECKING("whether flock struct is linux ordered")
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5 };
+-  int main() { 
+-    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
+-		return 0;
+-    }
+-    return 1;
+-  } 
+-], [
+-	flock_type=linux
+-    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
+-    AC_MSG_RESULT("yes")
+-], AC_MSG_RESULT("no") )
+-
+-AC_MSG_CHECKING("whether flock struct is BSD ordered")
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5 };
+-  int main() { 
+-    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
+-		return 0;
+-    }
+-    return 1;
+-  } 
+-], [
+-	flock_type=bsd
+-    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type]) 
+-    AC_MSG_RESULT("yes")
+-], AC_MSG_RESULT("no") )
++flock_type=linux
++AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
+ 
+ if test "$flock_type" == "unknown"; then
+ 	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
diff --git a/package/php/Config.ext b/package/php/Config.ext
index fafae26..a0898b9 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -10,6 +10,11 @@ config BR2_PACKAGE_PHP_EXT_FILEINFO
 	help
 	  File Information support
 
+config BR2_PACKAGE_PHP_EXT_OPCACHE
+	bool "OPcache"
+	help
+	  Enable the Zend OPcache accelerator.
+
 config BR2_PACKAGE_PHP_EXT_READLINE
 	bool "Readline"
 	select BR2_PACKAGE_NCURSES
diff --git a/package/php/php.mk b/package/php/php.mk
index 12f8eaa..eb4f797 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -38,6 +38,19 @@ PHP_CONFIG_SCRIPTS = php-config
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
 
+# The OPcache extension isn't cross-compile friendly
+# Throw some defines here to avoid patching heavily
+ifeq ($(BR2_PACKAGE_PHP_EXT_OPCACHE),y)
+PHP_CONF_OPTS += --enable-opcache
+PHP_CONF_ENV += ac_cv_func_mprotect=yes
+PHP_CFLAGS += \
+	-DHAVE_SHM_IPC \
+	-DHAVE_SHM_MMAP_ANON \
+	-DHAVE_SHM_MMAP_ZERO \
+	-DHAVE_SHM_MMAP_POSIX \
+	-DHAVE_SHM_MMAP_FILE
+endif
+
 # We need to force dl "detection"
 ifeq ($(BR2_STATIC_LIBS),)
 PHP_CONF_ENV += ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes
-- 
2.0.5
