From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 08:56:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <20191001055614.GA31145@ned>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
 <20190930230422.7a7d1173@windsurf.home>
 <20191001055614.GA31145@ned>
Message-ID: <20191001085605.501edf8e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Oct 2019 07:56:14 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> The D programming language needs a runtime, named libgphobos. When
> building a toolchain with uclibc-ng as libc, for qemu_aarch64_virt, the
> following error occurs:
> 
> ```
> libtool: compile:  /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/build/./gcc/gdc -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/build/./gcc/ -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/bin/ -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/lib/ -isystem /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/include -isystem /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/sys-include -fPIC -O2 -g -nostdinc -I ../../../../libphobos/libdruntime -I . -c ../../../../libphobos/libdruntime/core/internal/abort.d -fversion=Shared -o core/internal/.libs/abort.o
> /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/libphobos/libdruntime/core/sys/posix/sys/types.d:1134:39: error: undefined identifier '__SIZEOF_PTHREAD_ATTR_T'
>  1134 |         byte[__SIZEOF_PTHREAD_ATTR_T] __size;

This is off because __SIZEOF_PTHREAD_ATTR_T is defined by uClibc-ng,
for example for AArch64:

libpthread/nptl/sysdeps/unix/sysv/linux/aarch64/bits/pthreadtypes.h:#define __SIZEOF_PTHREAD_ATTR_T        64
libpthread/nptl/sysdeps/unix/sysv/linux/aarch64/bits/pthreadtypes.h:  char __size[__SIZEOF_PTHREAD_ATTR_T];

Perhaps there's an include missing in gcc ?

However, musl does not define __SIZEOF_PTHREAD_ATTR_T.

> I haven't dug into uclibc-ng code to find out the cause of the error.
> Hence the restriction to a glibc-based toolchain.

Fair enough, but it should be explained with a short comment above the
dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
