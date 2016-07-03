From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 3 Jul 2016 10:37:43 +0200
Subject: [Buildroot] [PATCH 06/24 v2] package/systemd: disabling tty1
 getty is a post-install hook
In-Reply-To: <fe81b5c13c44ebd66ef69fd8bc76e6e8acb14725.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
 <fe81b5c13c44ebd66ef69fd8bc76e6e8acb14725.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <e4252a68-df6a-6b49-5f6a-01d3a3c18d40@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 22/06/2016 ? 21:07, Yann E. MORIN a ?crit :
> Currently, we disable the getty on tty1 as a "init" step. It looks
> better like it is a post-install hook.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/systemd/systemd.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index c0503ae..7e8fc0b 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -211,10 +211,15 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
>  	touch $(TARGET_DIR)/etc/machine-id
>  endef
>  
> +define SYSTEMD_DISABLE_SERVICE_TTY1_HOOK
> +	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
> +endef
> +
>  SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
>  	SYSTEMD_INSTALL_INIT_HOOK \
>  	SYSTEMD_INSTALL_MACHINEID_HOOK \
> -	SYSTEMD_INSTALL_RESOLVCONF_HOOK
> +	SYSTEMD_INSTALL_RESOLVCONF_HOOK \
> +	SYSTEMD_DISABLE_SERVICE_TTY1_HOOK

It would be great to keep alphabetical order :)

Otherwise:
  Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


>  
>  define SYSTEMD_USERS
>  	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
> @@ -228,10 +233,6 @@ define SYSTEMD_USERS
>  	- - input -1 * - - - Input device group
>  endef
>  
> -define SYSTEMD_DISABLE_SERVICE_TTY1
> -	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
> -endef
> -
>  ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
>  # systemd needs getty.service for VTs and serial-getty.service for serial ttys
>  # also patch the file to use the correct baud-rate, the default baudrate is 115200 so look for that
> @@ -252,7 +253,6 @@ endef
>  endif
>  
>  define SYSTEMD_INSTALL_INIT_SYSTEMD
> -	$(SYSTEMD_DISABLE_SERVICE_TTY1)
>  	$(SYSTEMD_INSTALL_SERVICE_TTY)
>  	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
>  	$(SYSTEMD_INSTALL_SERVICE_TIMESYNC)
> 
