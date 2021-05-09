From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 9 May 2021 14:10:51 +0200
Subject: [Buildroot] [PATCH 1/1] linux: disable SSP on s390 when needed
In-Reply-To: <51418832-f995-ce29-33c5-8e71962c8aa1@gmail.com>
References: <20210509091800.708933-1-fontaine.fabrice@gmail.com>
 <51418832-f995-ce29-33c5-8e71962c8aa1@gmail.com>
Message-ID: <CAPi7W81C6dVUgZ+rq=ZkBa3A1cVcqcC_qJM6AUQi8bxBSHHHsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

Le dim. 9 mai 2021 ? 11:54, Romain Naour <romain.naour@gmail.com> a ?crit :
>
> Hello Fabrice,
>
> For s390 arch you can add Alexander Egorenkov <egorenar@linux.ibm.com> in Cc.
>
> Le 09/05/2021 ? 11:18, Fabrice Fontaine a ?crit :
> > Fix build failure raised since commit
> > 810ba387bec3c5b6904e8893fb4cb6f9d3717466 by disabling SSP when needed
> >
> > Fixes:
> >  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...02-arch-s390-disable-SSP-when-needed.patch | 47 +++++++++++++++++++
> >  linux/linux.mk                                |  7 +++
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 linux/0002-arch-s390-disable-SSP-when-needed.patch
> >
> > diff --git a/linux/0002-arch-s390-disable-SSP-when-needed.patch b/linux/0002-arch-s390-disable-SSP-when-needed.patch
> > new file mode 100644
> > index 0000000000..c8199d4fd6
> > --- /dev/null
> > +++ b/linux/0002-arch-s390-disable-SSP-when-needed.patch
> > @@ -0,0 +1,47 @@
> > +From 8a054081678ed0b0e56f829bac0a4656e3a198b9 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Sat, 8 May 2021 22:03:11 +0200
> > +Subject: [PATCH] arch/s390: disable SSP when needed
> > +
> > +Though -nostdlib is passed in PURGATORY_LDFLAGS and -ffreestanding in
> > +KBUILD_CFLAGS_DECOMPRESSOR, -fno-stack-protector must also be passed to
> > +avoid linking errors related to undefined references to
> > +'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
> > +-fstack-protector.
> > +
> > +Fixes:
> > + - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + arch/s390/Makefile           | 1 +
> > + arch/s390/purgatory/Makefile | 1 +
> > + 2 files changed, 2 insertions(+)
> > +
> > +diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> > +index e443ed9947bd..098abe3a56f3 100644
> > +--- a/arch/s390/Makefile
> > ++++ b/arch/s390/Makefile
> > +@@ -28,6 +28,7 @@ KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
> > + KBUILD_CFLAGS_DECOMPRESSOR += -fno-delete-null-pointer-checks -msoft-float -mbackchain
> > + KBUILD_CFLAGS_DECOMPRESSOR += -fno-asynchronous-unwind-tables
> > + KBUILD_CFLAGS_DECOMPRESSOR += -ffreestanding
> > ++KBUILD_CFLAGS_DECOMPRESSOR += -fno-stack-protector
> > + KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-member)
> > + KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
> > + KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
> > +diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
> > +index c57f8c40e992..21c4ebe29b9a 100644
> > +--- a/arch/s390/purgatory/Makefile
> > ++++ b/arch/s390/purgatory/Makefile
> > +@@ -24,6 +24,7 @@ KBUILD_CFLAGS := -fno-strict-aliasing -Wall -Wstrict-prototypes
> > + KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
> > + KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
> > + KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
> > ++KBUILD_CFLAGS += -fno-stack-protector
> > + KBUILD_CFLAGS += $(CLANG_FLAGS)
> > + KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
> > + KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
> > +--
> > +2.30.2
> > +
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 1457228eb9..338e79d23d 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -274,6 +274,13 @@ define LINUX_TRY_PATCH_TIMECONST
> >  endef
> >  LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
> >
> > +define LINUX_TRY_PATCH_ARCH_S390_SSP
> > +     @if patch -p1 --dry-run -f -s -d $(@D) <$(LINUX_PKGDIR)/0002-arch-s390-disable-SSP-when-needed.patch.conditional >/dev/null ; then \
> > +             $(APPLY_PATCHES) $(@D) $(LINUX_PKGDIR) 0002-arch-s390-disable-SSP-when-needed.patch.conditional ; \
> > +     fi
> > +endef
> > +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_ARCH_S390_SSP
>
> I'm not sure if we should fix this in linux.mk
> Instead put the patch to board/qemu/s390x/patches/linux/ (as for other kernel
> patches for qemu defconfig).
Thanks for your review, I'm not used to linux patching. I'll send a v2.
I assume that this patch should be upstreamable but again, I'm a total
newbie to linux contribution so my success rate is probably low...
>
> Best regards,
> Romain
>
>
> > +
> >  LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
> >  ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
> >  LINUX_DEPENDENCIES += host-imagemagick
> >
>
Best Regards,

Fabrice
