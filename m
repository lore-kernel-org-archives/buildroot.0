From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 14 Nov 2013 08:53:42 +0000
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <20131113223646.66a7a61b@skate>
References: <20131113223646.66a7a61b@skate>
Message-ID: <CAHt8ZCOb3Vy4JLpbP88hK7o9t2CfT8_V=_ytfx2_E1uko+UL4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 13 November 2013 21:36, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I've tried to build an AVR32 toolchain with 2013.11-rc1, with the
> following defconfig:
>
> BR2_avr32=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_INIT_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> # BR2_TARGET_ROOTFS_TAR is not set
>
> and the build failed with:
>
> In file included from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/kernel.h:4,
>                  from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/netlink.h:4,
>                  from /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/rtnetlink.h:5,
>                  from libc/inet/netlinkaccess.h:27,
>                  from libc/inet/if_index.c:36:
> /opt/br-avr32-full-2013.11-rc1/usr/avr32-buildroot-linux-uclibc/sysroot/usr/include/linux/sysinfo.h:8: error: expected specifier-qualifier-list before '__kernel_long_t'
> make[1]: *** [libc/inet/if_index.os] Error 1
> make[1]: Leaving directory `/opt/toolchain-build/build/uclibc-0.9.31.1'

Yes, using your defconfig the build fails for me too. For my avr32
projects, I'm using 3.4.x kernel and headers. The offending commit

  http://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/commit/?id=ccdfcc398594

appears not to have been back-ported to the 3.4.x series.

> It is apparently reported at:
>
>   https://lkml.org/lkml/2013/5/18/1
>
> However, I've also built several other toolchains with the same
> Buildroot version and haven't had any problem.

That's odd. I wonder if your other toolchains are using older kernel headers?

I'm not sure what the right fix is for this. Do you have any suggestions?

Simon.
