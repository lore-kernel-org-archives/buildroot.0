From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Jun 2019 13:07:48 -0700
Subject: [Buildroot] [PATCH] qemu/riscv32-virt: Fix missing
 linux-headers patch
In-Reply-To: <20190620205424.10702057@windsurf>
References: <20190620175648.7969-1-alistair.francis@wdc.com>
 <20190620205424.10702057@windsurf>
Message-ID: <CAKmqyKMzuRye_2h45M0FMcTx0iUDFvz_uizw0O3BxQ9STgp5bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 20, 2019 at 11:54 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Francis,
>
> +Yann in Cc.
>
> First of all, my apologies for breaking the build with my change.

No worries.

>
> On Thu, 20 Jun 2019 10:56:48 -0700
> Alistair Francis <alistair.francis@wdc.com> wrote:
>
> > Commit f9993797959 "configs/qemu_riscv32_virt: update to 5.1 kernel"
> > broke the qemu/riscv32-virt machine build as the BR2_LINUX_KERNEL_PATCH
> > mechanism was replaced with the BR2_GLOBAL_PATCH_DIR mechanism when the
> > patch was applied. This results in the linux-headers not having the
> > patch applied which causes a glibc build failure.
> >
> > Add a symbolic link to ensure the linux patch is applied to linux and
> > linux-headers.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  board/qemu/riscv32-virt/patches/linux-headers | 1 +
> >  1 file changed, 1 insertion(+)
> >  create mode 120000 board/qemu/riscv32-virt/patches/linux-headers
> >
> > diff --git a/board/qemu/riscv32-virt/patches/linux-headers b/board/qemu/riscv32-virt/patches/linux-headers
> > new file mode 120000
> > index 0000000000..9c52cb36f4
> > --- /dev/null
> > +++ b/board/qemu/riscv32-virt/patches/linux-headers
> > @@ -0,0 +1 @@
> > +linux
> > \ No newline at end of file
>
> I understand the problem, but I am not sure it is the right solution.
> Indeed, when the option BR2_KERNEL_HEADERS_AS_KERNEL is enabled, we
> really expect that linux-headers will use the same source code as the
> kernel, including all patches. The linux-headers.mk is already doing
> some effort to achieve this, but it does not do it entirely due do
> BR2_GLOBAL_PATCH_DIR patches.
>
> So what I would propose instead is this:
>
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 95432ade83..46f270a0e1 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -60,7 +60,8 @@ endif # LINUX_HEADERS_CUSTOM_TARBALL
>  # Apply any necessary patches if we are using the headers from a kernel
>  # build.
>  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> -LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
> +LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH)) \
> +       $(wildcard $(addsuffix /linux,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
>
>  # We rely on the generic package infrastructure to download and apply
>  # remote patches (downloaded from ftp, http or https). For local

This is fine with me, although I haven't tested to make sure it works.

>
> Yann, what do you think of this ?
>
> However, Francis & Mark: it is not normal that we can't build a RISC-V
> 32 toolchain out of the box, as I reported separately. So while this
> linux-headers/linux patch consistency issue is real, I think we need
> something better for RISC-V 32. Indeed a user who would build a RISC-V
> 32 system, but not for Qemu, would not use this defconfig, and would
> therefore not have this patch. Do you expect this issue to be resolved
> in the near future on the kernel side ?

Ah, now I understand what you mean.

Yes this is a bad situation.

From my understanding the glibc port for RV32 is basically done, it
just needs a little bit of cleaning and then more effort to submit it.
In saying that no one is really pushing for it at the moment. I'll
take a look to see if I can help get it in.

In the meantime we can either apply a patch to Linux, or we should be
able to user older kernel headers (I think 5.0 should be fine). Is
that a better solution?

Alistair

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
