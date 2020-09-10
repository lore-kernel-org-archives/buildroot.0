From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 10 Sep 2020 09:43:21 -0500
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <20200910120536.2431494d@windsurf.hq.k.grp>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
Message-ID: <CANQCQparV9FCnOCT=arB7zK0rvhWN4n6tJXTcLLNpZjCJfHcaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 10, 2020 at 5:06 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
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
>
> ARC
> ===
>
> All configurations are failing
>
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359481
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359482
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359483
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359484
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359485
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359487
>
> Issue is caused by the recent version of gdb, where gdbserver has been
> moved from gdb/gdbserver/ to gdbserver/. However, the story is not so
> simple: you can't simply go in gdbserver/ and run ./configure from it,
> that doesn't work anymore.
>
> ARMv7-M
> =======
>
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359529
>
> Build failures while building afboot-stm32, most likely due to gcc
> 10.x emitting calls to memcpy().
>
> Fixed by:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20200910094608.1251382-1-thomas.petazzoni at bootlin.com/
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
>
> PowerPC64 (big and little endian) Power 8
> =========================================
>
> Both the glibc stable and bleeding edge are failing to build libstdc++
> in host-gcc-final. Interesingly, the musl configurations work fine.
>
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359625
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359626
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359621
> - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622

Checking out 2020.08 and using the following config from the CI job.
BR2_powerpc64le=y
BR2_powerpc_power8=y
BR2_KERNEL_HEADERS_4_9=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_PACKAGE_HOST_GDB=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GDB=y
# BR2_TARGET_ROOTFS_TAR is not set

I see this error:
../../../libgfortran/libgfortran.h:61:12: fatal error:
quadmath_weak.h: No such file or directory

I did notice that if I did a basic build below using current defaults,
it doesn't fail.
BR2_powerpc64=y
BR2_powerpc_power8=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_TARGET_ROOTFS_TAR is not set

I'll do some analysis between the builds

Best Regards,
Matt
