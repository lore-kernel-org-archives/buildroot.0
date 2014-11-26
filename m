From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Nov 2014 23:07:28 +0100
Subject: [Buildroot] [PATCH] libnspr: fix static build
In-Reply-To: <4112e251a7a4b3513c66ff30ac2f502b0aa2541c.1417022842.git.baruch@tkos.co.il>
References: <4112e251a7a4b3513c66ff30ac2f502b0aa2541c.1417022842.git.baruch@tkos.co.il>
Message-ID: <20141126220728.GC4260@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-11-26 19:27 +0200, Baruch Siach spake thusly:
> Disable shared library in a static build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6ff/6ffae151ec3eaca175923ab860cf42167871164c/
> http://autobuild.buildroot.net/results/cab/cab19721c43b3256dd51ae511016bc9ea440512a/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested with the config from 6ff/6ffae15

Regards,
Yann E. MORIN.

> ---
>  package/libnspr/libnspr.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
> index c071d8591fbd..1930870a5108 100644
> --- a/package/libnspr/libnspr.mk
> +++ b/package/libnspr/libnspr.mk
> @@ -21,6 +21,12 @@ LIBNSPR_CONF_OPTS = --host=$(GNU_HOST_NAME)
>  LIBNSPR_CONF_OPTS += --$(if $(BR2_ARCH_IS_64),en,dis)able-64bit
>  LIBNSPR_CONF_OPTS += --$(if $(BR2_INET_IPV6),en,dis)able-ipv6
>  
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +LIBNSPR_MAKE_OPTS = SHARED_LIBRARY=
> +LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SHARED_LIBRARY= install
> +LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) SHARED_LIBRARY= install
> +endif
> +
>  ifeq ($(BR2_arm),y)
>  ifeq ($(BR2_ARM_CPU_HAS_THUMB2),y)
>  LIBNSPR_CONF_OPTS += --enable-thumb2
> -- 
> 2.1.3
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
