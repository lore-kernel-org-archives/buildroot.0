From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 25 May 2019 20:01:16 +0300
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
Message-ID: <20190525170116.GE9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 25, 2019 at 05:24:15PM +0200, Arnout Vandecappelle wrote:
> On 25/05/2019 15:07, Peter Korsgaard wrote:
> > S10mdev uses /proc/sys/kernel/hotplug, which is only available if
> > CONFIG_UEVENT_HELPER is enabled in the kernel, so ensure it is.
> 
>  So, I take a look at it, and it's a little bit more complicated...
> 
>  Busybox *does* have support for the "new" netlink-based uevent interface, but
> that interface needs a daemon that keeps running and they separated that daemon
> into a separate process, called uevent. So, in the "new" way, you should do
> something like (not tried, just based on source code):
> 
> start-stop-daemon -S -b -x /sbin/uevent -- mdev
> 
>  But of course, that means that we have to be sure that the uevent executable is
> in fact built for busybox. So we'd need to extend BUSYBOX_SET_MDEV to enable uevent.
> 
>  Also, we can only use the uevent approach if netlink uevents are available.
> They exist since 2.6.12, so I guess on that side we're safe. However, they also
> depend on CONFIG_NET (because netlink does).
> 
>  So, these are our options:
> 
> 1. Bloat the kernel with legacy uevent helper support (this patch).
> 
> 2. Bloat the kernel with networking even if it is not used for anything else,
> and bloat busybox with uevent (3.1 kb), and always use uevent.
> 
> 3. Use uevent in the init script but don't enforce anything (with potential
> silent failures), and explain stuff in the mdev help text.
> 
> 4. Try out all possibilities in the init script - which still fails silently in
> case neither CONFIG_UEVENT_HELPER nor CONFIG_NET is enabled in the kernel.

Since the UEVENT_HELPER had been made optional back in 2014 and I reported bug
for mdev script in 2019 I would *speculate* that everybody nowadays are using
udev, so, netlink is quite probably already enabled in the kernel.

>  In my opinion, we definitely should *not* go for option 1. I don't want to be
> the one that forces the kernel to maintain legacy stuff.

I second this.

> I would definitely use
> uevent. On the other hand, I really don't like it when we force changes into
> busybox or kernel configs. Since it's really likely that CONFIG_NET is enabled
> in the kernel, and since our default busybox config (but not the minimal one)
> does enable uevent, I think that option 3 is the way to go.

Agree.

>  By the way, with netlink, the event are properly serialized, and uevent makes
> sure that only one mdev subprocess is created so it maintains the serialisation.
> So, it is no longer needed to create /dev/mdev.seq (which, for some reason, we
> currently don't do...).

-- 
With Best Regards,
Andy Shevchenko
