From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Aug 2018 22:56:35 +0200
Subject: [Buildroot] [PATCH/next/RFC v2 1/2] package/mariadb: handle
 missing ucontext_t
In-Reply-To: <20180826170326.18743-1-bernd.kuhls@t-online.de>
References: <20180826170326.18743-1-bernd.kuhls@t-online.de>
Message-ID: <20180831225635.5dd4d83d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

+Waldemar in Cc, since there is (in my opinion) something not really
good going on in uClibc-ng, see below.

On Sun, 26 Aug 2018 19:03:25 +0200, Bernd Kuhls wrote:
> On some archs uclibc does not provide ucontext_t, for details see
> https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262
> 
> Mariadb uses ucontext_t optionally, its use can be disabled by the
> corresponding cmake option. Instead of copying the Config.in code from
> libsigsegv we shamelessly use its ARCH_SUPPORTS option while thinking
> that a more general approach might be needed for ucontext_t support so
> please consider this patch a RFC.

Indeed, hijacking the libsigsegv Config.in symbol is not really nice.
Having a global BR2_TOOLCHAIN_HAS_UCONTEXT symbol would be OK, but I
believe in the case of mariadb, it shouldn't be needed.

Indeed, MariaDB configure.cmake contains this:

CHECK_INCLUDE_FILE(ucontext.h HAVE_UCONTEXT_H)
IF(NOT HAVE_UCONTEXT_H)
  CHECK_INCLUDE_FILE(sys/ucontext.h HAVE_UCONTEXT_H)
ENDIF()
IF(HAVE_UCONTEXT_H)
  CHECK_FUNCTION_EXISTS(makecontext HAVE_UCONTEXT_H)
ENDIF()

Which should do the following:

 - Check if ucontext.h exists, and if so, define HAVE_UCONTEXT_H

 - If HAVE_UCONTEXT_H is still not defined, check if sys/ucontext.h
   exists, and if it's the case, define HAVE_UCONTEXT_H

 - If HAVE_UCONTEXT_H is defined, test if makecontext exists, and store
   the result in HAVE_UCONTEXT_H.

So in our case, because makecontext() is not implemented, mariadb
should not use ucontext support.

But this doesn't work, because that's not how CHECK_FUNCTION_EXISTS()
work. If the variable passed is already defined to one, then it does
nothing.

So, can you change to something like this:

CHECK_INCLUDE_FILE(ucontext.h HAVE_UCONTEXT_H)
IF(NOT HAVE_UCONTEXT_H)
  CHECK_INCLUDE_FILE(sys/ucontext.h HAVE_UCONTEXT_H)
ENDIF()
CHECK_FUNCTION_EXISTS(makecontext HAVE_MAKECONTEXT)
IF(NOT HAVE_MAKECONTEXT)
  UNSET(HAVE_UCONTEXT_H)
ENDIF()

it should work a bit better. Beware that there are two locations where
ucontext.h is tested:

 - in configure.cmake
 - in libmariadb/cmake/CheckIncludeFiles.cmake

Side note for Waldemar: uClibc-ng approach here is a bit unclean: it
installs <ucontext.h> even if the architecture doesn't support the
context functions. And this <ucontext.h> does basically nothing,
because its entire contents are enclosed in an
__UCLIBC_HAS_CONTEXT_FUNCS__ condition. Waldemar: perhaps this should
be fixed in uClibc-ng ?

> Musl also does not provide ucontext functions:
> https://wiki.musl-libc.org/open-issues.html

This is interesting, because it shows that the comment in
libsigsegv/Config.in is not correct:

        # with glibc/musl, ucontext is available for all supported
        # architectures
        default y if BR2_TOOLCHAIN_USES_GLIBC
        default y if BR2_TOOLCHAIN_USES_MUSL

What is available for all architectures is ucontext.h, but the context
functions are not available for any architecture. So, libsigsegv needs
ucontext.h, not the context functions.

Could you have a look at fixing the CMake logic in MariaDB to rely on
the presence of makecontext() to decide automatically if ucontext
should be used or not ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
