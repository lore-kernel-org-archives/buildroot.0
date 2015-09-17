From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 17 Sep 2015 22:10:23 +0000
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting
 SSP under uclibc-ng
In-Reply-To: <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
References: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
 <20150917191421.53dd3542@free-electrons.com>
 <CA+BsyQ7RqCVPi6h9VUJpdQ49pVZwLnCGzRtL+wN1JUhs+T7_WA@mail.gmail.com>
Message-ID: <1442527823.17912.40.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brendan,

On Thu, 2015-09-17 at 18:29 +0100, Brendan Heading wrote:
The problem is seen with uclibc-ng 1.0.6 (and likely greater) where they
> > > updated the __GLIBC_MINOR__ value to 10. It will be seen in any libc
> > > that permits stack protection to be disabled while exporting a glibc
> > > version >= 2.4.
> > 
> > Cc'ing Waldemar here. It's an interesting consequence of bumping the
> > GLIBC_MINOR version exposed by uClibc, which happened recently to solve
> > an eventfd_read() problem in Boost on ARC, investigated by Alexey (also
> > in Cc).
> 
> Yup, that's exactly what has exposed the problem. And the "problem" is
> really a deficiency in the way GCC detects SSP support in the libc.

Well I expected new issues to show up after that change but I'm surprised
it's the first one reported - so IMHO we're dealing quite well.

As for the nature of that new problem I'd say it's also expected.
Because I see people use glibc version to determine which feature
or set of features could be used. And IMHO that's not very correct
especially compared to checking each particular feature via compilation.

And frankly I was not very happy with that blind bump of GLIBC_MINOR
from one magical version (I was not able to find any justification why
it was the value it was) to another not justified also... just in attempt
to pretend we're now covering more things in uClibc. But it was low
hanging fruit and so we decided to go that way instead of fixing
affected projects... which in its turn could be not that easy as
patch submission in either uClibc or Buildroot :)

> __stack_chk symbols. Would be interested in hearing from Alexey and
> Waldemar

I think I'll vote for GCC patch as well. So there will be a check for
__UCLIBC_HAS_SSP__ regardless that GLIBC_MINOR value.

-Alexey
