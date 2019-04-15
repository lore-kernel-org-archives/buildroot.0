From: Artem Panfilov <panfilov.artyom@gmail.com>
Date: Mon, 15 Apr 2019 12:49:21 +0300
Subject: [Buildroot] [PATCH v2] package/php: fix how external PCRE2 JIT is
 enabled
Message-ID: <20190415094921.1050-1-panfilov.artyom@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds ac_cv_have_pcre2_jit cache variable to avoid
the tests running on the host system during cross-compiling.

Changes v1 -> v2:
 - add autoconf cache variable (suggested by Thomas Petazzoni)

Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
---
 ....m4-add-ac_cv_have_pcre2_jit-variabl.patch | 58 +++++++++++++++++++
 package/php/php.mk                            |  7 +++
 2 files changed, 65 insertions(+)
 create mode 100644 package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch

diff --git a/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
new file mode 100644
index 0000000000..5a2b80ac96
--- /dev/null
+++ b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
@@ -0,0 +1,58 @@
+From 4c23e174123c67363d51326b88c1160b389ed4c1 Mon Sep 17 00:00:00 2001
+From: Artem Panfilov <panfilov.artyom@gmail.com>
+Date: Mon, 15 Apr 2019 12:10:41 +0300
+Subject: [PATCH] ext/pcre/config0.m4: add ac_cv_have_pcre2_jit variable
+
+This patch adds ac_cv_have_pcre2_jit cache variable to avoid
+the tests running on the host system during cross-compiling.
+
+Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
+---
+ ext/pcre/config0.m4 | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/ext/pcre/config0.m4 b/ext/pcre/config0.m4
+index b9542f0113..a0bf14cb4a 100644
+--- a/ext/pcre/config0.m4
++++ b/ext/pcre/config0.m4
+@@ -52,8 +52,8 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
+     AC_DEFINE(PCRE2_CODE_UNIT_WIDTH, 8, [ ])
+     AC_DEFINE(HAVE_PCRE, 1, [ ])
+ 
+-    if test "$PHP_PCRE_JIT" != "no"; then
+-      AC_MSG_CHECKING([for JIT support in PCRE2])
++    AC_CACHE_CHECK([for JIT support in PCRE2], ac_cv_have_pcre2_jit,
++      [AC_MSG_CHECKING([for JIT support in PCRE2])
+       AC_RUN_IFELSE([
+         AC_LANG_SOURCE([[
+             #include <pcre2.h>
+@@ -65,7 +65,7 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
+             }
+         ]])], [
+         AC_MSG_RESULT([yes])
+-        AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
++        ac_cv_have_pcre2_jit=yes
+       ],
+       [
+         AC_MSG_RESULT([no])
+@@ -75,13 +75,16 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
+         case $host_cpu in
+         arm*|i[34567]86|x86_64|mips*|powerpc*|sparc)
+           AC_MSG_RESULT([yes])
+-          AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
++          ac_cv_have_pcre2_jit=yes
+           ;;
+         *)
+           AC_MSG_RESULT([no])
+           ;;
+         esac
+       ])
++    ])
++    if test $ac_cv_have_pcre2_jit = yes; then
++      AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
+     fi
+ 
+     PHP_NEW_EXTENSION(pcre, php_pcre.c, no,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
+-- 
+2.17.1
+
diff --git a/package/php/php.mk b/package/php/php.mk
index 541c76755f..e570ed6f7e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -246,6 +246,13 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += pcre2
+
+ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
+PHP_CONF_ENV += ac_cv_have_pcre2_jit=yes
+else
+PHP_CONF_ENV += ac_cv_have_pcre2_jit=no
+endif
+
 else
 # The bundled pcre library is not configurable through ./configure options,
 # and by default is configured to be thread-safe, so it wants pthreads. So
-- 
2.17.1
