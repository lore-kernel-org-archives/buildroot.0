From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:43:39 +0200
Subject: [Buildroot] [git commit] package/php: fix how external PCRE2 JIT is
 enabled
Message-ID: <20190417063913.628F2812AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58896f5c976bb61391ab34bb5826f429346f9a6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds ac_cv_have_pcre2_jit cache variable to avoid
the tests running on the host system during cross-compiling.

Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfig0.m4-add-ac_cv_have_pcre2_jit-variabl.patch | 91 ++++++++++++++++++++++
 package/php/php.mk                                 |  9 +++
 2 files changed, 100 insertions(+)

diff --git a/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
new file mode 100644
index 0000000000..4fa24fda63
--- /dev/null
+++ b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
@@ -0,0 +1,91 @@
+From a9151b1a6abde8306c7b46ca52036b2dc9c1b76d Mon Sep 17 00:00:00 2001
+From: Artem Panfilov <panfilov.artyom@gmail.com>
+Date: Tue, 16 Apr 2019 12:02:05 +0300
+Subject: [PATCH] ext/pcre/config0.m4: add ac_cv_have_pcre2_jit variable
+
+The HAVE_PCRE_JIT_SUPPORT check uses AC_RUN_IFELSE, which is not
+available when cross-compiling. As a fallback, JIT support is enabled
+based on CPU architecture. However, this may be wrong,
+e.g. when the JIT the feature was not enabled in the pcre2 build.
+
+Add a cache variable for the PCRE JIT feature to make it possible to
+override the check.
+
+Backported from: 12ee246ae45889004fc2c099c04cfff1ce6e8848
+Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
+---
+ ext/pcre/config0.m4 | 56 +++++++++++++++++++++++----------------------
+ 1 file changed, 29 insertions(+), 27 deletions(-)
+
+diff --git a/ext/pcre/config0.m4 b/ext/pcre/config0.m4
+index b9542f0113..f964429431 100644
+--- a/ext/pcre/config0.m4
++++ b/ext/pcre/config0.m4
+@@ -53,35 +53,37 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
+     AC_DEFINE(HAVE_PCRE, 1, [ ])
+ 
+     if test "$PHP_PCRE_JIT" != "no"; then
+-      AC_MSG_CHECKING([for JIT support in PCRE2])
++      AC_CACHE_CHECK([for JIT support in PCRE2], ac_cv_have_pcre2_jit, [
+       AC_RUN_IFELSE([
+-        AC_LANG_SOURCE([[
+-            #include <pcre2.h>
+-            #include <stdlib.h>
+-            int main(void) {
+-              uint32_t have_jit;
+-              pcre2_config_8(PCRE2_CONFIG_JIT, &have_jit);
+-              return !have_jit;
+-            }
+-        ]])], [
+-        AC_MSG_RESULT([yes])
+-        AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
+-      ],
+-      [
+-        AC_MSG_RESULT([no])
+-      ],
+-      [
+-        AC_CANONICAL_HOST
+-        case $host_cpu in
+-        arm*|i[34567]86|x86_64|mips*|powerpc*|sparc)
+-          AC_MSG_RESULT([yes])
+-          AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
+-          ;;
+-        *)
+-          AC_MSG_RESULT([no])
+-          ;;
+-        esac
++          AC_LANG_SOURCE([[
++              #include <pcre2.h>
++              #include <stdlib.h>
++              int main(void) {
++                uint32_t have_jit;
++                pcre2_config_8(PCRE2_CONFIG_JIT, &have_jit);
++                return !have_jit;
++              }
++          ]])], [
++          ac_cv_have_pcre2_jit=yes
++        ],
++        [
++          ac_cv_have_pcre2_jit=no
++        ],
++        [
++          AC_CANONICAL_HOST
++          case $host_cpu in
++          arm*|i[34567]86|x86_64|mips*|powerpc*|sparc)
++            ac_cv_have_pcre2_jit=yes
++            ;;
++          *)
++            ac_cv_have_pcre2_jit=no
++            ;;
++          esac
++        ])
+       ])
++      if test $ac_cv_have_pcre2_jit = yes; then
++        AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
++      fi
+     fi
+ 
+     PHP_NEW_EXTENSION(pcre, php_pcre.c, no,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
+-- 
+2.17.1
+
diff --git a/package/php/php.mk b/package/php/php.mk
index 541c76755f..d3a4d3984d 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -246,6 +246,15 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += pcre2
+
+ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
+PHP_CONF_OPTS += --with-pcre-jit=yes
+PHP_CONF_ENV += ac_cv_have_pcre2_jit=yes
+else
+PHP_CONF_OPTS += --with-pcre-jit=no
+PHP_CONF_ENV += ac_cv_have_pcre2_jit=no
+endif
+
 else
 # The bundled pcre library is not configurable through ./configure options,
 # and by default is configured to be thread-safe, so it wants pthreads. So
