From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Mon, 2 Apr 2018 19:54:42 +0000
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <20180402083828.54d43b63@windsurf>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
 <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
 <20180402005738.1d603538@windsurf>
 <1B48158D-B250-46BC-A4B8-7A2816D2573A@storagecraft.com>
 <7E1DAB3C-F973-4E41-8E6F-E603021DCFF9@storagecraft.com>
 <20180402083828.54d43b63@windsurf>
Message-ID: <911E1AE2-32AB-4DE4-89B2-49F68BFE20BF@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

so? hopefully the following makes sense...

On Apr 1, 2018, at 11:38 PM, Thomas Petazzoni <thomas.petazzoni at bootlin.com<mailto:thomas.petazzoni@bootlin.com>> wrote:

Hello,

[Side note: it is customary on open-source mailing list to avoid
top-posting, and instead reply below the text you are replying to.
Thanks!]

On Sun, 1 Apr 2018 23:05:11 +0000, Charles Hardin wrote:

Oh, I think I might remember the problem on TARGET - HOST, notice the core_avx2
is our target and our buildslaves don?t have avx2 and rust has some stage where it
built a local tool and it didn?t run on the buildslave because it used the cross compiler

Well, that's a severe bug. If Rust uses the cross-compiler to build a
program that it then runs on the host, this is not going to work on a
number of situations. Your defconfig uses glibc for the target, and
your host most likely uses glibc as well, so there are some chances
that a tool built with the cross-compiler will also run on the host.
But if the CPU optimization options are different (like you had with
AVX2) or the C library is different than glibc, then the tool built
with the cross-compiler will definitely not run on the host.

However, we do have a x86-64 uClibc configuration in our autobuilders,
which is built on a x86-64 machine, and I don't think we have seen any
issue. So, I'm a bit puzzled.


When you fix the CXX linking you will see this in the stage0 - notice the target is unknown - not buildroot, and
so what happens is the tools use the ?same? compiler as the target for the host side, which means that I ended
up getting ?target? compiled with avx2 on a host that doesn?t support it

Copying stage0 std from stage0 (x86_64-unknown-linux-gnu -> x86_64-unknown-linux-gnu / x86_64-unknown-linux-gnu)
Building stage0 test artifacts (x86_64-unknown-linux-gnu -> x86_64-unknown-linux-gnu)

? snip snip ?

Building LLVM for x86_64-unknown-linux-gnu
running: "cmake" "/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/src/llvm" "-DLLVM_ENABLE_ASSERTIONS=OFF" "-DLLVM_TARGETS_TO_BUILD=X86;ARM;AArch64;Mips;PowerPC;SystemZ;JSBackend;MSP430;Sparc;NVPTX;Hexagon" "-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=" "-DLLVM_INCLUDE_EXAMPLES=OFF" "-DLLVM_INCLUDE_TESTS=OFF" "-DLLVM_INCLUDE_DOCS=OFF" "-DLLVM_ENABLE_ZLIB=OFF" "-DWITH_POLLY=OFF" "-DLLVM_ENABLE_TERMINFO=OFF" "-DLLVM_ENABLE_LIBEDIT=OFF" "-DLLVM_PARALLEL_COMPILE_JOBS=2" "-DLLVM_TARGET_ARCH=x86_64" "-DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-unknown-linux-gnu" "-DLLVM_LINK_LLVM_DYLIB=ON" "-DCMAKE_C_COMPILER=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc" "-DCMAKE_CXX_COMPILER=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-g++" "-DCMAKE_C_FLAGS=-ffunction-sections -fdata-sections -fPIC -m64" "-DCMAKE_CXX_FLAGS=-ffunction-sections -fdata-sections -fPIC -m64" "-DCMAKE_AR=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-ar" "-DCMAKE_INSTALL_PREFIX=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/build/x86_64-unknown-linux-gnu/llvm" "-DCMAKE_BUILD_TYPE=Release"
-- The C compiler identification is GNU 7.3.0
-- The CXX compiler identification is GNU 7.3.0
-- The ASM compiler identification is GNU
-- Found assembler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc
-- Check for working C compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc
-- Check for working C compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-g++
-- Check for working CXX compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-g++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
CMake Warning at CMakeLists.txt:140 (message):
  Job pooling is only available with Ninja generators.

leads to building this ?host? tool

[  2%] Built target LLVMTableGen

which cann?t run on that host because the compiler it used was the ?buildroot? compiler

[ 19%] Linking CXX static library ../../libLLVMDebugInfoPDB.a
[ 19%] Built target LLVMDebugInfoPDB
Makefile:151: recipe for target 'all' failed
make[3]: *** [all] Error 2
thread 'main' panicked at '
command did not execute successfully, got: exit code: 2

build script failed, must exit now', src/vendor/cmake/src/lib.rs:631<http://lib.rs:631>:4
note: Run with `RUST_BACKTRACE=1` for a backtrace.
finished in 267.033
failed to run: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/build/bootstrap/debug/bootstrap build
Build completed unsuccessfully in 0:06:22
package/pkg-generic.mk:247: recipe for target '/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/.stamp_built' failed
make[2]: *** [/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/.stamp_built] Error 1
Makefile:79: recipe for target '_all' failed
make[1]: *** [_all] Error 2
make[1]: Leaving directory '/home/vagrant/oneblox-buildroot/repos/buildroot'
Makefile:93: recipe for target 'br-x86_64-core_avx2-glibc-tmp.tar.bz2' failed
make: *** [br-x86_64-core_avx2-glibc-tmp.tar.bz2] Error 2


Which specific internal tool was causing the problem ?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180402/8acbdcd9/attachment.html>
