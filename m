From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Aug 2015 14:21:42 +0200
Subject: [Buildroot] [PATCH] libpthsem: fix setjmp/longjmp detection
In-Reply-To: <1439982525-6788-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1439982525-6788-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150819122142.GA3830@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-19 13:08 +0200, Thomas Petazzoni spake thusly:
> libpthsem has been affected since quite a while by build issues, but
> occuring only on Nathaniel Roach's autobuilder. The failure message
> is:
> 
>   error: #error "Unsupported Linux (g)libc version and/or platform"
[--SNIP--]
> Fixes:
> 
>   http://autobuild.buildroot.org/results/3dd/3dd66d70c2e36f2d9fb0a0fe01bbdec009d55067/
>   and many similar build failures

Impressive work! :-)

> This patch has been tested by Nathaniel Roach in the context of his
> autobuilder instance which was causing the original problem.
> 
> Tested-by: Nathaniel Roach <nroach44@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

So I've made a little uname wrapper that fakes a 4.1.2 kernel version,
and I was able to reproduce the build failure, now.

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Here are the tests I've done (4.1.2 was with the uname wrapper first in
the PATH):

                  |                 uname -r
                  | 3.13.0-62-generic       4.1.2
    --------------+-----------------------------------
    master        | builds                  broken
    this patch    | builds                  builds

For reference, here's the uname wrapper:

    #!/bin/bash
    real_uname="/bin/uname"
    real_version="$( "${real_uname}" -r )"
    "${real_uname}" "${@}" |sed -r -e "s/${real_version//./\\.}/4.1.2/;"

Regards,
Yann E. MORIN.

> ---
>  package/libpthsem/libpthsem.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
> index f9f6f71..b8a3d7d 100644
> --- a/package/libpthsem/libpthsem.mk
> +++ b/package/libpthsem/libpthsem.mk
> @@ -13,6 +13,20 @@ LIBPTHSEM_AUTORECONF = YES
>  LIBPTHSEM_INSTALL_STAGING = YES
>  LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
>  
> +# Force the setjmp/longjmp detection, because the test being done in
> +# the AC_CHECK_SJLJ macro is not cross-compilation safe: it checks the
> +# running kernel with 'uname -r', and checks the C library version by
> +# looking at /usr/include/features.h. In terms of kernel version, it
> +# assumes any version later than 2.2.x is fine, except that it doesn't
> +# recognize 4.x as a valid kernel version, recognizing such systems as
> +# "braindead" and therefore falling back to the 'sjljlx' value for
> +# ac_cv_check_sjlj. In terms of C library version, it wants
> +# __GLIBC_MINOR to be at least 1. Since both conditions are true for
> +# all Buildroot systems, we can simply force the setjmp/longjmp
> +# detection to ssjlj.
> +LIBPTHSEM_CONF_ENV += \
> +	ac_cv_check_sjlj=ssjlj
> +
>  ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
>  LIBPTHSEM_CONF_OPTS += --enable-compat
>  LIBPTHSEM_CONFIG_SCRIPTS += pth-config
> -- 
> 2.5.0
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
