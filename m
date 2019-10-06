From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 6 Oct 2019 17:12:28 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <20191001085605.501edf8e@windsurf.home>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
 <20190930230422.7a7d1173@windsurf.home>
 <20191001055614.GA31145@ned>
 <20191001085605.501edf8e@windsurf.home>
Message-ID: <20191006151228.GA5258@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-10-01 08:56, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 1 Oct 2019 07:56:14 +0200
> Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
>
> > The D programming language needs a runtime, named libgphobos. When
> > building a toolchain with uclibc-ng as libc, for qemu_aarch64_virt, the
> > following error occurs:
> >
> > ```
> > libtool: compile:  /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/build/./gcc/gdc -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/build/./gcc/ -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/bin/ -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/lib/ -isystem /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/include -isystem /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/sys-include -fPIC -O2 -g -nostdinc -I ../../../../libphobos/libdruntime -I . -c ../../../../libphobos/libdruntime/core/internal/abort.d -fversion=Shared -o core/internal/.libs/abort.o
> > /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/libphobos/libdruntime/core/sys/posix/sys/types.d:1134:39: error: undefined identifier '__SIZEOF_PTHREAD_ATTR_T'
> >  1134 |         byte[__SIZEOF_PTHREAD_ATTR_T] __size;
>
> This is off because __SIZEOF_PTHREAD_ATTR_T is defined by uClibc-ng,
> for example for AArch64:
>
> libpthread/nptl/sysdeps/unix/sysv/linux/aarch64/bits/pthreadtypes.h:#define __SIZEOF_PTHREAD_ATTR_T        64
> libpthread/nptl/sysdeps/unix/sysv/linux/aarch64/bits/pthreadtypes.h:  char __size[__SIZEOF_PTHREAD_ATTR_T];
>
> Perhaps there's an include missing in gcc ?
>
> However, musl does not define __SIZEOF_PTHREAD_ATTR_T.
>
> > I haven't dug into uclibc-ng code to find out the cause of the error.
> > Hence the restriction to a glibc-based toolchain.
>
> Fair enough, but it should be explained with a short comment above the
> dependency.

Looking at libphobos/libdruntime/core/sys/posix/sys/types.d turned out
to be very informative. It contains a list of definitions per C-runtime
mapped to architecture/OS. Bionic, uclibc and musl are supported but
only for a limited set of architectures. For some of them,
__SIZEOF_PTHREAD_ATTR_T and friends are redefined.

ARM is supported for uclibc, but Aarch64 is not (hence the build
failure). Adding the missing definitions from
libpthread/nptl/sysdeps/unix/sysv/linux/aarch64/bits/pthreadtypes.h is
trivial, but then the build chokes on siginfo_t not being correct. So
deep work is required.

Even some combinations defined in types.d fail to build (e.g.
x86_64+musl or ARM/uclibc).

In the end, glibc turns out to be the only C-runtime covering most of
the architectures supported by Buildroot: x86_64, Aarch64, ARM,
MIPS{32,64}, PPC{,64}, RISCV32 and SPARC64.

In order to restrict the supported architectures, should
package/gcc/Config.in.host be updated to look like this?

```
config BR2_TOOLCHAIN_BUILDROOT_DLANG
	bool "Enable D language support"
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
	depends on BR2_TOOLCHAIN_USES_GLIBC
	depends on !BR2_arc
	depends on !BR2_csky
	depends on !BR2_m68k
	depends on !BR2_microblaze
	depends on !BR2_nds32
	depends on !BR2_nios2
	depends on !BR2_or1k
	depends on !BR2_sparc
	depends on !BR2_xtensa
```

Regards,

--
ELB
