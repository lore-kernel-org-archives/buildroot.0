From: Christian Stewart <christian@paral.in>
Date: Mon, 20 Jul 2015 21:35:42 +0000
Subject: [Buildroot] [PATCH v1 1/1] rtl8821au: new package
In-Reply-To: <20150720233051.6ae1947e@free-electrons.com>
References: <1436914861-10912-1-git-send-email-christian@paral.in>
 <20150718232609.5828891c@free-electrons.com>
 <CA+h8R2pR_BU7FRm0R8EHKuA7rqgeeRrzBzy1AkvVEuqo04uAwQ@mail.gmail.com>
 <20150720233051.6ae1947e@free-electrons.com>
Message-ID: <CA+h8R2rrU9vxJ7KiXpTuZW5S9+w9RZJwfLx_t+04OnYRJYEmiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I don't think I will forget about maintaining this because we're using the
driver here in the lab extensively. Only thing I can forsee happening is
the vendor releasing another version at some point, but you can always
email me to update the repo and test with the newer version and I'll get on
it pretty quickly.

As per the rtl8821au business...

Is this the best way to specify the defines I need in the makefile:

RTL8821AU_MODULE_MAKE_OPTS = KVER="$(LINUX_VERSION_PROBED)"
ARCH="$(KERNEL_ARCH)"

Also, what's the best way to determine big or little endian? All of the
arch options have different formats for specifying it.

Thanks!
Christian

On Mon, Jul 20, 2015 at 2:30 PM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Christian Stewart,
>
> Please keep the list in Cc when replying.
>
> Thanks!
>
> Thomas
>
> On Mon, 20 Jul 2015 21:16:20 +0000, Christian Stewart wrote:
> > Hey,
> >
> > Quick question for Yann.
> >
> > Is this the best way to specify the defines I need in the makefile:
> >
> > RTL8821AU_MODULE_MAKE_OPTS = KVER="$(LINUX_VERSION_PROBED)"
> > ARCH="$(KERNEL_ARCH)"
> >
> > Also, what's the best way to determine big or little endian? All of the
> > arch options have different formats for specifying it...
> >
> > Thanks!
> > Christian
> >
> > On Sat, Jul 18, 2015 at 2:26 PM Thomas Petazzoni <
> > thomas.petazzoni at free-electrons.com> wrote:
> >
> > > Dear Christian Stewart,
> > >
> > > On Tue, 14 Jul 2015 16:01:01 -0700, Christian Stewart wrote:
> > >
> > > > diff --git a/package/linux-firmware/Config.in
> > > b/package/linux-firmware/Config.in
> > > > index 2e4c205..a99b877 100644
> > > > --- a/package/linux-firmware/Config.in
> > > > +++ b/package/linux-firmware/Config.in
> > > > @@ -189,6 +189,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
> > > >       help
> > > >         Realtek rtl8821ae
> > > >
> > > > +config BR2_PACKAGE_RTL8821AU
> > > > +     bool "Realtek 8821AU"
> > > > +     help
> > > > +       Realtek rtl8821au kernel module
> > >
> > > Why are you putting the option in the middle of
> > > package/linux-firmware/Config.in ? It should be in
> > > package/rtl8821au/Config.in, and this file be included from
> > > package/Config.in.
> > >
> > > > diff --git a/package/rtl8821au/rtl8821au.hash
> > > b/package/rtl8821au/rtl8821au.hash
> > > > new file mode 100644
> > > > index 0000000..21f47a2
> > > > --- /dev/null
> > > > +++ b/package/rtl8821au/rtl8821au.hash
> > > > @@ -0,0 +1 @@
> > > > +sha256
> > > 7ab9aae237ff562d5c40675115ffb9e36a4774490df0a6a8a4c7746dfd567e14
> > > rtl8821au-4.3.14.tar.gz
> > > > diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/
> > > rtl8821au.mk
> > > > new file mode 100644
> > > > index 0000000..f5f3da6
> > > > --- /dev/null
> > > > +++ b/package/rtl8821au/rtl8821au.mk
> > > > @@ -0,0 +1,22 @@
> > > >
> > >
> +################################################################################
> > > > +#
> > > > +# rtl8821au
> > > > +#
> > > >
> > >
> +################################################################################
> > > > +
> > > > +RTL8821AU_VERSION = 4.3.14
> > > > +RTL8821AU_SITE = $(call
> github,paralin,rtl8821au,v$(RTL8821AU_VERSION))
> > >
> > > This is your repo, but it doesn't seem to be the real upstream for the
> > > project. Can you use https://github.com/ulli-kroll/rtl8821au instead,
> > > which seems much more active ? We can accept having a few patches on
> > > top, as long as their are also submitted upstream.
> > >
> > > > +define RTL8821AU_BUILD_CMDS
> > > > +     $(SED) "s/CONFIG_PLATFORM_I386_PC = y/CONFIG_PLATFORM_I386_PC =
> > > n/g" -i $(@D)/Makefile
> > > > +     $(MAKE) -C $(@D) ARCH="$(ARCH)" KVER="$(LINUX_VERSION_PROBED)"
> > > USER_EXTRA_CFLAGS="-DCONFIG_LITTLE_ENDIAN"
> CROSS_COMPILE="$(CROSS_COMPILE)"
> > > KSRC="$(LINUX_BUILDDIR)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" modules
> > >
> > > Hardcoding -DCONFIG_LITTLE_ENDIAN will not work on big endian
> > > architectures. ARCH should probably use KERNEL_ARCH.
> > >
> > > > +endef
> > > > +
> > > > +define RTL8821AU_INSTALL_TARGET_CMDS
> > > > +     $(INSTALL) -D -p -m 644 $(@D)/8821au.ko
> > >
> $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/drivers/net/wireless/
> > > > +     $(HOST_DIR)/sbin/depmod -a --basedir=$(TARGET_DIR)
> > > $(LINUX_VERSION_PROBED)
> > > > +endef
> > > > +
> > > > +RTL8821AU_DEPENDENCIES = linux linux-firmware
> > >
> > > Why do you depend on the linux-firmware package?
> > >
> > > > +$(eval $(generic-package))
> > >
> > > Can you look at using the kernel-module infrastructure instead, it
> > > should make things a bit easier. If you have issues, don't hesitate to
> > > ask. I've Cc'ed Yann E. Morin, who is the author of the kernel-module
> > > infrastructure. See also
> > >
> > >
> http://nightly.buildroot.org/manual.html#_infrastructure_for_packages_building_kernel_modules
> > > for the official documentation of this package infrastructure.
> > >
> > > In the mean time, I'll mark your patch as Changes Requested in our
> > > patch tracking system, so please resubmit an updated version when you
> > > can!
> > >
> > > Thanks a lot!
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Free Electrons
> > > Embedded Linux, Kernel and Android engineering
> > > http://free-electrons.com
> > >
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150720/7925581e/attachment.html>
