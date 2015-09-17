From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 17 Sep 2015 18:29:12 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting
 SSP under uclibc-ng
In-Reply-To: <20150917191421.53dd3542@free-electrons.com>
References: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
 <20150917191421.53dd3542@free-electrons.com>
Message-ID: <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> The problem is seen with uclibc-ng 1.0.6 (and likely greater) where they
>> updated the __GLIBC_MINOR__ value to 10. It will be seen in any libc
>> that permits stack protection to be disabled while exporting a glibc
>> version >= 2.4.
>
> Cc'ing Waldemar here. It's an interesting consequence of bumping the
> GLIBC_MINOR version exposed by uClibc, which happened recently to solve
> an eventfd_read() problem in Boost on ARC, investigated by Alexey (also
> in Cc).

Yup, that's exactly what has exposed the problem. And the "problem" is
really a deficiency in the way GCC detects SSP support in the libc.

> Exporting that globally is really horrible.

Yeah I knew that exporting it globally was not going to fly - I just
submitted it as a starting point for discussion how to solve this.

> I think the appropriate fix
> is probably to teach gcc about uClibc, like we're doing for musl already
> (http://git.buildroot.net/buildroot/tree/package/gcc/4.9.3/900-musl-support.patch#n452).
> So we could do a check here like:
>
>  *uclibc*)
>         test if __UCLIBC_HAS_SSP__ is defined or not. If yes -> we have
>         SSP, if not -> we don't have SSP.
>
> And contribute that to upstream gcc.
>
> What do you think?

It is up to you. My only quibble would be that layering another patch
in this area (where there are already patches adding stuff as you
noted) might get a bit fiddly. Are we okay with patches being
order-dependent ? This does mean that they're not so easy to submit
upstream ..

Aside from that .. GCC actually already has a block which checks
UCLIBC_HAS_SSP. The problem is that it reaches it only if the glibc
version check returns that the version is 2.3 or lower. The fix might
simply be to reorder the check.

I'm curious why GCC have done this rather than doing a check for the
__stack_chk symbols. Would be interested in hearing from Alexey and
Waldemar.

Brendan
