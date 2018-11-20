From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 20 Nov 2018 08:18:43 +0100
Subject: [Buildroot] [PATCH v3 1/3] glibc: ensure BR2_MAKE is also used
 for subdirs
In-Reply-To: <20181119162515.20360-1-peter@korsgaard.com>
References: <20181119162515.20360-1-peter@korsgaard.com>
Message-ID: <16304_1542698333_5BF3B55D_16304_91_2_20181120071843.GB25610@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

[Notice that you CCed the wrong Yann E. MORIN.]

On 2018-11-19 17:25 +0100, Peter Korsgaard spake thusly:
> The configure script contains logic to figure out what make program to
> invoke for subdirectories (trying gnumake, gmake, make).  Explicitly force
> it to use our BR2_MAKE to ensure the right make version is used.
> 
> As GLIBC_CONF_ENV is only initialized below, move this section below it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin@orange.com>

> ---
> v3: No changes
> v2:
> - Fix CONV/CONF typo, move section below GLIBC_CONF_ENV initialization
> 
>  package/glibc/glibc.mk | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 708c22f723..762c040688 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -31,10 +31,6 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
>  	$(BR2_MAKE_HOST_DEPENDENCY)
>  
> -# glibc requires make >= 4.0 since 2.28 release.
> -# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
> -GLIBC_MAKE = $(BR2_MAKE)
> -
>  GLIBC_SUBDIR = build
>  
>  GLIBC_INSTALL_STAGING = YES
> @@ -82,6 +78,11 @@ ifeq ($(BR2_riscv),y)
>  GLIBC_CONF_ENV += libc_cv_slibdir=/lib64 libc_cv_rtlddir=/lib
>  endif
>  
> +# glibc requires make >= 4.0 since 2.28 release.
> +# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
> +GLIBC_MAKE = $(BR2_MAKE)
> +GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"

Given the importance of the comment, I think it would have been a good
idea to also move the dependency here as well:

    # glibc requires make >= 4.0 since 2.28 release.
    # https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
    GLIBC_DEPENDENCIES += $(BR2_MAKE_HOST_DEPENDENCY)
    GLIBC_MAKE = $(BR2_MAKE)
    GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"

Still, that was not done before, so my reviewed-by tag still stands.

Regards,
Yann E. MORIN.

>  # Even though we use the autotools-package infrastructure, we have to
>  # override the default configure commands for several reasons:
>  #
> -- 
> 2.11.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
