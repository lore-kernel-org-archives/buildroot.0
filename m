From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 19:31:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: needs wchar
In-Reply-To: <20210515171657.GW2506@scaer>
References: <20210514211801.2261810-1-fontaine.fabrice@gmail.com>
 <20210515171550.GV2506@scaer> <20210515171657.GW2506@scaer>
Message-ID: <CAPi7W80Q9pBVCdGLmv61Pyh6wfToUQAHfLL5zLM4f+kSxgfWrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 15 mai 2021 ? 19:17, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> On 2021-05-15 19:15 +0200, Yann E. MORIN spake thusly:
> > Fabrice, All,
> >
> > On 2021-05-14 23:18 +0200, Fabrice Fontaine spake thusly:
> > > bullet needs wchar since bump to version 3.09 in commit
> > > 28b4947ed8f53c4edfbf8fef9304dc76480c01ca:
> > >
> > > /home/giuliobenetti/autobuild/run/instance-0/output-1/build/bullet-3.09/examples/ThirdPartyLibs/Gwen/Structures.h:42:14: error: 'wstring' in namespace 'std' does not name a type
> > >    42 | typedef std::wstring UnicodeString;
> > >       |              ^~~~~~~
> >
> > wstring is only ever used in tests and examples, and it seems we can
> > disable both. Tests are already disabled, and it should be possible to
> > disable exampels as well with -DBUILD_BULLET2_DEMOS=OFF
>
> I mean, of course, if other wchar related stuff are not used in the
> core...
We're enabling demos since commit 5f154799b6ed772a0c028072996e110fac131508
because upstream recommends to avoid changing any options, see:
https://patchwork.ozlabs.org/project/buildroot/patch/20210430060545.1243461-1-fontaine.fabrice at gmail.com/
>
> > Regards,
> > Yann E. MORIN.
> >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/2b1158970fc45e9ebd4be4d726352166ed417a1f
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > > ---
> > >  package/bullet/Config.in | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/package/bullet/Config.in b/package/bullet/Config.in
> > > index 5d8a57aa47..1f632b8931 100644
> > > --- a/package/bullet/Config.in
> > > +++ b/package/bullet/Config.in
> > > @@ -2,11 +2,13 @@ config BR2_PACKAGE_BULLET
> > >     bool "bullet"
> > >     depends on BR2_INSTALL_LIBSTDCPP
> > >     depends on !BR2_STATIC_LIBS # dlfcn.h
> > > +   depends on BR2_USE_WCHAR
> > >     help
> > >       Bullet is a Collision Detection and Rigid Body Dynamics
> > >       Library.
> > >
> > >       http://bulletphysics.org
> > >
> > > -comment "bullet needs a toolchain w/ C++, dynamic library"
> > > -   depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
> > > +comment "bullet needs a toolchain w/ C++, dynamic library, wchar"
> > > +   depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> > > +           !BR2_USE_WCHAR
> > > --
> > > 2.30.2
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
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
