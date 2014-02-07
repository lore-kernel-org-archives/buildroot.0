From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 7 Feb 2014 22:14:33 +0100
Subject: [Buildroot] [PATCH v7 2/4] udev: convert to virtual package.
In-Reply-To: <CAAXf6LWN2F6YhoVHu3w-TcWnqBQ4G_gdV652xBD0kGbopfafWw@mail.gmail.com>
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1391779295-19140-3-git-send-email-eric.le.bihan.dev@free.fr>
 <CAAXf6LWN2F6YhoVHu3w-TcWnqBQ4G_gdV652xBD0kGbopfafWw@mail.gmail.com>
Message-ID: <20140207211433.GA7580@milhouse>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Fri, Feb 07, 2014 at 09:17:08PM +0100, Thomas De Schampheleire wrote:

> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 2fe9cf9..6d594c6 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -101,6 +101,61 @@ endif
> >  ###############################################################################
> >  comment "Legacy options removed in 2014.02"
> >
> > +config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> > +       bool "/dev management by udev removed"
> > +       select BR2_LEGACY
> > +       help
> > +         The 'udev' package has been converted to a virtual package.
> > +         There is currently one provider for this feature: 'eudev'.
> > +
> > +         Therefore, you must choose 'Dynamic using eudev' in the
> > +         '/dev management' menu to get the same behaviour as in your
> > +          old configuration.
> > +
> > +         You must also check the packages depending on 'udev' are still
> > +         selected.
>
> Is there a particular reason why you don't automatically select the
> suggested alternative?
> This will make the transition easier for users...

That's what I did on first try. BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV was
selected. But I ended up facing a limit of kconfig: this boolean symbol is
used in a choice/endchoice ("/dev management"), which prevents its value from
being recalculated when it is selected from Config.in.legacy.

For example, if BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y in
test_udev_legacy_defconfig and we perform:

  $ make test_udev_legacy_defconfig

output/.config will contain:

  # BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is not set
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y

The default choice is selected. I discussed this issue on IRC with Yann E.
Morin last evening, but there is no workaround... So I chose to remove the
automatic selection of the new symbol and add detailed instructions.

> > diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
> > index a3e44f8..534e7c1 100644
> > --- a/package/libatasmart/Config.in
> > +++ b/package/libatasmart/Config.in
> > @@ -1,6 +1,6 @@
> >  config BR2_PACKAGE_LIBATASMART
> >         bool "libatasmart"
> > -       depends on BR2_PACKAGE_UDEV # libudev is configure dependency
> > +       depends on BR2_PACKAGE_HAS_UDEV # libudev is configure dependency
> >         help
> >           The libatasmart package is a disk reporting library.
> >           It only supports a subset of the ATA S.M.A.R.T. functionality.
> > @@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBATASMART
> >           http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
> >
> >  comment "libatasmart requires udev to be enabled"
> > -       depends on !BR2_PACKAGE_UDEV
> > +       depends on !BR2_PACKAGE_HAS_UDEV
>
> Finally we should also line up all the udev comments, but this can be
> done in a separate patch.
I will gladly do it.

> > +         udev is now a virtual package.
> > +         Packages requiring udevd at run time or libudev/gudev at build time
> > +         should select it.
>
> Does it make sense to adding a help option on a hidden option? Can the
> user ever make it visible?

The end user using the menu will not see it, but I added it for the user who
sometimes looks at the sources, as a kind of comment. When ThomasP suggested
to convert udev as a virtual package, I looked at opengl.mk hoping to find
information but found none... Maybe it would be better to add a section on how
to add virtual package and how to use it in the manual.

Thanks for your review.

Best regards,
ELB
