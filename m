From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 4 Nov 2013 12:45:24 +0100
Subject: [Buildroot] [PATCH v2 3/6] systemd: bump to v206.
In-Reply-To: <20131102193139.2af593b9@skate>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1379679847-16141-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20131102193139.2af593b9@skate>
Message-ID: <20131104114524.GA30293@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 02, 2013 at 07:31:39PM +0100, Thomas Petazzoni wrote:

Dear Thomas Petazzoni,

> > The selection of the following packages will also add features:
> >
> >  - libglib2 package will add support for gudev.
> >  - acl package will add support for multi-seat.
>
> Maybe this text should be mentioned in the help text of the systemd
> option.
Good suggestion. I will add it.

> > diff --git a/package/systemd/systemd-uclibc-fix.patch b/package/systemd/systemd-uclibc-fix.patch
> > deleted file mode 100644
> > index 9a20845..0000000
> > --- a/package/systemd/systemd-uclibc-fix.patch
> > +++ /dev/null
>
> Without this patch (or similar patches), systemd does not build with
> uClibc, so it should be marked to depend on (e)glibc.

As there was no advantage in using systemd with a uClibc toolchain, Arnout
Vandecappelle suggested that I add:

  depends on !BR2_TOOLCHAIN_USES_UCLIBC

in system/Config.in, but I'd prefer to add:

  depends on BR2_TOOLCHAIN_USES_GLIBC+

As I have not tested systemd with the musl libc yet. I will also remove the
uClib patches.

> > +	select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
>
> Why do we have this select? I must say I don't really follow what's
> going on in system/Config.in in terms of init option vs. /dev
> management options.

The line

  select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV

is needed in order to have udisks and friends to show up. The 'depends' became
a 'select' as I swapped the selection of the init system and the /dev
management.

> > +comment 'systemd needs toolchain w/ stack smashing protection'
> > +	depends on !BR2_TOOLCHAIN_HAS_SSP
>
> Wow, that's probably the first package that has this requirement. What
> happens when the toolchain doesn't have SSP support?

Without SSP, systemd does not build. It is compiled using lots of error
checking flags (see OUR_CFLAGS in configure.ac), which sounds sensible when
building a program meant to run as PID 1. This requirement made me report the
issue "uClibc fails to build with stack smash protection" back in September,
which was caused by the change in GCC build procedure (two steps instead of
three).

> > +comment "/dev management using udev (from systemd)"
> > +	depends on BR2_INIT_SYSTEMD
>
> I don't think this comment is really needed.

I'd prefer to keep it: even if the end user does not have the choice of /dev
management, he is informed of the solution chosen for him.

>
> In order to make the patch series bisectable, I think I would suggest
> to have the following sequence:
>
>  * Introduce the eudev package
>
>  * Turn the udev package into a virtual package that uses the only
>    available udev implementation: eudev
>
>  * Bump the systemd package, and register it as a possible udev
>    implementation.
>
> What do you think?
You are right. My initial problem was "bumping systemd", so I kept at looking
the udev stuff from this perspective. It seems more logical to see it as a
"bumping udev" problem. So, I will send a new series, with eudev as a starting
point.

Best Regards,
ELB
