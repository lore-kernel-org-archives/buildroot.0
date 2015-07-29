From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 29 Jul 2015 20:53:44 +0100
Subject: [Buildroot] libpthsem can of worms - RFC
Message-ID: <CA+BsyQ7kPZJeO0Th=nAjGfm2SOY+LZOyTF2_N9b7nDxgBVgS=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I was looking at the libpthsem autobuild issue. It looks at first
glance like a musl problem, but closer examination shows arch-specific
issues. I wanted to go through this first before submitting a patch.

libpthsem is a library that implements threading/locks/etc in
userspace. However, according to the maintainer's home page
(http://www.auto.tuwien.ac.at/~mkoegler/index.php/pth) it is "no
longer maintained and is archived for reference purposes". The last
release was in February 2010, and before that, April 2006.

The compilation issue comes up in a function something that looks
rather architecture-specific. Here's the offending code.

===============================

intern int pth_mctx_set(
    pth_mctx_t *mctx, void (*func)(void), char *sk_addr_lo, char *sk_addr_hi)
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

===============================

I think this is something to do with saving the register frame onto
the stack. In plain English, (ignoring the version-specific aspect),
if JB_PC and JB_SP are not defined, then they implement a workaround
for i386 or 68K; failing that, we bomb out.

A quick grep of GLIBC shows that JB_PC and JB_SP
(https://sourceware.org/git/?p=glibc.git&a=search&h=HEAD&st=grep&s=JB_PC)
are defined only for i386, x86_64, alpha, sparc32 and tile. Any other
arch will fail (autobuild is failing for aarch64,  mipsel and arm,
appropriately enough). It won't work on musl either, but that's not
the issue we're seeing.

I guess initially we can fix it in buildroot so that this package will
only build on the architectures that define JB_PC and JB_SP (don't
need to care about 68k). That will solve the autobuild problems. It
will also lead to similar restrictions on the dependent packages.
These are :

bcusdk (last release 2011 - 1 message/month on mailing list, usually spam)
gnupg2 (last release Jul 2015 - this is active)
linknx (last release Aug 2013)

Comments on the best approach welcome - my own feeling is that
restricting the architectures is quick and easy unless a maintainer
wishes to speak up.

regards

Brendan
