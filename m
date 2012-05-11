From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 May 2012 20:11:18 -0300
Subject: [Buildroot] [PATCH 3/5] Added the libpth package.
In-Reply-To: <4FAD981E.70805@mind.be>
References: <1336598986-9518-1-git-send-email-stijn.souffriau@essensium.com>
 <1336598986-9518-3-git-send-email-stijn.souffriau@essensium.com>
 <bd5a8085a62f24270632bd39c1a861dc@zacarias.com.ar> <4FAD981E.70805@mind.be>
Message-ID: <ab34b830ae8a23ad14e4c36eb3ab6574@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-05-11 19:52, Arnout Vandecappelle wrote:

>> depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc 
>> || BR2_TOOLCHAIN_CTNG_eglibc
>> pth doesn't work with uClibc...
>
>  Why do you say that?  I've just tried it with a default
> uClibc-0.9.33.1 config
> on i486 and the pth tests run fine.
>
>  It probably won't work on NOMMU, however: I see some fork calls in
> there that
> are not configured out.
>
>  Regards,
>  Arnout

Because it only works for i386 uclibc, see pth_mctx.c lines 464-485, 
snip:

*****
intern int pth_mctx_set(
     pth_mctx_t *mctx, void (*func)(void), char *sk_addr_lo, char 
*sk_addr_hi)
{
     pth_mctx_save(mctx);
#if defined(__GLIBC__) && defined(__GLIBC_MINOR__) \
     && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 0 && defined(JB_PC) && 
defined(JB_SP)
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
     sigemptyset(&mctx->sigs);
     mctx->error = 0;
     return TRUE;
}
*****

Regards.
