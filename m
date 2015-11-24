From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 24 Nov 2015 12:10:35 +0000
Subject: [Buildroot] Analysis of build results for 2015-11-18
In-Reply-To: <1448053288.2964.12.camel@synopsys.com>
References: <20151119073014.0017E101A9A@stock.ovh.net>
 <20151120001552.51c1b21b@free-electrons.com>
 <1448053288.2964.12.camel@synopsys.com>
Message-ID: <1448367035.6278.18.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, 2015-11-21 at 00:01 +0300, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Fri, 2015-11-20 at 00:15 +0100, Thomas Petazzoni wrote:
> > Hello,
> > 
> > J?r?me, Johan, Bernd, Yann, Martin, Gustavo, R?mi, Samuel, Alexey,
> > Waldemar, Clayton, please read below, there are some interesting issues
> > for you :-) Thanks !

[snip]

> > > arc |              util-linux-2.27.1 | NOK | 
> > > http://autobuild.buildroot.net/results/75960db671807091fe9155aee9e46a6245e32590/
> > 
> > checking for prlimit... no
> > configure: error: flock selected, but required timer_create function not available
> > 
> > Not sure. Alexey ?
> 
> Well I was trying to reproduce that locally but to no avail.
> Indeed I tried to strip everything but "util-linux" from defconfig to save time so
> might be that's the reason of my failed attempt.
> 
> Still google tells me there's a similar issue with MIPSEL, see
> http://autobuild.buildroot.org/results/112/112e8b85783f5aaba42a937a6eb064317615a21b/build-end.log
> 
> So I would assume that's not just ARC. Still I'm going to start building full defconfig
> from failed build and we'll see if I'll be able to trigger that same issue.

Ok I got it reproduced and it looks like another static build problem.
What happens util-linux on configuration step tries to build and example that
uses timer_create() function. That function exists in librt and configuration
utility correctly adds this lib (-lrt).

But timer_create() uses pthreads internally and so for successful linkage "-lpthread"
is required as well (in addition to "-lrt").

I think log below is quite self-explaining:
------------------->8-----------------
configure:18434: checking for timer_create in -lrt
configure:18459: /home/autobuild/instance-1/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc -std=gnu99 -o conftest 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -matomic -Os  -static -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lrt   >&5
/home/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/librt.a(timer_create.os): In
function `timer_create':
timer_create.c:(.text+0x96): undefined reference to `pthread_once'
timer_create.c:(.text+0xc8): undefined reference to `pthread_attr_init'
timer_create.c:(.text+0xec): undefined reference to `pthread_attr_setdetachstate'
timer_create.c:(.text+0x130): undefined reference to `pthread_mutex_lock'
timer_create.c:(.text+0x14a): undefined reference to `pthread_mutex_unlock'
/home/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/librt.a(timer_routines.os): In
function `timer_helper_thread':
timer_routines.c:(.text+0x84): undefined reference to `pthread_mutex_lock'
timer_routines.c:(.text+0xb8): undefined reference to `pthread_create'
timer_routines.c:(.text+0xc6): undefined reference to `pthread_mutex_unlock'
timer_routines.c:(.text+0xd2): undefined reference to `pthread_exit'
/home/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/usr/lib/librt.a(timer_routines.os): In
function `__start_helper_thread':
timer_routines.c:(.text+0x120): undefined reference to `pthread_attr_init'
timer_routines.c:(.text+0x12c): undefined reference to `pthread_attr_setstacksize'
timer_routines.c:(.text+0x166): undefined reference to `pthread_create'
timer_routines.c:(.text+0x18c): undefined reference to `pthread_attr_destroy'
timer_routines.c:(.text+0x19c): undefined reference to `pthread_atfork'
collect2: error: ld returned 1 exit status
------------------->8-----------------

I've got a fix already but first I'd like to upstream my change and apply it
as a true back-port once fix is in upstream.

If we don't have enough time I may post my fix for Buildroot
(these are just 2 additional patches for util-linux) right away.

-Alexey
