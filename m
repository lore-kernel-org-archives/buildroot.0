From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 31 Aug 2015 08:05:01 +0200
Subject: [Buildroot] [PATCH 1/1] Fix elf2flt build
In-Reply-To: <55E32486.5070501@gmail.com>
References: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
 <6966330.pLhB8QsgjT@raillard-dv6>
 <20150828100932.738b1809@free-electrons.com>
 <2694397.HiyaVxjcGY@raillard-dv6>
 <20150828132047.5ef4eec8@free-electrons.com>
 <20150828130109.GA2808@waldemar-brodkorb.de>
 <55E32486.5070501@gmail.com>
Message-ID: <20150831060501.GA9163@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Douglas RAILLARD wrote,

> On 28/08/2015 15:01, Waldemar Brodkorb wrote:
> > Please disable UCLIBC_HAS_CONTEXT_FUNCS, as the code is not thumb
> > ready. I'll accept any patches for this 
> 
> Works better without UCLIBC_HAS_CONTEXT_FUNCS
> 
> > NPTL is not thumb ready, please use LINUXTHREADS.OLD for ARM no-MMU
> > or send a fix :)
> 
> Still fails with LINUXTHREADS_OLD:
> /working_dir/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc -c libpthread/linuxthreads.old/mutex.c -o libpthread/linuxthreads.old/mutex.os -Wall -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin -fno-asm -fmerge-all-constants -msoft-float -std=gnu99 -mlittle-endian -fstack-protector -nostdinc -I./include -I./include -include libc-symbols.h -I./libc/sysdeps/linux/arm -I./libc/sysdeps/linux -I./ldso/ldso/arm -I./ldso/include -I. -DSTATIC -Os -fstrict-aliasing -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux/arm -I./libpthread/linuxthreads.old/sysdeps/arm -I./libpthread/linuxthreads.old/sysdeps/unix/sysv/linux -I./libpthread/linuxthreads.old/sysdeps/pthread -I./libpthread/linuxthreads.old -I./libpthread -I./libc/sysdeps/linux/common -isystem /working_dir/buildroot/output/host/usr/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/4.9.3/include-fixed -isystem /working_dir/buildroot/output/host/usr/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/4.9.3/in
> clude -I/working_dir/buildroot/output/build/linux-headers-4.1.4/usr/include/ -DNDEBUG -DNOT_IN_libc -DIS_IN_libpthread -fstack-protector-all -DIN_LIB=libpthread -fPIC -MT libpthread/linuxthreads.old/mutex.os -MD -MP -MF libpthread/linuxthreads.old/.mutex.os.dep
> /tmp/ccWVQC5r.s: Assembler messages:
> /tmp/ccWVQC5r.s:34: Error: selected processor does not support ARM opcodes
> /tmp/ccWVQC5r.s:35: Error: attempt to use an ARM instruction on a Thumb-only processor -- `swp r3,r3,[r0]'
> /tmp/ccWVQC5r.s:36: Error: attempt to use an ARM instruction on a Thumb-only processor -- `orr r0,pc,#1'
> /tmp/ccWVQC5r.s:37: Error: attempt to use an ARM instruction on a Thumb-only processor -- `bx r0'
> /tmp/ccWVQC5r.s:151: Error: selected processor does not support ARM opcodes
> /tmp/ccWVQC5r.s:152: Error: attempt to use an ARM instruction on a Thumb-only processor -- `swp r3,r3,[r0]'
> /tmp/ccWVQC5r.s:153: Error: attempt to use an ARM instruction on a Thumb-only processor -- `orr r0,pc,#1'
> /tmp/ccWVQC5r.s:154: Error: attempt to use an ARM instruction on a Thumb-only processor -- `bx r0'
> Makerules:383: recipe for target 'libpthread/linuxthreads.old/mutex.os' failed
> make[1]: *** [libpthread/linuxthreads.old/mutex.os] Error 1
> make[1]: Leaving directory '/working_dir/buildroot/output/build/uclibc-1.0.5'
> package/pkg-generic.mk:156: recipe for target '/working_dir/buildroot/output/build/uclibc-1.0.5/.stamp_built' failed
> make: *** [/working_dir/buildroot/output/build/uclibc-1.0.5/.stamp_built] Error 2
> 
> It seems that the problem stems from libpthread/linuxthreads.old/sysdeps/arm/pt-machine.h in testandset function:
>      83         "\tswp %0, %2, [%3]\n"
>      84         "\torr %1, pc, #1\n"
>      85         "\tbx %1\n"
> 
> 
> Is it still the good place to send such reports or should I post them somewhere else ? (or in a new thread)

Okay, for me.
Please enable COMPILE_IN_THUMB_MODE in your uClibc config. It is
missing in the generated config. Would be cool if you prepare a
patch with the two fixes.

best regards
 Waldemar
