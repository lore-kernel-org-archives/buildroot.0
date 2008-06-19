From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 19 Jun 2008 12:53:51 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <485A3396.80701@cetrtapot.si>
References: <485A3396.80701@cetrtapot.si>
Message-ID: <485A3ABF.90707@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hinko Kocevar wrote:
> Hello,
> 
> I'm new to the uclibc buildroot. I've noticed that there are two repositories: GIT and SVN. GIT looks more up2date. Is GIT the tree to use?
> 
> Also, I'm trying to create a uclibc toolchain for cris architecture. 

And here is the 1st problem with cris toolchain. When building gcc-final libgomp wants threads... The gcc was configured with threads enabled and BR2 has BR2_PTHREADS_OLD=y. Here is gcc configure line:
$ /work/stage/buildroot/toolchain_build_cris/gcc-4.3.0/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc --enable-languages=c --with-sysroot=/work/stage/buildroot/build_cris/staging_dir --with-build-time-tools=/work/stage/buildroot/build_cris/staging_dir/usr/cris-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared --with-gmp=/work/stage/buildroot/toolchain_build_cris/gmp --with-mpfr=/work/stage/buildroot/toolchain_build_cris/mpfr --disable-nls --enable-threads --disable-multilib --disable-largefile

FAILURE:

...
checking if libtool supports shared libraries... yes
checking whether to build shared libraries... no
checking whether to build static libraries... yes
libtool.m4: error: problem compiling FC test program
checking for cris-linux-uclibc-gfortran -B/usr/cris-linux-uclibc/bin/ -B/usr/cris-linux-uclibc/lib/ -isystem /usr/cris-linux-uclibc/include -isystem /usr/cris-linux-uclibc/sys-include option to produce PIC... -fPIC
checking if cris-linux-uclibc-gfortran -B/usr/cris-linux-uclibc/bin/ -B/usr/cris-linux-uclibc/lib/ -isystem /usr/cris-linux-uclibc/include -isystem /usr/cris-linux-uclibc/sys-include PIC flag -fPIC works... no
checking if cris-linux-uclibc-gfortran -B/usr/cris-linux-uclibc/bin/ -B/usr/cris-linux-uclibc/lib/ -isystem /usr/cris-linux-uclibc/include -isystem /usr/cris-linux-uclibc/sys-include static flag -static works... no
checking if cris-linux-uclibc-gfortran -B/usr/cris-linux-uclibc/bin/ -B/usr/cris-linux-uclibc/lib/ -isystem /usr/cris-linux-uclibc/include -isystem /usr/cris-linux-uclibc/sys-include supports -c -o file.o... no
checking if cris-linux-uclibc-gfortran -B/usr/cris-linux-uclibc/bin/ -B/usr/cris-linux-uclibc/lib/ -isystem /usr/cris-linux-uclibc/include -isystem /usr/cris-linux-uclibc/sys-include supports -c -o file.o... (cached) no
checking whether the cris-linux-uclibc-gfortran -B/usr/cris-linux-uclibc/bin/ -B/usr/cris-linux-uclibc/lib/ -isystem /usr/cris-linux-uclibc/include -isystem /usr/cris-linux-uclibc/sys-include linker (/work/stage/buildroot/toolchain_build_cris/gcc-4.3.0-final/./gcc/collect-ld) supports shared libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
checking how to hardcode library paths into programs... immediate
checking for ANSI C header files... (cached) yes
checking whether time.h and sys/time.h may both be included... yes
checking for unistd.h... (cached) yes
checking semaphore.h usability... yes
checking semaphore.h presence... yes
checking for semaphore.h... yes
checking sys/loadavg.h usability... no
checking sys/loadavg.h presence... no
checking for sys/loadavg.h... no
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
looking for a compliant stdint.h in stdint.h, checking for uintmax_t... yes
checking for uintptr_t... yes
checking for int_least32_t... yes
checking for int_fast32_t... yes
checking for uint64_t... yes
checking what to include in gstdint.h... stdint.h (already complete)
configure: error: Pthreads are required to build libgomp
make[2]: *** [configure-target-libgomp] Error 1
make[2]: Leaving directory `/work/stage/buildroot/toolchain_build_cris/gcc-4.3.0-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/work/stage/buildroot/toolchain_build_cris/gcc-4.3.0-final'
make: *** [/work/stage/buildroot/toolchain_build_cris/gcc-4.3.0-final/.compiled] Error 2


I'll try older gcc version to see if the error persists.

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
