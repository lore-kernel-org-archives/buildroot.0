From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Nov 2013 16:42:56 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-08
In-Reply-To: <CAFbHwiQn4A9bBVNqJZwJyfNZsurx618CtUpENAZ3ATis62qNyQ@mail.gmail.com>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <CAFbHwiQn4A9bBVNqJZwJyfNZsurx618CtUpENAZ3ATis62qNyQ@mail.gmail.com>
Message-ID: <20131109164256.6bd02bbd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Newton,

On Sat, 9 Nov 2013 14:53:00 +0000, Will Newton wrote:

> >        arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/983828bd27a521020e42e58cce9393e6b8d23502/
> 
> Hi Thomas,
> 
> Do you know what is going on with the binary arm toolchain above? It
> looks like the toolchain is configured wrongly, it also has "linaro"
> and "uclibc" in the tarball name which is a strange combination. ;-)

It has both uclibc and Linaro in the tarball name because this
toolchain uses gcc-linaro, but the uClibc library. So having both in
the same tarball name makes sense in this situation :-)

Regarding the toolchain, it is indeed funky. The compiler was built
with --with-float=hard, so it should be EABIhf, but the corresponding
Buildroot configuration was declaring it as being EABI.

However, switching to EABIhf in the Buildroot configuration doesn't
work either: Buildroot checks whether the crt1.o of the toolchain is
indeed built hard-float as a way of verifying that the toolchain is
indeed EABIhf. And it turns out that it's not the case for this
toolchain.

Moreover, while it was built --with-float=hard, the tuple contains
gnueabi and not gnueabihf. I guess this is all due to the fact that
this toolchain was built with the old 1.15.2 Crosstool-NG, and it's
probably time to update my ct-ng toolchains.

For the timing being, I've simply removed this toolchain from the
autobuilders.

Thanks for the report!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
