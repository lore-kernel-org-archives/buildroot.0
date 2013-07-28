From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 28 Jul 2013 16:14:35 +0800
Subject: [Buildroot] Build error for nptl with no-mmu (arm7tdmi)
In-Reply-To: <1374993176.3762.1.camel@phoenix>
References: <1374993176.3762.1.camel@phoenix>
Message-ID: <1374999275.19163.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? ??2013-07-28 ? 14:32 +0800?Axel Lin ???
> hi list,
> 
> In my config, I have
> # ARCH_HAS_MMU is not set.
> 
> I got below build error (I got the same error on both buildroot-2013.05 and current git tree):
> 
>   AS libpthread/nptl/sysdeps/unix/sysv/linux/arm/clone.os
>   AS libpthread/nptl/sysdeps/unix/sysv/linux/arm/vfork.os
>   CC libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os
> In file included from libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.c:31:0:
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:17: error: 'fork' undeclared here (not in a function)
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:63:1: error: '__libc_fork' redeclared as different kind of symbol
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:61:23: note: previous declaration of '__libc_fork' was here
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:228:1: error: 'fork' redeclared as different kind of symbol
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:227:1: note: previous declaration of 'fork' was here
> libpthread/nptl/sysdeps/unix/sysv/linux/arm/../fork.c:229:1: error: '__EI_fork' aliased to undefined symbol '__GI_fork'
> make[1]: *** [libpthread/nptl/sysdeps/unix/sysv/linux/arm/fork.os] Error 1
> make[1]: Leaving directory `/opt/test/buildroot/buildroot-2013.05/output/toolchain/uClibc-0.9.33.2'
> make: *** [/opt/test/buildroot/buildroot-2013.05/output/toolchain/uClibc-0.9.33.2/lib/libc.a] Error 2
> 

hi,

Seems I hit this bug:
[Bug 6224] New: Cannot enable threads on arm7tdmi (MMU-less) arch
http://lists.uclibc.org/pipermail/uclibc-cvs/2013-May/031094.html

Now I switch to compile with

# ARCH_HAS_MMU is not set
LINUXTHREADS_OLD=y
# LINUXTHREADS_NEW is not set
# UCLIBC_HAS_THREADS_NATIVE is not set
UCLIBC_HAS_THREADS=y


But I got another compile error: (compile against current git tree)

 CC libpthread/linuxthreads.old/libc_pthread_init.os
  CC libc/sysdeps/linux/arm/aeabi_lcsts.os
  CC libc/misc/elf/dl-core.os
  CC libc/misc/elf/dl-iterate-phdr.os
  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/libc.a
  INSTALL include
-> /opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
install -m
644 ./lib/crt1.o ./lib/crti.o ./lib/crtn.o   /opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib//
install -m
644 ./lib/*.a /opt/test/buildroot/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib//
make[1]: Leaving directory
`/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2'
/usr/bin/install -D -m
0755 /opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/utils/ldd.host /opt/test/buildroot/buildroot/output/host/usr/bin/ldd
/usr/bin/install: cannot stat
'/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/utils/ldd.host': No such file or directory
make: ***
[/opt/test/buildroot/buildroot/output/build/uclibc-0.9.33.2/.stamp_staging_installed] Error 1

Regards,
Axel
