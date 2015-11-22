From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Nov 2015 09:52:35 -0200
Subject: [Buildroot] [PATCH 1/1] gpsd: re-enable on microblaze
	architecture
In-Reply-To: <56510B19.9060203@mind.be>
References: <1448142802-1294-1-git-send-email-sergio.prado@e-labworks.com>
 <56510B19.9060203@mind.be>
Message-ID: <CANu7NGtEOcA-HbGn4Gu9MerN-4mTp86b0wh=5KA-UtrLnttK7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-21 22:23 GMT-02:00 Arnout Vandecappelle <arnout@mind.be>:

>  Since you also add a workaround, the subject should have been:
>
> gpsd: add work-around and re-enable for microblaze
>
> (I've taken some poetic license here :-)
>
OK. :)


>
> On 21-11-15 22:53, Sergio Prado wrote:
> > Fix (works around) bug #6872
> > https://bugs.busybox.net/show_bug.cgi?id=6872
> >
> > The gpsd package was disabled due to an internal compiler error for
> > the microblaze architecture in the following commit:
> >
> http://git.buildroot.net/buildroot/commit/?id=d517415bcda380336f4a27bf248cef4d81791c9e
> >
> > The problem is due to an specific GCC optimization flag
> > (-fexpensive-optimizations), so disabling it we can work around this
> > problem and compile gpsd for the microblaze architecture.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > ---
> >  package/gpsd/Config.in        | 3 ---
> >  package/gpsd/gpsd.mk          | 7 ++++++-
> >  package/sconeserver/Config.in | 2 --
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
> > index fa8b8f6b2ad5..b4008ebd8353 100644
> > --- a/package/gpsd/Config.in
> > +++ b/package/gpsd/Config.in
> > @@ -1,7 +1,6 @@
> >  comment "gpsd needs a toolchain w/ threads, dynamic library"
> >       depends on BR2_USE_MMU
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> > -     depends on !BR2_microblaze
> >
> >  config BR2_PACKAGE_GPSD
> >       bool "gpsd"
> > @@ -10,8 +9,6 @@ config BR2_PACKAGE_GPSD
> >       depends on BR2_TOOLCHAIN_HAS_THREADS
> >       # Always tries to build a shared library
> >       depends on !BR2_STATIC_LIBS
> > -     # triggers gcc ice
> > -     depends on !BR2_microblaze
> >       help
> >         gpsd is a service daemon that monitors one or more GPSes or AIS
> >         receivers attached to a host computer through serial or USB
> ports,
> > diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> > index 87911c3905fe..18715f8f2933 100644
> > --- a/package/gpsd/gpsd.mk
> > +++ b/package/gpsd/gpsd.mk
> > @@ -13,6 +13,7 @@ GPSD_INSTALL_STAGING = YES
> >  GPSD_DEPENDENCIES = host-scons host-pkgconf
> >
> >  GPSD_LDFLAGS = $(TARGET_LDFLAGS)
> > +GPSD_CFLAGS = $(TARGET_CFLAGS)
> >
> >  GPSD_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
> >
> > @@ -37,6 +38,10 @@ else
> >  GPSD_SCONS_OPTS += libgpsmm=no
> >  endif
> >
> > +ifeq ($(BR2_microblaze),y)
>
>  The 'triggers gcc ice' comment should be repeated here.
>
OK.


>
>  Otherwise looks good so you can add my
>  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
I will do it and send v2.

Thanks!


>
>  Regards,
>  Arnout
>
> > +GPSD_CFLAGS += -fno-expensive-optimizations
> > +endif
> > +
> >  # Enable or disable Qt binding
> >  ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
> >  GPSD_SCONS_ENV += QMAKE="$(QT_QMAKE)"
> > @@ -185,7 +190,7 @@ ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
> >  GPSD_SCONS_OPTS += limited_max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
> >  endif
> >
> > -GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)"
> > +GPSD_SCONS_ENV += LDFLAGS="$(GPSD_LDFLAGS)" CFLAGS="$(GPSD_CFLAGS)"
> >
> >  define GPSD_BUILD_CMDS
> >       (cd $(@D); \
> > diff --git a/package/sconeserver/Config.in
> b/package/sconeserver/Config.in
> > index f16e683bf563..4083aa7dce36 100644
> > --- a/package/sconeserver/Config.in
> > +++ b/package/sconeserver/Config.in
> > @@ -63,7 +63,6 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
> >       bool "location"
> >       depends on BR2_USE_MMU # gpsd
> >       depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
> > -     depends on !BR2_microblaze # gpsd
> >       depends on !BR2_STATIC_LIBS # gpsd
> >       select BR2_PACKAGE_GPSD
> >       help
> > @@ -72,7 +71,6 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
> >  comment "location support needs a toolchain w/ theads, dynamic library"
> >       depends on BR2_USE_MMU
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBRARY
> > -     depends on !BR2_microblaze
> >
> >  config BR2_PACKAGE_SCONESERVER_LETTUCE
> >       bool "lettuce"
> >
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151122/566dd4c8/attachment.html>
