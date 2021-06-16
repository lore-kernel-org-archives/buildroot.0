From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:39:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/weston: add configuration
 options for weston shells
In-Reply-To: <20210616124201.1345632-1-martin.elshuber@theobroma-systems.com>
References: <20210616124201.1345632-1-martin.elshuber@theobroma-systems.com>
Message-ID: <20210616193912.GQ2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2021-06-16 14:42 +0200, Martin Elshuber spake thusly:
> Enable selection of used weston shells. By default all available
> shells are enabled to keep the old behavior. The new configuration
> options enable the user to select them individually.
> 
> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
> Changes v1->v2:
>  - Show comment if no shell is selected

I've made a few changes:

  - ensure at least one shell is enabled; desktop arbitrarily chosen
  - s/BR2_PACKAGE_WESTON_SHELL_SELECTED/BR2_PACKAGE_WESTON_HAS_SHELL/
  - reword associated comment

and applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Martin Elshuber <martin.elshuber@theobroma-systems.com>
> ---
>  package/weston/Config.in | 27 +++++++++++++++++++++++++++
>  package/weston/weston.mk | 24 ++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index d07eba4c9d..bd6b0fdbff 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -119,6 +119,33 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>  comment "XWayland support needs libepoxy and X.org enabled"
>  	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
>  
> +config BR2_PACKAGE_WESTON_SHELL_DESKTOP
> +	bool "desktop shell"
> +	default y
> +	select BR2_PACKAGE_WESTON_SHELL_SELECTED
> +
> +config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
> +	bool "fullscreen shell"
> +	default y
> +	select BR2_PACKAGE_WESTON_SHELL_SELECTED
> +
> +config BR2_PACKAGE_WESTON_SHELL_IVI
> +	bool "ivi shell"
> +	default y
> +	select BR2_PACKAGE_WESTON_SHELL_SELECTED
> +
> +config BR2_PACKAGE_WESTON_SHELL_KIOSK
> +	bool "kiosk shell"
> +	default y
> +	select BR2_PACKAGE_WESTON_SHELL_SELECTED
> +
> +# Hidden option selected by any westen shell
> +config BR2_PACKAGE_WESTON_SHELL_SELECTED
> +	bool
> +
> +comment "Warning: Weston needs at least one shell selected"
> +	depends on !BR2_PACKAGE_WESTON_SHELL_SELECTED
> +
>  config BR2_PACKAGE_WESTON_DEMO_CLIENTS
>  	bool "demo clients"
>  	depends on BR2_USE_MMU # pango
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 8afe4bbab4..6dd5439291 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -133,6 +133,30 @@ else
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
