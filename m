From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Nov 2016 18:02:15 -0800
Subject: [Buildroot] undefined reference to `dl_iterate_phdr'
Message-ID: <20161117020215.GA26390@octofox.metropolis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

I see a number of buildroot build issues with the post-unification
uclibc-ng versions (1.0.18 and 1.0.19) related to dl_iterate_phdr
used in static builds.
E.g.:

>       xtensa |                   autossh-1.4e | http://autobuild.buildroot.net/results/96807eda8a4b5a25225a82d7dd2b352b84fc3ddf
>       xtensa |              berkeleydb-5.3.28 | http://autobuild.buildroot.net/results/886aecbbd664d11383c11c6cd9434a52f9c82b46
>       xtensa |                    dvblast-3.0 | http://autobuild.buildroot.net/results/29ad877562d27896e3d68c06b8c1e3970750b51a

In fact the toolchain cannot produce static executable image
unless extra -lc is given to the linker.

The failure looks like this:

xtensa-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o autossh autossh.o -lnsl
xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `__gthread_mutex_lock':
xtensa-buildroot-linux-uclibc/libgcc/./gthr-default.h:748: undefined reference to `dl_iterate_phdr'

and is caused by the reference to dl_iterate_phdr from the DWARF
unwinder in the libgcc.
The linker command line parameters are the following (irrelevant
paths stripped):

-o autossh crt1.o crti.o crtbegin.o autossh.o -lnsl -lgcc -lc -lgcc crtend.o crtn.o

The chain of dependencies is the following:

usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(init.os) is requested by
                              usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(__uClibc_main.os) (__pthread_initialize_minimal)

usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(unwind.os) is requested by
                              usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(init.os) (__GI___pthread_unwind)

usr/lib/gcc/xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-xtensa.o) is requested by
                              usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(unwind.os) (_Unwind_GetCFA)

usr/lib/gcc/xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o) is requested by
                              usr/lib/gcc/xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-xtensa.o) (_Unwind_Find_FDE)

the following line only appears if extra -lc is given to the linker
(so that its parameters become
-o autossh crt1.o crti.o crtbegin.o autossh.o -lnsl -lgcc -lc -lgcc crtend.o crtn.o):

usr/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(dl-iterate-phdr.os) is requested by
                              usr/lib/gcc/xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o) (dl_iterate_phdr)

Prior to uclibc-1.0.18 release it used to work because a
call to __pthread_initialize_minimal was being resolved to
function defined in libpthread/nptl/sysdeps/generic/libc-tls.c
which does not reference pthread_unwind.

Any idea how to fix this?

-- 
Thanks.
-- Max
