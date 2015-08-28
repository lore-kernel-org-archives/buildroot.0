From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 28 Aug 2015 15:01:09 +0200
Subject: [Buildroot] [PATCH 1/1] Fix elf2flt build
In-Reply-To: <20150828132047.5ef4eec8@free-electrons.com>
References: <1440694037-9022-1-git-send-email-public.douglas.raillard@gmail.com>
 <6966330.pLhB8QsgjT@raillard-dv6>
 <20150828100932.738b1809@free-electrons.com>
 <2694397.HiyaVxjcGY@raillard-dv6>
 <20150828132047.5ef4eec8@free-electrons.com>
Message-ID: <20150828130109.GA2808@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Douglas, Thomas,
Thomas Petazzoni wrote,

> Douglas,
> 
> On Fri, 28 Aug 2015 12:17:40 +0200, Douglas RAILLARD wrote:
> 
> > > This seems weird: using uClibc 0.9.33 with the configuration file for
> > > uClibc-ng. Have you had any problem with uClibc-ng that made you go
> > > back to uClibc 0.9.33 ?
> > 
> > Indeed, I did not pay attention to it in the first place as I wanted to use as 
> > much default as possible.
> > uClibc-ng does not compile with my configuration (same as before but with
> > uClibc-ng instead of uClibc 0.9.33), I have not tried to investigate this issue yet:
> 
> I would suggest to use uClibc-ng. The upstream uClibc developers are
> not really active anymore, while the uClibc-ng (Waldemar) is very
> active, and is following/helping the Buildroot development as well. I'm
> sure he will be interested by your reports. I've added him in Cc.
> 
> > make[1]: Entering directory '/working_dir/buildroot/output/build/uclibc-1.0.5'
> > /working_dir/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc -c libc/sysdeps/linux/arm/setcontext.S -o libc/sysdeps/linux/arm/setcontext.os -Wall -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin -fno-asm -fmerge-all-constants -msoft-float -mlittle-endian -fstack-protector -nostdinc -I./include -I./include -include libc-symbols.h -I./libc/sysdeps/linux/arm -I./libc/sysdeps/linux -I./ldso/ldso/arm -I./ldso/include -I. -DSTATIC -Os -fstrict-aliasing -I./libc/sysdeps/linux/common -isystem /working_dir/buildroot/output/host/usr/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/4.9.3/include-fixed -isystem /working_dir/buildroot/output/host/usr/lib/gcc/arm-buildroot-uclinux-uclibcgnueabi/4.9.3/include -I/working_dir/buildroot/output/build/linux-headers-4.1.4/usr/include/ -DNDEBUG -DIN_LIB=libc -fPIC -MT libc/sysdeps/linux/arm/setcontext.os -MD -MP -MF libc/sysdeps/linux/arm/.setcontext.os.dep -D__ASSEMBLER__ -Wa,--noexecstack    
> > libc/sysdeps/linux/arm/setcontext.S: Assembler messages:
> > libc/sysdeps/linux/arm/setcontext.S:63: Error: LR and PC should not both be in register list -- `ldmia r14,{r14,pc}'
> > Makerules:386: recipe for target 'libc/sysdeps/linux/arm/setcontext.os' failed
> > make[1]: *** [libc/sysdeps/linux/arm/setcontext.os] Error 1
> > make[1]: Leaving directory '/working_dir/buildroot/output/build/uclibc-1.0.5'
> > package/pkg-generic.mk:156: recipe for target '/working_dir/buildroot/output/build/uclibc-1.0.5/.stamp_built' failed
> > make: *** [/working_dir/buildroot/output/build/uclibc-1.0.5/.stamp_built] Error 2

Please disable UCLIBC_HAS_CONTEXT_FUNCS, as the code is not thumb
ready. I'll accept any patches for this :)
 
> > 
> > > > BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> > > > BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> > > > BR2_PTHREADS_NONE=y
> > > 
> > > Any reason to disable thread support?
> > It fails  with NPTL thread support enabled (and also with every other threading backend).
> > Same configuration with uClibc 0.9.33 and NPTL thread, I did not try to solve this 
> > issue yet:
> > 
> > make[1]: Entering directory '/working_dir/buildroot/output/build/uclibc-0.9.33.2'
> >   AR cr lib/libcrypt.a
> >   STRIP -x -R .note -R .comment lib/libcrypt.a
> >   AR cr lib/libm.a
> >   STRIP -x -R .note -R .comment lib/libm.a
> >   AR cr lib/libnsl.a
> >   STRIP -x -R .note -R .comment lib/libnsl.a
> >   AR cr lib/libresolv.a
> >   STRIP -x -R .note -R .comment lib/libresolv.a
> >   AR cr lib/libutil.a
> >   STRIP -x -R .note -R .comment lib/libutil.a
> >   AS libpthread/nptl/sysdeps/arm/pthread_spin_lock.os -DSTATIC -DHAVE_FORCED_UNWIND -DNDEBUG -D__USE_STDIO_FUTEXES__ -D__ASSEMBLER__ -DNOT_IN_libc -DIS_IN_libpthread
> > libpthread/nptl/sysdeps/arm/pthread_spin_lock.S: Assembler messages:
> > libpthread/nptl/sysdeps/arm/pthread_spin_lock.S:26: Error: selected processor does not support Thumb mode `swp r2,r1,[r0]'
> > libpthread/nptl/sysdeps/arm/pthread_spin_lock.S:27: Error: instruction not supported in Thumb16 mode -- `teq r2,#0'
> > Makerules:362: recipe for target 'libpthread/nptl/sysdeps/arm/pthread_spin_lock.os' failed
> > make[1]: *** [libpthread/nptl/sysdeps/arm/pthread_spin_lock.os] Error 1
> > make[1]: Leaving directory '/working_dir/buildroot/output/build/uclibc-0.9.33.2'
> > package/pkg-generic.mk:156: recipe for target '/working_dir/buildroot/output/build/uclibc-0.9.33.2/.stamp_built' failed
> > make: *** [/working_dir/buildroot/output/build/uclibc-0.9.33.2/.stamp_built] Error 2
> 
> Another thing for Waldemar :-)

NPTL is not thumb ready, please use LINUXTHREADS.OLD for ARM no-MMU
or send a fix :)
 
> > > To tell the truth, ARM noMMU support in Buildroot is very much a work
> > > in progress. We have had only some initial Cortex-M3 patches, and a lot
> > > of work remain to be done to make it really usable. Your
> > > patches/reports are definitely welcome!
> > 
> > I plan to add support the smt32f429-discovery board with as much new
> > stuff as possible (new kernel, new toolchain, new Busybox, new U-boot), because
> > I started from this: https://github.com/jserv/stm32f429-linux-builder and after some
> > research, I felt that Buildroot was in the same vein, but much more integrated and also
> > widespread so this was the way to go for that kind of job.
> 
> Great idea! Looking forward to seeing patches going in this direction!

BTW: I have a working elf2flt git repo here:
http://cgit.openadk.org/cgi/cgit/elf2flt.git

At least working for m68k/coldfire and h8/300. 
I have not done runtime testing on ARM, yet.
But the required patch is in:
http://cgit.openadk.org/cgi/cgit/elf2flt.git/commit/?id=830762b7875194677bf0ed41af44758d8323260f
 
dito
 Waldemar
