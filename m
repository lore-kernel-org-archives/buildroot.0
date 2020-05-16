From: vadim4j at gmail.com <vadim4j@gmail.com>
Date: Sat, 16 May 2020 18:13:53 +0300
Subject: [Buildroot] [PATCH v2] package/ndisc6: fix compilation for
 glibc < 2.19
In-Reply-To: <20200516161700.57b975ef@windsurf.home>
References: <20200509190947.453850-1-vadim4j@gmail.com>
 <20200516161700.57b975ef@windsurf.home>
Message-ID: <20200516151353.GA1424@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 16, 2020 at 04:17:00PM +0200, Thomas Petazzoni wrote:
> Hello Vadym,
> 
> On Sat,  9 May 2020 22:09:47 +0300
> Vadym Kochan <vadim4j@gmail.com> wrote:
> 
> > glibc version before 2.19 version allows to use BSD-mode via #define
> > _BSD_SOURCE, it defines another one
> > 
> >     __FAVOR_BSD
> > 
> > which provides BSD-style tcp/udp headers where fields are different than
> > in GNU version.
> > 
> > In glibc > 2.18 there is no such ability to use BSD mode, but it
> > supports both kinds of tcp/udp headers because of using __extension__
> > union.
> > 
> > Since trace-{udp,tcp}.c uses BSD-style tcp/udp headers, it fails on
> > toolchains with glibc < 2.19 version.
> > 
> > So fix it by defining __FAVOR_BSD define only for tcp/udp headers.
> 
> Defining __FAVOR_BSD is not correct, and the whole explanation is a bit
> confused I believe.
> 
> The <features.h> macros that start with two underscores, such as
> __FAVOR_BSD are internal defines, they are not meant to be defined/used
> by code using the C library, but only by the C library internally.
> 
> Instead, what needs to be done is:
> 
> #define _BSD_SOURCE
> 
> next to the existing #define _DEFAULT_SOURCE.
> 
> For one of the two files, #undef _GNU_SOURCE is present, which is good,
> it will have to be added as to the other file for that fix to work.
> 
> From man feature_test_macros:
> 
>        _BSD_SOURCE (deprecated since glibc 2.20)
> 
>                Defining this macro with any value causes header files
>                to expose BSD-derived definitions.
> 
>                In glibc versions up to and including 2.18, defining
>                this macro also causes BSD  definitions  to  be
>                preferred  in  some  situations  where  standards
>                conflict,  unless  one  or  more of _SVID_SOURCE,
>                _POSIX_SOURCE, _POSIX_C_SOURCE, _XOPEN_SOURCE,
>                _XOPEN_SOURCE_EXTENDED, or _GNU_SOURCE is defined, in
>                which case BSD definitions are disfavored.  Since glibc
>                2.19, _BSD_SOURCE no longer causes BSD defi? nitions to
>                be preferred in case of conflicts.
> 
>                Since glibc 2.20, this macro is deprecated.  It now has
>                the same effect as defining _DEFAULT_SOURCE, but
>                generates a compile-time warning (unless _DEFAULT_SOURCE
>                is also defined).  Use _DEFAULT_SOURCE instead.  To
>                allow code that requires _BSD_SOURCE in glibc 2.19 and
>                earlier and  _DEFAULT_SOURCE  in glibc 2.20 and later to
>                compile without warnings, define both _BSD_SOURCE and
>                _DEFAULT_SOURCE.
> 
> See the last paragraph? They see you should define both _BSD_SOURCE and
> _DEFAULT_SOURCE.
> 
> Could you fix your patch, and the commit log, and send an updated
> version?
Sure!

> 
> Thanks a lot!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
