From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Apr 2011 12:18:29 +0200
Subject: [Buildroot] [PATCH 1/3] Create menu entry to select device
 creation method
In-Reply-To: <201104021921.50612.yann.morin.1998@anciens.enib.fr>
References: <cover.1301763205.git.thomas.petazzoni@free-electrons.com>
	<21d579b47ff25083ac66fd9f7411e05f936165c9.1301763205.git.thomas.petazzoni@free-electrons.com>
	<201104021921.50612.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110403121829.5a46d779@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Apr 2011 19:21:50 +0200
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> > +ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
>                                        ^^^^^^
> > +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> > +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
> > +endif
> 
> This should be BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS, no?

This is what I originally implemented, but I was told that using
devtmpfs was easier even in the udev/mdev cases for the early boot part
(i.e before udev/mdev are working).

See
http://lists.busybox.net/pipermail/buildroot/2010-December/039886.html
for Peter's comment on the matter.

> > +ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
> > +	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config)
> > +endif
> 
> As I suggest below, I'd move that into the startup script.

Hmm, why not.

> >  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(@D) oldconfig
> >  	$(Q)touch $@
> >  
> > diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
> > new file mode 100644
> > index 0000000..472810b
> > --- /dev/null
> > +++ b/package/busybox/S10mdev
> > @@ -0,0 +1,22 @@
> > +#!/bin/sh
> > +#
> > +# Start mdev....
> > +#
> > +
> > +case "$1" in
> > +  start)
> > + 	echo "Starting mdev..."
> > +	/sbin/mdev -s
> 
> >From busybox/docs/mdev.txt:
> 
> Here's a typical code snippet from the init script:
> [0] mount -t proc proc /proc
> [1] mount -t sysfs sysfs /sys
> [2] echo /sbin/mdev > /proc/sys/kernel/hotplug
> [3] mdev -s                                                                                                  
> 
> I see that [2] is done in the kernel's .config. I find it non-obvious,
> and I would move that to the script above. It makes it easier to
> follow.

I guess that's a matter of taste. I have no strong opinion here.

> Also, I did not see where /dev is mounted (as a tmpfs). If / is a RO file
> system, then you can't use dynamic nodes, or you need a RW file system on
> /dev.

/dev is a devtmpfs filesystem, thanks to the kernel options that you
highlighted above, and it is mounted automatically by the kernel thanks
to the CONFIG_DEVTMPFS_MOUNT option.

> > +	;;
> > +  stop)
> 
> For completeness:
>     echo "/bin/true" > /proc/sys/kernel/hotplug
>     killall mdev
>     sleep 2  # Leave it some time to proerly quit (adjust delay)
>     killall -9 mdev

mdev is not a daemon (contrary to udev), so there's no point in killing
it. It's a utility that the kernel runs where there are events to
handle.

So I don't think there's a lot of point in having the stop), restart)
and reload) commands for mdev.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
