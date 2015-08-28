From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:53:14 +0200
Subject: [Buildroot] elf2flt .ARM.exidx and .ARM.extab section handling
In-Reply-To: <1990856.EDz1xKh0BM@raillard-dv6>
References: <1990856.EDz1xKh0BM@raillard-dv6>
Message-ID: <20150828115314.606c5049@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Douglas,

On Thu, 27 Aug 2015 21:11:18 +0200, Douglas RAILLARD wrote:

> Cortex M3 no-MMU toolchain includes the elf2flt tool to convert ELF to bFLT.
> However, it does not seem to be able to do its job when given the ELF output
> of gcc 4.9.3 and uClibc 0.9.33.
> The problem is: .ARM.exidx sections and .ARM.extab input sections are
> not kept by the elf2flt linker script and libgcc apparently needs that
> information (actually, a symbol for the beginning and the end of the 
> .ARM.exidx sections):
> output/build/host-gcc-final-4.9.3/build/arm-buildroot-uclinux-uclibcgnueabi/libgcc/../../../libgcc/unwind-arm-common.inc:275: undefined reference to ? __exidx_start ?
> This error shows up during the final link of a binary, not when
> compiling the toolchain itself.
> 
> A patch has been sent here 3 years ago but for some reasons, has not been
> checked in buildroot:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/40885/match=elf2flt

Because it was not a proper patch: the e-mail mixed some kernel
changes, with elf2flt changes and Buildroot changes. Definitely not
something we could have applied.

> Now elf2flt sources had been moved out of the buildroot tree, but the currently
> used upstream has no obvious mean of contact so here is a serie of small patches that
> allow the elf2flt toolchain to compile cleanly C code (C++ not tested).

Can you submit this as proper patches against Buildroot, i.e a patch
adding patches in package/elf2flt/ ?

Also, can you ask on the nommu.org mailing list
(http://lists.nommu.org/listinfo/nommu) is they have a new official
upstream location for elf2flt ?

> Also, support for two relocations types (R_ARM_NONE, R_ARM_PREL31) must be
> added to elf2flt in order to process the content of .ARM.exidx section.
> Note that I have not already tested the resulting binaries, only that 
> buildroot builds the root image without error, but Sourcery 2010q1 
> uClinux prebuilt toolchain default linker script does a similar thing.
> Unfortunately, I have not been able to find the sources of the elf2flt 
> binary included in that prebuilt toolchain yet.
>
> Here is the URL of that prebuilt toolchain:
> https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 

Are you sure? This is a Linux toolchain, not a uClinux toolchain.

If you want the sources of:

  http://sourcery.mentor.com/public/gnu_toolchain/arm-uclinuxeabi/arm-2011.03-46-arm-uclinuxeabi-i686-pc-linux-gnu.tar.bz2

they are available at:

  http://sourcery.mentor.com/public/gnu_toolchain/arm-uclinuxeabi/arm-2011.03-46-arm-uclinuxeabi.src.tar.bz2

And this one does have the sources of elf2flt:

  arm-2011.03-46-arm-uclinuxeabi/elf2flt-2011.03-46.tar.bz2

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
