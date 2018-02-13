From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:42:58 +0100
Subject: [Buildroot] [master 1/1] php: disable valgrind
In-Reply-To: <20180212170112.12313-1-aduskett@gmail.com>
References: <20180212170112.12313-1-aduskett@gmail.com>
Message-ID: <20180213224258.70de201b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 12:01:12 -0500, Adam Duskett wrote:
> Introduced in PHP7.2, if a host has valgrind headers installed, PHP will detect
> them and set HAVE_VALGRIND to 1.
> Disable this entry after configuring.
> 
> fixes:
> http://autobuild.buildroot.net/results/d59/d59b5961890aeddcd6d59ed52243be6554d1fe21
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/php/php.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index a4481c45c7..e6bc1e47e1 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -232,6 +232,11 @@ define PHP_DISABLE_PCRE_JIT
>  	$(SED) '/^#define SUPPORT_JIT/d' $(@D)/ext/pcre/pcrelib/config.h
>  endef
>  
> +define PHP_DISABLE_VALGRIND
> +	$(SED) '/^#define HAVE_VALGRIND/d' $(@D)/main/php_config.h
> +endef
> +PHP_POST_CONFIGURE_HOOKS += PHP_DISABLE_VALGRIND

Thanks, applied to master. But when I look at the reason why Valgrind
is incorrectly detected, then I understand why people hate autoconf:
because they don't understand at all how to use it properly, do
completely non-sense utter crap with it, and then complain that
autoconf sucks.

They do this non-sense:

AC_DEFUN([PHP_CHECK_VALGRIND], [
  AC_MSG_CHECKING([for valgrind])

  SEARCH_PATH="/usr/local /usr"
  SEARCH_FOR="/include/valgrind/valgrind.h"
  for i in $SEARCH_PATH ; do
    if test -r $i/$SEARCH_FOR; then
      VALGRIND_DIR=$i
    fi
  done

  if test -z "$VALGRIND_DIR"; then
    AC_MSG_RESULT([not found])
  else
    AC_MSG_RESULT(found in $VALGRIND_DIR)
    AC_DEFINE(HAVE_VALGRIND, 1, [ ])
  fi
])

Which could be replaced be:

	AC_CHECK_HEADERS([valgrind/valgrind.h])

(HAVE_VALGRIND would have to be replaced by HAVE_VALGRIND_VALGRIND_H)

Which has several advantages:

 - It is much shorter
 - It is not utterly broken for cross-compilation
 - It supports a cache variable

If you're in the mood to send a patch to PHP upstream, I think this
would be a useful contribution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
