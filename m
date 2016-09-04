From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Sep 2016 23:51:11 +0200
Subject: [Buildroot] [PATCH 1/2] websocketpp: new package
In-Reply-To: <6967de21-0283-2d26-1d2d-048b18919f5f@gmail.com>
References: <20160902134256.4515-1-pieter.degendt@gmail.com>
 <6967de21-0283-2d26-1d2d-048b18919f5f@gmail.com>
Message-ID: <20160904215111.GC6522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, Pieter, All,

On 2016-09-03 19:43 +0200, Romain Naour spake thusly:
> Le 02/09/2016 ? 15:42, Pieter De Gendt a ?crit :
> > Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
[--SNIP--]
> > diff --git a/package/websocketpp/0001-Fix-cmake-cross-compile.patch b/package/websocketpp/0001-Fix-cmake-cross-compile.patch
> > new file mode 100644
> > index 0000000..cbaa9e9
> > --- /dev/null
> > +++ b/package/websocketpp/0001-Fix-cmake-cross-compile.patch
> > @@ -0,0 +1,42 @@
> > +From 1be867f214cf86d48be13603511dafe75afe8d8e Mon Sep 17 00:00:00 2001
> > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Date: Fri, 2 Sep 2016 14:44:55 +0200
> > +Subject: [PATCH] cmake: install correct .cmake files
> > +
> > +Currently, we install a .cmake file (so that other packages can find us)
> > +that sets the include path to /usr/include.
> > +
> > +This does not work in cross-compilation, as it points to the build
> > +machine headers, so is not correct for cross-compilation, for two
> > +reasons:
> > +  - websocketpp might not be installed on the build machine,
> > +  - it might be installed as a different version.
> > +
> > +Thus, we need to let cmake find the correct include path.
> > +
> > +We do so by searching the include directory that contains a specific
> > +file of our own; we choose websocketpp/version.h as the file to look
> > +for.
> > +
> > +This then properly sets the include path, which is even often uneeded
> > +as it will be the standard search path (either /usr/include for native
> > +builds, or .../sysroot/usr/include for cross builds).
> > +
> > +Thanks to Samuel for hinting me at find_path(). :-)
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Cc: Samuel Martin <s.martin49@gmail.com>
> > +---

Here, you should add a pointer to the upstream merge-request on github,
for reference.

> > diff --git a/package/websocketpp/Config.in b/package/websocketpp/Config.in
> > new file mode 100644
> > index 0000000..97df9fd
> > --- /dev/null
> > +++ b/package/websocketpp/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_WEBSOCKETPP
> > +	bool "websocketpp"
> > +	select BR2_PACKAGE_ZLIB
> > +	depends on BR2_PACKAGE_BOOST
> > +	depends on BR2_PACKAGE_BOOST_SYSTEM

Why do you absolutely need BR2_PACKAGE_BOOST_SYSTEM?

> > +	depends on BR2_PACKAGE_BOOST_RANDOM
> 
> Like gnuradio package, you can use "select" instead of "depends on" for boost
> package dependecy.

Unfortunately, if the "system" layout is required, you can not select
Boost and depend on the system option, or you'd get a circular
dependency.

So what Pieter did (assuming the "system" layout is mandatory) is
correct.

> Add select BR2_BOOST_THREAD maybe ?
> websocketpp/common/thread.hpp:    #include <boost/thread.hpp>
> Add select BR2_BOOST_CHRONO maybe ?
> websocketpp/common/chrono.hpp:    #include <boost/chrono.hpp>
> 
> But it seems these dependency are required only if the toolchains doesn't have
> C++11 support. Otherwise the C++11 chrono/thread header is preferred over the
> boost one.

Even so, it is better to just require these two dependencies.

Boost is a (almost) headers-only stuff, so adding more would not enlarge
the rootfs (at least not by much, if at all).

> // If we've determined that we're in full C++11 mode and the user hasn't
> // explicitly disabled the use of C++11 functional header, then prefer it to
> // boost.
> #if defined _WEBSOCKETPP_CPP11_INTERNAL_ && !defined _WEBSOCKETPP_NO_CPP11_CHRONO_
>     #ifndef _WEBSOCKETPP_CPP11_CHRONO_
>         #define _WEBSOCKETPP_CPP11_CHRONO_
>     #endif
> #endif
> 
> [...]
> 
> #ifdef _WEBSOCKETPP_CPP11_CHRONO_
>     #include <chrono>
> #else
>     #include <boost/chrono.hpp>
> #endif
> 
> So, websocket package should take into account BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 or
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 for C++11 dependencies.

Or maybe not: if gcc is recent enough, websocketpp will use C++11 stuff,
and fallback to Boost if C++11 is not available. No?

[--SNIP--]
> > diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
> > new file mode 100644
> > index 0000000..e4f729b
> > --- /dev/null
> > +++ b/package/websocketpp/websocketpp.mk
> > @@ -0,0 +1,15 @@
> > +################################################################################
> > +#
> > +# websocketpp
> > +#
> > +################################################################################
> > +
> > +WEBSOCKETPP_VERSION = 0.7.0
> > +WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
> > +WEBSOCKETPP_LICENSE = BSD
> 
> websocketpp use several license like MIT as noticed by Manuel Gro? in
> http://patchwork.ozlabs.org/patch/659477

So, this is more than that, as seen in the COPYING file:

    WEBSOCKETPP_LICENSE = BSD-3c, MIT, zlib license

> > +WEBSOCKETPP_LICENSE_FILES = COPYING
> > +WEBSOCKETPP_DEPENDENCIES = zlib
> 
> websocketpp doesn't build anything (header only package), there is no need to
> add zlib as build dependency.

Not sure, see below...

> > +WEBSOCKETPP_INSTALL_STAGING = YES

Since it only installs headers:

    # Only installs headers
    WEBSOCKETPP_INSTALL_TARGET = NO

> > +WEBSOCKETPP_DEPENDENCIES = host-pkgconf boost
>                             ^^
> Use += here otherwise zlib dependency is dropped.

And there should be only one dependency line, as there's nothing
conditional here:

    WEBSOCKETPP_DEPENDENCIES = host-pkgconf boost zlib

However, I would say that, if a package needs websocketpp but does not
need zilb, that package should not need to add a dependency on zlib.
Yet, zlib must be built before that pacakge.

So I would say that the depednency on zlib and boost is correct. They
are not needed at build =time (there's actually no build), but that's
irrelevant: they need to be available in staging as soon as websocketpp
is.

> I don't see where pkg-config is used in the Buildsystem, I think it's not needed.

Line 205 in CMakeList.txt:

    205  find_package (Boost 1.39.0 COMPONENTS "${WEBSOCKETPP_BOOST_LIBS}")

(find_package() is the pkg-config stuff in cmake, right?)

> Like for zlib, I beleve that boost build dependency can be removed here.
> Boost and zlib should be added to the package using websocketpp headers.

I don't think so; see above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
