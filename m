From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 1 Oct 2019 07:56:14 +0200
Subject: [Buildroot] [PATCH 2/2] package/gcc: add support for D language
In-Reply-To: <20190930230422.7a7d1173@windsurf.home>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190929165601.20269-3-eric.le.bihan.dev@free.fr>
 <20190930230422.7a7d1173@windsurf.home>
Message-ID: <20191001055614.GA31145@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 2019-09-30 23:04, Thomas Petazzoni wrote:
> Hello Eric,
>
> On Sun, 29 Sep 2019 18:56:01 +0200
> Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
>
> > +config BR2_TOOLCHAIN_BUILDROOT_DLANG
> > +	bool "Enable D language support"
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > +	depends on BR2_TOOLCHAIN_USES_GLIBC
>
> Could you explain why glibc is necessary as a dependency here ?

The D programming language needs a runtime, named libgphobos. When
building a toolchain with uclibc-ng as libc, for qemu_aarch64_virt, the
following error occurs:

```
libtool: compile:  /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/build/./gcc/gdc -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/build/./gcc/ -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/bin/ -B/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/lib/ -isystem /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/include -isystem /home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/host/aarch64-buildroot-linux-uclibc/sys-include -fPIC -O2 -g -nostdinc -I ../../../../libphobos/libdruntime -I . -c ../../../../libphobos/libdruntime/core/internal/abort.d -fversion=Shared -o core/internal/.libs/abort.o
/home/eric/build/demo-dlang/qemu/aarch64/virt/uclibc/build/host-gcc-final-9.2.0/libphobos/libdruntime/core/sys/posix/sys/types.d:1134:39: error: undefined identifier '__SIZEOF_PTHREAD_ATTR_T'
 1134 |         byte[__SIZEOF_PTHREAD_ATTR_T] __size;
      |                                       ^
```

I haven't dug into uclibc-ng code to find out the cause of the error.
Hence the restriction to a glibc-based toolchain.

Regards,

--
ELB
