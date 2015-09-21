From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Sep 2015 00:34:26 +0200
Subject: [Buildroot] [PATCHv2] valgrind: build for the right MIPS ISA
	revision level
In-Reply-To: <1442874710-11595-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1442874710-11595-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150921223426.GH3570@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-09-21 23:31 +0100, Vicente Olivert Riera spake thusly:
> When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
> -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture, it
> forcibly adds -march=mips64. This causes Valgrind to be built always for
> the first ISA revision level (R1), even when the user has configured
> Buildroot for the second ISA revision level (R2).
> 
> Since R2 is backwards compatible with R1, you can run a Valgrind built
> for R1 in an R2 core. This is why nobody noticed about this problem, or
> at least nobody complained.
> 
> But, since (I hope) we will support R6 in Buildroot in the near future,
> this problem will become very important because R6 is not backwards
> compatible with R1 or R2, so building Valgrind for R1 when your target
> is R6 will result in a non-working Valgrind.
> 
> Override the CFLAGS variable (which Valgrind appends to its CFLAGS) and
> pass the right -march option, so they take precedence over Valgrind's
> wrongfully detected value.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Improved commit log. (Suggested by Yann E. Morin)
> 
>  package/valgrind/valgrind.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index f8f205e..9500264 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -13,6 +13,19 @@ VALGRIND_CONF_OPTS = --disable-tls
>  VALGRIND_AUTORECONF = YES
>  VALGRIND_INSTALL_STAGING = YES
>  
> +# When Valgrind detects a 32-bit MIPS architecture, it forcibly adds
> +# -march=mips32 to CFLAGS; when it detects a 64-bit MIPS architecture,
> +# it forcibly adds -march=mips64. This causes Valgrind to be built
> +# always for the first ISA revision level (R1), even when the user has
> +# configured Buildroot for the second ISA revision level (R2).
> +#
> +# Override the CFLAGS variable (which Valgrind appends to its CFLAGS)
> +# and pass the right -march option, so they take precedence over
> +# Valgrind's wrongfully detected value.
> +ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)
> +VALGRIND_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -march=$(BR2_GCC_TARGET_ARCH)"
> +endif
> +
>  # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
>  # host tuple to determine whether it's being built for ARMv7 or
>  # not. Therefore, we adjust the host tuple to specify we're on
> -- 
> 2.4.9
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
