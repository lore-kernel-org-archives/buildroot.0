From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 22:20:21 +0200
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting
 SSP under uclibc-ng
In-Reply-To: <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
References: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
 <20150917191421.53dd3542@free-electrons.com>
 <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
Message-ID: <20150917222021.4096b754@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Thu, 17 Sep 2015 18:29:12 +0100, Brendan Heading wrote:

> > Cc'ing Waldemar here. It's an interesting consequence of bumping the
> > GLIBC_MINOR version exposed by uClibc, which happened recently to solve
> > an eventfd_read() problem in Boost on ARC, investigated by Alexey (also
> > in Cc).
> 
> Yup, that's exactly what has exposed the problem. And the "problem" is
> really a deficiency in the way GCC detects SSP support in the libc.

Correct.

> > Exporting that globally is really horrible.
> 
> Yeah I knew that exporting it globally was not going to fly - I just
> submitted it as a starting point for discussion how to solve this.

Sure, no problem with that. It's already much appreciated that you did
all this investigation.

> > I think the appropriate fix
> > is probably to teach gcc about uClibc, like we're doing for musl already
> > (http://git.buildroot.net/buildroot/tree/package/gcc/4.9.3/900-musl-support.patch#n452).
> > So we could do a check here like:
> >
> >  *uclibc*)
> >         test if __UCLIBC_HAS_SSP__ is defined or not. If yes -> we have
> >         SSP, if not -> we don't have SSP.
> >
> > And contribute that to upstream gcc.
> >
> > What do you think?
> 
> It is up to you. My only quibble would be that layering another patch
> in this area (where there are already patches adding stuff as you
> noted) might get a bit fiddly. Are we okay with patches being
> order-dependent ? This does mean that they're not so easy to submit
> upstream ..

We are fine with patches being order-dependent. That's fine we have a
sequence number for all patches in the first place.

So far, the effort to push upstream our gcc patches has been very
limited. It would be good to push some of them upstream, but in the
mean time, our stack of gcc patches is not that big, and is not causing
too many problems when bumping gcc.

> Aside from that .. GCC actually already has a block which checks
> UCLIBC_HAS_SSP. The problem is that it reaches it only if the glibc
> version check returns that the version is 2.3 or lower. The fix might
> simply be to reorder the check.

If it's that simple, then it should be done :) In any case, version
based tests are often not a good idea, so when uClibc is used, gcc
should really rely on UCLIBC_HAS_SSP.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
