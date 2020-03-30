From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 30 Mar 2020 10:47:08 +0300
Subject: [Buildroot] [PATCH v5 1/3] package/arm-gnu-a-toolchain: new
 package
In-Reply-To: <CAAfyv3724WciWQ7anLt7xj1NhLKmH=40oyFK5Ozzh=rA0nGZ4g@mail.gmail.com>
References: <1585371871-29406-1-git-send-email-sunil@amarulasolutions.com>
 <1585371871-29406-2-git-send-email-sunil@amarulasolutions.com>
 <20200329151425.25f92077@windsurf.home>
 <CAAfyv3724WciWQ7anLt7xj1NhLKmH=40oyFK5Ozzh=rA0nGZ4g@mail.gmail.com>
Message-ID: <20200330074708.d2xczevafng3zmvi@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi
> 
> On Sun, Mar 29, 2020 at 3:14 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > I've applied your patch, but after doing a number of changes, see below.
> >
> > On Sat, 28 Mar 2020 10:34:29 +0530
> > sunil at amarulasolutions.com wrote:
> >
> > >  DEVELOPERS                                         |  3 +++
> > >  package/Config.in.host                             |  1 +
> > >  package/arm-gnu-a-toolchain/Config.in.host         |  9 ++++++++
> >
> > I've entirely dropped the visible Config.in.host option for this
> > package, it is merely a build dependency of ATF, so we don't need (at
> > this point at least) a visible option.
> >
> > > +N:   Suniel Mahesh <sunil@amarulasolutions.com>
> > > +F:   package/arm-gnu-a-toolchain
> >
> > Directories end with a / in DEVELOPERS.
> >
> > > +config BR2_PACKAGE_HOST_ARM_GNU_A_TOOLCHAIN
> > > +     bool "host arm-gnu-a-toolchain"
> > > +     help
> > > +       arm trusted firmware requires a bare metal toolchain to build some platforms
> > > +       which host cortex-m series core, for instance rockchip rk3399 has a cortex-m0 core.
> > > +       This package installs a pre-built cross-compilation ARM-A bare metal toolchain for
> > > +       the host machine.
> >
> > Lines where way too long: you forgot to run "make check-package", which
> > would have pointed out this coding style issue. Of course, since I
> > dropped the Config.in.host, it was not a big issue.
> Does it mean that with this we can enable same for nanopi NEO4 (which
> was dropped in 8af7b11bd8a95bc41e4de46f727f3b0afde465a4)
> with comment:
> 
> This defconfig tries to build an ARM Trusted Firmware version that
>     needs an ARM32 toolchain, which is not available as the platform is an
>     ARM64 one. The correct solution for this is to have a package in
>     Buildroot for an ARM32 bare-metal toolchain, but this wasn't done in
>     time for the 2019.08 release.
> 
> but when I just reverted mentioned commit NEO4 boots fine without
> issue. So I'm bit confused if I need to add support for NEO4 with this
> changes to NEO4 and resurrect it? Thanks.

You mean if you revert that commit w/o any changes, NEO4 builds and
boots fine ? Probably you have already installed arm32 toolchain on
your build server, that is why it works fine for you.

Looking at the patches from Sunil, you have to add
BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
into ATF section of NEO4 board defconfig.

Regards,
Sergey
