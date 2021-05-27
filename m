From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 May 2021 08:10:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: disable logs with riscv32
In-Reply-To: <a223a026-dfcd-ffb0-7791-b6cfc3600170@mind.be>
References: <20210521200323.426580-1-fontaine.fabrice@gmail.com>
 <a223a026-dfcd-ffb0-7791-b6cfc3600170@mind.be>
Message-ID: <CAPi7W81hPubXmYw4EDESah7h8QQXypOcm3zqfGqkoZ+_oTGTNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le mar. 25 mai 2021 ? 21:27, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 21/05/2021 22:03, Fabrice Fontaine wrote:
> > boost logs can't be built with riscv32 because it unconditionally uses
> > __NR_futex:
> >
> > libs/log/src/event.cpp: In member function 'void boost::log::v2_mt_posix::aux::futex_based_event::wait()':
> > libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
> >    38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
> >       |                             ^~~~~~~~~~
>
>  There seems to be a similar issue in boost/atomic/detail/futex.hpp, e.g. [1].
The link that you've given is also raised by log, not atomic:

    - log                      : building

libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
   38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
      |                             ^~~~~~~~~~
> Could you handle that as well?
>
>
>  Regards,
>  Arnout
>
>
> [1]
> http://autobuild.buildroot.net/results/6aa/6aa7ac8b14c3ba4f674d541fabb4476680b299a7/build-end.log
>
>
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/azmq/Config.in  | 3 +++
> >  package/boost/Config.in | 3 +++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/package/azmq/Config.in b/package/azmq/Config.in
> > index 37131a260a..6751d533a4 100644
> > --- a/package/azmq/Config.in
> > +++ b/package/azmq/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_AZMQ
> >       bool "azmq"
> > +     depends on !BR2_RISCV_32 # boost-log
> >       depends on BR2_INSTALL_LIBSTDCPP
> >       depends on BR2_TOOLCHAIN_HAS_ATOMIC
> >       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
> > @@ -22,9 +23,11 @@ config BR2_PACKAGE_AZMQ
> >         https://github.com/zeromq/azmq
> >
> >  comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
> > +     depends on !BR2_RISCV_32
> >       depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> >       depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> >               && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
> >
> >  comment "azmq needs exception_ptr"
> > +     depends on !BR2_RISCV_32
> >       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> > diff --git a/package/boost/Config.in b/package/boost/Config.in
> > index 3e96e1ede3..75bb81600a 100644
> > --- a/package/boost/Config.in
> > +++ b/package/boost/Config.in
> > @@ -240,6 +240,7 @@ comment "boost-locale needs a toolchain not affected by GCC bug 64735"
> >
> >  config BR2_PACKAGE_BOOST_LOG
> >       bool "boost-log"
> > +     depends on !BR2_RISCV_32>       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >       depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic
> >       depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
> > @@ -253,10 +254,12 @@ config BR2_PACKAGE_BOOST_LOG
> >         Logging library.
> >
> >  comment "boost-log needs a toolchain w/ NPTL"
> > +     depends on !BR2_RISCV_32
> >       depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >
> >  comment "boost-log needs a toolchain not affected by GCC bug 64735"
> > +     depends on !BR2_RISCV_32
> >       depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> >
> >  config BR2_PACKAGE_BOOST_MATH
>
>
>
Best Regards,

Fabrice
