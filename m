From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 19:04:14 +0200
Subject: [Buildroot] [PATCH] iptables: disable static for dynamic builds
In-Reply-To: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413910694-21496-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021170414.GJ3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-21 13:58 -0300, Gustavo Zacarias spake thusly:
> It leads to ugly runtime warnings, see:
> http://patchwork.ozlabs.org/patch/386215/
> It's also required for xtables-addons.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Seems sensible to me:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/iptables/iptables.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
> index f059807..2ef879d 100644
> --- a/package/iptables/iptables.mk
> +++ b/package/iptables/iptables.mk
> @@ -12,7 +12,9 @@ IPTABLES_DEPENDENCIES = host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
>  IPTABLES_LICENSE = GPLv2
>  IPTABLES_LICENSE_FILES = COPYING
> -IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
> +# Building static causes ugly warnings on some plugins
> +IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
> +	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
>  # Because of iptables-01-fix-static-link.patch
>  IPTABLES_AUTORECONF = YES
>  
> -- 
> 2.0.4
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
