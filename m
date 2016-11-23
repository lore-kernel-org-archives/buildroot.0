From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 23 Nov 2016 12:20:35 +0100
Subject: [Buildroot] Bare metal toolchain support?
In-Reply-To: <20161123113517.04f6ec47@free-electrons.com>
References: <CAM+bi4v0iJKAbKV8FvqwJqEw=L+DqTLZhcHWGboYBbPv1oTM0A@mail.gmail.com>
 <20161123113517.04f6ec47@free-electrons.com>
Message-ID: <CAM+bi4vNKMBr0Dv9_-rsQzU_kPNrze7o9_EcSEA--g2UCVCfzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas

2016-11-23 11:35 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> No, but this is generally not needed. A Linux-capable toolchain is
> capable of building userspace applications, but also the Linux kernel
> and bootloaders like Barebox, U-Boot, etc (which you could build with
> bare metal toolchains).
>
> > Specifically, I'm trying to build a small bootloader for the microblaze
> > architecture. Xilinx provides an SDK, and I wonder if I can build one
> like
> > this using buildroot, so I can keep all my code and workflow centralized
> > under buildroot.
>
> Have you tried building this small bootloader with the Buildroot
> toolchain?
>
>
Xilinx provides a very simple bootloader, which depends on what they call a
BSP for my platform,
so first of all, I have to compile this BSP, which provides drivers for
xilinx's IP cores. I'm having
only partial success, as drivers code compiles without an issue, but I'm
reaching a point that seems
to be related to the toolchain.

My guess is once this is solved, the BSP will build and the bootloader as
well, as it only uses functions
from these drivers.

output/host/usr/bin/microblazeel-linux-gcc  -O2 -c -mcpu=v9.6
-mlittle-endian -mno-xl-soft-div -mno-xl-soft-mul -mxl-barrel-shift
-mxl-multiply-high -mxl-pattern-compare  -g -I./. -I../../../include
xil_exception.c microblaze_sleep.c fcntl.c xil_testio.c xil_io.c
xil_printf.c outbyte.c microblaze_interrupt_handler.c pvr.c
microblaze_exception_handler.c inbyte.c xil_cache.c xil_misc_psreset_api.c
print.c xplatform_info.c xil_testmem.c _exit.c errno.c
microblaze_interrupts_g.c xil_assert.c xil_testcache.c
microblaze_update_dcache.S microblaze_disable_dcache.S
microblaze_invalidate_dcache_range.S microblaze_flush_dcache.S
microblaze_invalidate_icache.S microblaze_invalidate_cache_ext_range.S
microblaze_flush_cache_ext_range.S microblaze_scrub.S
microblaze_enable_dcache.S microblaze_disable_icache.S
microblaze_disable_interrupts.S microblaze_invalidate_dcache.S
microblaze_flush_cache_ext.S microblaze_invalidate_cache_ext.S
microblaze_flush_dcache_range.S microblaze_disable_exceptions.S
microblaze_init_icache_range.S hw_exception_handler.S
microblaze_enable_icache.S microblaze_enable_interrupts.S
microblaze_update_icache.S microblaze_init_dcache_range.S
microblaze_invalidate_icache_range.S microblaze_enable_exceptions.S
errno.c:6:19: fatal error: reent.h: No such file or directory
 #include <reent.h>

This reent.h header doesn't exist in the toolchain built by buildroot, but
it exists on Xilinx's:

/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/microblaze-xilinx-elf/include/include/reent.h
/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/microblaze-xilinx-elf/include/include/sys/reent.h
/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/microblaze-xilinx-elf/include/reent.h
/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/microblaze-xilinx-elf/include/sys/reent.h
/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/microblaze-xilinx-elf/sysroot/usr/include/reent.h
/opt/Xilinx/SDK/2016.2/gnu/microblaze/lin/microblaze-xilinx-elf/sysroot/usr/include/sys/reent.h

Best regards

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161123/715bb248/attachment.html>
