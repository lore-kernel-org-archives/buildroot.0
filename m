From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Oct 2019 20:16:43 +0200
Subject: [Buildroot] [PATCH v4 2/2] support/dependencies: set cmake
 version min to 3.10
In-Reply-To: <CADvTj4r-Z3U6cru8wy3APa=qdxFOxnkU979FM2GtV73r0FxoCQ@mail.gmail.com>
References: <20191012152643.67744-1-james.hilliard1@gmail.com>
 <20191012152643.67744-2-james.hilliard1@gmail.com>
 <20191012165207.GA14656@scaer>
 <CADvTj4r-Z3U6cru8wy3APa=qdxFOxnkU979FM2GtV73r0FxoCQ@mail.gmail.com>
Message-ID: <20191012181643.GB14656@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2019-10-12 19:18 +0200, James Hilliard spake thusly:
> On Sat, Oct 12, 2019 at 6:52 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2019-10-12 09:26 -0600, James Hilliard spake thusly:
> > > We retain 3.8 as the minimum for hosts without a c++ toolchain.
> > >
> > > All packages that require 3.10 or newer themselves require a c++ toolchain.
> > >
> > > This is required by wpewebkit and webkitgtk.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
> > >
> > > ---
> > > Changes v3 -> v4:
> > >   - retain support for version 3.8.2 for older toolchains
> > > ---
> > >  support/dependencies/check-host-cmake.mk | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> > > index 5604713de6..7d59708573 100644
> > > --- a/support/dependencies/check-host-cmake.mk
> > > +++ b/support/dependencies/check-host-cmake.mk
> > > @@ -1,9 +1,17 @@
> > > -# Set this to either 3.8 or higher, depending on the highest minimum
> > > +# Set this to either 3.10 or higher, depending on the highest minimum
> > >  # version required by any of the packages bundled in Buildroot. If a
> > >  # package is bumped or a new one added, and it requires a higher
> > >  # version, our cmake infra will catch it and build its own.
> > > +# Newer versions of cmake require a c++11 toolchain so we should
> > > +# only build newer versions if our host gcc supports c++11.
> > > +# Packages that depend upon newer cmake versions all currently
> > > +# require a c++11 toolchain themselves.
> > >  #
> > > +ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),y)
> > > +BR2_CMAKE_VERSION_MIN = 3.10
> > > +else
> > >  BR2_CMAKE_VERSION_MIN = 3.8
> > > +endif
> >
> > Sorry, but this is still not good for me.
> >
> > BR2_CMAKE_VERSION_MIN is really meant to be the highest minimal cmake
> > version the cmake-packages in Buildroot need.
> Well it's still technically true for a host without a BR2_HOST_GCC_AT_LEAST_4_8
> that 3.8 is the max needed and for a host with BR2_HOST_GCC_AT_LEAST_4_8
> that 3.10 is the max, I guess one option may be to replace the
> BR2_HOST_GCC_AT_LEAST_4_8 with something like
> BR2_HOST_CMAKE_AT_LEAST_3_10 which the webkit packages select.
> >
> > Semantically (and I really mean _semantically_) it feels really wrong to
> > correlate the minimum cmake version with the host-gcc version.
> I agree, it just seemed to be the simplest change that would work.
> >
> > With your patch, a target cmake-package that needs cmake-3.10, will also
> > have to know that it should also need a host-gcc >= 4.8, even thou it is
> > a pure target package.
> That def is not ideal, but at least there don't seem to be any packages
> that depend on a target cmake-package(seems kind of useless on the target
> in general since we don't support building target toolchains).

It's not about a package that needs the target cmake, but still the
host-cmake, which we have to build with the host compiler.

> > Furthermore, the discussion is happening in this patch, but it really
> > applies to both, because if the host-provided cmake is too old, then
> > we're going to build host-cmake-3.15 now, which as Arnout noted on IRC,
> > is full of even more C++11-isms (but do all of those require gcc-4.8?)
> Well it in theory should always work since we only build host-cmake-3.15
> if we have BR2_HOST_GCC_AT_LEAST_4_8.

Sorry, but maybe I am missing on something here. The problem is not that
host-cmake-3.15 is built only with BR2_HOST_GCC_AT_LEAST_4_8.

The problem is the following:

1. the host machine does not have cmake installed, so we have to build
    our own. With your two patches, we will build host-cmake-3.15. But
    that requires a host that has gcc >= 4.8, which we currently do not
    require.

    So, with your two patches, it means that *all* our cmake-based
    packages will have to depend on BR2_HOST_GCC_AT_LEAST_4_8. This is
    not acceptable.

2. The host has a cmake < 3.10. We are back in the situation above,
    where we will have to build our own host-cmake-3.15, and we still
    have the same issue. This is still not accpetable.

3. The host has cmake >= 3.10 installed, then we don't care.

So, in conclusion, the conditional version in this patch is useless,
since it always implies we need to build cmake 3.15.

Now, even if you downgrade your second patch from 3.15 to 3.10, we still
have the exact same issue.

> > However, maybe we can look at how we solved a similar issue for glibc.
> > glibc requires make-4.0+, but Buildroot only requires 3.81+, and we
> > build glibc by passing a specific version of make. Maybe we could do
> > something similar for webkit...
> That seems super tricky, and I'm not sure that situation is directly comparable,
> I don't see any reason we need to build with two versions of cmake
> since the newer
> version should be fully backwards compatible and build all projects
> cmake-3.8 can.

I would not say that, if I were you. We did have cmake versions that
introduced regressions, or changed behaviours that were previously
working for us and no longer did... See for example:
  - 8428dbd88 although it is terse in explanations,
  - 0904b80b4 which is also a change in behaviour that we fixed,
  - 1914ce3f3..85b852a96 which again is a revert of a major version bump

So, no, history has taught us that major version bumps are not simple,
and especially here, sine we'd got from 3.8 to 3.15, which is not a bump,
not even a leap, but a really long jump...

> > We still require cmake-3.8 at minimum, but for webkit-stuff, we depend
> > on host-cmake-3.10_or_above_whatever, and explicitly use that cmake for
> > webkit, by introducing a new variable in the infra, like we have
> > FOO_MAKE, we could introduce FOO_CMAKE (if not already present).
> So BR2_HOST_CMAKE_AT_LEAST_3_10 would depend on
> BR2_HOST_GCC_AT_LEAST_4_8 in that case then?

What I was thinking was:

    package/cmake-3.8/Config.in.host
        config BR2_PACKAGE_HOST_CMAKE_3_8
            bool "host-cmake"

    package/cmake-3.8/cmake-3.8.mk
        # Don't install the target variant
        # Install host-cmake normally, as done today, but rename the
        # cmake program to cmake-3.8

    package/cmake/Config.in.host
        config BR2_PACKAGE_HOST_CMAKE_3_15
            bool "host-cmake-3.15"
            depends on BR2_HOST_GCC_AT_LEAST_4_8

    package.cmake/cmake.mk
        # Install the target variant
        # Install the host variant as 'cmake'

    package/pkg-cmake.mk
        ifndef $(2)_CMAKE
          ifdef $(3)_CMAKE
            $(2)_CMAKE = $$($(3)_CMAKE)
          else
            $(2)_CMAKE ?= $$(BR2_CMAKE)
          endif
        endif

        ifeq ($$($(2)_CMAKE),cmake-3.15)
        $(2)_DEPENDENCIES += host-cmake
        else
        $(2)_DEPENDENCIES += $$(BR2_CMAKE_HOST_DEPENDENCY)
        endif

    support/dependencies/check-host-cmake.mk
        # When we need it:
        BR2_CMAKE_HOST_DEPENDENCY = host-cmake-3.8

Then, packages that require cmake > 3.8 would have to select
BR2_PACKAGE_HOST_CMAKE_3_15 and thus would inherit its dependencies, and
in their .mk they would set FOO_CMAKE = cmake-3.15

This would be limited to a very small set, comprised of only
webkit-stuff for now.

This is the overall idea... I may be missing a few details here and
there, though, but the plan is around this.

That, or we bite the bullet and bump our requirements to host machines
that provide a gcc-4.8 or later. Some people might not be very happy...

Regards,
Yann E. MORIN.

> > Thoughts?
> >
> > Regards,
> > Yann E. MORIN.
> >
> > >  BR2_CMAKE_CANDIDATES ?= cmake cmake3
> > >  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> > > --
> > > 2.20.1
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

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
