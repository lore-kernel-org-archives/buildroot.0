From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 27 Aug 2015 20:20:31 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for x32 ABI for x86-64
 target.
In-Reply-To: <CAGtNMfM=h-kOytBJoKLSk1kPxTNV=H5ZUP1JDR4tiB+wZV+vGQ@mail.gmail.com>
References: <1439333955-1259-1-git-send-email-Guido.Hatzsis@yandex.com>
 <CAGtNMfM=h-kOytBJoKLSk1kPxTNV=H5ZUP1JDR4tiB+wZV+vGQ@mail.gmail.com>
Message-ID: <20150827182031.GY8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,
sergey kostanbaev wrote,

> Hi Guido,
> 
> I tried your patch against?buildroot-2015.05 and it fails during compilation of
> glibc-2.21:
> 
> /home/serg/projects/buildroot-2015.05/output/host/usr/bin/
> x86_64-umsiteroot-linux-gnux32-gcc mktime.c -c -std=gnu99 -fgnu89-inline ?-O2
> -Wall -Werror -Winline -Wno-error=undef -Wundef -Wwrite-strings
> -fmerge-all-constants -frounding-math -Wstrict-prototypes ? -fPIC ? ? ? ?-I../
> include -I/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/
> time ?-I/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build
> ?-I../sysdeps/unix/sysv/linux/x86_64/x32 ?-I../sysdeps/x86_64/x32/nptl ?-I../
> sysdeps/unix/sysv/linux/x86_64 ?-I../sysdeps/unix/sysv/linux/x86 ?-I../sysdeps/
> unix/sysv/linux/wordsize-64 ?-I../sysdeps/x86_64/nptl ?-I../sysdeps/unix/sysv/
> linux/include -I../sysdeps/unix/sysv/linux ?-I../sysdeps/nptl ?-I../sysdeps/
> pthread ?-I../sysdeps/gnu ?-I../sysdeps/unix/inet ?-I../sysdeps/unix/sysv ?-I..
> /sysdeps/unix/x86_64 ?-I../sysdeps/unix ?-I../sysdeps/posix ?-I../sysdeps/
> x86_64/x32 ?-I../sysdeps/x86_64/fpu/multiarch ?-I../sysdeps/x86_64/fpu ?-I../
> sysdeps/x86/fpu/include -I../sysdeps/x86/fpu ?-I../sysdeps/x86_64/multiarch
> ?-I../sysdeps/x86_64 ?-I../sysdeps/x86 ?-I../sysdeps/ieee754/ldbl-96 ?-I../
> sysdeps/ieee754/dbl-64/wordsize-64 ?-I../sysdeps/ieee754/dbl-64 ?-I../sysdeps/
> ieee754/flt-32 ?-I../sysdeps/wordsize-32 ?-I../sysdeps/ieee754 ?-I../sysdeps/
> generic ?-I.. -I../libio -I. -nostdinc -isystem /home/serg/projects/
> buildroot-2015.05/output/host/usr/lib/gcc/x86_64-umsiteroot-linux-gnux32/4.9.2/
> include -isystem /home/serg/projects/buildroot-2015.05/output/host/usr/lib/gcc/
> x86_64-umsiteroot-linux-gnux32/4.9.2/include-fixed -isystem /home/serg/projects
> /buildroot-2015.05/output/host/usr/x86_64-umsiteroot-linux-gnux32/sysroot/usr/
> include ?-D_LIBC_REENTRANT -include /home/serg/projects/buildroot-2015.05/
> output/build/glibc-2.21/build/libc-modules.h -DMODULE_NAME=libc -include ../
> include/libc-symbols.h ?-DPIC -DSHARED ? ? -o /home/serg/projects/
> buildroot-2015.05/output/build/glibc-2.21/build/time/mktime.os -MD -MP -MF /
> home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/build/time/
> mktime.os.dt -MT /home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/
> build/time/mktime.os
> (echo '#include <dl-vdso.h>'; \
> ? ? ? ? ?echo 'extern void *time_ifunc (void) __asm ("time");'; \
> ? ? ? ? ?echo 'void *'; \
> ? ? ? ? ?echo 'time_ifunc (void)'; \
> ? ? ? ? ?echo '{'; \
> ? ? ? ? ?echo ' ?PREPARE_VERSION_KNOWN (symver, LINUX_2_6);'; \
> ? ? ? ? ?echo ' ?return _dl_vdso_vsym ("__vdso_time", &symver);'; \
> ? ? ? ? ?echo '}'; \
> ? ? ? ? ?echo 'asm (".type time, %gnu_indirect_function");'; \
> ? ? ? ? ?echo 'asm (".globl __GI_time
> /bin/sh: 10: Syntax error: Unterminated quoted string
> make[3]: *** [/home/serg/projects/buildroot-2015.05/output/build/glibc-2.21/
> build/time/time.os] Error 2

If I remember correctly this is a shell portability issue, which
only occurs with x86_64 x32, when not using bash as your shell.
(f.e. Ubuntu uses dash as /bin/sh)

The bug is fixed in 2.22.
https://sourceware.org/bugzilla/show_bug.cgi?id=16704

best regards
 Waldemar
