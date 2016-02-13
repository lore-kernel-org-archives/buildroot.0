From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 16:31:16 +0100
Subject: [Buildroot] Issue with toolchain wrapper changes
Message-ID: <20160213163116.745e4507@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

I am facing some issues with the toolchain wrapper, which I believe
were introduced by the changes done to use the toolchain wrapper also
for the internal toolchain backend.

As you know, Buildroot installs all its host stuff in $(HOST_DIR)/usr,
and not directly under $(HOST_DIR). For the autobuilders, I build a
number of toolchains with Buildroot, which are then used as pre-built
external toolchains by the autobuilders. In order for those toolchains
to look like conventional toolchains, at the end of their build, I do:

	mv /path/to/host/usr/* /path/to/host/
	rmdir /path/to/host/usr/

Which moves everything outside of the usr/ subdirectory, and removes
the usr/ subdirectory itself. This used to work perfectly fine, but
now, it fails to find the .br_real equivalent of the command being
executed. Example:

thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ ls
arm-buildroot-linux-musleabi  bin  include  lib  libexec  share
thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ ./bin/arm-linux-gcc -v
/home/thomas/x-tools/usr/bin/arm-linux-gcc.br_real: No such file or directory

As you can see, it looks for arm-linux-gcc.br_real
in /home/thomas/x-tools/usr/bin, while it is
in /home/thomas/x-tools/armv5-musl-new-2016.02-1/bin/.

If I move everything again under a usr/ subdirectory, it all works fine
again:

thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ mkdir usr
thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ mv * usr/
mv: cannot move ?usr? to a subdirectory of itself, ?usr/usr?
thomas at skate:~/x-tools/armv5-musl-new-2016.02-1$ ./usr/bin/arm-linux-gcc -v
Using built-in specs.
COLLECT_GCC=/home/thomas/x-tools/armv5-musl-new-2016.02-1/usr/bin/arm-linux-gcc.br_real
COLLECT_LTO_WRAPPER=/home/thomas/x-tools/armv5-musl-new-2016.02-1/usr/bin/../libexec/gcc/arm-buildroot-linux-musleabi/5.3.0/lto-wrapper
Target: arm-buildroot-linux-musleabi
Configured with: ./configure --prefix=/build/armv5-musl-new-2016.02-1/usr --sysconfdir=/build/armv5-musl-new-2016.02-1/etc --enable-static --target=arm-buildroot-linux-musleabi --with-sysroot=/build/armv5-musl-new-2016.02-1/usr/arm-buildroot-linux-musleabi/sysroot --disable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --with-gmp=/build/armv5-musl-new-2016.02-1/usr --with-mpfr=/build/armv5-musl-new-2016.02-1/usr --with-pkgversion='Buildroot 2016.02-rc1-00006-gbb13242' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --disable-libsanitizer --disable-tls --disable-libmudflap --enable-threads --with-mpc=/build/armv5-musl-new-2016.02-1/usr --without-isl --without-cloog --with-float=soft --disable-decimal-float --with-abi=aapcs-linux --with-cpu=arm926ej-s --with-float=soft --with-mode=arm --enable-languages=c,c++ --with-build-time-tools=/build/armv5-musl-new-2016.02-1/usr/arm-buildroot-linux-musleabi/bin --enable-shared --disable-libgomp
Thread model: posix
gcc version 5.3.0 (Buildroot 2016.02-rc1-00006-gbb13242) 

Now, I'm sure the problem is at the beginning of the
toolchain-wrapper.c main() function. But I'm wondering what is the
proper fix for this. Should I fix the toolchain-wrapper logic to
properly work in such a situation ? Should we remove the usr/
sub-directory completely from Buildroot, as you suggested multiple
times already ?

Do you have some other suggestions ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
