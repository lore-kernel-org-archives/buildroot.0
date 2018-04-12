From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 12 Apr 2018 08:44:23 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq packages: added dynamic library
 check
In-Reply-To: <CALFsTFW8txRWfd_O8289+wLT2-Nexh-r4B3i5zp4EyXbs+MFUQ@mail.gmail.com>
References: <20180411155544.18395-1-asafka7@gmail.com>
 <20180411183800.fgtsbp2ypgsb5ajk@tarshish>
 <CALFsTFW8txRWfd_O8289+wLT2-Nexh-r4B3i5zp4EyXbs+MFUQ@mail.gmail.com>
Message-ID: <20180412054423.2kwp4tuqgawbsqbi@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

On Wed, Apr 11, 2018 at 10:35:56PM +0300, Asaf Kahlon wrote:
> I want to make sure I understand.
> 
> Are we going to patch the configure.ac file and add something like
> AC_CHECK_LIB([dl], [function]), and remove the dladdr check?
> If yes, can you please elaborate why it's going to solve the problem?

Here is what I have in mind, totally untested:

diff --git a/configure.ac b/configure.ac
index 9e9a889f7c99..6cce53830d58 100644
--- a/configure.ac
+++ b/configure.ac
@@ -175,11 +175,6 @@ case "${host_os}" in
         AC_DEFINE(ZMQ_HAVE_LINUX, 1, [Have Linux OS])
         libzmq_on_linux="yes"
 
-        # dladdr/dlopen is in libdl on glibc
-        AC_SEARCH_LIBS([dladdr], [dl dld], [], [
-          AC_MSG_ERROR([unable to find the dladdr() function])
-        ])
-
         if test "x$libzmq_tipc_support" = "xyes"; then
             AC_DEFINE(ZMQ_HAVE_TIPC, 1, [Have TIPC support])
         fi
@@ -784,7 +779,7 @@ if test "x$enable_libunwind" != "xno"; then
             AC_DEFINE(HAVE_LIBUNWIND, 1, [The libunwind library is to be used])
             AC_SUBST([LIBUNWIND_CFLAGS])
             AC_SUBST([LIBUNWIND_LIBS])
-            AC_CHECK_LIB([dl], [dladdr])
+            AC_SEARCH_LIBS([dladdr], [dl dld])
         ],
         [
             if test "x$enable_libunwind" = "xyes"; then

> When I think about it after you brought up libunwind, I'm asking myself if
> zeromq should select this package too...

Not select, since libunwind is not a mandatory dependency. But adding an 
optional dependency on libunwind would be nice.

baruch

> On Wed, Apr 11, 2018 at 9:38 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Apr 11, 2018 at 06:55:44PM +0300, Asaf Kahlon wrote:
> > > The zeromq package now needs dynamic library support.
> > > Therefore the check was added to it, and to it's bindings.
> >
> > Please add a link an autobuilder build that this patch fixes.
> >
> > You also need to propagate this added dependency to reverse dependencies
> > recursively. So, for example, filemq also needs to depend on !static
> > because
> > it selects czmq.
> >
> > But I think there is a way to avoid all that. The code that needs dladdr()
> > in
> > src/err.cpp depends on libunwind. The configure.ac section that checks for
> > libunwind checks also dladdr(). So this configure failure is unnecessary.
> > Just
> > add libdld to the list of libraries, and remove the configure failing
> > check.
> >
> > Can you suggest upstream something along this line?
> >
> > Thanks,
> > baruch
> >
> > > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > > ---
> > >  DEVELOPERS                     |  1 +
> > >  package/cppzmq/Config.in       |  6 ++++--
> > >  package/czmq/Config.in         |  6 ++++--
> > >  package/php-zmq/Config.in      | 10 ++++++----
> > >  package/python-pyzmq/Config.in |  6 ++++--
> > >  package/zeromq/Config.in       | 10 ++++------
> > >  package/zmqpp/Config.in        |  5 +++--
> > >  7 files changed, 26 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index 00cbaeff37..bf7716316c 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -191,6 +191,7 @@ F:        package/stress/
> > >  N:   Asaf Kahlon <asafka7@gmail.com>
> > >  F:   package/python-jsonmodels/
> > >  F:   package/python-yieldfrom/
> > > +F:   package/zeromq
> > >
> > >  N:   Ash Charles <ash.charles@savoirfairelinux.com>
> > >  F:   package/pru-software-support/
> > > diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
> > > index c984c15c96..33fe7b6bca 100644
> > > --- a/package/cppzmq/Config.in
> > > +++ b/package/cppzmq/Config.in
> > > @@ -2,11 +2,13 @@ config BR2_PACKAGE_CPPZMQ
> > >       bool "cppzmq"
> > >       depends on BR2_INSTALL_LIBSTDCPP
> > >       depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > > +     depends on !BR2_STATIC_LIBS # zeromq
> > >       select BR2_PACKAGE_ZEROMQ
> > >       help
> > >         C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
> > >
> > >         http://github.com/zeromq/cppzmq
> > >
> > > -comment "cppzmq needs a toolchain w/ C++, threads"
> > > -     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> > > +comment "cppzmq needs a toolchain w/ dynamic library, C++, threads"
> > > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS ||
> > \
> > > +             BR2_STATIC_LIBS
> > > diff --git a/package/czmq/Config.in b/package/czmq/Config.in
> > > index 71389fce51..3cfe61ce42 100644
> > > --- a/package/czmq/Config.in
> > > +++ b/package/czmq/Config.in
> > > @@ -3,12 +3,14 @@ config BR2_PACKAGE_CZMQ
> > >       depends on BR2_USE_MMU # fork()
> > >       depends on BR2_INSTALL_LIBSTDCPP # zeromq
> > >       depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > > +     depends on !BR2_STATIC_LIBS # zeromq
> > >       select BR2_PACKAGE_ZEROMQ
> > >       help
> > >         High-level C Binding for 0MQ
> > >
> > >         http://czmq.zeromq.org/
> > >
> > > -comment "czmq needs a toolchain w/ C++, threads"
> > > +comment "czmq needs a toolchain w/ dynamic library, C++, threads"
> > >       depends on BR2_USE_MMU
> > > -     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> > > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS ||
> > \
> > > +             BR2_STATIC_LIBS
> > > diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
> > > index 058f93d9a8..3ba0096e43 100644
> > > --- a/package/php-zmq/Config.in
> > > +++ b/package/php-zmq/Config.in
> > > @@ -1,11 +1,13 @@
> > > -comment "php-zmq needs a toolchain w/ C++, threads"
> > > -     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> > > +comment "php-zmq needs a toolchain w/ dynamic library C++, threads"
> > > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS ||
> > \
> > > +             BR2_STATIC_LIBS
> > >
> > >  config BR2_PACKAGE_PHP_ZMQ
> > >       bool "php-zmq"
> > >       depends on BR2_PACKAGE_PHP
> > > -     depends on BR2_INSTALL_LIBSTDCPP
> > > -     depends on BR2_TOOLCHAIN_HAS_THREADS
> > > +     depends on BR2_INSTALL_LIBSTDCPP # zeromq
> > > +     depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > > +     depends on !BR2_STATIC_LIBS # zeromq
> > >       select BR2_PACKAGE_ZEROMQ
> > >       help
> > >         ZeroMQ messaging bindings for PHP
> > > diff --git a/package/python-pyzmq/Config.in
> > b/package/python-pyzmq/Config.in
> > > index 8f33a635c8..306fa02bcb 100644
> > > --- a/package/python-pyzmq/Config.in
> > > +++ b/package/python-pyzmq/Config.in
> > > @@ -2,12 +2,14 @@ config BR2_PACKAGE_PYTHON_PYZMQ
> > >       bool "python-pyzmq"
> > >       depends on BR2_INSTALL_LIBSTDCPP # zeromq
> > >       depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > > +     depends on !BR2_STATIC_LIBS # zeromq
> > >       select BR2_PACKAGE_ZEROMQ
> > >       help
> > >         This package contains the python language binding for zeromq.
> > >
> > >         http://zeromq.org/bindings:python
> > >
> > > -comment "python-pyzmq needs a toolchain w/ C++, threads"
> > > +comment "python-pyzmq needs a toolchain w/ dynamic library C++, threads"
> > >       depends on BR2_PACKAGE_PYTHON
> > > -     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> > > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS ||
> > \
> > > +             BR2_STATIC_LIBS
> > > diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
> > > index 69be9f002c..038ff61912 100644
> > > --- a/package/zeromq/Config.in
> > > +++ b/package/zeromq/Config.in
> > > @@ -1,10 +1,12 @@
> > > -comment "zeromq needs a toolchain w/ C++, threads"
> > > -     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
> > > +comment "zeromq needs a toolchain w/ dynamic library, C++, threads"
> > > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS ||
> > \
> > > +             BR2_STATIC_LIBS
> > >
> > >  config BR2_PACKAGE_ZEROMQ
> > >       bool "zeromq"
> > >       depends on BR2_INSTALL_LIBSTDCPP
> > >       depends on BR2_TOOLCHAIN_HAS_THREADS
> > > +     depends on !BR2_STATIC_LIBS
> > >       select BR2_PACKAGE_UTIL_LINUX
> > >       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> > >       help
> > > @@ -25,12 +27,8 @@ config BR2_PACKAGE_ZEROMQ
> > >
> > >  if BR2_PACKAGE_ZEROMQ
> > >
> > > -comment "norm support needs a toolchain w/ dynamic library"
> > > -     depends on BR2_STATIC_LIBS
> > > -
> > >  config BR2_PACKAGE_ZEROMQ_NORM
> > >       bool "NORM support"
> > > -     depends on !BR2_STATIC_LIBS
> > >       select BR2_PACKAGE_NORM
> > >       help
> > >         Add support for NACK-Oriented Reliable Multicast (RFC 5740)
> > > diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
> > > index 8dad80e451..3bb427cc5b 100644
> > > --- a/package/zmqpp/Config.in
> > > +++ b/package/zmqpp/Config.in
> > > @@ -4,6 +4,7 @@ config BR2_PACKAGE_ZMQPP
> > >       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> > >       depends on BR2_INSTALL_LIBSTDCPP
> > >       depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
> > > +     depends on !BR2_STATIC_LIBS # zeromq
> > >       select BR2_PACKAGE_ZEROMQ
> > >       help
> > >         C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
> > > @@ -13,9 +14,9 @@ config BR2_PACKAGE_ZMQPP
> > >
> > >         http://github.com/benjamg/zmqpp
> > >
> > > -comment "zmqpp needs a toolchain w/ C++, threads, gcc >= 4.7"
> > > +comment "zmqpp needs a toolchain w/ dynamic library, C++, threads"
> > >       depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS ||
> > \
> > > -             !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> > > +             BR2_STATIC_LIBS
> > >
> > >  if BR2_PACKAGE_ZMQPP

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
