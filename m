From: Christian Stewart <christian@paral.in>
Date: Sun, 15 Jul 2018 12:26:17 -0700
Subject: [Buildroot] [PATCH v3 1/6] tini: new package
In-Reply-To: <20180715160129.GF2516@scaer>
References: <20180715010732.21765-1-christian@paral.in>
 <20180715010732.21765-7-christian@paral.in>
 <20180715160129.GF2516@scaer>
Message-ID: <CA+h8R2oxXWWnPT8dnn0Bt4UL=JA8SGjDg3vCyZNNchrPCaWJ+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On Sun, Jul 15, 2018 at 9:01 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Since you want to do a static build (which I questioned in my previous
> reply), you should depend on static libs being actually available,
> i.e.:
>
>     depends on !BR2_SHARED_LIBS # Static build



I went over this with Thomas before the last time I tried to merge a
similar series.

Here are the relevant bits:

> The next issue is that your package assumes that static linking is
> possible. But Buildroot defaults to BR2_SHARED_LIBS, which means that
> the toolchain may not necessarily provide libc.a and allow static
> linking.

I'm able to compile with BR2_SHARED_LIBS and still produce a static
output with -static. Why is this possible? I remember seeing an email
about this at some point, where it was stated that glibc.a or so was not
produced with BR2_SHARED_LIBS. Why can I then compile this package in
this way?

> Alternatively, you could decide to build dumb-init statically only
> if !BR2_SHARED_LIBS, but that means that in the default Buildroot
> configurations, dumb-init would be linked dynamically.

This wouldn't work unfortunately in 95% of the intended cases where
dumb-init would be used. I'm using a shared build for example.

Then, Thomas asks me to test it out:

> Could you try a completely dynamic build with uClibc and musl ?
>
> Something like this:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_SHARED_LIBS=y

>> This wouldn't work unfortunately in 95% of the intended cases where
>> dumb-init would be used.

> Let's see what the above test does. If it's able to build a static
> binary even though BR2_SHARED_LIBS=y, then OK, we're good. Otherwise,
> we'll have to find a different solution.

I completed the test with this defconfig:

BR2_arm=y
BR2_cortex_a8=y
BR2_SHARED_LIBS=y
BR2_PACKAGE_DUMB_INIT=y

The build passed.

To me, the logic goes, if you're doing a static build, you can't build a
shared binary. If you're doing a shared build, you can always build a
static binary. Is this not the case?

Either way, this part of the series is not important. I'm happy to respin
it with just the docker-cli and docker-engine split (caused originally by
trying to upgrade docker-engine).

Best,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180715/1af0f249/attachment.html>
