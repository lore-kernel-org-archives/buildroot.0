From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 3 Apr 2011 20:05:00 +0200
Subject: [Buildroot] [PATCH 1/3] Create menu entry to select device
	creation method
In-Reply-To: <20110403121829.5a46d779@surf>
References: <cover.1301763205.git.thomas.petazzoni@free-electrons.com>
	<201104021921.50612.yann.morin.1998@anciens.enib.fr>
	<20110403121829.5a46d779@surf>
Message-ID: <201104032005.01046.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 03 April 2011 12:18:29 Thomas Petazzoni wrote:
> On Sat, 2 Apr 2011 19:21:50 +0200
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:
> 
> > > +ifneq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
> >                                        ^^^^^^

Oh, that's an 'ifneq', not an 'ifeq'. Sorry for the noise...

> > > +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> > > +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config)
> > > +endif
> > 
> > This should be BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS, no?
> 
> This is what I originally implemented, but I was told that using
> devtmpfs was easier even in the udev/mdev cases for the early boot part
> (i.e before udev/mdev are working).

So, unless I am totally mistaken, if one chooses devtmpfs with
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS, then devtmpfs is not forced
in the kernel's .config.

So even if the user asks for a static /dev, he nonetheless gets a devtmpfs.
So what's the point of having both options in BR?

The only difference is that, when _STATIC is selected, the user is offered
a choice to specify a device_table, and not when _DEVTMPFS is selected.

What I really find confusing is the config prompts do not actually match
the behavior. If I select 'static', I expect to get static, not dynamic
(even if only the kernel is involved).

> > > +case "$1" in
> > > +  start)
> > > + 	echo "Starting mdev..."
> > > +	/sbin/mdev -s
> > 
> > >From busybox/docs/mdev.txt:
> > 
> > Here's a typical code snippet from the init script:
> > [0] mount -t proc proc /proc
> > [1] mount -t sysfs sysfs /sys
> > [2] echo /sbin/mdev > /proc/sys/kernel/hotplug
> > [3] mdev -s                                                                                                  
> > 
> > I see that [2] is done in the kernel's .config. I find it non-obvious,
> > and I would move that to the script above. It makes it easier to
> > follow.
> 
> I guess that's a matter of taste. I have no strong opinion here.

At least, add a comment (in S10mdev, or in the config help) stating
where the setup is done. I have no strong opinion either, it just took
me a while to understand what was going on. And I find it more explicit
to get related stuff grouped together when possible.

> > Also, I did not see where /dev is mounted (as a tmpfs). If / is a RO file
> > system, then you can't use dynamic nodes, or you need a RW file system on
> > /dev.
> 
> /dev is a devtmpfs filesystem, thanks to the kernel options that you
> highlighted above, and it is mounted automatically by the kernel thanks
> to the CONFIG_DEVTMPFS_MOUNT option.

Right. I missed the ifneq, above...

> > > +	;;
> > > +  stop)
> > 
> > For completeness:
> >     echo "/bin/true" > /proc/sys/kernel/hotplug
> >     killall mdev
> >     sleep 2  # Leave it some time to proerly quit (adjust delay)
> >     killall -9 mdev
> 
> mdev is not a daemon (contrary to udev), so there's no point in killing
> it. It's a utility that the kernel runs where there are events to
> handle.

Yeah, right. 'mdev -s' is here to handle coldplug events. My bad.

> So I don't think there's a lot of point in having the stop), restart)
> and reload) commands for mdev.

Forget my silly comment. So:

Reviewed by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
