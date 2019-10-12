From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Oct 2019 19:18:14 +0200
Subject: [Buildroot] [PATCH v4 2/2] support/dependencies: set cmake
 version min to 3.10
In-Reply-To: <20191012165207.GA14656@scaer>
References: <20191012152643.67744-1-james.hilliard1@gmail.com>
 <20191012152643.67744-2-james.hilliard1@gmail.com>
 <20191012165207.GA14656@scaer>
Message-ID: <CADvTj4r-Z3U6cru8wy3APa=qdxFOxnkU979FM2GtV73r0FxoCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 12, 2019 at 6:52 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2019-10-12 09:26 -0600, James Hilliard spake thusly:
> > We retain 3.8 as the minimum for hosts without a c++ toolchain.
> >
> > All packages that require 3.10 or newer themselves require a c++ toolchain.
> >
> > This is required by wpewebkit and webkitgtk.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
> >
> > ---
> > Changes v3 -> v4:
> >   - retain support for version 3.8.2 for older toolchains
> > ---
> >  support/dependencies/check-host-cmake.mk | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/support/dependencies/check-host-cmake.mk b/support/dependencies/check-host-cmake.mk
> > index 5604713de6..7d59708573 100644
> > --- a/support/dependencies/check-host-cmake.mk
> > +++ b/support/dependencies/check-host-cmake.mk
> > @@ -1,9 +1,17 @@
> > -# Set this to either 3.8 or higher, depending on the highest minimum
> > +# Set this to either 3.10 or higher, depending on the highest minimum
> >  # version required by any of the packages bundled in Buildroot. If a
> >  # package is bumped or a new one added, and it requires a higher
> >  # version, our cmake infra will catch it and build its own.
> > +# Newer versions of cmake require a c++11 toolchain so we should
> > +# only build newer versions if our host gcc supports c++11.
> > +# Packages that depend upon newer cmake versions all currently
> > +# require a c++11 toolchain themselves.
> >  #
> > +ifeq ($(BR2_HOST_GCC_AT_LEAST_4_8),y)
> > +BR2_CMAKE_VERSION_MIN = 3.10
> > +else
> >  BR2_CMAKE_VERSION_MIN = 3.8
> > +endif
>
> Sorry, but this is still not good for me.
>
> BR2_CMAKE_VERSION_MIN is really meant to be the highest minimal cmake
> version the cmake-packages in Buildroot need.
Well it's still technically true for a host without a BR2_HOST_GCC_AT_LEAST_4_8
that 3.8 is the max needed and for a host with BR2_HOST_GCC_AT_LEAST_4_8
that 3.10 is the max, I guess one option may be to replace the
BR2_HOST_GCC_AT_LEAST_4_8 with something like
BR2_HOST_CMAKE_AT_LEAST_3_10 which the webkit packages select.
>
> Semantically (and I really mean _semantically_) it feels really wrong to
> correlate the minimum cmake version with the host-gcc version.
I agree, it just seemed to be the simplest change that would work.
>
> With your patch, a target cmake-package that needs cmake-3.10, will also
> have to know that it should also need a host-gcc >= 4.8, even thou it is
> a pure target package.
That def is not ideal, but at least there don't seem to be any packages
that depend on a target cmake-package(seems kind of useless on the target
in general since we don't support building target toolchains).
>
> Furthermore, the discussion is happening in this patch, but it really
> applies to both, because if the host-provided cmake is too old, then
> we're going to build host-cmake-3.15 now, which as Arnout noted on IRC,
> is full of even more C++11-isms (but do all of those require gcc-4.8?)
Well it in theory should always work since we only build host-cmake-3.15
if we have BR2_HOST_GCC_AT_LEAST_4_8.
>
> o, I am decidely not happy with this... :-(
Yeah, I'm not liking it much either but haven't found a better way yet.
>
> However, maybe we can look at how we solved a similar issue for glibc.
> glibc requires make-4.0+, but Buildroot only requires 3.81+, and we
> build glibc by passing a specific version of make. Maybe we could do
> something similar for webkit...
That seems super tricky, and I'm not sure that situation is directly comparable,
I don't see any reason we need to build with two versions of cmake
since the newer
version should be fully backwards compatible and build all projects
cmake-3.8 can.
>
> We still require cmake-3.8 at minimum, but for webkit-stuff, we depend
> on host-cmake-3.10_or_above_whatever, and explicitly use that cmake for
> webkit, by introducing a new variable in the infra, like we have
> FOO_MAKE, we could introduce FOO_CMAKE (if not already present).
So BR2_HOST_CMAKE_AT_LEAST_3_10 would depend on
BR2_HOST_GCC_AT_LEAST_4_8 in that case then?
>
> Thoughts?
>
> Regards,
> Yann E. MORIN.
>
> >  BR2_CMAKE_CANDIDATES ?= cmake cmake3
> >  BR2_CMAKE ?= $(call suitable-host-package,cmake,\
> > --
> > 2.20.1
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
