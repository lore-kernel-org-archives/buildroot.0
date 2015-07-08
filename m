From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 8 Jul 2015 14:48:06 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-06-28
In-Reply-To: <20150708163639.44ba74d5@free-electrons.com>
References: <20150629063017.4326F10013E@stock.ovh.net>
 <1436194278.3246.42.camel@synopsys.com>
 <20150706174356.6d6471c9@free-electrons.com>
 <1436357726.3043.10.camel@synopsys.com>
 <20150708142953.7c615412@free-electrons.com>
 <1436366016.3043.22.camel@synopsys.com>
 <20150708163639.44ba74d5@free-electrons.com>
Message-ID: <1436366885.3043.31.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-07-08 at 16:36 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 8 Jul 2015 14:33:36 +0000, Alexey Brodkin wrote:
> 
> > Ok I now see the difference.
> > 
> > [1] Toolchain that builds "empty" successfully is based on uClibc-0.9.33.2
> > which simply doesn't have "uClibc_posix_opt.h" where _POSIX_SEMAPHORES
> > is undefed in more recent versions of uClibc be it uClibc-ng or up to date uClibc
> > (tip of upstream uClibc's master branch in case of ARC).
> > 
> > See commit that happened 1 month after 0.9.33.2 was cut:
> > http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux/common/bits/uClibc_posix_opt.h?id=2389017f787dd51e11e697c4480
> > 71ec
> > dd217169a
> > 
> > In that commit "uClibc_posix_opt.h" was introduced and since then "empty"
> > won't built without threads.
> > 
> > Mystery solved? :)
> 
> Thanks for the investigation!
> 
> To conclude, I think marking the empty package as not available when
> thread support is not there is probably the easiest/simplest solution.
> What do you think?

I'd agree with that point, i.e. making "empty" dependent on threads support in toolchain
is the simplest approach for us.

But what bothers me a little bit I am frankly not completely sure if "empty" really needs
threads. Actually it forks a brand new process instead of creating new (p)thread.

And then semaphores are used for IPC between processes.

So if uClibc requires pthread library for implementation of semaphores, then "empty"
is really dependent on threads. And from the first glance I'd say that's the case.

Otherwise we may simply patch "empty".

Adding Waldemar who might comment on that.

-Alexey
