From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 14 Sep 2020 11:10:41 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
In-Reply-To: <CAOiXNkCVYCW=rf6pN5-e0D7NZWhoOry0ZwtPDEOPna_4G2ss6g@mail.gmail.com>
References: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
 <20200909221101.327887ca@windsurf.hq.k.grp>
 <CAOiXNkAW-_HZPMGzZSezjNDu=wyKN6eiiokfOXBkBaAce+SMLg@mail.gmail.com>
 <20200910114133.43bb3e53@windsurf.hq.k.grp>
 <CAOiXNkCVYCW=rf6pN5-e0D7NZWhoOry0ZwtPDEOPna_4G2ss6g@mail.gmail.com>
Message-ID: <CAOiXNkDBjvTj=ND=qVvaz+vk2H8LBiE3dm0HCFK=9a+Y8NBf1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 at 11:44, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>
> On Thu, 10 Sep 2020 at 11:41, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Thu, 10 Sep 2020 11:40:29 +0200
> > Andrey Nechypurenko <andreynech@gmail.com> wrote:
> >
> > > > Which OpenGL implementation are you trying to use? The proprietary
> > > > blobs from Vivante, or the open-source Etnaviv implementation? I don't
> > > > know if the latter was tested on STM32MP157.
> > >
> > > Good question. In fact, I am not sure :-) . So I guess it is Etnaviv
> > > because I did nothing to add proprietary blobs. I will check it out
> > > and see what is used by Yocto-based distribution provided by STM where
> > > Weston works.
> >
> > In Buildroot, the package package/gcnano-binaries/ will give you the
> > proprietary OpenGL blobs provided by ST.

Selecting the gcnano-binaries package leads to the following compile errors.
This time "make clean" does not help unfortunately :-) .
If someone has an idea how to fix these errors, I would appreciate the hint.

  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_device.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_linux.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_math.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_os.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_debugfs.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_allocator.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_user_memory.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_gfp.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_reserved_mem.o
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/gc_hal_kernel_driver.o
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:
In function ?_DmaAlloc?:
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:167:11:
error: implicit declaration of function ?dma_alloc_writecombine?; did
you mean ?pgprot_writecombine??
[-Werror=implicit-function-declaration]
  167 |         = dma_alloc_writecombine(galcore_device, NumPages *
PAGE_SIZE,  &mdlPriv->dmaHandle, gfp);
      |           ^~~~~~~~~~~~~~~~~~~~~~
      |           pgprot_writecombine
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:167:9:
error: assignment to ?gctPOINTER? {aka ?void *?} from ?int? makes
pointer from integer without a cast [-Werror=int-conversion]
  167 |         = dma_alloc_writecombine(galcore_device, NumPages *
PAGE_SIZE,  &mdlPriv->dmaHandle, gfp);
      |         ^
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:
In function ?_DmaFree?:
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:288:5:
error: implicit declaration of function ?dma_free_writecombine?; did
you mean ?pgprot_writecombine??
[-Werror=implicit-function-declaration]
  288 |     dma_free_writecombine(galcore_device, Mdl->numPages *
PAGE_SIZE, mdlPriv->kvaddr, mdlPriv->dmaHandle);
      |     ^~~~~~~~~~~~~~~~~~~~~
      |     pgprot_writecombine
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:
In function ?_DmaMmap?:
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.c:324:9:
error: implicit declaration of function ?dma_mmap_writecombine?
[-Werror=implicit-function-declaration]
  324 |     if (dma_mmap_writecombine(gcvNULL,
      |         ^~~~~~~~~~~~~~~~~~~~~
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/platform/st/gc_hal_kernel_platform_st.o
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:265:
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dma.o]
Error 1
make[3]: *** Waiting for unfinished jobs....
  CC [M]  /home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/./hal/os/linux/kernel/allocator/default/gc_hal_kernel_allocator_dmabuf.o
make[2]: *** [Makefile:1690:
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/.]
Error 2
make[1]: *** [package/pkg-generic.mk:270:
/home/andreynech/p2_build/build/gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed/.stamp_built]
Error 2
make: *** [Makefile:23: _all] Error 2
