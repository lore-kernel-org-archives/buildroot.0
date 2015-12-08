From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 18:16:27 +0100
Subject: [Buildroot] [PATCH] libass: allow compilation without a system
 font provider
In-Reply-To: <1449505148-9046-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1449505148-9046-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151208171627.GO4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-12-07 16:19 +0000, Vicente Olivert Riera spake thusly:
> If no system font provider is provided, then libass will fail to build
> because it requires one by default. The error looks like this:
> 
> configure: error: Either DirectWrite (on Windows), CoreText (on OSX), or
> Fontconfig(Linux, other) is required. If you really want to compile
> withouta system font provider, add
> --disable-require-system-font-provider
> 
> But, as the error messages says, we can allow the compilation without a
> system font provider if we use the above configure option, so let's do
> it.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/3a4/3a4c07a0a54d5497fa8a4be2191856e286729637/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/libass/libass.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libass/libass.mk b/package/libass/libass.mk
> index 83939e2..f1ec503 100644
> --- a/package/libass/libass.mk
> +++ b/package/libass/libass.mk
> @@ -24,6 +24,9 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
>  LIBASS_DEPENDENCIES += host-yasm
>  endif
>  
> +# Allow compilation without a system font provider
> +LIBASS_CONF_OPTS = --disable-require-system-font-provider

It is my understanding that fontconfig *is* a "system font provider", so
maybe that should go n the else-case for fontconfig, below?

>  ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
>  LIBASS_DEPENDENCIES += fontconfig
>  LIBASS_CONF_OPTS += --enable-fontconfig
Here:

    else
    LIBASS_CONF_OPTS += \
        --disable-fontconfig \
        --disable-require-system-font-provider
    endif

Regards,
Yann E. MORIN.

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
