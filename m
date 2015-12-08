From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 21:22:21 +0100
Subject: [Buildroot] [PATCH] pixman: disable vmx for powerpc CS
	toolchains
In-Reply-To: <1449498431-5872-1-git-send-email-gustavo@zacarias.com.ar>
References: <1449498431-5872-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151208202220.GT4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-07 11:27 -0300, Gustavo Zacarias spake thusly:
> The ppc CS toolchains have flaky VMX (AKA altivec) implementation
> causing build failure. Disable it for these toolchains. Fixes:
> http://autobuild.buildroot.net/results/3b4/3b4cda40f074578f6b35b1fb381ba37b93174e86/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested only]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pixman/pixman.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 8281773..8845315 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -32,5 +32,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405),y)
>  PIXMAN_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DPIXMAN_NO_TLS"
>  endif
>  
> +# Altivec detection isn't reliable for CS toolchains
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103)$(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009),y)
> +PIXMAN_CONF_OPTS += --disable-vmx
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
> -- 
> 2.4.10
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
