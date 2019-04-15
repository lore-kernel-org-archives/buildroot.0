From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Apr 2019 14:45:50 +0200
Subject: [Buildroot] [PATCH v2] package/php: fix how external PCRE2 JIT
 is enabled
In-Reply-To: <20190415094921.1050-1-panfilov.artyom@gmail.com>
References: <20190415094921.1050-1-panfilov.artyom@gmail.com>
Message-ID: <df60ec38-7222-6728-fac5-9332ab91ef82@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Artem,

On 15/04/2019 11:49, Artem Panfilov wrote:
> This patch adds ac_cv_have_pcre2_jit cache variable to avoid
> the tests running on the host system during cross-compiling.
> 
> Changes v1 -> v2:
>  - add autoconf cache variable (suggested by Thomas Petazzoni)

 The changelog should be after your Sob, separated by a --- line. This way, it
is removed in the final commit message in git.

> 
> Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>

 So here:

---
Changes v1 -> v2:
 - add autoconf cache variable (suggested by Thomas Petazzoni)

> ---
>  ....m4-add-ac_cv_have_pcre2_jit-variabl.patch | 58 +++++++++++++++++++
>  package/php/php.mk                            |  7 +++
>  2 files changed, 65 insertions(+)
>  create mode 100644 package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
> 
> diff --git a/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
> new file mode 100644
> index 0000000000..5a2b80ac96
> --- /dev/null
> +++ b/package/php/0006-ext-pcre-config0.m4-add-ac_cv_have_pcre2_jit-variabl.patch
> @@ -0,0 +1,58 @@
> +From 4c23e174123c67363d51326b88c1160b389ed4c1 Mon Sep 17 00:00:00 2001
> +From: Artem Panfilov <panfilov.artyom@gmail.com>
> +Date: Mon, 15 Apr 2019 12:10:41 +0300
> +Subject: [PATCH] ext/pcre/config0.m4: add ac_cv_have_pcre2_jit variable
> +
> +This patch adds ac_cv_have_pcre2_jit cache variable to avoid
> +the tests running on the host system during cross-compiling.

 Not entirely accurate. Better:

The HAVE_PCRE_JIT_SUPPORT check uses AC_RUN_IFELSE, which is not available when
cross-compiling. As a fallback, a guess is made based on the host_cpu. However,
this may be wrong, e.g. when the JIT feature was not enabled in the pcre build.

Add a cache variable for the PCRE JIT feature, so it is possible to override the
check.

> +
> +Signed-off-by: Artem Panfilov <panfilov.artyom@gmail.com>

 Did you send this patch upstream? If yes, please add a reference here to the
upstream pull request or list archive entry or bug report. If no, please do so :-)

> +---
> + ext/pcre/config0.m4 | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/ext/pcre/config0.m4 b/ext/pcre/config0.m4
> +index b9542f0113..a0bf14cb4a 100644
> +--- a/ext/pcre/config0.m4
> ++++ b/ext/pcre/config0.m4
> +@@ -52,8 +52,8 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
> +     AC_DEFINE(PCRE2_CODE_UNIT_WIDTH, 8, [ ])
> +     AC_DEFINE(HAVE_PCRE, 1, [ ])
> + 
> +-    if test "$PHP_PCRE_JIT" != "no"; then

 I think this condition should not be removed.

> +-      AC_MSG_CHECKING([for JIT support in PCRE2])
> ++    AC_CACHE_CHECK([for JIT support in PCRE2], ac_cv_have_pcre2_jit,
> ++      [AC_MSG_CHECKING([for JIT support in PCRE2])

 The AC_MSG_CHECKING is implied by AC_CACHE_CHECK.

 Also, ac_cv_have_prce2_jit=no should be added explicitly here AFAIU.

 Regards,
 Arnout

> +       AC_RUN_IFELSE([
> +         AC_LANG_SOURCE([[
> +             #include <pcre2.h>
> +@@ -65,7 +65,7 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
> +             }
> +         ]])], [
> +         AC_MSG_RESULT([yes])
> +-        AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
> ++        ac_cv_have_pcre2_jit=yes
> +       ],
> +       [
> +         AC_MSG_RESULT([no])
> +@@ -75,13 +75,16 @@ PHP_ARG_WITH(pcre-jit,,[  --with-pcre-jit         Enable PCRE JIT functionality
> +         case $host_cpu in
> +         arm*|i[34567]86|x86_64|mips*|powerpc*|sparc)
> +           AC_MSG_RESULT([yes])
> +-          AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
> ++          ac_cv_have_pcre2_jit=yes
> +           ;;
> +         *)
> +           AC_MSG_RESULT([no])
> +           ;;
> +         esac
> +       ])
> ++    ])
> ++    if test $ac_cv_have_pcre2_jit = yes; then
> ++      AC_DEFINE(HAVE_PCRE_JIT_SUPPORT, 1, [])
> +     fi
> + 
> +     PHP_NEW_EXTENSION(pcre, php_pcre.c, no,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
> +-- 
> +2.17.1
> +
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 541c76755f..e570ed6f7e 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -246,6 +246,13 @@ PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND
>  ifeq ($(BR2_PACKAGE_PCRE2),y)
>  PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
>  PHP_DEPENDENCIES += pcre2
> +
> +ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
> +PHP_CONF_ENV += ac_cv_have_pcre2_jit=yes
> +else
> +PHP_CONF_ENV += ac_cv_have_pcre2_jit=no
> +endif
> +
>  else
>  # The bundled pcre library is not configurable through ./configure options,
>  # and by default is configured to be thread-safe, so it wants pthreads. So
> 
