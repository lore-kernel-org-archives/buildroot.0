From: Artem Panfilov <panfilov.artyom@gmail.com>
Date: Sat, 16 Feb 2019 02:20:59 +0300
Subject: [Buildroot] [PATCH 2/2] package/php: fix how external PCRE2 JIT is
 enabled
In-Reply-To: <20190215232059.31440-1-panfilov.artyom@gmail.com>
References: <20190215232059.31440-1-panfilov.artyom@gmail.com>
Message-ID: <20190215232059.31440-2-panfilov.artyom@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the external PCRE2 library is used, PHP JIT option is enabled
based on architecture. If the external library was compiled without
JIT support runtime will fail.

When I call "php -m" command, I have the following error message:
PHP Fatal error:  Unable to start pcre module in Unknown on line 0

Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>
---
 ...0006-pcre2-tweak-pcre2-jit-detection.patch | 41 +++++++++++++++++++
 package/php/php.mk                            |  7 ++++
 2 files changed, 48 insertions(+)
 create mode 100644 package/php/0006-pcre2-tweak-pcre2-jit-detection.patch

diff --git a/package/php/0006-pcre2-tweak-pcre2-jit-detection.patch b/package/php/0006-pcre2-tweak-pcre2-jit-detection.patch
new file mode 100644
index 0000000000..492abf008b
--- /dev/null
+++ b/package/php/0006-pcre2-tweak-pcre2-jit-detection.patch
@@ -0,0 +1,41 @@
+diff --git a/ext/pcre/config0.m4 b/ext/pcre/config0.m4
+index b9542f0113..f4c66a8369 100644
+--- a/ext/pcre/config0.m4
++++ b/ext/pcre/config0.m4
+@@ -53,35 +53,7 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
+     AC_DEFINE(HAVE_PCRE, 1, [ ])
+ 
+     if test "$PHP_PCRE_JIT" != "no"; then
+-      AC_MSG_CHECKING([for JIT support in PCRE2])
+-      AC_RUN_IFELSE([
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
+-      ])
++      AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
+     fi
+ 
+     PHP_NEW_EXTENSION(pcre, php_pcre.c, no,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
diff --git a/package/php/php.mk b/package/php/php.mk
index 061b2f2609..eb6907972b 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -246,6 +246,13 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
 PHP_DEPENDENCIES += pcre2
+
+ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
+PHP_CONF_OPTS += --with-pcre-jit
+else
+PHP_CONF_OPTS += --without-pcre-jit
+endif
+
 else
 # The bundled pcre library is not configurable through ./configure options,
 # and by default is configured to be thread-safe, so it wants pthreads. So
-- 
2.19.1
