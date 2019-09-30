From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 30 Sep 2019 18:20:34 +0300
Subject: [Buildroot] [PATCH 1/3] package/hostapd: enable Linux ioctls
 for VLANs
In-Reply-To: <CANQCQpa9-gV_XQZi3xr77xH5BavD56Ee588zoMJ8HWuT800ocQ@mail.gmail.com>
References: <20190928173632.21119-1-geomatsi@gmail.com>
 <20190928173632.21119-2-geomatsi@gmail.com>
 <CANQCQpa9-gV_XQZi3xr77xH5BavD56Ee588zoMJ8HWuT800ocQ@mail.gmail.com>
Message-ID: <CAFGfvX7qHn-Hj9K32kb7oxuP2eFKCw4TvehkivDF21fvOSTxMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

> Sergey,
>
> On Sat, Sep 28, 2019 at 12:34 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > Hostapd v2.9 follows the approach taken by bridge-utils and attempts
> > to use new bridge ioctls whenever possible. New bridge calls are
> > enabled in hostapd build using NEED_LINUX_IOCTL configuration option.
> > That switch is enabled for all the practical configurations excluding
> > wired driver. However it is required to support dynamic VLANs in
> > any configuration.
> >
> > Enable NEED_LINUX_IOCTL hostapd configuration option whenever
> > dynamic VLANs support is requested in buildroot.
> >
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  package/hostapd/hostapd.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> > index 4a493cb9b2..0e5e5b2962 100644
> > --- a/package/hostapd/hostapd.mk
> > +++ b/package/hostapd/hostapd.mk
> > @@ -96,6 +96,7 @@ endif
> >
> >  ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC),y)
> >  HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
> > +HOSTAPD_CONFIG_SET += NEED_LINUX_IOCTL
>
> It seems interesting that CONFIG_FULL_DYNAMIC_VLAN doesn't set this
> withing the Makefile of hostapd

The NEED_LINUX_IOCTL option is set in driver make files, e.g. see
src/drivers/drivers.mk.
I assume it is done so in order to enable this option only for Linux
drivers. For instance, this
option is not set for wired hostapd driver which is platform agnostic.
In the case of Buildroot,
only Linux matters, so it is ok to set NEED_LINUX_IOCTL whenever we
need to support
dynamic VLANs.

But your remark is a good one anyway. Unless I am missing something,
support of dynamic
VLANs in hostapd is Linux only anyway. So it would make sense to
enable NEED_LINUX_IOCTL
in src/drivers/drivers.mk whenever CONFIG_FULL_DYNAMIC_VLAN is
selected in hostapd config.

Regards,
Sergey
