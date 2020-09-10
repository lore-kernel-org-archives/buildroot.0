From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 10 Sep 2020 10:43:57 -0500
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <CANQCQparV9FCnOCT=arB7zK0rvhWN4n6tJXTcLLNpZjCJfHcaQ@mail.gmail.com>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CANQCQparV9FCnOCT=arB7zK0rvhWN4n6tJXTcLLNpZjCJfHcaQ@mail.gmail.com>
Message-ID: <CANQCQpbtpt-_pDFk0oBXiCqXDVfVcUCubBDq7kCdh+vbmWeVdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 10, 2020 at 9:43 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> On Thu, Sep 10, 2020 at 5:06 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > As part of the https://toolchains.bootlin.com project, I've tried to
> > rebuild 175 toolchains on top of Buildroot 2020.08, and encountered a
> > number of failures, which are summarized below.
> >
> > Damien, Alistair: there is an issue with the RISC-V 32-bit toolchain.
> > Could you have a look, and tell us if you have some suggestions?
> >
> > ARC maintainers: all ARC toolchains are failing to build due to the use
> > of a recent gdb where gdbserver was moved to the top-level. However, it
> > doesn't seem to be that easy to build just gdbserver in those recent
> > gcc versions. I have posted a question about this on the gdb@ mailing
> > list: https://sourceware.org/pipermail/gdb/2020-September/048888.html.
> >
> > Matt, there are some PowerPC64 build issues as well. Have you ever seen
> > them, do you have any hints?
> >
[snip]
> > PowerPC64 (big and little endian) Power 8
> > =========================================
> >
> > Both the glibc stable and bleeding edge are failing to build libstdc++
> > in host-gcc-final. Interesingly, the musl configurations work fine.
> >
> > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359625
> > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359626
> > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359621
> > - https://gitlab.com/bootlin/toolchains-builder/-/jobs/729359622
>
> Checking out 2020.08 and using the following config from the CI job.
> BR2_powerpc64le=y
> BR2_powerpc_power8=y
> BR2_KERNEL_HEADERS_4_9=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> BR2_PACKAGE_HOST_GDB=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GDB=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> I see this error:
> ../../../libgfortran/libgfortran.h:61:12: fatal error:
> quadmath_weak.h: No such file or directory
>
> I did notice that if I did a basic build below using current defaults,
> it doesn't fail.
> BR2_powerpc64=y
> BR2_powerpc_power8=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_INIT_NONE=y
> # BR2_TARGET_ROOTFS_TAR is not set

Disregard the successful build above, I forgot to enable fortran.

It looks like the powerpc64 is detecting __float128 and is trying to
use the quadmath library which we disable.  I'll check to see if the
change should be in the libfortran configure stage or what is being
passed to gcc final.

Regards,
Matt
