From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2011 16:28:42 +0200
Subject: [Buildroot] mdev problem in 2011.08 ?
In-Reply-To: <4E75EBBF.9080203@openwide.fr>
References: <4E75EBBF.9080203@openwide.fr>
Message-ID: <20110918162842.02150727@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre,

Le Sun, 18 Sep 2011 15:01:51 +0200,
Pierre Ficheux <pierre.ficheux@openwide.fr> a ?crit :

> May be I'm wrong but it seems there is a problem when using mdev for
> /dev management:

For our mdev and udev support, we assume that the kernel is compiled
with CONFIG_DEVTMPFS and CONFIG_DEVTMPFS_MOUNT. For kernels built by
Buildroot, this is ensured by :

        $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
                $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

in linux/linux.mk.

For kernels built outside of Buildroot, it's up to the user to enable
those options. In your case, I guess your kernel lacks devtmpfs support
and/or the option to have devtmpfs mounted automatically at boot time,
and this explains why the /dev/null device is missing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
