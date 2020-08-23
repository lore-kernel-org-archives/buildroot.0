From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 16:16:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5imageformats: add
 optional dependencies
In-Reply-To: <20200823132822.GE8728@scaer>
References: <20200822182535.1835260-1-fontaine.fabrice@gmail.com>
 <20200823132822.GE8728@scaer>
Message-ID: <CAPi7W81omS4-KyyEbDtKTiG72CFhdEksuTQQx=YYNb=5_R-Dzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le dim. 23 ao?t 2020 ? 15:28, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> On 2020-08-22 20:25 +0200, Fabrice Fontaine spake thusly:
> > Add optional dependencies which are enabled by default:
> >  - libmng and tiff are optional dependencies since version 5.0.0 and
> >    https://github.com/qt/qtimageformats/commit/5373e3e821c7f43d9c941384437b1d39d6e9d47e
> >  - webp is an optional dependency since version 5.3.0 and
> >    https://github.com/qt/qtimageformats/commit/4522b350e53471c2ebc6d4692736ee4708445b66
> >  - jasper is an optional dependency since version 5.7.0 and
> >    https://github.com/qt/qtimageformats/commit/2d59367241aafbfe6acb30202f64e30697028bd9
> >
> > Ideally we should use the configure options to disable those
> > dependencies if needed especially webp to avoid using the embedded one
> > These options are defined here:
> > https://code.qt.io/cgit/qt/qtimageformats.git/tree/config_help.txt
> > but I'm not skilled enough with the qmake-infrastructure
>
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_qmake_based_packages
> It would probably be something along the lines of:
>
>     ifeq ($(BR2_PACKAGE_JASPER),y)
>     QT5IMAGEFORMATS_DEPENDENCIES += jasper
>     QT5IMAGEFORMATS_CONF_OPTS += QT_CONFIG+=jasper
>     else
>     QT5IMAGEFORMATS_CONF_OPTS += QT_CONFIG-=jasper
>     endif
This doesn't work, this has no effect on the build (i.e. jasper is
enabled if it is found on the system even if I passed QT_CONFIG -=
jasper or more importantly the embedded webp is used even if I passed
QT_CONFIG -= webp).

>> qt5imageformats 5.15.0 Configuring
cd /home/fabrice/buildroot/output/build/qt5imageformats-5.15.0/ &&
PATH="/home/fabrice/buildroot/output/host/bin:/home/fabrice/buildroot/output/host/sbin:/home/fabrice/perl5/bin:/home/fabrice/.local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
 /home/fabrice/buildroot/output/host/bin/qmake -spec
devices/linux-buildroot-g++ QT_CONFIG-=jasper QT_CONFIG-=tiff
QT_CONFIG-=webp
Info: creating stash file
/home/fabrice/buildroot/output/build/qt5imageformats-5.15.0/.qmake.stash
Info: creating cache file
/home/fabrice/buildroot/output/build/qt5imageformats-5.15.0/.qmake.cache

Running configuration tests...
Done running configuration tests.

Configure summary:

Further Image Formats:
  JasPer ................................. yes
  MNG .................................... no
  TIFF ................................... yes
    Using system libtiff ................. no
  WEBP ................................... yes
    Using system libwebp ................. no

From my understanding, the build option should be -webp=system or
-webp=no but this option is not recognized by qmake but I know nearly
nothing about Qt.
>
> Would you rework this patch, and split it into four patches, one for
> each optional dependency, please?
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/qt5/qt5imageformats/qt5imageformats.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
> > index ffb094d566..33631a39b2 100644
> > --- a/package/qt5/qt5imageformats/qt5imageformats.mk
> > +++ b/package/qt5/qt5imageformats/qt5imageformats.mk
> > @@ -12,4 +12,10 @@ QT5IMAGEFORMATS_INSTALL_STAGING = YES
> >  QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
> >  QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
> >
> > +QT5IMAGEFORMATS_DEPENDENCIES += \
> > +     $(if $(BR2_PACKAGE_JASPER),jasper) \
> > +     $(if $(BR2_PACKAGE_LIBMNG),libmng) \
> > +     $(if $(BR2_PACKAGE_TIFF),tiff) \
> > +     $(if $(BR2_PACKAGE_WEBP),webp)

> > +
> >  $(eval $(qmake-package))
> > --
> > 2.28.0
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
