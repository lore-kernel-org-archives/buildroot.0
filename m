From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2011 08:54:19 +0200
Subject: [Buildroot] [PATCH 0/1] Bug in the boot process using mdev
In-Reply-To: <1309690078-9197-1-git-send-email-luca@lucaceresoli.net>
References: <1309690078-9197-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20110704085419.47aa9b62@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

Le Sun,  3 Jul 2011 12:47:57 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> The init process I use is busybox's init, with the inittab that comes
> with buildroot. This starts with:
> 
>   # Startup the system
>   null::sysinit:/bin/mount -t proc proc /proc
>   null::sysinit:/bin/mount -o remount,rw /
>   null::sysinit:/bin/mkdir -p /dev/pts
>   null::sysinit:/bin/mount -a
>   null::sysinit:/bin/hostname -F /etc/hostname
>   # now run any rc scripts
>   ::sysinit:/etc/init.d/rcS
> 
> Busybox init takes the first field, adds "/dev/" in front if it and
> uses the result as the input and output device the the process to be
> launched. This is normally used for ttys, but in this case the
> processes will read from and write to /dev/null.
> 
> Alas, /dev/null does not exist when the first few "sysinit" lines are
> executed, since it will be created by mdev, which in turn will be
> launched only by rcS, in the last of the cited inittab lines.

I initially implemented mdev support as you proposed, with a separate
static device table for the few device nodes that are mandatory to get
the system up to a point where mdev can be started.

However, after discussions on the list, we decided that both our mdev
and udev configurations should rely on devtmpfs. So when the mdev or
udev mechanisms are selected in Buildroot configuration, we assume that
devtmpfs will be mounted in /dev at boot time.

This is automatically ensured when Buildroot is responsible for
building the kernel. See linux/linux.mk :

ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
        $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
        $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
endif

However, if you build your kernel separately, then indeed, it's your
responsibility to make sure that DEVTMPFS and DEVTMPFS_MOUNT are
enabled.

This is probably a requirement that should be better documented, at
least in the static/devtmpfs/mdev/udev configuration option help.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
