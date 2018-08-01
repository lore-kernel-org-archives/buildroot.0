From: Daniel Nicoletti <dantti12@gmail.com>
Date: Wed, 1 Aug 2018 10:00:35 -0300
Subject: [Buildroot] [PATCH] package/cutelyst: Fix build dependencies
In-Reply-To: <CACo8zOf7ukrnVpS0QUCA_YpmX7ApxApqGdadyTJn4yocF+juTg@mail.gmail.com>
References: <20180801114738.5044-1-dantti12@gmail.com>
 <20180801142712.5281ca21@windsurf>
 <CACo8zOf7ukrnVpS0QUCA_YpmX7ApxApqGdadyTJn4yocF+juTg@mail.gmail.com>
Message-ID: <CACo8zOdTofTccz-i3N-ugxuzMhgFJ5kD_09xQMBj0uqVWdB1=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh, and in this build:
http://autobuild.buildroot.net/results/555/555cf0cd59c9c832b15c604dae5bad3640f8b450/build-end.log

it failed not because of doxygen, but because it could not find libpwquality,
I guess it's an old build.
Em qua, 1 de ago de 2018 ?s 09:55, Daniel Nicoletti
<dantti12@gmail.com> escreveu:
>
> Em qua, 1 de ago de 2018 ?s 09:27, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> escreveu:
> >
> > Hello Daniel,
> >
> > Thanks for providing this fix!
> You welcome
>
> >
> > On Wed,  1 Aug 2018 08:47:38 -0300, Daniel Nicoletti wrote:
> > > Add missing optional dependencies need when
> > > the dependency was available, disabling Grantlee
> > > plugin for now as it failed to build.
> > >
> > > Signed-off-by: Daniel Nicoletti <dantti12@gmail.com>
> >
> > I've applied, but after changing one thing:
> >
> > > ---
> > >  package/cutelyst/cutelyst.mk | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
> > > index 438ac091c6..2d1c9b1532 100644
> > > --- a/package/cutelyst/cutelyst.mk
> > > +++ b/package/cutelyst/cutelyst.mk
> > > @@ -15,20 +15,16 @@ CUTELYST_DEPENDENCIES = qt5base
> > >  CUTELYST_CONF_OPTS += \
> > >       -DPLUGIN_CSRFPROTECTION=ON
> > >
> > > -ifeq ($(BR2_PACKAGE_GRANTLEE),y)
> > > -CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=ON
> > > -else
> > > -CUTELYST_CONF_OPTS += -DPLUGIN_VIEW_GRANTLEE=OFF
> > > -endif
> >
> > I've kept an unconditional -DPLUGIN_VIEW_GRANTLEE=OFF to make sure that
> > grantlee support is always disabled, even if grantlee gets
> > built/installed before cutelyst.
> By default all plugins that require external deps are disabled, but
> it's harmless anyway
>
> >
> > However, there are other build issues of the cutelyst package which
> > don't seem to be related:
> >
> >  - http://autobuild.buildroot.net/results/b4b/b4bd0807fed721d8f553f1392e7d1fa51545d046/build-end.log
> >
> >    Lots of Qt/C++ errors.
> Yeah, I have fixed a few right after the release, as they usually build fine
> when warnings are not enabled...
>
> >
> >  - http://autobuild.buildroot.net/results/555/555cf0cd59c9c832b15c604dae5bad3640f8b450/build-end.log
> >
> >    Doxygen missing. We have a host-doxygen package in Buildroot, but it
> >    would be a lot nicer of Cutelyst would not require Doxygen. Any
> >    chance to make this optional ? We don't really care about building
> >    documentation in the context of Buildroot.
> It does not require, it only uses if found and if make docs, I could
> add a BUILD_DOCS option but it's not very important IMO.
>
> >
> >  - http://autobuild.buildroot.net/results/771/7716878c3a26b93417188ad7eac91ace172815bb/build-end.log
> >
> >    lrelease not found
> >
> > Could you have a look at those remaining build issues ?
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> Daniel Nicoletti
>
> KDE Developer - http://dantti.wordpress.com



-- 
Daniel Nicoletti

KDE Developer - http://dantti.wordpress.com
