From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jan 2014 23:45:25 +0800
Subject: [Buildroot] [PATCH] force devtmpfs and inotify kernel option
 when udev is used as dev handler
In-Reply-To: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140108234525.49fae894@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Wed,  8 Jan 2014 14:48:33 +0100, J?r?my Rosen wrote:

> +	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
> +                $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

These two last lines are not needed, we already have:

        $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

Note the two commas at the end of the first line. It means that when
BR2_ROOTFS_DEVICE_CREATION_STATIC is *NOT* enabled, then we enabled
devtmpfs and devtmpfs_mount.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
