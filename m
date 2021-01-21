From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:35:31 +0100
Subject: [Buildroot] [PATCH 1/2] configs/qemu_*: bump kernel version to
 5.10.7
In-Reply-To: <20210120195954.31797-1-geoffrey.legourrierec@gmail.com>
References: <20210120195954.31797-1-geoffrey.legourrierec@gmail.com>
Message-ID: <20210121223531.1bb899e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Jan 2021 20:59:53 +0100
Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com> wrote:

> Bump most QEMU defconfigs (every one that was previously on 5.4.y)
> to latest longterm kernel 5.10.7.
> 
> Please note the following exceptions/modifications:
> - board/qemu/qemu_s390x_defconfig: ignored (already up to date)
> - board/qemu/sh4*-r2d:
>     - Remove the remaining kernel patch [1] provided by Alan Modra
>       fixing rodata alignment, carried here by Romain Naour [2] to
>       fix an issue preventing kernel from booting with binutils 2.23.
>       Patch is present in upstream Linux now.
>     - Fix compile-time error regarding 64-bit time data structures
>       from kernel headers when building with uclibc. Previous fix [3]
>       existed upstream; but see details below.
>     - board/qemu/ppc-mpc8544ds: Updated kernel patch
> - board/qemu/arm-versatile: Updated kernel patch
> - board/qemu/mips*r6*: Updated kernel patch
> 
> Tested on all configs/qemu* configurations. [4]
> 
> [1] https://www.sourceware.org/ml/binutils/2019-12/msg00112.html
> [2] https://git.busybox.net/buildroot/commit/?id=a2331c8a61bdd71c47492efc818fb0458a349219
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc94cf2092c7c1267fa2deb8388d624f50eba808
> [4] https://gitlab.com/clumsyape/buildroot/-/pipelines/244024195
> 
> Signed-off-by: Geoffrey Le Gourri?rec <geoffrey.legourrierec@gmail.com>

Thanks, series applied!


>  ....h-and-not-time_types.h-in-sockios.h.patch | 76 +++++++++++++++++++
>  ....h-and-not-time_types.h-in-sockios.h.patch | 76 +++++++++++++++++++

I am not a huge fan of those linux-headers patches buried deep into
defconfig-specific locations. Indeed, I just tried today to build a SH4
toolchain... and fell precisely into those problems, and your patch is
not going to fix them.

What about having the patches in package/linux-headers/ for the few
linux headers versions that we officially support ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
