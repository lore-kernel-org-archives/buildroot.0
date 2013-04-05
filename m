From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 05 Apr 2013 09:59:35 -0300
Subject: [Buildroot] Quick analysis of the last build failures
In-Reply-To: <20130405141247.67149ee7@skate>
References: <20130405141247.67149ee7@skate>
Message-ID: <515ECAB7.4030105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/2013 09:12 AM, Thomas Petazzoni wrote:

>  * strace on aarch64
>    http://autobuild.buildroot.org/results/cc590a0e830def391a261bd4ef2826acbffac521/build-end.log
> 
>    Quick solution: disable strace on Aarch64.
> 
>    Good solution: bump strace to the latest Git version, which has
>    Aarch64 support. Someone on the list proposed a patch to add it, but
>    it was a backport of only the main patch adding Aarch64 support, and
>    it has been followed by several fixes. Generally speaking, strace
>    4.7 is 11 months old, and there has been numerous commits in the
>    strace code base since 4.7, so maybe we should adopt a Git version
>    until a new strace release is made?

+1 on going git.
It's one of the essential debugging tools, so functionality wins here.

>  * opkg on bfin
>    http://autobuild.buildroot.org/results/bbf41833999b635633e746ff859b11d8b1713e4f/build-end.log
> 
>    opkg needs fork. Probably just disable it on !BR2_USE_MMU.

Ack.

>  * libglib2 on arm with no threads
>    http://autobuild.buildroot.org/results/935bbe4f21917a65105ededd7b37542010eca97d/build-end.log
> 
>    Build failure of libglib2 due to the absence of threads. I'm pretty
>    sure the problem can be fixed by a patch of libglib2.
> 
>    Adding the !BR2_TOOLCHAIN_HAS_THREADS dependency on libglib2 would
>    be a nightmare because libglib2 has gazillions of reverse
>    dependencies.

As i've mentioned earlier on IRC i'm not 100% sure the patch does what
it's supposed to do. It may fix the build but i don't think the
functionality will be equivalenet since it blindly replaces fork() with
vfork() for nommu (which in turn blocks the parent unlike fork, so in
code that don't expect that behaviour the consequences will be unknown).
How much code uses that functionality of glib is another matter, maybe
not that many packages.

>  * libpfm4 on avr32
>    http://autobuild.buildroot.org/results/845681638cd31f65221955a6670791dbac59b618/build-end.log
> 
>    Maybe because avr32 does not have the implementation of the perf
>    system calls? If so, adding depends on !BR2_avr32 should be
>    sufficient, no?

Yup.
I'm on the "kill avr32" side, it's been officially deprecated by Atmel
for the app processors, see
http://www.atmel.com/About/Quality/obsolescence/obsolete_items.aspx?searchText=at32ap
Yesterday was the last day to buy said chips officially, it's just
distribution/dealer stock left now.

>  * berkeleydb on sh2a
>    http://autobuild.buildroot.org/results/ae1ee5c1f702e1449030cab244eb9b74b488e27c/build-end.log
> 
>    Not sure what's going on here. I'm considering dropping the sh2/sh3
>    variants that we have, since I don't think we ever had anyone using
>    Buildroot for those platforms. sh2 support was originally added by
>    me because I started working on a sh2 project, but the Linux support
>    was so horrible that I recommended a different hardware platform to
>    the customer. So in the end, I don't care about sh2.
> 
>    Thoughts?

/usr/src/linux/arch/sh/configs $ grep SH72 * (CPU_SUBTYPE_SH72* aka SH2*
cores, see http://www.renesas.com/products/mpumcu/superh/index.jsp)
Gives: rsk7201, rsk7203, rsk7264, rsk7269 and se7206 defconfigs.
The RSKs are Renesas Starter Kits.
The SE7206 is from the "Hitachi SolutionEngine" line of products (pre
Renesas merge), sounds pretty much like another development kit since
there are various with different processors.
There doesn't seem to be any third party board upstream with sh2 support.
And most of the "new" chips are microcontrollers - no external memory,
won't run linux.
So i'll add my +1 to removing sh2 support.

Regards.
