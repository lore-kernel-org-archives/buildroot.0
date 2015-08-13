From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 13 Aug 2015 17:21:12 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-08-11
In-Reply-To: <20150812063012.10AFA1011A5@stock.ovh.net>
References: <20150812063012.10AFA1011A5@stock.ovh.net>
Message-ID: <1439486471.5209.9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-08-12 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-08-11
> ===============================
> 
>         success : 5  
>        failures : 3  
>        timeouts : 0  
>           TOTAL : 8  
> 
> Classification of failures by reason
> ====================================
> 
>              libselinux-2.1.13 | 2 
>                libpthsem-2.0.8 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                libpthsem-2.0.8 | NOK | 
> http://autobuild.buildroot.net/results/a4cde804f769f8b4bbebc4d6ab5ec0e1e7e01afe/

That one is interesting.
Definitely not ARC-specific, the same failure I see building for ARM:
----------------------------->8-----------------------
pth_mctx.c: In function '__pth_mctx_set':
pth_mctx.c:480:2: error: #error "Unsupported Linux (g)libc version and/or platform"
 #error "Unsupported Linux (g)libc version and/or platform"
  ^
Makefile:995: recipe for target 'pth_mctx.lo' failed
----------------------------->8-----------------------

That happens here
----------------------------->8-----------------------
#if defined(__GLIBC__) && defined(__GLIBC_MINOR__) \
    && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 0 && defined(JB_PC) && defined(JB_SP)
    mctx->jb[0].__jmpbuf[JB_PC] = (int)func;
    mctx->jb[0].__jmpbuf[JB_SP] = (int)sk_addr_hi;
#elif defined(__GLIBC__) && defined(__GLIBC_MINOR__) \
    && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 0 && defined(__mc68000__)
    mctx->jb[0].__jmpbuf[0].__aregs[0] = (long int)func;
    mctx->jb[0].__jmpbuf[0].__sp = (int *)sk_addr_hi;
#elif defined(__GNU_LIBRARY__) && defined(__i386__)
    mctx->jb[0].__jmpbuf[0].__pc = (char *)func;
    mctx->jb[0].__jmpbuf[0].__sp = sk_addr_hi;
#else
#error "Unsupported Linux (g)libc version and/or platform"
#endif
----------------------------->8-----------------------

Looks like this library relies on some symbols that are not supported in some tools or
even architectures.

So we need either add missing parts in both libc and libpthsem for arches we're
interested in or disable libpthsem for some arches.

I would assume that the best approach is to define __jump_buf structure
with meaningful members like __pc and __sp for example in the same way as MIPS guys did,
see http://git.uclibc.org/uClibc/tree/libc/sysdeps/linux/mips/bits/setjmp.h#n34

-Alexey
