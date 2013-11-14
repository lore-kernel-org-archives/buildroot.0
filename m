From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Nov 2013 10:10:18 +0100
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAHt8ZCOb3Vy4JLpbP88hK7o9t2CfT8_V=_ytfx2_E1uko+UL4g@mail.gmail.com>
References: <20131113223646.66a7a61b@skate>
 <CAHt8ZCOb3Vy4JLpbP88hK7o9t2CfT8_V=_ytfx2_E1uko+UL4g@mail.gmail.com>
Message-ID: <20131114101018.4c10ea52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Thu, 14 Nov 2013 08:53:42 +0000, Simon Dawson wrote:

> > In file included from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/kernel.h:4,
> >                  from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/netlink.h:4,
> >                  from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:5,
> >                  from libc/inet/netlinkaccess.h:27,
> >                  from libc/inet/if_index.c:36:
> > /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/sysinfo.h:8: error: expected specifier-qualifier-list before '__kernel_long_t'
> > make[1]: *** [libc/inet/if_index.os] Error 1
> > make[1]: Leaving directory `/opt/toolchain-build/build/uclibc-0.9.31.1'
> 
> Yes, using your defconfig the build fails for me too. For my avr32
> projects, I'm using 3.4.x kernel and headers. The offending commit
> 
>   http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=ccdfcc398594
> 
> appears not to have been back-ported to the 3.4.x series.

Ok.

> > It is apparently reported at:
> >
> >   https://lkml.org/lkml/2013/5/18/1
> >
> > However, I've also built several other toolchains with the same
> > Buildroot version and haven't had any problem.
> 
> That's odd. I wonder if your other toolchains are using older kernel headers?

No, they were all using the 3.12 kernel headers:

$ grep "linux-headers.*Extracting" *2013.11*log
br-arm-basic-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-arm-cortex-a9-bleeding-edge-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-arm-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-arm11-full-nothread-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-avr32-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-i386-pentium4-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-mips64-largefile-basic-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-mipsel-o32-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-powerpc-603e-basic-cpp-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-powerpc-e500mc-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-sh4-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-x86-64-atom-no-rpc-no-ipv6-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting
br-x86-64-core2-full-2013.11-rc1-build.log:>>> linux-headers 3.12 Extracting

and all of them were successful, except:

 * AVR32 (problem exposed above)
 * SH4 (a multilib problem for which I know the cause)

> I'm not sure what the right fix is for this. Do you have any suggestions?

Well, the difference between all of these builds and the AVR32 one is
obviously that AVR32 is using uClibc 0.9.31, right? Seems like uClibc
0.9.33 is not affected by the problem. So I would suggest that a fix is
made to uClibc 0.9.31 to avoid this problem.

Maybe it's just
uclibc-0004-libc-sysdeps-add-__kernel_long-and-__kernel_ulong.patch
from our 0.9.33.2 patch stack that needs to be backported to uClibc
0.9.31 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
