From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 15:38:46 +0200
Subject: [Buildroot] [PATCH v2] libdrm: fix static build (tests/nouveau)
In-Reply-To: <20190809231908.22209-1-ps.report@gmx.net>
References: <20190809231908.22209-1-ps.report@gmx.net>
Message-ID: <20190811153846.68028925@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for working on this topic. Some questions/comments below.

On Sat, 10 Aug 2019 01:19:08 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Some toolchains (e.g. br-arm-cortex-m4-full) provide empty libdl
> libraries. This fools the dynamic/static detection for tests/nouveau,
> so explicit check for library type instead.
> 
> Fixes [1]:
> 
>   ../tests/nouveau/threaded.c:24:10: fatal error: dlfcn.h: No such file or directory

So the error is about not finding a header.

> + # Among others FreeBSD does not have a separate dl library.
> + if not cc.has_function('dlsym')
> ++  # fooled in case empty libdl provided, e.g. toolchain br-arm-cortex-m4-full
> +   dep_dl = cc.find_library('dl', required : with_nouveau)

What about instead checking for the availability of dlfcn.h, in
addition to checking the availability of the libdl library ?

Also, how come the cc.has_function('dlsym') checks returns true ? I
guess in a static library configuration, this check should return false.

Also, could you drop the references to br-arm-cortex-m4-full, so that
the patch can be upstreamed ?

BTW, with uClibc-ng and musl, the libdl library is always empty,
regardless of whether it has dynamic library support or not. Here is a
uClibc-ng toolchain, with dynamic library support:

-rw-r--r-- 1 thomas thomas 8  1 ao?t  22:23 output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libdl.a

Indeed, since quite a while, uClibc-ng is all in a single file,
libc.so, including symbols that used to be in libdl.so:

$ ./output/host/bin/arm-linux-readelf -s output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libc.so.1  | grep "FUNC.*dlsym"
   884: 00058fe0   468 FUNC    GLOBAL DEFAULT    8 dlsym
  7356: 00058fe0   468 FUNC    GLOBAL DEFAULT    8 dlsym

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
