From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Nov 2019 23:11:39 +0100
Subject: [Buildroot] [PATCH 07/15] package/connman: adapt to preset-all
In-Reply-To: <20191103165640.21819-8-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
 <20191103165640.21819-8-jeremy.rosen@smile.fr>
Message-ID: <20191109221139.GT3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-03 17:56 +0100, J?r?my Rosen spake thusly:
> connman has two services
> * connman.service which is the real daemon
> * connman-wait-online.service which is a sync point for network-online.target
> 
> Only the first one was enabled. This adaptation enables both.
> 
> Not enabling connman-wait-online.service is probably a bug

Actually no, that's not a bug; not enabling it is a privacy feature.
Some people are concerned about the phone-home-alike that check-online
may do.

Regards,
Yann E. MORIN.

> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/connman/connman.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 839bc7a0e2..d70eb1ac82 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
>  endef
>  
> -define CONNMAN_INSTALL_INIT_SYSTEMD
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -	ln -fs ../../../../usr/lib/systemd/system/connman.service \
> -		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
> -endef
> -
>  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
>  CONNMAN_CONF_OPTS += --enable-client
>  CONNMAN_DEPENDENCIES += readline
> -- 
> 2.24.0.rc1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
