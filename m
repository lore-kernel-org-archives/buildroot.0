From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Nov 2019 20:06:12 +0100
Subject: [Buildroot] [PATCH 2/2] package/matchbox-desktop: needs -ldl
In-Reply-To: <20191120182301.GN32494@scaer>
References: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
 <20191030092245.10235-2-fontaine.fabrice@gmail.com>
 <20191120182301.GN32494@scaer>
Message-ID: <CAPi7W83SQuDc_Adb00z0cpGrG-VM68MWkXaakxwsmEujfGTVKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le mer. 20 nov. 2019 ? 19:23, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Fabrice, All,
>
> On 2019-10-30 10:22 +0100, Fabrice Fontaine spake thusly:
> > For an unknown reason, autoreconf does not work anymore to link with
> > -ldl, probably because of a change in the behavior of the deprecated
> > AC_LIBTOOL_DLOPEN macro
>
> I'd like to understand what is really going on here, because there are
> build more recent than this one, which do build successfully:
>     http://autobuild.buildroot.org/results/c9c/c9c02c2c6d29f447c82adf9c05c141f288de1754/
>
> So definitely, the autoreconf does work in some cases.
>
> So, can we identify the reason it fails in some caes and not in others?
Build failures started on October 22nd so perhaps this issue is also
linked to commit 9cc8680fe54c0b8f5008158e36e2157127f03a7e.
There is already discussions ongoing about if for gmpc that missed -lm
(https://patchwork.ozlabs.org/patch/1186343/) and libv4l that missed
-latomic (https://patchwork.ozlabs.org/patch/1186541).
>
> Regards,
> Yann E. MORIN.
>
> > As matchox-desktop is not active, just add -ldl to LIBS
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/382a5041b628328808083085f87016547a680478
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/matchbox-desktop/matchbox-desktop.mk | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/package/matchbox-desktop/matchbox-desktop.mk b/package/matchbox-desktop/matchbox-desktop.mk
> > index 9054dd80c6..82d8a44f77 100644
> > --- a/package/matchbox-desktop/matchbox-desktop.mk
> > +++ b/package/matchbox-desktop/matchbox-desktop.mk
> > @@ -11,11 +11,7 @@ MATCHBOX_DESKTOP_SITE = http://downloads.yoctoproject.org/releases/matchbox/matc
> >  MATCHBOX_DESKTOP_LICENSE = GPL-2.0+
> >  MATCHBOX_DESKTOP_LICENSE_FILES = COPYING
> >  MATCHBOX_DESKTOP_DEPENDENCIES = matchbox-lib zlib
> > -
> > -# The bundled configure script does not properly replace LIBADD_DL, so
> > -# we force an autoreconf even if we don't have any patches touching
> > -# configure.ac/Makefile.am.
> > -MATCHBOX_DESKTOP_AUTORECONF = YES
> > +MATCHBOX_DESKTOP_CONF_ENV = LIBS=-ldl
> >
> >  ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
> >  MATCHBOX_DESKTOP_CONF_OPTS += --enable-startup-notification
> > --
> > 2.23.0
> >
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
