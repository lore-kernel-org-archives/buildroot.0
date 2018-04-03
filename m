From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Tue, 3 Apr 2018 22:11:25 +0000
Subject: [Buildroot] [PATCH 1/1] rust: make sure the cxx compiler is
 also set for the target
In-Reply-To: <20180403220132.GA20271@itchy>
References: <20180228173852.66069-1-charles.hardin@storagecraft.com>
 <20180402004857.7e7e46c1@windsurf>
 <F8479AD1-B731-4235-A6C6-A517165DD553@storagecraft.com>
 <20180402005738.1d603538@windsurf>
 <1B48158D-B250-46BC-A4B8-7A2816D2573A@storagecraft.com>
 <7E1DAB3C-F973-4E41-8E6F-E603021DCFF9@storagecraft.com>
 <20180402083828.54d43b63@windsurf>
 <911E1AE2-32AB-4DE4-89B2-49F68BFE20BF@storagecraft.com>
 <20180403220132.GA20271@itchy>
Message-ID: <D6CBB3FC-2D17-45B6-91A9-9001C4150408@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,

Good to talk to you again?

> On Apr 3, 2018, at 3:01 PM, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> 
> Hi!
> 
> On 2018-04-02 19:54, Charles Hardin wrote:
>> so? hopefully the following makes sense...
>> 
>> When you fix the CXX linking you will see this in the stage0 - notice the target is unknown - not buildroot, and
>> so what happens is the tools use the ?same? compiler as the target for the host side, which means that I ended
>> up getting ?target? compiled with avx2 on a host that doesn?t support it
>> 
>> Copying stage0 std from stage0 (x86_64-unknown-linux-gnu -> x86_64-unknown-linux-gnu / x86_64-unknown-linux-gnu)
>> Building stage0 test artifacts (x86_64-unknown-linux-gnu -> x86_64-unknown-linux-gnu)
>> 
>> ? snip snip ?
>> 
>> Building LLVM for x86_64-unknown-linux-gnu
>> running: "cmake" "/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/src/llvm" "-DLLVM_ENABLE_ASSERTIONS=OFF" "-DLLVM_TARGETS_TO_BUILD=X86;ARM;AArch64;Mips;PowerPC;SystemZ;JSBackend;MSP430;Sparc;NVPTX;Hexagon" "-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=" "-DLLVM_INCLUDE_EXAMPLES=OFF" "-DLLVM_INCLUDE_TESTS=OFF" "-DLLVM_INCLUDE_DOCS=OFF" "-DLLVM_ENABLE_ZLIB=OFF" "-DWITH_POLLY=OFF" "-DLLVM_ENABLE_TERMINFO=OFF" "-DLLVM_ENABLE_LIBEDIT=OFF" "-DLLVM_PARALLEL_COMPILE_JOBS=2" "-DLLVM_TARGET_ARCH=x86_64" "-DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-unknown-linux-gnu" "-DLLVM_LINK_LLVM_DYLIB=ON" "-DCMAKE_C_COMPILER=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc" "-DCMAKE_CXX_COMPILER=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-g++" "-DCMAKE_C_FLAGS=-ffunction-sections -fdata-sections -fPIC -m64" "-DCMAKE_CXX_FLAGS=-ffunction-sections -fdata-sections -fPIC -m64" "-DCMAKE_AR=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-ar" "-DCMAKE_INSTALL_PREFIX=/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/build/x86_64-unknown-linux-gnu/llvm" "-DCMAKE_BUILD_TYPE=Release"
>> -- The C compiler identification is GNU 7.3.0
>> -- The CXX compiler identification is GNU 7.3.0
>> -- The ASM compiler identification is GNU
>> -- Found assembler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc
>> -- Check for working C compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc
>> -- Check for working C compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-gcc -- works
>> -- Detecting C compiler ABI info
>> -- Detecting C compiler ABI info - done
>> -- Detecting C compile features
>> -- Detecting C compile features - done
>> -- Check for working CXX compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-g++
>> -- Check for working CXX compiler: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/host/bin/x86_64-buildroot-linux-gnu-g++ -- works
>> -- Detecting CXX compiler ABI info
>> -- Detecting CXX compiler ABI info - done
>> -- Detecting CXX compile features
>> -- Detecting CXX compile features - done
>> CMake Warning at CMakeLists.txt:140 (message):
>>  Job pooling is only available with Ninja generators.
>> 
>> leads to building this ?host? tool
>> 
>> [  2%] Built target LLVMTableGen
>> 
>> which cann?t run on that host because the compiler it used was the ?buildroot? compiler
>> 
>> [ 19%] Linking CXX static library ../../libLLVMDebugInfoPDB.a
>> [ 19%] Built target LLVMDebugInfoPDB
>> Makefile:151: recipe for target 'all' failed
>> make[3]: *** [all] Error 2
>> thread 'main' panicked at '
>> command did not execute successfully, got: exit code: 2
>> 
>> build script failed, must exit now', src/vendor/cmake/src/lib.rs:631<http://lib.rs:631>:4
>> note: Run with `RUST_BACKTRACE=1` for a backtrace.
>> finished in 267.033
>> failed to run: /home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/build/bootstrap/debug/bootstrap build
>> Build completed unsuccessfully in 0:06:22
>> package/pkg-generic.mk:247: recipe for target '/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/.stamp_built' failed
>> make[2]: *** [/home/vagrant/oneblox-buildroot/toolchains/br-x86_64-core_avx2-glibc_toolchains.build/build/host-rust-1.23.0/.stamp_built] Error 1
>> Makefile:79: recipe for target '_all' failed
>> make[1]: *** [_all] Error 2
>> make[1]: Leaving directory '/home/vagrant/oneblox-buildroot/repos/buildroot'
>> Makefile:93: recipe for target 'br-x86_64-core_avx2-glibc-tmp.tar.bz2' failed
>> make: *** [br-x86_64-core_avx2-glibc-tmp.tar.bz2] Error 2
> 
> Building Rust for x86_64 on a x86_64 is indeed tricky!
> 
> As seen in the build section of src/bootstrap/config.toml.example, Rust
> manages "build", "host" and "target" parameters, which all default to
> "x86_64-unknown-linux-gnu".
> 
> When building, the compiler is built for the host and the standard
> library for the host and the target.
> 
> So when the target is the same as the host, only the compiler and the
> standard library for the host should be built.
> 
> As the compiler is built on LLVM, coded in C++, a C++ compiler for the
> host is indeed required. It happens that in the build of LLVM, a host
> tool named FileCheck is built and run for test.
> 
> IIUC, the C compiler is only used for building the standard library
> (this is what I've seen when cross-compiling for ARM).
> 
> So when the target is the same as the host, it might be sensible to
> avoid defining c and cxx in the target configuration file, as suggested
> by your patch.
> 
> I'll poke upstream for clarifications on this special case, though.
> 
> The first versions of the patch series did try to work with new targets
> using triples with "buildroot" instead of "unknown", but defining new
> targets instead of using the available ones turned out to be
> difficult/cumbersome.
> 
> But maybe it would have avoided the issue raised here where the target
> is the same as the host.
> 
> Out of curiosity, does using the pre-built toolchain may be of use in
> your situation?
> 

Yes and no, on some targets we use the pre-built and on some (ie. mips64) we
have to build for now at least.

So, this isn?t blocking us - I have it working ?good enough? but this was just sending
it upstream incase anyone else hit it. I am not inclined to know the fix or prefer one
way over another.

> Regards,
> 
> --
> ELB
> 
