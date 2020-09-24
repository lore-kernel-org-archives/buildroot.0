From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Sep 2020 20:47:07 +0200
Subject: [Buildroot] Toolchain issues on multiple architectures
In-Reply-To: <CAKmqyKMuzcbZ0ZhMdmgYxRnxkLT0z9+-3Vb==sdc2miHKvF7YA@mail.gmail.com>
References: <20200910120536.2431494d@windsurf.hq.k.grp>
 <CAKmqyKOSLH-VJc-72eyn=O_-nNwneb3Wqcm-Yb1qt6TzXdDS0g@mail.gmail.com>
 <20200911093009.68a115f9@windsurf.hq.k.grp>
 <CAKmqyKN4Ge5YWUtbU-XwBD2JbrJ-jMhSVMZVbE6wOsz+CUM1jA@mail.gmail.com>
 <20200924114204.7713bdfe@windsurf>
 <CAKmqyKMuzcbZ0ZhMdmgYxRnxkLT0z9+-3Vb==sdc2miHKvF7YA@mail.gmail.com>
Message-ID: <20200924204707.58010cfc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Sep 2020 11:20:18 -0700
Alistair Francis <alistair23@gmail.com> wrote:

> > Sorry for the slow feedback. I retested the above defconfig, and it
> > fails to build here. Did you try on the 2020.08 tag, with no change ?
> > Perhaps you tried on master and something fixed this on master after
> > 2020.08 ?  
> 
> Yep, that doesn't work.
> 
> That branch is missing the patches to use upstream glibc:
> 
> * acc1330d4a configs/qemu_riscv32_virt: use Linux 5.4 kernel (by
> Alistair Francis 3 weeks ago)
> * a4889545aa package/glibc: use upstream glibc for RISC-V 32-bit (by
> Alistair Francis 3 weeks ago)
> 
> Because of that the kernel headers need to be patched to add support
> for a 32-bit time_t.
> 
> This change in the defconfig should fix that:
> 
> BR2_GLOBAL_PATCH_DIR="board/qemu/riscv32-virt/patches/"
> 
> Although it looks like the kernel build is also required to get the
> patches to take effect:
> 
> # Kernel
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.12"
> BR2_LINUX_KERNEL_DEFCONFIG="rv32"
> BR2_LINUX_KERNEL_IMAGE=y
> 
> Although applying the two commits mentioned above would be a much better option.

Thanks a lot for the feedback, it makes sense. To me, it illustrates
very well that the solution of having patches for the kernel headers
that only apply to a specific defconfig doesn't work: whenever someone
builds a system from scratch without using a defconfig, such patches
are not applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
