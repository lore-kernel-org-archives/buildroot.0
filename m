From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 4 Aug 2015 13:17:06 +0000
Subject: [Buildroot] [PATCH] board: add support for ARC AXS101 and
 AXS103 Software Development Platforms
In-Reply-To: <20150804145738.44ad2bd3@free-electrons.com>
References: <1438689614-31408-1-git-send-email-abrodkin@synopsys.com>
 <20150804145738.44ad2bd3@free-electrons.com>
Message-ID: <1438694226.22313.12.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, 2015-08-04 at 14:57 +0200, Thomas Petazzoni wrote:
> Alexey,
> 
> On Tue,  4 Aug 2015 15:00:14 +0300, Alexey Brodkin wrote:
> 
> > diff --git a/board/synopsys/axs10x/fs-overlay/etc/inittab b/board/synopsys/axs10x/fs-overlay/etc/inittab
> > new file mode 100644
> > index 0000000..de3d6e8
> > --- /dev/null
> > +++ b/board/synopsys/axs10x/fs-overlay/etc/inittab
> > @@ -0,0 +1,41 @@
> > +# /etc/inittab
> > +#
> > +# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
> > +#
> > +# Note: BusyBox init doesn't support runlevels.  The runlevels field is
> > +# completely ignored by BusyBox init. If you want runlevels, use
> > +# sysvinit.
> > +#
> > +# Format for each entry: <id>:<runlevels>:<action>:<process>
> > +#
> > +# id        == tty to run on, or empty for /dev/console
> > +# runlevels == ignored
> > +# action    == one of sysinit, respawn, askfirst, wait, and once
> > +# process   == program to run
> > +
> > +# Startup the system
> > +null::sysinit:/bin/mount -t proc proc /proc
> > +null::sysinit:/bin/mkdir -p /dev/pts
> > +null::sysinit:/bin/mkdir -p /dev/shm
> > +null::sysinit:/bin/mount -a
> > +null::sysinit:/bin/hostname -F /etc/hostname
> > +# now run any rc scripts
> > +::sysinit:/etc/init.d/rcS
> > +
> > +# Start an "askfirst" shell on the console (whatever that may be)
> > +#::askfirst:-/bin/sh # ASKFIRST_SHELL
> 
> Why?

Opps dummy copy-paste from Busybox's example.
Please pardon that silly thing.

> > +
> > +# /sbin/getty invocations for selected ttys
> > +tty0::respawn:/sbin/getty 115200 tty0
> > +
> > +# Put a getty on the serial port
> > +console::respawn:/sbin/getty -L console 0 vt100
> 
> It's a bit annoying to have a custom inittab just for this, but I agree
> that this is the only solution with today's Buildroot.

Agree, that's a long-standing problem and if I'm not mistaken you guys
advise to go for fs overlay if that kind of "feature" is required.

That said I'm not happy with that solution but having no other way I have to swallow

> > diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
> > new file mode 100644
> > index 0000000..6af4ac3
> > --- /dev/null
> > +++ b/configs/snps_axs101_defconfig
> > @@ -0,0 +1,13 @@
> > +BR2_arcle=y
> > +BR2_TARGET_GENERIC_HOSTNAME="axs101"
> > +BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
> > +BR2_SYSTEM_DHCP="eth0"
> > +BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
> > +BR2_LINUX_KERNEL_DEFCONFIG="axs101"
> 
> Please force the version of the kernel headers, so that they match the
> kernel being built.

Well you see the problem here is we do need yet to be released Linux v4.2
because that's where both boards are finally exist.

So once v4.2 is released (in a couple of weeks now) and Buildroot is updated
I would assume v4.2 headers will become default version, right?
So then we're golden and there's no need to update these defconfigs.

As for kernel version itself as of today I HAVE TO specify custom version
(v4.2-rc5) just to have sources with our boards supported. In case of Buildroot
that means these defconfigs will be build successfully.

Still once v4.2 gets released (and I think it will happen well between some
Buildroots RCs) I will send an update that will effectively remove 
----->8-----
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
----->8-----

So that's a question to you if you prefer to have headers pointing to 4.2-rc5
with right now:
----->8-----
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.2-rc5"
----->8-----

or we're OK to have defconfigs as they are today (because everything builds
anyways with headers from 4.1) and have less clean-up on v4.2 release.

-Alexey
