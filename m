From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 1 Oct 2019 10:44:51 +0300
Subject: [Buildroot] [PATCH 1/3] package/hostapd: enable Linux ioctls
 for VLANs
In-Reply-To: <CAFGfvX7qHn-Hj9K32kb7oxuP2eFKCw4TvehkivDF21fvOSTxMg@mail.gmail.com>
Message-ID: <20191001074451.ce5u4ogstnsbwxma@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

+ buildroot

> >>> Hostapd v2.9 follows the approach taken by bridge-utils and attempts
> >>> to use new bridge ioctls whenever possible. New bridge calls are
> >>> enabled in hostapd build using NEED_LINUX_IOCTL configuration option.
> >>> That switch is enabled for all the practical configurations excluding
> >>> wired driver. However it is required to support dynamic VLANs in
> >>> any configuration.
> >>>
> >>> Enable NEED_LINUX_IOCTL hostapd configuration option whenever
> >>> dynamic VLANs support is requested in buildroot.

...

> >> It seems interesting that CONFIG_FULL_DYNAMIC_VLAN doesn't set this
> >> withing the Makefile of hostapd
> > 
> > The NEED_LINUX_IOCTL option is set in driver make files, e.g. see
> > src/drivers/drivers.mk.
> > I assume it is done so in order to enable this option only for Linux
> > drivers. For instance, this
> > option is not set for wired hostapd driver which is platform agnostic.
> > In the case of Buildroot,
> > only Linux matters, so it is ok to set NEED_LINUX_IOCTL whenever we
> > need to support
> > dynamic VLANs.
> > 
> > But your remark is a good one anyway. Unless I am missing something,
> > support of dynamic
> > VLANs in hostapd is Linux only anyway. So it would make sense to
> > enable NEED_LINUX_IOCTL
> > in src/drivers/drivers.mk whenever CONFIG_FULL_DYNAMIC_VLAN is
> > selected in hostapd config.
> 
>  Indeed, since vlan_full.c includes linux_ioctl, it makes sense to enable that
> in drivers.mk. Could you send a patch doing that upstream?

Sure, will do. But hostapd upstreaming is going to take some time.
As for Buildroot, I have two options for this patch then:
- to keep this fix until next hostapd version update 
- drop this fix and add hostapd patch to packages/hostapd directory

Any preferences ?

Regards,
Sergey
