From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 11:19:32 +0200
Subject: [Buildroot] ext-toolchain-wrapper issues
In-Reply-To: <CAE9DZUSdA9fgHZjgNu3bY8Ue4d6V+4o0USbR6_dcOPsCAfxgiQ@mail.gmail.com>
References: <CAE9DZUSdA9fgHZjgNu3bY8Ue4d6V+4o0USbR6_dcOPsCAfxgiQ@mail.gmail.com>
Message-ID: <20120804111932.6e0f0481@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 3 Aug 2012 12:21:06 -0500,
Dallas Clement <dallas.a.clement@gmail.com> a ?crit :

> I have been having trouble booting a uImage on my armada-xp
> development board.

Interesting, I'm also working around the Armada 370 and Armada XP. What
are you doing with this platform?

> I am building with an external toolchain.  When
> building the linux kernel via buildroot, the supported machine types
> were all garbled, and the kernel would not boot.

The Armada XP support in mainline doesn't need machine type, it uses
the device tree.

> # ls -l output/host/usr/bin
> lrwxrwxrwx 1 dallasc dallasc     21 Aug  2 15:53
> arm-marvell-linux-gnueabi-gcc -> ext-toolchain-wrapper
> 
> # rm arm-marvell-linux-gnueabi-gcc
> 
> # ln
> -s /opt/armada-sdk-5.0/armv7-marvell-linux-gnueabi-softfp/bin/arm-marvell-linux-gnueabi-gcc
> arm-marvell-linux-gnueabi-gcc

Is this Marvell toolchain available somewhere so I can try to reproduce
the problem?

> Lo and behold, after rebuilding the kernel, it booted just fine.
> Clearly there is some difference in the compiler options when relying
> on ext-toolchain-wrapper that is leading to trouble.
> 
> Apart from tweaking the links as I have done, is there a way to
> disable the use of ext-toolchain-wrapper?  I think I'll be fine
> without it.

No, the correct way is to use the ext-toolchain-wrapper, because it
ensures that the right --sysroot option is passed, as well as a few
other important compiler options. The right solution is to find out
which option is causing problem, and understand why.

You can modify ext-toolchain-wrapper.c to progressively remove some
option that it passes to the compiler to see which one is problematic.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
