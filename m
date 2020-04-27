From: Olivier, Alain [COMRES/EUR/BLU] <Alain.Olivier@Emerson.com>
Date: Mon, 27 Apr 2020 06:49:35 +0000
Subject: [Buildroot] [Buildroot 2020.02.1] Problems with x86_64-jaguar
 buildroot-toolchain-built kernel
In-Reply-To: <BL0PR10MB2866A594CDE0E5FD74BC767BFFAE0@BL0PR10MB2866.namprd10.prod.outlook.com>
References: <BL0PR10MB2866A594CDE0E5FD74BC767BFFAE0@BL0PR10MB2866.namprd10.prod.outlook.com>
Message-ID: <BL0PR10MB286624EC6E8417F3DA28E257FFAF0@BL0PR10MB2866.namprd10.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello there,

I am experiencing the following problem when building a basic environment for a board running on a AMD GX-222GC (should be Jaguar subarch).
The default external toolchain is amd-2016.11-19 from CodeBench. Kernel built with that toolchain boots correctly.
Instead, if I build the same kernel, same configuration, with the toolchain built by buildroot, the kernel doen not boot! Not even a kernel panic, machine just resets.

These are the results of gcc -v
CodeBench:
$ output/host/usr/bin/x86_64-amd-linux-gnu-gcc -v
Using built-in specs.
COLLECT_GCC=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/opt/ext-toolchain/bin/x86_64-amd-linux-gnu-gcc
COLLECT_LTO_WRAPPER=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/opt/ext-toolchain/bin/../libexec/gcc/x86_64-amd-linux-gnu/6.2.0/lto-wrapper
Target: x86_64-amd-linux-gnu
Configured with: /scratch/jmyers/amd-lite/src/gcc-6-2016.11/configure --build=i686-pc-linux-gnu --host=i686-pc-linux-gnu --target=x86_64-amd-linux-gnu --enable-threads --disable-libmudflap --disable-libstdcxx-pch --enable-extra-sgxxlite-multilibs --with-arch=btver2 --with-cpu=btver2 --with-gnu-as --with-gnu-ld --with-specs='-D__CS_SOURCERYGXX_MAJ__=2016 -D__CS_SOURCERYGXX_MIN__=11 -D__CS_SOURCERYGXX_REV__=19' --enable-languages=c,c++ --enable-shared --enable-lto --enable-symvers=gnu --enable-__cxa_atexit --with-glibc-version=2.24 --with-pkgversion='Sourcery CodeBench Lite 2016.11-19' --with-bugurl=https://sourcery.mentor.com/GNUToolchain/<https://urldefense.proofpoint.com/v2/url?u=https-3A__sourcery.mentor.com_GNUToolchain_&d=DwQFAw&c=jOURTkCZzT8tVB5xPEYIm3YJGoxoTaQsQPzPKJGaWbo&r=GRglAZYePosf_lPzwVu-TAr6NhBHNTaO44HwSmVR9cw&m=hjFUodgGyWKtnZNKi8G_JNXNrbX-j8sNfEfnL3zkxJg&s=28lkkdJ_0LP0mdZ2YX7Hr7EiAH9NpZ4yep5s6PhHcSI&e=> --disable-nls --prefix=/opt/codesourcery --with-sysroot=/opt/codesourcery/x86_64-amd-linux-gnu/libc --with-build-sysroot=/scratch/jmyers/amd-lite/install/opt/codesourcery/x86_64-amd-linux-gnu/libc --with-gmp=/scratch/jmyers/amd-lite/obj/pkg-2016.11-19-x86_64-amd-linux-gnu/amd-2016.11-19-x86_64-amd-linux-gnu.extras/host-libs-i686-pc-linux-gnu/usr --with-mpfr=/scratch/jmyers/amd-lite/obj/pkg-2016.11-19-x86_64-amd-linux-gnu/amd-2016.11-19-x86_64-amd-linux-gnu.extras/host-libs-i686-pc-linux-gnu/usr --with-mpc=/scratch/jmyers/amd-lite/obj/pkg-2016.11-19-x86_64-amd-linux-gnu/amd-2016.11-19-x86_64-amd-linux-gnu.extras/host-libs-i686-pc-linux-gnu/usr --with-isl=/scratch/jmyers/amd-lite/obj/pkg-2016.11-19-x86_64-amd-linux-gnu/amd-2016.11-19-x86_64-amd-linux-gnu.extras/host-libs-i686-pc-linux-gnu/usr --enable-libgomp --enable-libitm --enable-libatomic --disable-libssp --disable-libcc1 --enable-poison-system-directories --with-python-dir=x86_64-amd-linux-gnu/share/gdb/python --with-build-time-tools=/scratch/jmyers/amd-lite/install/opt/codesourcery/x86_64-amd-linux-gnu/bin --with-build-time-tools=/scratch/jmyers/amd-lite/install/opt/codesourcery/x86_64-amd-linux-gnu/bin SED=sed
Thread model: posix
gcc version 6.2.0 (Sourcery CodeBench Lite 2016.11-19)

Buildroot:
Using built-in specs.
COLLECT_GCC=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/opt/ext-toolchain/bin/x86_64-linux-gcc.br_real
COLLECT_LTO_WRAPPER=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/opt/ext-toolchain/bin/../libexec/gcc/x86_64-buildroot-linux-gnu/7.5.0/lto-wrapper
Target: x86_64-buildroot-linux-gnu
Configured with: ./configure --prefix=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host --sysconfdir=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/etc --enable-static --target=x86_64-buildroot-linux-gnu --with-sysroot=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/x86_64-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --with-gmp=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host --with-mpc=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host --with-mpfr=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host --with-pkgversion='Buildroot 2020.02.1-00007-g345f377da1-dirty' --with-bugurl=http://bugs.buildroot.net/<https://urldefense.proofpoint.com/v2/url?u=http-3A__bugs.buildroot.net_&d=DwQFAw&c=jOURTkCZzT8tVB5xPEYIm3YJGoxoTaQsQPzPKJGaWbo&r=GRglAZYePosf_lPzwVu-TAr6NhBHNTaO44HwSmVR9cw&m=hjFUodgGyWKtnZNKi8G_JNXNrbX-j8sNfEfnL3zkxJg&s=PlQ707PIhSCbmNL2wUQH7xHm7hYzsvgHCkXG6xJg2Hw&e=> --enable-libquadmath --enable-tls --enable-threads --without-isl --without-cloog --with-arch=btver2 --enable-languages=c,c++ --with-build-time-tools=/media/alain/9977d84d-11ba-45b3-8fec-87ae51a7c338/tmp/buildroot_toolchain/output/host/x86_64-buildroot-linux-gnu/bin --enable-shared --disable-libgomp
Thread model: posix
gcc version 7.5.0 (Buildroot 2020.02.1-00007-g345f377da1-dirty)


I even tried gcc 8 without resolving.

Thanks in advance.
Alain.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200427/8b4b3ea4/attachment.html>
