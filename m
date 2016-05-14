From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 12:02:11 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514154655.57ae0bad@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
Message-ID: <57373DF3.5070509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/05/16 10:46, Thomas Petazzoni wrote:


>>       powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/a2bb339864bdfd2ddfd2ec487d9c3cb3181ce9ca/
>
> Gustavo, this is the same issue as the one we add with the old
> CodeSourcery toolchain, but this time with a Crosstool-NG toolchain
> that uses gcc 4.7. What is so special with blktrace that it causes such
> issues?

This toolchain must also die, since it's glibc-based we can assume it's 
bad for SPE (likely eglibc). And blktrace needs glibc/musl, hence for 
SPE it's a no go in the end (i believe Rich was looking into SPE support 
for musl, but will probably go for soft-float given the kind of broken FPU).
That being said, i think this is an old gcc bug, however i'm failing to 
find the exact details.

>>           arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/dab91372b7bfde57796a7e3de7e823dc44adfb76/
>
> cairo-gl.h:130:21: fatal error: EGL/egl.h: No such file or directory
>   #include <EGL/egl.h>
>
> Gustavo, Bernd ?

It's mali-t76x's fault, since the package only installs binaries it 
depends on mesa3d-headers for the headers, but in fact it doesn't, so 
cairo builds before it.
Patch sent.

>> microblazeel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/602f1b40d1c369bb7eef24216264e0e41837518e/
>>           arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/bf6e4d55b3ff069c8efd72721a65af2c30e5b6f4/
>
> There's a dependency error on iptables. Gustavo, could you have a look?

This is the big iptables/netfilter header debacle from 4.5.x, i can't 
stress how much this thing will linger into future breakage.
It will need some preprocessor hacky fix, or disabling iptables support 
which wouldn't be too nice (even if it's for 4.5).

>>          i686 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/3eb32c19f90a5fd8d45a0c36676e015e8278a469/
>
>    CCLD     event-debug
> ../src/.libs/libinput.so: undefined reference to `static_assert'
>
> Baruch, you recently looked at libinput, could you investigate this
> build failure?

static_assert() needs "modern" C11 support, and the feature isn't 
checked for in configure, that's the problem.
Quickie fix could be an #ifdef since it's basically a build check.

>>         sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/c77e763817657b251213a7ce1e52513b3233e9cd/
>>           arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/88c34347cb4d0f33221415f00426be3dc4223d3b/
>>       powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/cc4b52b5a222cad30c369be493d918916df3ec70/
>>      mips64el |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/011c74cce1ca77fe4c7880226f43ef6e5bc6aadc/
>>           arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/663da681c22a3c913de174b6b80341e2f8e6ca33/
>>         sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/74787def01b321f7b9c6736c6871f8558d23b1ab/
>
> Gustavo, you added mpv recently, could you look into those issues?

Most of these are lack of xsi math in the buildroot toolchains which 
need to get updated.
The only exception is sparc that lacks atomics and thus needs a fix.

>>          bfin |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/b4e469a72a746c05ace172798771cfcd081ea473/
>
> process.c: In function 'rb_spawn_process':
> process.c:3928: warning: passing argument 2 of 'rb_ary_new_from_values' from incompatible pointer type
> process.c:3930: error: 'status' undeclared (first use in this function)
> process.c:3930: error: (Each undeclared identifier is reported only once
> process.c:3930: error: for each function it appears in.)
>
> Gustavo? This seems like a recent regression, I remember being able to
> build ruby on bfin some time ago.

It seems so, i'll take a look since it's supposed to work for nommu.

>>          bfin |                 sg3_utils-1.42 | NOK | http://autobuild.buildroot.net/results/31447787e70cd351ce01b7a49ba029758d0c68e5/
>
> Static linking or weird bfin prefix issue. If it's Blackfin related, I
> would suggest to make this package unavailable on Blackfin.

Yes, bfin with SAS/SATA storage is pretty unlikely, so blacklisted.
It's the usual weird symbol prefixing prefixing problem for bfin flat, 
so if anyone is inclined to fix then it's welcome, though it's an 
unlikely scenario since blackfin lacks storage ports compatible with 
sg3_utils (sas, sata, scsi).

>>      mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/293b9ff94c5e28802f3112eb764b62226aee8bea/
>>      mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/b940f2faa567229dd9fd30041430ed3eea96e297/
>
> Vicente, Gustavo, I am not sure to whom of you this falls. It doesn't
> seem to be architecture related, but only happened on mips64el. Could
> you have a look?

It's consistent for certain combinations of mips, so i defer to Vicente 
(i believe again!) on this.
Always R6 ISA, little endian, external toolchain it seems.

I'll look at the musl build issues but make no promises.
Regards.
