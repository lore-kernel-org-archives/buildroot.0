From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 17 Nov 2016 08:53:14 +0100
Subject: [Buildroot] undefined reference to `dl_iterate_phdr'
In-Reply-To: <20161117020215.GA26390@octofox.metropolis>
References: <20161117020215.GA26390@octofox.metropolis>
Message-ID: <20161117075314.GE27313@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,
Max Filippov wrote,

> Hi Waldemar,
> 
> I see a number of buildroot build issues with the post-unification
> uclibc-ng versions (1.0.18 and 1.0.19) related to dl_iterate_phdr
> used in static builds.
> E.g.:
> 
> >       xtensa |                   autossh-1.4e | http://autobuild.buildroot.net/results/96807eda8a4b5a25225a82d7dd2b352b84fc3ddf
> >       xtensa |              berkeleydb-5.3.28 | http://autobuild.buildroot.net/results/886aecbbd664d11383c11c6cd9434a52f9c82b46
> >       xtensa |                    dvblast-3.0 | http://autobuild.buildroot.net/results/29ad877562d27896e3d68c06b8c1e3970750b51a
> 
> In fact the toolchain cannot produce static executable image
> unless extra -lc is given to the linker.
> 
> The failure looks like this:
> 
> xtensa-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -o autossh autossh.o -lnsl
> xtensa-buildroot-linux-uclibc/5.4.0/libgcc.a(unwind-dw2-fde-dip.o): In function `__gthread_mutex_lock':
> xtensa-buildroot-linux-uclibc/libgcc/./gthr-default.h:748: undefined reference to `dl_iterate_phdr'

A short test with OpenADK gives a working autossh binary:
wbx at helium:~/openadk $ file
root_qemu-xtensa_uclibc-ng_dc233c/usr/bin/autossh                                                                       
root_qemu-xtensa_uclibc-ng_dc233c/usr/bin/autossh: ELF 32-bit LSB
executable, Tensilica Xtensa, version 1 (SYSV), statically linked, stripped

/toolchain_qemu-xtensa_uclibc-ng_dc233c/usr/bin/xtensa-openadk-linux-uclibc-gcc -v                                                                 <
Using built-in specs.
COLLECT_GCC=./toolchain_qemu-xtensa_uclibc-ng_dc233c/usr/bin/xtensa-openadk-linux-uclibc-gcc
COLLECT_LTO_WRAPPER=/home/wbx/openadk/toolchain_qemu-xtensa_uclibc-ng_dc233c/usr/libexec/gcc/xtensa-openadk-linux-uclibc/6.2.0/lto-wrapper
Target: xtensa-openadk-linux-uclibc
Configured with:
/home/wbx/openadk/toolchain_build_qemu-xtensa_uclibc-ng_dc233c/w-gcc-6.2.0-1/gcc-6.2.0/configure
--prefix=/home/wbx/openadk/toolchain_qemu-xtensa_uclibc-ng_dc233c/usr
--with-bugurl=http://www.openadk.org/ --build=x86_64-linux-gnu
--host=x86_64-linux-gnu --target=xtensa-openadk-linux-uclibc
--with-gmp=/home/wbx/openadk/host_x86_64-linux-gnu/usr
--with-mpfr=/home/wbx/openadk/host_x86_64-linux-gnu/usr
--with-libelf=/home/wbx/openadk/host_x86_64-linux-gnu/usr
--disable-__cxa_atexit --with-system-zlib --with-gnu-ld
--with-gnu-as --disable-libsanitizer --disable-install-libiberty
--disable-libitm --disable-libmudflap --disable-libgomp
--disable-libcilkrts --disable-libquadmath
--disable-libquadmath-support --disable-decimal-float
--disable-libstdcxx-pch --disable-ppl-version-check
--disable-cloog-version-check --without-ppl --without-cloog
--without-isl --disable-werror --disable-nls --disable-lto
--enable-tls --enable-threads --enable-libatomic --disable-shared
--disable-libssp --disable-biarch --disable-multilib
--enable-languages=c
--with-build-sysroot='/../../target_qemu-xtensa_uclibc-ng_dc233c'
--with-sysroot='/../../target_qemu-xtensa_uclibc-ng_dc233c'
Thread model: posix
gcc version 6.2.0 (GCC) 

I recheck later with autossh 1.4e, as I only used 1.4b.
Latest uClibc-ng git used. But I don't see relevant changes to
1.0.19 release.

best regards
 Waldemar
