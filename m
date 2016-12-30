From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 30 Dec 2016 16:10:06 +0100
Subject: [Buildroot] [PATCH] efl: optional 'upower' ecore system module.
In-Reply-To: <20161230145104.20804-1-barbieri@profusion.mobi>
References: <CAPdpN3BnRBvciT2GjvVDWa5gvWXFNyVxkA9b1X1VOrE2-hBPrg@mail.gmail.com>
 <20161230145104.20804-1-barbieri@profusion.mobi>
Message-ID: <b04bdf4d-44ef-f18f-ceb5-bd5590cb4dd3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 30/12/2016 ? 15:51, Gustavo Sverzut Barbieri a ?crit :
> Ecore will reach 'upower' using D-Bus system bus in order to detect if
> the system state changes and let applications know about the power
> state such as low battery or AC power in order to optimize their power
> consumption.
> 
> For host this is not needed and would not work, since output/host DBus
> declares its own output/host/var/run/dbus/system_bus_socket, which has
> no dbus-daemon and thus no services in it.
> 
> For target it's optional and only installed if BR2_PACKAGE_UPOWER=y,
> otherwise it prints error messages about missing upower service.
> 
> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>

Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>

Obviously after the commit of upower package:
http://patchwork.ozlabs.org/patch/709564/

Thanks!

Best regards,
Romain

> ---
>  package/efl/efl.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> index 7a8e47f4c..2fe140a30 100644
> --- a/package/efl/efl.mk
> +++ b/package/efl/efl.mk
> @@ -272,6 +272,18 @@ else
>  EFL_CONF_OPTS += --disable-librsvg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_UPOWER),)
> +# upower ecore system module is only useful if upower
> +# dbus service is available.
> +# It's not essential, only used to notify applications
> +# of power state, such as low battery or AC power, so
> +# they can adapt their power consumption.
> +define EFL_HOOK_REMOVE_UPOWER
> +	rm -fr $(TARGET_DIR)/usr/lib/ecore/system/upower
> +endef
> +EFL_POST_INSTALL_TARGET_HOOKS = EFL_HOOK_REMOVE_UPOWER
> +endif
> +
>  $(eval $(autotools-package))
>  
>  ################################################################################
> @@ -352,4 +364,13 @@ else
>  HOST_EFL_CONF_OPTS += --disable-cxx-bindings
>  endif
>  
> +# Always disable upower system module from host as it's
> +# not useful and would try to use the output/host/var
> +# system bus which is non-existent and does not contain
> +# any upower service in it.
> +define HOST_EFL_HOOK_REMOVE_UPOWER
> +	rm -fr $(HOST_DIR)/usr/lib/ecore/system/upower
> +endef
> +HOST_EFL_POST_INSTALL_HOOKS = HOST_EFL_HOOK_REMOVE_UPOWER
> +
>  $(eval $(host-autotools-package))
> 
