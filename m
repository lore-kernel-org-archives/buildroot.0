From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Aug 2013 00:06:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-08-16
In-Reply-To: <20130818200133.4046034b@skate>
References: <20130817063005.A69FB52C5D6@lolut.humanoidz.org>
 <20130818200133.4046034b@skate>
Message-ID: <20130819220644.GA3595@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-08-18 20:01 +0200, Thomas Petazzoni spake thusly:
> On Sat, 17 Aug 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:
> 
> >        arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/40f3be947e5d686bb4e016db1b3bf59503237e62/
> >        arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/ad9d92bef3655ca279bfd6184dca0457ee6c94a0/
> 
> Could you have a look at those two? In commit
> 29b071077f66de1d9a257e7c5c6983dcce1fc65d, you've added "depends on" to
> make sure libbsd only gets built on architectures that provide a.out.h.
> However, here, we are on ARM, and apparently, a.out.h is not available.

This Buildroot .config uses Linux 3.10.7 for the headers.

Support for a.out on ARM has been removed in acfdd4b, but this is
scheduled for 3.11. 3.10 still had support for a.out.

Currently the only archs that still have support for a.out in Linux
are: um, m68k, x86 and alpha. Of those, only x86 is meaningfull to
Buildroot.

So, I think I won't even try to fix this, and simply depend on
i386 || x86_64.

As far as I am concerned, I use it in my qemu-on-target patchset, and I
only expect to run this on x86_64 anyway.

We could patch-away the single user of a.out: src/nlist.c .
It seems it would be relatively easy to remove a.out support from
nlist.c, since there is conditional code guarded by:
    #ifdef  _NLIST_DO_AOUT
    blabla
    #endif

which is defined by:
    #if !defined(__NO_A_OUT_SUPPORT)
    #define _NLIST_DO_AOUT
    #endif

But nothing sets __NO_A_OUT_SUPPORT.

The only thing that is properly guarded by _NLIST_DO_AOUT is the
inclusion of a.out.h, but is easy to do.

So, maybe we should pass __NO_A_OUT_SUPPORT in CPPFLAGS to ./configure

Is it really important that this be buildable on !x86 at all?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
