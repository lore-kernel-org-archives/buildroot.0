From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Oct 2019 21:34:08 +0200
Subject: [Buildroot] Build failure on upgrade to 2019.08.1
In-Reply-To: <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
References: <CAJJ6jxvGsZ0SYgivex5jGCHg21_acu=kp5CdRO2FF2K_xhUZwQ@mail.gmail.com>
 <fced002e-90cf-30e7-d515-f546daaf77bf@mind.be>
 <CAJJ6jxuRAd76-cOzKgGhtq0nvx+w0MeoMTCKdHzNmsGP+Rudzg@mail.gmail.com>
 <90524ee3-a438-fb38-da43-8632066743af@mind.be>
 <CAJJ6jxvGXS4L0fjp16WHGtdd6fKMhTPcCsS2aeaZPrkW0MBNYw@mail.gmail.com>
Message-ID: <fbfd215f-42ec-74e8-b1b6-5650624d7ca0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Steve,

 I'll continue try to debug remotely but it gets harder and harder :-)

On 10/10/2019 18:09, Steve Calfee wrote:
[snip]
> I don't see anything obviously wrong in the output. I hope it is not
> one of those "order matters" in the link command.

 Order matters generally only applies to static linking.


[snip]
> Toolchain wrapper executing:
> '/home/calfee/edi-workspace/buildroot/../toolchain/output/host/usr/bin/arm-buildroot-linux-gnueabi-gcc.br_real'
> '--sysroot' '/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot'

 This is what I wanted to double-check. Looks correct.


> gcc version 8.3.0 (Buildroot 2019.11-git-00838-g196e3d2)

 Oh, I hadn't noticed this bit before: you're building the toolchain with
Buildroot master and use it with Buildroot 2019.8.1. Not that it should matter,
but I'll just try that use case now.

[snip]
> -L/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0
> -L/home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/lib

 Clutching at straws here, but: is this also the location where you originally
built the toolchain, or did you move it around? I would in fact expect
libpthread.so.0 to be in this directory as well..

> -L/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/lib

 So the directory containing libpthread.so.0 *is* included with -L...

> -L/home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib
> --no-as-needed dbus-monitor.o dbus-print-message.o tool-common.o
> ../dbus/.libs/libdbus-1.so -rpath

 Maybe this .so file has an RPATH and maybe for some reason the linker uses that
instead of -L for the NEEDED entries?

 Or maybe the fact that a -rpath is specified on the command line overrides the
-L options?

 But in either case, I should be able to reproduce...

 Could you post the defconfig for your toolchain and for the failing config?

 Regards,
 Arnout

> /home/calfee/edi-workspace/buildroot/output/build/dbus-1.12.16/dbus/.libs
> -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s
> --no-as-needed /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/crtend.o
> /home/calfee/edi-workspace/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/crtn.o
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> warning: libpthread.so.0, needed by ../dbus/.libs/libdbus-1.so, not
> found (try using -rpath or -rpath-link)
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_mutexattr_init at GLIBC_2.4'
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_mutexattr_destroy at GLIBC_2.4'
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_condattr_setclock at GLIBC_2.4'
> /home/calfee/edi-workspace/toolchain/output/host/lib/gcc/arm-buildroot-linux-gnueabi/8.3.0/../../../../arm-buildroot-linux-gnueabi/bin/ld:
> ../dbus/.libs/libdbus-1.so: undefined reference to
> `pthread_mutexattr_settype at GLIBC_2.4'
> collect2: error: ld returned 1 exit status
> calfee at dock-container:~/edi-workspace/buildroot/output/build/dbus-1.12.16/tools$
> 
