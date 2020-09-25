From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 25 Sep 2020 11:30:57 +0200
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <20200910120536.2431494d@windsurf.hq.k.grp>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
Message-ID: <75797676-b07f-29dc-1fe2-f6fc402db515@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 10/09/2020 ? 12:05, Thomas Petazzoni a ?crit?:
> Hello,
> 
> As part of the https://toolchains.bootlin.com project, I've tried to
> rebuild 175 toolchains on top of Buildroot 2020.08, and encountered a
> number of failures, which are summarized below.
> 
> Damien, Alistair: there is an issue with the RISC-V 32-bit toolchain.
> Could you have a look, and tell us if you have some suggestions?
> 
> ARC maintainers: all ARC toolchains are failing to build due to the use
> of a recent gdb where gdbserver was moved to the top-level. However, it
> doesn't seem to be that easy to build just gdbserver in those recent
> gcc versions. I have posted a question about this on the gdb@ mailing
> list: https://sourceware.org/pipermail/gdb/2020-September/048888.html.
> 
> Matt, there are some PowerPC64 build issues as well. Have you ever seen
> them, do you have any hints?
> 
> There are also issues on other platforms, AArch64, x86-64, Microblaze, etc.
> 
> See below the full details:
> 
> AArch64
> =======
> 
> - aarch64--musl--stable
>   https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359478
> 
>   build failure while building gdb, with redefinitions of C library
>   structures

This is our usual aarch64 + musl + gdb issue due to the kernel headers < 5.0.
You already fixed it by applying a patch to linux-headers package to a custom
branch in the bootlin repository.

Maybe we should use kernel headers 5.4 for the bleeding-edge toolchain since we
use a kernel 5.4 in the qemu defconfig.
(Is the kernel headers 5.4 too bleeding-edge for bleeding-edge toolchains ? :) )

> 
> Microblaze
> ==========
> 
> All the "bleeding edge" configurations fail to boot under Qemu.
> 
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359536
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359538
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359540
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359542
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359544
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359546

I'm not sure there is a regular Maintainer for Microblaze

For example, last time glibc has been tested on Microblaze
https://sourceware.org/glibc/wiki/Release/2.29#MicroBlaze

https://sourceware.org/glibc/wiki/Release/2.30#MicroBlaze
https://sourceware.org/glibc/wiki/Release/2.31#MicroBlaze
https://sourceware.org/glibc/wiki/Release/2.32#MicroBlaze

I'll to take a look...

> 
> SPARCv8
> =======
> 
> Fortran support related issue:
> 
> /builds/bootlin/toolchains-builder/build/opt/sparcv8--uclibc--stable-2020.08-1/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /builds/bootlin/toolchains-builder/build/opt/sparcv8--uclibc--stable-2020.08-1/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/lib/libgfortran.so: undefined reference to `__sync_bool_compare_and_swap_4'
> collect2: error: ld returned 1 exit status
> 
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359681
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359683
> 
> SPARCv8 doesn't have __sync built-ins of 4 bytes, so probably we
> should not allow Fortran support on SPARCv8 ?

See patch proposal:
http://patchwork.ozlabs.org/project/buildroot/patch/20200925090451.1407258-1-romain.naour at gmail.com/

> 
> x86-64
> ======
> 
> Issue happens only with the uClibc bleeding edge toolchain: it seems
> like it cannot login into the system under Qemu. The login prompt
> appears, but then it doesn't seem to work.
> 
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359690

See:
https://github.com/bootlin/toolchains-builder/pull/36

Best regards,
Romain
