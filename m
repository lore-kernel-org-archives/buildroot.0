From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 12:14:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: add configuration
 options for weston shells
In-Reply-To: <20210511154006.630376-1-martin.elshuber@theobroma-systems.com>
References: <20210511154006.630376-1-martin.elshuber@theobroma-systems.com>
Message-ID: <20210519101415.GQ2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2021-05-11 17:40 +0200, Martin Elshuber spake thusly:
> Enable selection of used weston shells. By default all available
> shells are enabled to keep the old behavior. The new configuration
> options enable the user to select them individually.

Don't we have to ensure that at least one is enabled, or is it valid to
disable all of them?

Regards,
Yann E. MORIN.

> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>  package/weston/Config.in | 16 ++++++++++++++++
>  package/weston/weston.mk | 24 ++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index d07eba4c9d..60351ff09d 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -119,6 +119,22 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>  comment "XWayland support needs libepoxy and X.org enabled"
>  	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
>  
> +config BR2_PACKAGE_WESTON_SHELL_DESKTOP
> +	bool "desktop shell"
> +	default y
> +
> +config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
> +	bool "fullscreen shell"
> +	default y
> +
> +config BR2_PACKAGE_WESTON_SHELL_IVI
> +	bool "ivi shell"
> +	default y
> +
> +config BR2_PACKAGE_WESTON_SHELL_KIOSK
> +	bool "kiosk shell"
> +	default y
> +
>  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	bool "demo clients"
>  	depends on BR2_USE_MMU # pango
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index f59963bf2e..6953132c57 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -132,6 +132,30 @@ else
>  WESTON_CONF_OPTS += -Dtest-junit-xml=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WESTON_SHELL_DESKTOP),y)
> +WESTON_CONF_OPTS += -Dshell-desktop=true
> +else
> +WESTON_CONF_OPTS += -Dshell-desktop=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WESTON_SHELL_FULLSCREEN),y)
> +WESTON_CONF_OPTS += -Dshell-fullscreen=true
> +else
> +WESTON_CONF_OPTS += -Dshell-fullscreen=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WESTON_SHELL_IVI),y)
> +WESTON_CONF_OPTS += -Dshell-ivi=true
> +else
> +WESTON_CONF_OPTS += -Dshell-ivi=false
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WESTON_SHELL_KIOSK),y)
> +WESTON_CONF_OPTS += -Dshell-kiosk=true
> +else
> +WESTON_CONF_OPTS += -Dshell-kiosk=false
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WESTON_DEMO_CLIENTS),y)
>  WESTON_CONF_OPTS += -Ddemo-clients=true
>  WESTON_DEPENDENCIES += pango
> -- 
> 2.30.2
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
