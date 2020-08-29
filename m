From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Sat, 29 Aug 2020 09:32:01 +0200
Subject: [Buildroot] [PATCH v3] package/easyframes: new package
In-Reply-To: <CALFsTFUmB-vWcn+RHQjcSfCCJLtxJjLniuV=FGwdLrDf8-=iOA@mail.gmail.com>
References: <20200820064356.3103584-1-horatiu.vultur@microchip.com>
 <CALFsTFUmB-vWcn+RHQjcSfCCJLtxJjLniuV=FGwdLrDf8-=iOA@mail.gmail.com>
Message-ID: <20200829073201.r2f3y66x7cd7bmgb@soft-dev3.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 08/28/2020 21:44, Asaf Kahlon wrote:
> 
> Hello,

Hi,

Thanks for your comments. I have sent a new version now, where I removed
the C++ dependency.

> 
> On Thu, Aug 20, 2020 at 9:44 AM Horatiu Vultur via buildroot
> <buildroot@busybox.net> wrote:
> >
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> >
> > ---
> > Changes v2 -> v3:
> >   - add missing changelog
> >
> > Changes v1 -> v2:
> >   - add missing comment in easyframes.hash
> >   - add sha256 for COPYING
> >   - remove zlib dependency
> >   - change from using sha to use tag
> > ---
> >  DEVELOPERS                         |  3 +++
> >  package/Config.in                  |  1 +
> >  package/easyframes/Config.in       | 10 ++++++++++
> >  package/easyframes/easyframes.hash |  3 +++
> >  package/easyframes/easyframes.mk   | 15 +++++++++++++++
> >  5 files changed, 32 insertions(+)
> >  create mode 100644 package/easyframes/Config.in
> >  create mode 100644 package/easyframes/easyframes.hash
> >  create mode 100644 package/easyframes/easyframes.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 35840ec9a8..dd1ec8903c 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1109,6 +1109,9 @@ F:        package/gauche/
> >  F:     package/gmrender-resurrect/
> >  F:     package/squeezelite/
> >
> > +N:     Horatiu Vultur <horatiu.vultur@microchip.com>
> > +F:     package/easyframes/
> > +
> >  N:     Ian Haylock <haylocki@yahoo.co.uk>
> >  F:     package/python-rpi-gpio/
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index d7e79f4795..3965d523c6 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -2039,6 +2039,7 @@ menu "Networking applications"
> >         source "package/dnsmasq/Config.in"
> >         source "package/drbd-utils/Config.in"
> >         source "package/dropbear/Config.in"
> > +       source "package/easyframes/Config.in"
> >         source "package/ebtables/Config.in"
> >         source "package/ejabberd/Config.in"
> >         source "package/ethtool/Config.in"
> > diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
> > new file mode 100644
> > index 0000000000..eca9ff3a60
> > --- /dev/null
> > +++ b/package/easyframes/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_EASYFRAMES
> > +       bool "easyframes"
> > +       depends on BR2_INSTALL_LIBSTDCPP
> In case the user doesn't have a toolchain with C++, you should add a
> comment describing that need.
> Something like:
> comment "easyframes needs a toolchain w/ C++"
>         depends on !BR2_INSTALL_LIBSTDCPP
> 
> In addition, I opened a PR for you in order to make the package fully
> C++ independent, so if you want you can create a new tag with this
> change and remove the BR2_INSTALL_LIBSTDCPP dependency at all.
> 
> > +       select BR2_PACKAGE_LIBPCAP
> > +       help
> > +         This is a small and simple command-line tool for network testing.
> > +         The tool makes it simple to compose a frame, inject and express what
> > +         and where frames are expected to be received.
> > +
> > +         https://github.com/microchip-ung/easyframes
> > diff --git a/package/easyframes/easyframes.hash b/package/easyframes/easyframes.hash
> > new file mode 100644
> > index 0000000000..07c516fb6d
> > --- /dev/null
> > +++ b/package/easyframes/easyframes.hash
> > @@ -0,0 +1,3 @@
> > +# locally calculated
> > +sha256 bd26de2de60e55ea092053c66cf4482f15ed6353961b175ddb376c46b536e86b easyframes-v0.2.tar.gz
> > +sha256 24f37598e822a1411fb7164ce7eb3ef120aea8279016399abc282c2381ce3f57 COPYING
> > diff --git a/package/easyframes/easyframes.mk b/package/easyframes/easyframes.mk
> > new file mode 100644
> > index 0000000000..218fe3b238
> > --- /dev/null
> > +++ b/package/easyframes/easyframes.mk
> > @@ -0,0 +1,15 @@
> > +################################################################################
> > +#
> > +# easyframes
> > +#
> > +################################################################################
> > +
> > +EASYFRAMES_VERSION = v0.2
> > +EASYFRAMES_SITE = $(call github,microchip-ung,easyframes,$(EASYFRAMES_VERSION))
> > +EASYFRAMES_INSTALL_STAGING = YES
> > +EASYFRAMES_DEPENDENCIES = libpcap
> > +
> > +EASYFRAMES_LICENSE = MIT
> > +EASYFRAMES_LICENSE_FILES = COPYING
> > +
> > +$(eval $(cmake-package))
> > --
> > 2.27.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> Regards,
> Asaf.

-- 
/Horatiu
