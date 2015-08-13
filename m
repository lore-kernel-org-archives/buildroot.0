From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 13 Aug 2015 22:04:56 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-08-11
In-Reply-To: <1439486471.5209.9.camel@synopsys.com>
References: <20150812063012.10AFA1011A5@stock.ovh.net>
 <1439486471.5209.9.camel@synopsys.com>
Message-ID: <20150813200456.GC3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey, All,

On 2015-08-13 17:21 +0000, Alexey Brodkin spake thusly:
> On Wed, 2015-08-12 at 08:30 +0200, Thomas Petazzoni wrote:
> >          arc |                libpthsem-2.0.8 | NOK | 
> > http://autobuild.buildroot.net/results/a4cde804f769f8b4bbebc4d6ab5ec0e1e7e01afe/
> 
> That one is interesting.

Indeed! ;-)

If you look closely, those failures only occur on Nathaniel's
autobuilder instance:
    http://autobuild.buildroot.org/?reason=libpthsem-2.0.8

I've tried to reproduce the build failures, and I even deboostrapped the
same envirnoment as Nathaniel's, but to not avail. I not able to
reproduce... :-(

So, we do have an issue with this package.

> Definitely not ARC-specific, the same failure I see building for ARM:
> ----------------------------->8-----------------------
> pth_mctx.c: In function '__pth_mctx_set':
> pth_mctx.c:480:2: error: #error "Unsupported Linux (g)libc version and/or platform"
>  #error "Unsupported Linux (g)libc version and/or platform"
>   ^
> Makefile:995: recipe for target 'pth_mctx.lo' failed
> ----------------------------->8-----------------------
> 
> That happens here
> ----------------------------->8-----------------------
> #if defined(__GLIBC__) && defined(__GLIBC_MINOR__) \
>     && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 0 && defined(JB_PC) && defined(JB_SP)
>     mctx->jb[0].__jmpbuf[JB_PC] = (int)func;
>     mctx->jb[0].__jmpbuf[JB_SP] = (int)sk_addr_hi;
> #elif defined(__GLIBC__) && defined(__GLIBC_MINOR__) \
>     && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 0 && defined(__mc68000__)
>     mctx->jb[0].__jmpbuf[0].__aregs[0] = (long int)func;
>     mctx->jb[0].__jmpbuf[0].__sp = (int *)sk_addr_hi;
> #elif defined(__GNU_LIBRARY__) && defined(__i386__)
>     mctx->jb[0].__jmpbuf[0].__pc = (char *)func;
>     mctx->jb[0].__jmpbuf[0].__sp = sk_addr_hi;
> #else
> #error "Unsupported Linux (g)libc version and/or platform"
> #endif
> ----------------------------->8-----------------------
> 
> Looks like this library relies on some symbols that are not supported in some tools or
> even architectures.
> 
> So we need either add missing parts in both libc and libpthsem for arches we're
> interested in or disable libpthsem for some arches.
> 
> I would assume that the best approach is to define __jump_buf structure
> with meaningful members like __pc and __sp for example in the same way as MIPS guys did,
> see http://git.uclibc.org/uClibc/tree/libc/sysdeps/linux/mips/bits/setjmp.h#n34

That's not the only problem with libpthsem. Its configure step compiles
and tries to run a lot of programs to detect for some features.
Obviously, that can not work in cross-compilation... :-(

The best solution would be to fix the configure script, but it looks
like upstream is dead; quoting:

    This page (and the software described on it) is no longer
    maintained. It is archived for reference purposes.

So we won't be able to push our changes...

So, the next-best solution is to define the proper ac_cv_XXX variables
to override the checks, and feed it the proper values (should be always
the same, whatever the architecture: stack grows an such...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
