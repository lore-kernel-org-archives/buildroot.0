From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 16:25:44 +0200
Subject: [Buildroot] [PATCH 06/14] package infra: drop non-IPv6 support
In-Reply-To: <1428754662-27829-6-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
 <1428754662-27829-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150412142544.GH21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-04-11 09:17 -0300, Gustavo Zacarias spake thusly:
> Now that IPv6 is mandatory remove support for non-IPv6 tweaks/variables
> in the package infra.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

You're missing one instance of DISABLE_IPV6 in netsnmp:

    NETSNMP_CONF_OPTS = \
        [--SNIP--]
        --without-kmem-usage $(DISABLE_IPV6) \
        [--SNIP--]

which should just be removed entirely I guess.

Regards,
Yann E. MORIN.

> ---
>  package/Makefile.in      | 6 ------
>  package/pkg-autotools.mk | 2 +-
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index e65e08b..a0c5a7a 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -369,12 +369,6 @@ else
>  DISABLE_NLS :=--disable-nls
>  endif
>  
> -ifeq ($(BR2_INET_IPV6),y)
> -DISABLE_IPV6 = --enable-ipv6
> -else
> -DISABLE_IPV6 = --disable-ipv6
> -endif
> -
>  ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
>  TARGET_CONFIGURE_OPTS += CXX=false
>  endif
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index 2ecf7d8..49b42d4 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -200,8 +200,8 @@ define $(2)_CONFIGURE_CMDS
>  		--with-xmlto=no \
>  		--with-fop=no \
>  		--disable-dependency-tracking \
> +		--enable-ipv6 \
>  		$$(DISABLE_NLS) \
> -		$$(DISABLE_IPV6) \
>  		$$(ENABLE_DEBUG) \
>  		$$(SHARED_STATIC_LIBS_OPTS) \
>  		$$(QUIET) $$($$(PKG)_CONF_OPTS) \
> -- 
> 2.0.5
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
