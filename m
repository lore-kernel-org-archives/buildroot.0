From: buildroot mail <brm@hyac.in.th>
Date: Wed, 11 Jul 2007 23:21:44 +0700
Subject: [Buildroot] buildroot for ARM AT91M40800 failed
Message-ID: <a512d1250707110921w51312b90k8dd3291675929c39@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
         I tried buildroot revision 19058 for an ARM board using AT91M40800
CPU, but it failed.
The .config file is attached. The first error I got was

|  CC libpthread/linuxthreads.old/specific.os
|  CC libpthread/linuxthreads.old/spinlock.os
|  CC libpthread/linuxthreads.old/wrapsyscall.os
| libpthread/linuxthreads.old/wrapsyscall.c:101: error: redefinition of
'msync'
| ./include/sys/mman.h:97: error: previous definition of 'msync' was here
| make[1]: *** [libpthread/linuxthreads.old/wrapsyscall.os] Error 1
| make[1]: Leaving directory
`/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29'
| make: ***
[/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
Error 2

         I tried fix that problem by comment out

| CANCELABLE_SYSCALL (int, msync, (__ptr_t addr, size_t length, int flags),
|                    (addr, length, flags))

        in file wrapsyscall.c. Well, I should comment out the mman.h instead
because, the next failed was

| libc/sysdeps/linux/common/msync.c:20: error: redefinition of 'msync'
| ./include/sys/mman.h:97: error: previous definition of 'msync' was here
| make[1]: *** [libc/sysdeps/linux/common/msync.os] Error 1
| make[1]: Leaving directory
`/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29'
| make: ***
[/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29/lib/libc.a]
Error 2

        but, since I already didn't touch mman.h, so I chose to put another
comment in msync.c at

| weak_alias(__libc_msync,msync)

        okay, now after this point, I can continue the building, and then
next error was

| make[1]: Entering directory
`/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29
/utils'
| /usr/bin/gcc ../utils/readelf.c  -o ../utils/readelf.host  -Wl,-s  -O2
-Wall -include ../include/elf.h
| make[1]: Leaving directory
`/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29
/utils'
| install -c
/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29/utils/ldd.host
/opt/cj/workplace/projects/buildroot/build_arm/staging_dir/usr/bin/ldd
| install: cannot stat
`/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29/utils/ldd.host':
No such file or directory
| make: ***
[/opt/cj/workplace/projects/buildroot/build_arm/staging_dir/usr/lib/libc.a]
Error 1

         This one is a bit strange, I don't think I need "ldd" since I try
to build static binary. And anyway, when
         call make once again, it can continue from that point, so I think I
will leave it like this for this moment.
         After that, the next error was

|
/opt/cj/workplace/projects/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.6/../../../../arm-linux-uclibc/bin/ld:
../utils/readelf: hidden symbol `_stdio_term' in ../lib/libc.a(_stdio.os) is
referenced by DSO
|
/opt/cj/workplace/projects/buildroot/build_arm/staging_dir/lib/gcc/arm-linux-uclibc/3.4.6/../../../../arm-linux-uclibc/bin/ld:
final link failed: | Nonrepresentable section on output
| collect2: ld returned 1 exit status
| make[2]: *** [../utils/readelf] Error 1
| make[1]: *** [utils] Error 2
| make[1]: Leaving directory
`/opt/cj/workplace/projects/buildroot/toolchain_build_arm/uClibc-0.9.29'
| make: ***
[/opt/cj/workplace/projects/buildroot/build_arm/root/usr/bin/ldd] Error 2

           And I stuck here. Does this error  the result from the previous
error?
           How can I fix this?

Cheers,
brm
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070711/ced464d2/attachment.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 2699 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070711/ced464d2/attachment.obj 
