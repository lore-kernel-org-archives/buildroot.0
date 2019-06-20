From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 20 Jun 2019 15:58:23 -0700
Subject: [Buildroot] [PATCH] qemu/riscv32-virt: Fix missing
 linux-headers patch
In-Reply-To: <20190620204314.GL2216@scaer>
References: <20190620175648.7969-1-alistair.francis@wdc.com>
 <20190620205424.10702057@windsurf> <20190620204314.GL2216@scaer>
Message-ID: <CAKmqyKPV=Bqum0_sxAdyhRKDcfQp9ie1dr6E5zVBEN70usmwQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 20, 2019 at 1:43 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Thomas, Alistair, Mark, All,
>
> On 2019-06-20 20:54 +0200, Thomas Petazzoni spake thusly:
> > +Yann in Cc.
>
> I seem to consistently been dragged into weird corner-cases... ;-)
>
> > On Thu, 20 Jun 2019 10:56:48 -0700
> > Alistair Francis <alistair.francis@wdc.com> wrote:
> > > Add a symbolic link to ensure the linux patch is applied to linux and
> > > linux-headers.
> [--SNIP--]
> > I understand the problem, but I am not sure it is the right solution.
> > Indeed, when the option BR2_KERNEL_HEADERS_AS_KERNEL is enabled, we
> > really expect that linux-headers will use the same source code as the
> > kernel, including all patches. The linux-headers.mk is already doing
> > some effort to achieve this, but it does not do it entirely due do
> > BR2_GLOBAL_PATCH_DIR patches.
>
> Agreed.
>
> > So what I would propose instead is this:
> >
> > diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> > index 95432ade83..46f270a0e1 100644
> > --- a/package/linux-headers/linux-headers.mk
> > +++ b/package/linux-headers/linux-headers.mk
> > @@ -60,7 +60,8 @@ endif # LINUX_HEADERS_CUSTOM_TARBALL
> >  # Apply any necessary patches if we are using the headers from a kernel
> >  # build.
> >  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> > -LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
> > +LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH)) \
> > +       $(wildcard $(addsuffix /linux,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
> >
> >  # We rely on the generic package infrastructure to download and apply
> >  # remote patches (downloaded from ftp, http or https). For local
> >
> > Yann, what do you think of this ?
>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> > However, Francis & Mark: it is not normal that we can't build a RISC-V
> > 32 toolchain out of the box, as I reported separately. So while this
> > linux-headers/linux patch consistency issue is real, I think we need
> > something better for RISC-V 32. Indeed a user who would build a RISC-V
> > 32 system, but not for Qemu, would not use this defconfig, and would
> > therefore not have this patch. Do you expect this issue to be resolved
> > in the near future on the kernel side ?
>
> So, upstream is broken. Our response is usually that we patch it, and
> cary the patch(es) in the package directory (or in a per-version
> subdirectory thereof).
>
> However, for the kernel, it is more complex, because we usually can't
> know what version the user will end up using (and it is definitely not
> uncommon that they go with a non upstream kernel), and so we can't have
> an automatic way to locate that patch. And even if we could, it may or
> may not apply (e.g. not on older kernels that don't have riscv).
>
> So, besides providing a defconfig, like this one for qemu or for a real
> board, which has the patch we can point users at, I don;t see what we
> can do. Oh, yes I see: we can wait the kernel to get fixed. ;-)

I started looking at fixing glibc, but it seems to be a large task as
without __ARCH_WANT_TIME32_SYSCALLS defined in the kernel we need to
implement a lot of syscalls in glibc.

Alistair

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

On Thu, Jun 20, 2019 at 1:43 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Thomas, Alistair, Mark, All,
>
> On 2019-06-20 20:54 +0200, Thomas Petazzoni spake thusly:
> > +Yann in Cc.
>
> I seem to consistently been dragged into weird corner-cases... ;-)
>
> > On Thu, 20 Jun 2019 10:56:48 -0700
> > Alistair Francis <alistair.francis@wdc.com> wrote:
> > > Add a symbolic link to ensure the linux patch is applied to linux and
> > > linux-headers.
> [--SNIP--]
> > I understand the problem, but I am not sure it is the right solution.
> > Indeed, when the option BR2_KERNEL_HEADERS_AS_KERNEL is enabled, we
> > really expect that linux-headers will use the same source code as the
> > kernel, including all patches. The linux-headers.mk is already doing
> > some effort to achieve this, but it does not do it entirely due do
> > BR2_GLOBAL_PATCH_DIR patches.
>
> Agreed.
>
> > So what I would propose instead is this:
> >
> > diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> > index 95432ade83..46f270a0e1 100644
> > --- a/package/linux-headers/linux-headers.mk
> > +++ b/package/linux-headers/linux-headers.mk
> > @@ -60,7 +60,8 @@ endif # LINUX_HEADERS_CUSTOM_TARBALL
> >  # Apply any necessary patches if we are using the headers from a kernel
> >  # build.
> >  ifeq ($(BR2_KERNEL_HEADERS_AS_KERNEL),y)
> > -LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
> > +LINUX_HEADERS_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH)) \
> > +       $(wildcard $(addsuffix /linux,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR))))
> >
> >  # We rely on the generic package infrastructure to download and apply
> >  # remote patches (downloaded from ftp, http or https). For local
> >
> > Yann, what do you think of this ?
>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> > However, Francis & Mark: it is not normal that we can't build a RISC-V
> > 32 toolchain out of the box, as I reported separately. So while this
> > linux-headers/linux patch consistency issue is real, I think we need
> > something better for RISC-V 32. Indeed a user who would build a RISC-V
> > 32 system, but not for Qemu, would not use this defconfig, and would
> > therefore not have this patch. Do you expect this issue to be resolved
> > in the near future on the kernel side ?
>
> So, upstream is broken. Our response is usually that we patch it, and
> cary the patch(es) in the package directory (or in a per-version
> subdirectory thereof).
>
> However, for the kernel, it is more complex, because we usually can't
> know what version the user will end up using (and it is definitely not
> uncommon that they go with a non upstream kernel), and so we can't have
> an automatic way to locate that patch. And even if we could, it may or
> may not apply (e.g. not on older kernels that don't have riscv).
>
> So, besides providing a defconfig, like this one for qemu or for a real
> board, which has the patch we can point users at, I don;t see what we
> can do. Oh, yes I see: we can wait the kernel to get fixed. ;-)
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
