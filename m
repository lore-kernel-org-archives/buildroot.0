From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 17 May 2021 22:51:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: drop
 BR2_PACKAGE_LVM2_APP_LIBRARY
In-Reply-To: <20210517204324.GH2506@scaer>
References: <20210517170609.810302-1-fontaine.fabrice@gmail.com>
 <20210517170609.810302-2-fontaine.fabrice@gmail.com>
 <20210517204324.GH2506@scaer>
Message-ID: <CAPi7W83SZL9j2iEvi8DM6EBVJfXksN5-WsGZXnSundeHfYHOYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lun. 17 mai 2021 ? 22:43, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> +Adam for udisks and GOI... ;-]
>
> On 2021-05-17 19:06 +0200, Fabrice Fontaine spake thusly:
> > The application library (liblvm2app) has been dropped since version
> > 2.03.00 and
> > https://github.com/lvmteam/lvm2/commit/0d22b58172808f050abeacdb5d6a7b7132b91a8c
> >
> > It should be noted that lvm2 support must be dropped from udisks until
> > a bump to at least version 2.7.0 and
> > https://github.com/storaged-project/udisks/commit/4c0709a893be49a0db5b2839e4766621e2c1bb98
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Applied to master, thanks.
>
> I was a bit concerned that we dropped this support, but hinestly, we
> have udisks 1.0.5, from March 2014... So, to me, it's a minor annoyance
> if lvm2 support in udisks is dropped...
>
> IIRC, Adam, did some work on udisks back when he was "toying" with GOI...
> Adam? ;-)
We also have a patch to bump udisks from Giulio:
https://patchwork.ozlabs.org/project/buildroot/patch/20200217143030.5031-5-giulio.benetti at benettiengineering.com/
Perhaps, Giulio could also help us to bump udisks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  Config.in.legacy         | 13 +++++++++++++
> >  package/lvm2/Config.in   | 11 -----------
> >  package/lvm2/lvm2.mk     |  7 -------
> >  package/udisks/Config.in | 15 ---------------
> >  package/udisks/udisks.mk |  6 +-----
> >  5 files changed, 14 insertions(+), 38 deletions(-)
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 39a44f3026..8683e01490 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,19 @@ endif
> >
> >  comment "Legacy options removed in 2021.05"
> >
> > +config BR2_PACKAGE_UDISKS_LVM2
> > +     bool "udisks lvm2 support removed"
> > +     select BR2_LEGACY
> > +     help
> > +       The lvm2 support was removed because udisks < 2.7.0 still
> > +       depends on lvm2 application library.
> > +
> > +config BR2_PACKAGE_LVM2_APP_LIBRARY
> > +     bool "lvm2 application library removed"
> > +     select BR2_LEGACY
> > +     help
> > +       The lvm2 application library was removed upstream.
> > +
> >  config BR2_PACKAGE_LVM2_LVMETAD
> >       bool "lvm2 lvmetad removed"
> >       select BR2_LEGACY
> > diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> > index de5b972e99..f8bcdffb38 100644
> > --- a/package/lvm2/Config.in
> > +++ b/package/lvm2/Config.in
> > @@ -36,17 +36,6 @@ config BR2_PACKAGE_LVM2_STANDARD_INSTALL
> >  comment "lvm2 standard install needs a glibc or uClibc toolchain"
> >       depends on BR2_TOOLCHAIN_USES_MUSL
> >
> > -config BR2_PACKAGE_LVM2_APP_LIBRARY
> > -     bool "install application library"
> > -     # http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
> > -     depends on !BR2_TOOLCHAIN_USES_MUSL
> > -     select BR2_PACKAGE_LVM2_STANDARD_INSTALL
> > -     help
> > -       Install application library (liblvm2app).
> > -
> > -comment "lvm2 application library needs a glibc or uClibc toolchain"
> > -     depends on BR2_TOOLCHAIN_USES_MUSL
> > -
> >  endif
> >
> >  comment "lvm2 needs a toolchain w/ threads, dynamic library"
> > diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> > index 84ec75530a..224dbf5d54 100644
> > --- a/package/lvm2/lvm2.mk
> > +++ b/package/lvm2/lvm2.mk
> > @@ -55,12 +55,6 @@ LVM2_INSTALL_STAGING_OPTS += install
> >  LVM2_INSTALL_TARGET_OPTS += install
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
> > -LVM2_CONF_OPTS += --enable-applib
> > -else
> > -LVM2_CONF_OPTS += --disable-applib
> > -endif
> > -
> >  ifeq ($(BR2_INIT_SYSTEMD),y)
> >  LVM2_INSTALL_TARGET_OPTS += install_systemd_units install_systemd_generators
> >  endif
> > @@ -75,7 +69,6 @@ HOST_LVM2_CONF_OPTS = \
> >       --enable-pkgconfig \
> >       --disable-cmdlib \
> >       --disable-dmeventd \
> > -     --disable-applib \
> >       --disable-fsadm \
> >       --disable-readline \
> >       --disable-selinux
> > diff --git a/package/udisks/Config.in b/package/udisks/Config.in
> > index efd3b619bf..9d3eb240e6 100644
> > --- a/package/udisks/Config.in
> > +++ b/package/udisks/Config.in
> > @@ -31,21 +31,6 @@ config BR2_PACKAGE_UDISKS
> >
> >         http://www.freedesktop.org/wiki/Software/udisks
> >
> > -if BR2_PACKAGE_UDISKS
> > -
> > -config BR2_PACKAGE_UDISKS_LVM2
> > -     bool "lvm2 support"
> > -     # The lvm app library can't compile against musl
> > -     depends on BR2_TOOLCHAIN_USES_GLIBC
> > -     select BR2_PACKAGE_LVM2_APP_LIBRARY
> > -     help
> > -       Enable LVM2 support
> > -
> > -comment "lvm2 support needs a glibc toolchain"
> > -     depends on !BR2_TOOLCHAIN_USES_GLIBC
> > -
> > -endif
> > -
> >  comment "udisks needs udev /dev management"
> >       depends on BR2_USE_MMU
> >       depends on !BR2_PACKAGE_HAS_UDEV
> > diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
> > index af25c2b8e2..9f7a02e10c 100644
> > --- a/package/udisks/udisks.mk
> > +++ b/package/udisks/udisks.mk
> > @@ -24,10 +24,6 @@ UDISKS_DEPENDENCIES = \
> >       sg3_utils \
> >       udev
> >
> > -UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
> > -
> > -ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
> > -UDISKS_CONF_OPTS += --enable-lvm2
> > -endif
> > +UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages --disable-lvm2
> >
> >  $(eval $(autotools-package))
> > --
> > 2.30.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
Best Regards,

Fabrice
