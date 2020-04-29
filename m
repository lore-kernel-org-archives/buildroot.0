From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Wed, 29 Apr 2020 08:15:51 -0500
Subject: [Buildroot] [PATCH] package/cunit: switch to maintain fork
 version 3.2.6
In-Reply-To: <20200429150827.20ac5a0d@windsurf.home>
References: <20200428221018.1317-1-ryan.barnett@rockwellcollins.com>
 <20200429150827.20ac5a0d@windsurf.home>
Message-ID: <CAMQcK5JsFiCKtD9A2uQM4OuSfeEy6wA5hojOUBowLC5+dEAA6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/All,

On Wed, Apr 29, 2020 at 8:09 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 28 Apr 2020 17:10:18 -0500
> Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:
>
> > Changes which were made to the package include:
> >
> >  * Switch to CMake build system
> >  * Requires BR2_USE_MMU for '-rdynamic' (CMake test)
>
> -rdynamic is more related to shared libraries than MMU support. You can
> have a pure static library system on a MMU-capable system, and some
> no-MMU platforms support shared libraries.

That is what I'm gather based on the feedback from upstream in my
issue that I created:

https://gitlab.com/cunity/cunit/-/issues/39

> > diff --git a/package/cunit/Config.in b/package/cunit/Config.in
> > index 8bcfa2a4ec..53d8be2307 100644
> > --- a/package/cunit/Config.in
> > +++ b/package/cunit/Config.in
> > @@ -1,6 +1,12 @@
> >  config BR2_PACKAGE_CUNIT
> >       bool "cunit"
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_USE_MMU
> >       help
> > -       An automated testing framework in 'C'.
> > +       An automated testing framework in 'C' forked from the
> > +       Sourceforge CUnit which is currently unmaintained.
> >
> > -       http://cunit.sourceforge.net/
> > +       https://gitlab.com/cunity/cunit
> > +
> > +comment "cunit needs a toolchain w/ C++"
> > +     depends on !BR2_INSTALL_LIBSTDCPP
>
> This comment would have required a "depends on BR2_USE_MMU". But most
> likely, it will be a !BR2_STATIC_LIBS dependency instead.

Do you have any suggestions in regards to the feedback that Ian Norton
(maintainer of forked cunit) of how we could handle this properly?

Feedback from Ian:

   Hi Ryan, that error is complaining about the linker not supporting -rdynamic.

   I think you can make this go away by setting a newer cmake policy -
   https://cmake.org/cmake/help/v3.6/policy/CMP0065.html

   Or by overriding the cmake shared library flags to be empty perhaps?

   -DCMAKE_SHARED_LIBRARY_LINK_C_FLAGS=""

Thanks,
-Ryan
