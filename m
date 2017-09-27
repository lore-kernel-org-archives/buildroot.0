From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Sep 2017 23:01:12 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/diffutils: disable
 getopt_long replacement with glibc
In-Reply-To: <20170923212414.16744-6-romain.naour@gmail.com>
References: <20170923212414.16744-1-romain.naour@gmail.com>
 <20170923212414.16744-6-romain.naour@gmail.com>
Message-ID: <20170927210112.GF2903@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-09-23 23:24 +0200, Romain Naour spake thusly:
> Since glibc >= 2.26, don't try to use getopt_long replacement bundled
> with diffutils. It will conflict with the one from glibc.
> The getopt copy bundled in glibc has been updated with the one from gnulib.

Yeah, because gnulib was such a bright idea... ;-)

> After a lot of warnings...
> Fixes:
> xstrtol-error.c: In function 'xstrtol_error':
> xstrtol-error.c:84:26: error: invalid use of undefined type 'struct rpl_option'
>      option = long_options[opt_idx].name;
>                           ^
> xstrtol-error.c:84:26: error: dereferencing pointer to incomplete type 'const struct rpl_option'
> 
> [...]
> 
> xstrtol-error.c:92:1: error: conflicting types for 'xstrtol_fatal'
>  xstrtol_fatal (enum strtol_error err,
>  ^~~~~~~~~~~~~
> In file included from xstrtol-error.c:20:0:
> xstrtol.h:69:16: note: previous declaration of 'xstrtol_fatal' was here
>  _Noreturn void xstrtol_fatal (enum strtol_error,
>                 ^~~~~~~~~~~~~
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/diffutils/diffutils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
> index 6e5b9b6..79785d6 100644
> --- a/package/diffutils/diffutils.mk
> +++ b/package/diffutils/diffutils.mk
> @@ -11,6 +11,12 @@ DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  DIFFUTILS_LICENSE = GPL-3.0+
>  DIFFUTILS_LICENSE_FILES = COPYING
>  
> +# Since glibc >= 2.26, don't try to use getopt_long replacement bundled
> +# with diffutils. It will conflict with the one from glibc.
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> +DIFFUTILS_CONF_ENV += gl_cv_func_getopt_gnu=yes
> +endif
> +
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  DIFFUTILS_DEPENDENCIES += busybox
>  endif
> -- 
> 2.9.5
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
