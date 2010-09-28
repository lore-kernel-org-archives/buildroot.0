From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Sep 2010 19:35:08 +0200
Subject: [Buildroot] [PATCH 3/4] Create menu entry to select device
 creation method
In-Reply-To: <4C9C558A.7050009@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
	<4C9C54FC.4040609@visionsystems.de>
	<4C9C553E.8040105@visionsystems.de>
	<4C9C558A.7050009@visionsystems.de>
Message-ID: <20100928193508.41e6b8ae@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Sep 2010 09:38:50 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> +choice
> +	prompt "Device Creation"
> +	default BR2_ROOTFS_DEVICE_CREATION_STATIC

I would probably name this "/dev management" or something similar. In
my boards-cleanup work, I'm creating a new top-level "System
configuration" menu. Maybe this should belong to this place instead,
but this is something I can handle if I merge this patch into my
boards-cleanup branch.

> +config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
> +	bool "Dynamic using mdev"

Maybe this should "select BR2_PACKAGE_BUSYBOX" ?

>  config BR2_ROOTFS_DEVICE_TABLE
> -       string "Path to the device table"
> -       default "target/generic/device_table.txt"
> -       help
> -         Specify the location of a device table, that will be passed
> -         to the makedevs utility to create all the special device
> -         files in the target filesystem.
> +	string "Path to the device table"
> +	depends on BR2_ROOTFS_DEVICE_CREATION_STATIC
> +	default "target/generic/device_table.txt"
> +	help
> +	 Specify the location of a device table, that will be passed
> +	 to the makedevs utility to create all the special device
> +	 files in the target filesystem.

Something odd here with the indentation. We should only see the new
line "depends on BR2_ROOTFS_DEVICE_CREATION_STATIC" and no other change.

> +ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
> +endif

So devtmpfs is used even when mdev or udev are used ?

> index 0000000..943b73b
> --- /dev/null
> +++ b/package/busybox/S10mdev
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +#
> +# Start the mdev....

s/the//

> +#
> +
> +case "$1" in
> +  start)
> + 	echo "Starting mdev..."
> +	/sbin/mdev -s

This is not sufficient as far as I remember: this will only
populate /dev with the existing devices. mdev also needs to be
registered as a hotplug event handler by writing to some /proc/sys
file. See mdev documentation for details (docs/mdev.txt in Busybox
sources).

> +  stop)
> +	echo -n "Stopping mdev..."
> +	killall mdev

mdev is not a daemon, so there's no point in killing it.

> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index b7f4740..d4b04a9 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -20,6 +20,19 @@ ifndef BUSYBOX_CONFIG_FILE
>  	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
>  endif
>  
> +# If mdev will be used for device creation enable it and copy S10mdev to /etc/init.d
> +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> +define BUSYBOX_INSTALL_MDEV_SCRIPT
> +	install -m 0755 package/busybox/S10mdev $(TARGET_DIR)/etc/init.d
> +endef
> +define BUSYBOX_SET_MDEV
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MDEV,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_CONF,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_EXEC,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MDEV_LOAD_FIRMWARE,$(BUSYBOX_BUILD_CONFIG))
> +endef
> +endif
> +
>  # If we have external syslogd, force busybox to use it
>  ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
>  define BUSYBOX_SET_SYSKLOGD
> @@ -114,6 +127,7 @@ define BUSYBOX_CONFIGURE_CMDS
>  	$(BUSYBOX_SET_IPV6)
>  	$(BUSYBOX_SET_RPC)
>  	$(BUSYBOX_PREFER_STATIC)
> +	$(BUSYBOX_SET_MDEV)
>  	$(BUSYBOX_NETKITBASE)
>  	$(BUSYBOX_NETKITTELNET)
>  	@yes "" | $(MAKE) ARCH=$(KERNEL_ARCH) CROSS_COMPILE="$(TARGET_CROSS)" \
> @@ -142,6 +156,7 @@ endif
>  define BUSYBOX_INSTALL_TARGET_CMDS
>  	$(BUSYBOX_INSTALL_BINARY)
>  	-chmod a+rx $(TARGET_DIR)/usr/share/udhcpc/default.script
> +	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
>  endef

This part sounds good to me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
