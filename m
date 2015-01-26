From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 22:26:51 +0100
Subject: [Buildroot] [PATCH 01/16] package/busybox: optional udhcpc
 script
In-Reply-To: <1421684056-5266-2-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-2-git-send-email-maxtram95@gmail.com>
Message-ID: <20150126222651.512e842f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxim Mikityanskiy,

On Mon, 19 Jan 2015 18:14:01 +0200, Maxim Mikityanskiy wrote:
> Create new config option BR2_PACKAGE_BUSYBOX_UDHCPC_SCRIPT to control
> whether to install optional udhcpc default.script. It is possible that
> udhcpc is not enabled in busybox config, so default.script is useless in
> that case.
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Thanks for this patch. However, rather than using a new option, can we
instead simply test if udhcpc is enabled in the Busybox configuration?

> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index f68a2f8..fbdde62 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -49,10 +49,20 @@ BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
>  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>  
> +ifeq ($(BR2_PACKAGE_BUSYBOX_UDHCPC_SCRIPT),y)
> +define BUSYBOX_INSTALL_UDHCPC_SCRIPT
> +	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
> +		$(TARGET_DIR)/usr/share/udhcpc/default.script; \
> +endef
>  define BUSYBOX_PERMISSIONS
>  	/bin/busybox                     f 4755 0  0 - - - - -
>  	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
>  endef
> +else
> +define BUSYBOX_PERMISSIONS
> +	/bin/busybox                     f 4755 0  0 - - - - -
> +endef
> +endif

I believe we can remove /usr/share/udhcpc/default.script entirely from
BUSYBOX_PERMISSIONS: it doesn't need any special permission or
ownership, so the default done by Buildroot will be fine in terms of
ownership, and in terms of permissions, 755 is already enforced by the
install command below.

>  # If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
>  ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> @@ -210,10 +220,7 @@ endef
>  
>  define BUSYBOX_INSTALL_TARGET_CMDS
>  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
> -	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
> -		$(TARGET_DIR)/usr/share/udhcpc/default.script
> -	$(INSTALL) -m 0755 -d \
> -		$(TARGET_DIR)/usr/share/udhcpc/default.script.d
> +	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
>  endef

Here I'd prefer something like:

	if grep -q CONFIG_UDHCPC=y $(BUSYBOX_BUILD_CONFIG) ; then
		... do the udhcpc scripts installation
	fi

Which allows to get rid of the new Config.in option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
