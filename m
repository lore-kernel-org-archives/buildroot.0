From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 25 Jan 2016 21:59:03 +0100
Subject: [Buildroot] [PATCH 08/21] apache, apr: fix atomic handling
In-Reply-To: <1453676887-31236-9-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125205903.GI3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> Since the apache package was introduced,
> --enable-nonportable-atomics=yes was passed when
> BR2_ARCH_HAS_ATOMICS. However, Apache doesn't take this option: it
> only passes it down when building the APR library. But since we're
> building APR separately, this statement had no effect.
> 
> So this commit removes the useless code from the Apache package, and
> instead adds the appropriate logic to the apr package, using the new
> BR2_TOOLCHAIN_HAS_SYNC_x symbols rather than BR2_ARCH_HAS_ATOMICS.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/apache/apache.mk |  4 ----
>  package/apr/apr.mk       | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 8e7b6be..e752fcc 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -35,10 +35,6 @@ APACHE_CONF_OPTS = \
>  	--disable-lua \
>  	--disable-luajit
>  
> -ifeq ($(BR2_ARCH_HAS_ATOMICS),y)
> -APACHE_CONF_OPTS += --enable-nonportable-atomics=yes
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
>  APACHE_DEPENDENCIES += libxml2
>  # Apache wants the path to the header file, where it can find
> diff --git a/package/apr/apr.mk b/package/apr/apr.mk
> index 0fed19c..33873a0 100644
> --- a/package/apr/apr.mk
> +++ b/package/apr/apr.mk
> @@ -35,6 +35,23 @@ endif
>  # Fix lfs detection when cross compiling
>  APR_CONF_ENV += apr_cv_use_lfs64=yes
>  
> +# Use non-portable atomics when available: 8 bytes atomics are used on
> +# 64-bits architectures, 4 bytes atomics on 32-bits architectures. We
> +# have to override ap_cv_atomic_builtins because the test used to
> +# check for atomic builtins uses AC_TRY_RUN, which doesn't work when
> +# cross-compiling.
> +ifeq ($(BR2_ARCH_IS_64),y)
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8),y)
> +APR_CONF_OPTS += --enable-nonportable-atomics
> +APR_CONF_ENV += ap_cv_atomic_builtins=yes
> +endif
> +else
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
> +APR_CONF_OPTS += --enable-nonportable-atomics
> +APR_CONF_ENV += ap_cv_atomic_builtins=yes
> +endif
> +endif

What about forcing --disable-nonportable-atomics ?

The code does:

   643 AC_ARG_ENABLE(nonportable-atomics,
   644 [  --enable-nonportable-atomics  Use optimized atomic code which may produce nonportable binaries],
   645 [if test $enableval = yes; then
   646    force_generic_atomics=no
   647  else
   648    force_generic_atomics=yes
   649  fi
   650 ],
   651 [case $host_cpu in
   652    i[[456]]86) force_generic_atomics=yes ;;
   653    *) force_generic_atomics=no ;;
   654 esac
   655 ])
 
So, it looks like, if one does not provide any of --enable/disable, it
will try to decide based on the CPU.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
>  APR_DEPENDENCIES += util-linux
>  endif
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
