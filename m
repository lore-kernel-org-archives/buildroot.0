From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 4 Feb 2014 13:10:32 +0100
Subject: [Buildroot] [PATCH v6 3/5] udev: convert to virtual package.
In-Reply-To: <CAAXf6LXUD2hAt+_0JUyXHgwOGqHVwe4J7-AkekopnR-LixKOAg@mail.gmail.com>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-4-git-send-email-eric.le.bihan.dev@free.fr>
 <CAAXf6LXUD2hAt+_0JUyXHgwOGqHVwe4J7-AkekopnR-LixKOAg@mail.gmail.com>
Message-ID: <20140204121030.GA8125@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Mon, Feb 03, 2014 at 10:41:03PM +0100, Thomas De Schampheleire wrote:

> > --- a/package/systemd/Config.in
> > +++ b/package/systemd/Config.in
> > @@ -1,6 +1,6 @@
> >  config BR2_PACKAGE_SYSTEMD
> >         bool "systemd"
> > -       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> > +       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> >         depends on BR2_INET_IPV6
> >         depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
> >         depends on BR2_USE_MMU # dbus
> > @@ -18,7 +18,7 @@ config BR2_PACKAGE_SYSTEMD
> >
> >           http://freedesktop.org/wiki/Software/systemd
> >
> > -comment "systemd needs udev /dev management and a toolchain w/ IPv6, threads"
> > +comment "systemd needs eudev /dev management and a toolchain w/ IPv6, threads"
> >         depends on BR2_USE_MMU
> > -       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV || !BR2_INET_IPV6 || \
> > +       depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV || !BR2_INET_IPV6 || \\
> >                 !BR2_TOOLCHAIN_HAS_THREADS
>
> These changes are odd: you indicate here that systemd is depending on
> eudev, while eudev is precisely an alternative provider of udev than
> systemd. So:
>
>        udev
>        /   \
> systemd     eudev
>
> and there is no direct relation between systemd and eudev. In the next
> patch, you replace this again with BR2_INIT_SYSTEMD, which makes sense
> again, but the transition is odd.

At this stage, the version of systemd in Buildroot is still v44, which does
not provide udev, but needs it. As the previous patch introduced eudev and
this one removes BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV, the dependency on
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV ensures systemd will be installed
with a udev implementation.

> Directly related to this, we question the need to rename
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV to
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV. First of all, the symbol
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is already existing in users'
> defconfig. Removing it requires the addition of a new legacy symbol
> (not only for BR2_PACKAGE_UDEV, which you already added, but also for
> the DEVICE_CREATION_DYNAMIC one).
> Users that previously selected udev, should be moved to eudev, rather
> than systemd. Our suggestion is to keep the existing
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV symbol to indicate the eudev
> choice, rendering the massive rename in the previous patch unneeded,
> removing the above odd systemd transition, and avoiding the need for
> legacy handling. What do you think of that?

I find it odd that some packages depend on
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV whereas others depend on
BR2_PACKAGE_UDEV. To me, both symbols are interpreted as "the package needs a
udev daemon to talk to at runtime" (whether via D-Bus or libudev). So I
replaced both with BR2_PACKAGE_HAS_UDEV to be homogeneous. It is true that if
a package depends on BR2_PACKAGE_HAS_UDEV, it is not explicitly said if it is
a runtime or a build dependency. But, AFAIK, programs that want to communicate
with the udev daemon do it via libudev/libgudev, so we end up with a build
dependency.

In system/Config.in, I removed BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV because
I want the user to understand the change: he/she should not think of 'udev' as
a package, but as a feature which, at this stage, is only available via eudev.
I could have kept BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV and have it select
BR2_PACKAGE_EUDEV, but I've found it confusing.

But I should have added BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV in
Config.in.legacy to migrate to BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV.

In the end, the user selects BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV, which
selects BR2_PACKAGE_EUDEV, which in turn selects BR2_PACKAGE_HAS_UDEV. All the
packages depending on it are now available.

> Maybe you could add a comment in udev/Config.in and udev/udev.mk
> clarifying that this is now a virtual package.
Yes, indeed!

> > -comment "udisks needs udev /dev management and a toolchain w/ wchar, threads"
> > +comment "udisks needs udev /dev mgmnt, toolchain w/ wchar, threads"
>
> This string is not as it is described in the manual. Why did you change it?
It was truncated on a 80x24 terminal.
