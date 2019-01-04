From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jan 2019 15:01:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/wine: Add gettext dependency
 for host-wine only with NLS enabled
In-Reply-To: <20190104114909.14166-1-vadim4j@gmail.com>
References: <20190104114909.14166-1-vadim4j@gmail.com>
Message-ID: <20190104140109.GB19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vadim, All,

On 2019-01-04 13:49 +0200, Vadim Kochan spake thusly:
> Checked that host-wine compiles ok without host-gettext, so no
> needs to specify this dependency.
> 
> libgettextpo is required by tools/wrc (https://linux.die.net/man/1/wrc)
> which allows to convert windows resources also to *.po format, which is
> not needed if NLS is disabled.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/wine/wine.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index 78c8e6ab63..ef70b6276c 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -307,8 +307,10 @@ WINE_CONF_OPTS += --without-zlib
>  endif
>  
>  # host-gettext is essential for .po file support in host-wine wrc
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
>  HOST_WINE_DEPENDENCIES += host-gettext
>  HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
> +endif

At the beginning, I was failing to see how/why a target-related option,
BR2_SYSTEM_ENABLE_NLS, would affect a host package.

But it truns out that the target wine needs the host wrc to buile the
.po stuff.

However, we unconditionally compile the target wine with:
    --without-gettext --without-gettextpo

So, why do we need a host wrc? And if we need it, why does it needs
gettext support?

Regards,
Yann E. MORIN.

>  # Wine needs to enable 64-bit build tools on 64-bit host
>  ifeq ($(HOSTARCH),x86_64)
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
