From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 18 Nov 2015 18:28:09 +0900
Subject: [Buildroot] [PATCH v2] package/gauche: fix 'dlfcn.h: No such
 file' on autobuild
In-Reply-To: Your message of Tue, 17 Nov 2015 21:40:10 +0100.
 <20151117214010.64de14ab@free-electrons.com>
Message-ID: <201511180928.tAI9S9AC005215@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for your test.
Realy... I reproduced this.

I will send new patch next.

Regards,
Kawashima

Thomas Petazzoni writes:
> Dear Hiroshi Kawashima,
> 
> On Wed, 18 Nov 2015 00:50:10 +0900, Hiroshi Kawashima wrote:
> > Ported from bdwgc package.
> > When build with BR2_STATIC_LIBS environment, prevent to use dlopen().
> > 
> > Fix:
> > http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92
> 536419c1
> > 
> > Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
> 
> This patch is not sufficient. It still fails to build, later, because
> gauche tries to build a shared library. So I believe gauche really
> needs to depend on !BR2_STATIC_LIBS. Here is the failure you get:
> 
> gcc -O2 -DHAVE_CONFIG_H -o arm-buildroot-linux-uclibcgnueabi-gauche-config ga
> uche-config.c
> TARGETLIB=`pwd`  /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux
> -gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -
> static -std=gnu99 -DGC_NO_DLOPEN -fPIC -Wl,--rpath -Wl,`pwd` -L. -static  -o 
> gauche-config gauche-config.o -lcrypt -lutil -lrt -lm  -lpthread
> TARGETLIB=`pwd`  /home/thomas/projets/buildroot/output/host/usr/bin/arm-linux
> -gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -
> static -std=gnu99 -DGC_NO_DLOPEN -fPIC -Wl,--rpath -Wl,`pwd` -L. -static  -Wl
> ,--soname,libgauche-0.9.so.0.4  -shared -o libgauche-0.9.so box.o core.o vm.o
>  compaux.o macro.o code.o error.o class.o prof.o collection.o boolean.o char.
> o string.o list.o hash.o treemap.o bits.o port.o write.o read.o vector.o weak
> .o symbol.o gloc.o compare.o regexp.o signal.o parameter.o module.o proc.o nu
> mber.o bignum.o load.o paths.o lazy.o repl.o autoloads.o system.o compile.o l
> ibalpha.o libbool.o libchar.o libcode.o libcmp.o libdict.o libeval.o libexc.o
>  libfmt.o libio.o liblazy.o liblist.o libmisc.o libmod.o libnum.o libobj.o li
> bomega.o libproc.o librx.o libstr.o libsym.o libsys.o libvec.o `ls -1 ../gc/.
> libs/*.o | grep -v '/cord' | grep -v '/staticrootslib'` `ls -1 ../gc/libatomi
> c_ops/src/.libs/*.o` -lcrypt -lutil -lrt -lm  -lpthread
> ls: cannot access ../gc/.libs/*.o: No such file or directory
> ls: cannot access ../gc/libatomic_ops/src/.libs/*.o: No such file or director
> y
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnue
> abi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_fini':
> __uClibc_main.c:(.text+0x138): undefined reference to `__fini_array_end'
> __uClibc_main.c:(.text+0x13c): undefined reference to `__fini_array_start'
> __uClibc_main.c:(.text+0x140): undefined reference to `__fini_array_start'
> /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnue
> abi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_main':
> __uClibc_main.c:(.text+0x568): undefined reference to `__preinit_array_start'
> __uClibc_main.c:(.text+0x56c): undefined reference to `__preinit_array_end'
> __uClibc_main.c:(.text+0x570): undefined reference to `__preinit_array_start'
> __uClibc_main.c:(.text+0x574): undefined reference to `__init_array_start'
> __uClibc_main.c:(.text+0x578): undefined reference to `__init_array_end'
> __uClibc_main.c:(.text+0x57c): undefined reference to `__init_array_start'
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/a
> rm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibc
> gnueabi/bin/ld: libgauche-0.9.so: hidden symbol `__fini_array_end' isn't defi
> ned
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/a
> rm-buildroot-linux-uclibcgnueabi/4.9.3/../../../../arm-buildroot-linux-uclibc
> gnueabi/bin/ld: final link failed: Bad value
> 
> When building the following minimal configuration:
> 
> BR2_arm=y
> BR2_STATIC_LIBS=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarball
> s/br-arm-full-static-2015.08-647-gc356fb2.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_GAUCHE=y
> # BR2_TARGET_ROOTFS_TAR is not set
> 
> Best regards,
> 
> Thomas
============================================================
    Hiroshi Kawashima
