From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Sep 2015 19:41:44 +0200
Subject: [Buildroot] [PATCH] valgrind: build for the right MIPS ISA
	revision level
In-Reply-To: <1442840551-13640-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1442840551-13640-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150921174144.GC3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-09-21 14:02 +0100, Vicente Olivert Riera spake thusly:
> When valgrind detects a 32-bit MIPS architecture adds -march=mips32 to
> CFLAGS, and when it detects a 64-bit MIPS architecture adds
> -march=mips64 instead.

Hmm.. This looks like the sentence is missing some verbs. What about:


    When valgrind detects a 32-bit MIPS architecture, it forcibly adds
    -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
    it forcibly adds -march=mips64. This causes valgrind to be built
    always for the first ISA revision level (R1), even when the user has
    configured Buildroot for the second ISA revision level (R2).

    Since R2 is backwards compatible with R1, you can run a valgrind
    built for R1 in an R2 core. This is why nobody noticed about this
    problem, or at least nobody complained.

    But, since (I hope) we will support R6 in Buildroot in the near
    future, this problem will become very important because R6 is not
    backwards compatible with R1 or R2, so building valgrind for R1 when
    your target is R6 will result in a non-working valgrind.

    Override the CFLAGS variable (which Valgrind appends to its CFLAGS)
    and pass the right -march option, so they take precedence over
    Valgrind's wrongfully detected value.
 

(I find this new layout more meaningful: it explains the current status
in Valgrind in ?1, explains why this is a problem in ?2-3, and explains
how we fix it in ?4.)

But that's mostly nit-picking. ;-)

> This causes valgrind to be built always for the
> first ISA revision level (R1) which is not correct because our target
> architecture could have a different ISA revision level (i.e. R2). We
> need to override the CFLAGS variable and pass the right -march option.
> 
> Since R2 is backwards compatible with R1, you can run a valgrind built
> for R1 in an R2 core. This is why nobody noticed about this problem, or
> at least nobody complained. But, since (I hope) we will support R6 in
> Buildroot in the near future, this problem will become very important
> because R6 is not backwards compatible with R1 or R2, so building
> valgrind for R1 when your target is R6 will result in a non-working
> valgrind.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/valgrind/valgrind.mk |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index f8f205e..944e721 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -13,6 +13,16 @@ VALGRIND_CONF_OPTS = --disable-tls
>  VALGRIND_AUTORECONF = YES
>  VALGRIND_INSTALL_STAGING = YES
>  
> +# When valgrind detects a 32-bit MIPS architecture adds -march=mips32 to
> +# CFLAGS, and when it detects a 64-bit MIPS architecture adds

Ditto, the sentence looks weird.

Regards,
Yann E. MORIN.

> +# -march=mips64 instead. This causes valgrind to be built always for the
> +# first ISA revision level (R1) which is not correct because our target
> +# architecture could have a different ISA revision level (i.e. R2). We
> +# need to override the CFLAGS variable and pass the right -march option.
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +VALGRIND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -march=$(BR2_GCC_TARGET_ARCH)"
> +endif
> +
>  # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
>  # host tuple to determine whether it's being built for ARMv7 or
>  # not. Therefore, we adjust the host tuple to specify we're on
> -- 
> 1.7.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
