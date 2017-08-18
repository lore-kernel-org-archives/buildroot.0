From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 18 Aug 2017 12:54:19 +0200
Subject: [Buildroot] mips: nan2008 require kernel headers 4.5.x
In-Reply-To: <38121FAB319C3344930C920E7B518313888D0F57@hhmail02.hh.imgtec.org>
References: <2f4c0a2a-ffeb-9a1c-ebe4-d5eaf50f3154@gmail.com>
 <38121FAB319C3344930C920E7B518313888D0F57@hhmail02.hh.imgtec.org>
Message-ID: <837cf48e-f422-30c8-8115-6988eb865906@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

Le 17/08/2017 ? 23:20, Vincent Olivert Riera a ?crit :
> Hi Romain,
> 
> I'm currently on holidays in Japan until the 23rd. I can have a look when I get back.

Ok, thanks!
Have a good time :)

Thomas replied on IRC:
(23:16:16) kos_tom: Kubu: I know about this dependency
(23:16:54) kos_tom: Kubu: we build our stable toolchains with 3.10
(23:17:08) kos_tom: Kubu: except the mips32r5 toolchain that we build with
kernel headers 4.9, see
https://github.com/free-electrons/toolchains-builder/blob/master/configs/optionals/mips32r5el-glibc-stable.config

There is the same issue for mips32r5el and mips64r6el.

Actually it's not only mips, if you search "arch_minimum_kernel" in the glibc
source code, you'll find few arch that require kernel header > 3.2

aarch64: kernel headers >= 3.7 (already handled in Buildroot)
sysdeps/unix/sysv/linux/aarch64/configure.ac:arch_minimum_kernel=3.7.0

ia64: kernel headers >= 3.2.18 (not supported in Buildroot)
sysdeps/unix/sysv/linux/ia64/configure.ac:arch_minimum_kernel=3.2.18

mips with nan2008
sysdeps/unix/sysv/linux/mips/configure.ac:if test -z "$arch_minimum_kernel"; then
sysdeps/unix/sysv/linux/mips/configure.ac:    arch_minimum_kernel=4.5.0

nios2: kernel headers >= 3.19 (already handled in Buildroot)
sysdeps/unix/sysv/linux/nios2/configure.ac:arch_minimum_kernel=3.19.0

powerpc64el: kernel headers >= 3.10 since glibc 2.26
sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac:  ],
arch_minimum_kernel=3.10.0, libc_cv_ppc64_le=no)])

https://sourceware.org/git/?p=glibc.git;a=commit;h=c2ff5ec13fca1bdd1cd646a0260808386d7bd7ff

ia64: kernel headers >= 3.4.0 (not supported in Buildroot)
sysdeps/unix/sysv/linux/x86_64/x32/configure.ac:arch_minimum_kernel=3.4.0

How to handle mips and powerpc64el kernel header dependency for glibc toolchains
properly?

Maybe we can just don't allow building a mips toolchain with kernel headers <
4.5.0 and do the same for powerpc64el toolchains with kernel headers < 3.10.0 ?

Start dropping too old kernel headers choice for internal toolchains ?

Best regards,
Romain
> 
> Regards,
> 
> Vincent
> ________________________________________
> From: Romain Naour [romain.naour at gmail.com]
> Sent: 17 August 2017 20:12
> To: Vincent Olivert Riera
> Cc: Thomas Petazzoni; Arnout Vandecappelle; Peter Korsgaard
> Subject: mips: nan2008 require kernel headers 4.5.x
> 
> Hi Vincente,
> 
> There is a dependency issue on mips with glibc based toolchains when
> BR2_MIPS_NAN_2008 is enabled, glibc require kernel headers 4.5.x not 3.2.x.
> 
> defconfig:
> BR2_mips64el=y
> BR2_mips_64r5=y
> BR2_MIPS_NABI64=y
> # BR2_MIPS_SOFT_FLOAT is not set
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_KERNEL_HEADERS_3_10=y
> BR2_BINUTILS_VERSION_2_27_X=y
> BR2_GCC_VERSION_5_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> 
> I tied to add a new dependency on BR2_MIPS_NAN_2008 to
> BR2_TOOLCHAIN_BUILDROOT_GLIBC but I got a recursive dependency.
> 
> Can you have a look?
> 
> Best regards,
> Romain
> 
