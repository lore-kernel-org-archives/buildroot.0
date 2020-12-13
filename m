From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 13 Dec 2020 17:07:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build failure due to
 gcc -v
In-Reply-To: <CAPi7W80FOkm4g+zKQqpmzCdK-9X9H80ww=q_iJhpjqz9f4G4zQ@mail.gmail.com>
References: <20201203202853.616174-1-fontaine.fabrice@gmail.com>
 <20201205213101.72a80abc@windsurf.home>
 <CAPi7W80FOkm4g+zKQqpmzCdK-9X9H80ww=q_iJhpjqz9f4G4zQ@mail.gmail.com>
Message-ID: <20201213170736.4cb4859c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice, Thomas,

On Sat, 5 Dec 2020 21:44:05 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Hi,
> 
> Le sam. 5 d?c. 2020 ? 21:31, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :
> >
> > On Thu,  3 Dec 2020 21:28:53 +0100
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >  
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20
> > >
> > > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>  
> >
> > Why isn't gcc -v working ?  
> I don't know, you can see the full trace here:
> http://autobuild.buildroot.org/results/8605c16cc28316954ce8b9dcc266974390c5da20/rhash-1.4.0/config.log

May be a problem with the toolchain-wrapper?

	$ ls -l .../host/bin/arm-linux-gcc
.../host/bin/arm-linux-gcc -> toolchain-wrapper

	$ .../host/bin/arm-linux-gcc -v 
Using built-in specs.
COLLECT_GCC=.../host/opt/ext-toolchain/bin/arm-linux-gcc.br_real
COLLECT_LTO_WRAPPER=.../host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/lto-wrapper
Target: arm-buildroot-linux-uclibcgnueabihf
Configured with: ./configure --prefix=/opt/br-arm11-full-nothread-2020.02 --sysconfdir=/opt/br-arm11-full-nothread-2020.02/etc --enable-static --target=arm-buildroot-linux-uclibcgnueabihf --with-sysroot=/opt/br-arm11-full-nothread-2020.02/arm-buildroot-linux-uclibcgnueabihf/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --with-gmp=/opt/br-arm11-full-nothread-2020.02 --with-mpc=/opt/br-arm11-full-nothread-2020.02 --with-mpfr=/opt/br-arm11-full-nothread-2020.02 --with-pkgversion='Buildroot 2020.02' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --disable-libsanitizer --disable-tls --disable-threads --disable-libitm --disable-libatomic --without-isl --without-cloog --with-abi=aapcs-linux --with-cpu=arm1176jzf-s --with-fpu=vfp --with-float=hard --with-mode=arm --enable-languages=c,c++ --with-build-time-tools=/opt/br-arm11-full-nothread-2020.02/arm-buildroot-linux-uclibcgnueabihf/bin --enable-shared --disable-libgomp
Thread model: single
gcc version 8.3.0 (Buildroot 2020.02) 
COMPILER_PATH=.../host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/:.../host/opt/ext-toolchain/bin/../libexec/gcc/:.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/
LIBRARY_PATH=.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/:.../host/opt/ext-toolchain/bin/../lib/gcc/:.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/lib/:.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/lib/:.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/
COLLECT_GCC_OPTIONS='-mabi=aapcs-linux' '-mfpu=vfp' '-marm' '-mfloat-abi=hard' '-mcpu=arm1176jzf-s' '-v' '-mtls-dialect=gnu' '-march=armv6kz+fp'
 .../host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/collect2 -plugin .../host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/liblto_plugin.so -plugin-opt=.../host/opt/ext-toolchain/bin/../libexec/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/lto-wrapper -plugin-opt=-fresolution=/tmp/ccb9JJ1m.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --sysroot=.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot --eh-frame-hdr -dynamic-linker /lib/ld-uClibc.so.0 -X -m armelf_linux_eabi .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/crt1.o .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/crti.o .../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/crtbegin.o -L.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0 -L.../host/opt/ext-toolchain/bin/../lib/gcc -L.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/lib -L.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/lib -L.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib -z relro -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed .../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/crtend.o .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/crtn.o
.../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: .../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/crt1.o: in function `_start':
(.text+0x34): undefined reference to `main'
collect2: error: ld returned 1 exit status


The toolchain-wrapper seems to do/try some compile after the '-v'
handling (all output after the 'gcc version 8.3.0 (Buildroot 2020.02)'
line)

The gcc -v output from the host for compare:

	$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib64/gcc/x86_64-suse-linux/10/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:amdgcn-amdhsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-suse-linux
Configured with: ../configure --prefix=/usr --infodir=/usr/share/info --mandir=/usr/share/man --libdir=/usr/lib64 --libexecdir=/usr/lib64 --enable-languages=c,c++,objc,fortran,obj-c++,ada,go,d --enable-offload-targets=nvptx-none,amdgcn-amdhsa, --without-cuda-driver --enable-checking=release --disable-werror --with-gxx-include-dir=/usr/include/c++/10 --enable-ssp --disable-libssp --disable-libvtv --enable-cet=auto --disable-libcc1 --enable-plugin --with-bugurl=https://bugs.opensuse.org/ --with-pkgversion='SUSE Linux' --with-slibdir=/lib64 --with-system-zlib --enable-libstdcxx-allocator=new --disable-libstdcxx-pch --enable-libphobos --enable-version-specific-runtime-libs --with-gcc-major-version-only --enable-linker-build-id --enable-linux-futex --enable-gnu-indirect-function --program-suffix=-10 --without-system-libunwind --enable-multilib --with-arch-32=x86-64 --with-tune=generic --with-build-config=bootstrap-lto-lean --enable-link-mutex --build=x86_64-suse-linux --host=x86_64-suse-linux
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 10.2.1 20201202 [revision e563687cf9d3d1278f45aaebd03e0f66531076c9] (SUSE Linux) 


Regards,
Peter


> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com  
> Best Regards,
> 
> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
