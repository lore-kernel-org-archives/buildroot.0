From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 17 Feb 2021 23:51:24 +0100
Subject: [Buildroot] CMake package requires out of source build
In-Reply-To: <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
References: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
 <20210216000715.2d81f552@gmx.net>
 <CADjezma+0Oav4kZzYnuwdsbruCFuBG3ZLqRPQ2EF7uHyHXg4Cw@mail.gmail.com>
Message-ID: <20210217235124.240c7012@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Wed, 17 Feb 2021 09:20:03 -0500, mattwood2000 at gmail.com wrote:

> Hi Peter,
>
> On Mon, Feb 15, 2021 at 6:07 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello Matt,
> >
> > On Mon, 15 Feb 2021 16:28:28 -0500, mattwood2000 at gmail.com wrote:
> >
> > > Hi,
> > >
> > > I've found myself in a bit of a dilemma with a piece of software I'm
> > > trying to integrate into a custom cmake package.
> > >
> > > The software is the amazon avs-device-sdk:
> > > https://github.com/alexa/avs-device-sdk
> > >
> > > For whatever reason, it does not support building within the source
> > > tree.  Under normal circumstances one would set
> > > <PKG>_SUPPORTS_IN_SOURCE_BUILD=NO, but in this case the sdk will not
> > > support a build directory in the source SDK whatsoever, so that config
> > > option is useless.
> > >
> > > The only way I can see to get around this short of Amazon fixing their
> > > weird build requirement is to do a dirty hack like below.
> > >
> > > Does anyone have any other suggestions?
> >
> > You can try it the other way round, overwrite the extract step
> > via <PKG>_EXTRACT_CMDS to extract into build/<package>-<version>/some_sub_dir
> > and use <PKGC>_SUBDIR=some_sub_dir then (did not test the solution)....
> >
> > If it works it would have the advantage to not touch pkg-cmake.mk and keep
> > all files in the package build directory...
>
> Well, that sounded like a great solution but unfortunately the
> buildroot still tries to build within the <PKG>_SUBDIR.  The main
> issue is Amazon's rule to disallow in-source building, even within a
> separate directory.  I worked around this by not including their
> iterate function to detect an in-source build and using
> SUPPORTS_IN_SOURCE_BUILD=NO.

Yes your are right, the actual buildroot logic moves even in the
case of _SUPPORTS_IN_SOURCE_BUILD = NO and given _SUBDIR the
buildroot-build to $(<PKG>_SUBDIR)/buildroot-build, maybe time to
change it for this case to do a real out-of-source-tree build...

Tested the following patch for e.g. jpeg-turbo package:


  --- a/package/jpeg-turbo/jpeg-turbo.mk
  +++ b/package/jpeg-turbo/jpeg-turbo.mk
  @@ -13,6 +13,13 @@ JPEG_TURBO_INSTALL_STAGING = YES
   JPEG_TURBO_PROVIDES = jpeg
   JPEG_TURBO_DEPENDENCIES = host-pkgconf

  +JPEG_TURBO_SUPPORTS_IN_SOURCE_BUILD = NO
  +define JPEG_TURBO_EXTRACT_CMDS
  +       mkdir -p $(@D)/jpeg-turbo-src
  +       gzip -d -c $(JPEG_TURBO_DL_DIR)/$(JPEG_TURBO_SOURCE) | tar --strip-components=1 -C $(@D)/jpeg-turbo-src -xf -
  +endef
  +JPEG_TURBO_SUBDIR = jpeg-turbo-src
  +
   JPEG_TURBO_CONF_OPTS = -DWITH_JPEG8=ON

   ifeq ($(BR2_STATIC_LIBS),y)

  --- a/package/pkg-cmake.mk
  +++ b/package/pkg-cmake.mk
  @@ -66,7 +66,7 @@ $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
   ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
   $(2)_BUILDDIR                  = $$($(2)_SRCDIR)
   else
  -$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
  +$(2)_BUILDDIR                  = $$($(2)_DIR)/buildroot-build
   endif

   #

Regards,
Peter

>
> Thanks for the suggestion though.
>
>
> >
> > Regards,
> > Peter
> >
> > >
> > > Thanks, Matt.
> > >
> > > --- a/package/pkg-cmake.mk
> > > +++ b/package/pkg-cmake.mk
> > > @@ -66,7 +66,8 @@ $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
> > >  ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
> > >  $(2)_BUILDDIR                  = $$($(2)_SRCDIR)
> > >  else
> > > -$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
> > > +$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/../$(1)_buildroot-build
> > >  endif
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
