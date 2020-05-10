From: Koen Martens <gmc@sonologic.nl>
Date: Sun, 10 May 2020 12:32:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/capnproto: bump version to 1.8.0
In-Reply-To: <20200509231926.543cdf35@windsurf.home>
References: <20200503063730.GA1839@coltrane>
 <20200509231926.543cdf35@windsurf.home>
Message-ID: <20200510103257.GA12594@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 09, 2020 at 11:19:26PM +0200, Thomas Petazzoni wrote:
> On Sun, 3 May 2020 08:37:30 +0200
> Koen Martens <gmc@sonologic.nl> wrote:
> 
> > The new version requires two extra features in the
> > toolchain, therefore two new toolchain options are
> > added as dependencies:
> > 
> > * BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> 
> Could you give more details about this new dependency? Which build
> failure did you encounter, and with which toolchain/configuration?

gmc at coltrane:~/src/3rdparty/buildroot$ ./utils/test-pkg -a -c capnproto.config -p capnproto
                             andes-nds32 [ 1/44]: SKIPPED
                             arm-aarch64 [ 2/44]: OK
                        br-aarch64-glibc [ 3/44]: OK
                           br-arcle-hs38 [ 4/44]: SKIPPED
                            br-arm-basic [ 5/44]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/44]: OK
                   br-arm-cortex-a9-musl [ 7/44]: OK
                   br-arm-cortex-m4-full [ 8/44]: SKIPPED
                             br-arm-full [ 9/44]: FAILED
                    br-arm-full-nothread [10/44]: SKIPPED
                      br-arm-full-static [11/44]: OK
                   br-i386-pentium4-full [12/44]: OK
                br-i386-pentium-mmx-musl [13/44]: OK
                       br-m68k-5208-full [14/44]: SKIPPED
                      br-m68k-68040-full [15/44]: SKIPPED
                    br-microblazeel-full [16/44]: SKIPPED
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
                      br-openrisc-uclibc [22/44]: SKIPPED
               br-powerpc-603e-basic-cpp [23/44]: SKIPPED
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                  br-powerpc-e500mc-full [26/44]: SKIPPED
                              br-riscv32 [27/44]: OK
                              br-riscv64 [28/44]: OK
                             br-sh4-full [29/44]: SKIPPED
                        br-sparc64-glibc [30/44]: OK
                         br-sparc-uclibc [31/44]: OK
                    br-x86-64-core2-full [32/44]: OK
                          br-x86-64-musl [33/44]: OK
                          br-xtensa-full [34/44]: SKIPPED
                       linaro-aarch64-be [35/44]: OK
                          linaro-aarch64 [36/44]: OK
                              linaro-arm [37/44]: OK
                     sourcery-arm-armv4t [38/44]: SKIPPED
                            sourcery-arm [39/44]: SKIPPED
                     sourcery-arm-thumb2 [40/44]: SKIPPED
                         sourcery-mips64 [41/44]: OK
                           sourcery-mips [42/44]: OK
                          sourcery-nios2 [43/44]: OK
                         sourcery-x86-64 [44/44]: OK
44 builds, 16 skipped, 1 build failed, 0 legal-info failed
gmc at coltrane:~/src/3rdparty/buildroot$ cat package/capnproto/Config.in 
config BR2_PACKAGE_CAPNPROTO
	bool "capnproto"
	depends on BR2_USE_MMU
	depends on BR2_HOST_GCC_AT_LEAST_5 # C++14
	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
	depends on BR2_INSTALL_LIBSTDCPP
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_TOOLCHAIN_HAS_ATOMIC
	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
	help
	  Cap'n Proto is an insanely fast data interchange format
	  and capability-based RPC system. Think JSON, except
	  binary. Or think Protocol Buffers, except faster. In
	  fact, in benchmarks, Cap'n Proto is INFINITY TIMES
	  faster than Protocol Buffers.

	  https://capnproto.org/index.html

comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic (always lock free), ucontext"
	depends on BR2_USE_MMU
	depends on !BR2_HOST_GCC_AT_LEAST_5 || \
		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
		!BR2_INSTALL_LIBSTDCPP || \
		!BR2_TOOLCHAIN_HAS_THREADS || \
		!BR2_TOOLCHAIN_HAS_ATOMIC || \
		!BR2_TOOLCHAIN_HAS_UCONTEXT 

gmc at coltrane:~/src/3rdparty/buildroot$ cd ~/br-test-pkg/br-arm-full
gmc at coltrane:~/br-test-pkg/br-arm-full$ tail -n 20 logfile 
/bin/bash ./libtool  --tag=CXX   --mode=compile /home/gmc/br-test-pkg/br-arm-full/host/bin/arm-linux-g++ -std=gnu++14 -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -I./src -DKJ_HEADER_WARNINGS -DCAPNP_HEADER_WARNINGS -DCAPNP_INCLUDE_DIR='"/usr/include"'  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -c -o src/kj/time.lo src/kj/time.c++
src/kj/exception.c++: In function ?void kj::{anonymous}::terminateHandler()?:
src/kj/exception.c++:429:15: error: ?current_exception? is not a member of ?std?
   auto eptr = std::current_exception();
               ^
src/kj/exception.c++:432:7: error: ?rethrow_exception? is not a member of ?std?
       std::rethrow_exception(eptr);
       ^
/bin/bash ./libtool  --tag=CXX   --mode=compile /home/gmc/br-test-pkg/br-arm-full/host/bin/arm-linux-g++ -std=gnu++14 -DHAVE_CONFIG_H -I.   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -I./src -DKJ_HEADER_WARNINGS -DCAPNP_HEADER_WARNINGS -DCAPNP_INCLUDE_DIR='"/usr/include"'  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -c -o src/kj/filesystem.lo src/kj/filesystem.c++
Makefile:2075: recipe for target 'src/kj/exception.lo' failed
make[2]: *** [src/kj/exception.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
libtool: compile:  /home/gmc/br-test-pkg/br-arm-full/host/bin/arm-linux-g++ -std=gnu++14 -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -I./src -DKJ_HEADER_WARNINGS -DCAPNP_HEADER_WARNINGS -DCAPNP_INCLUDE_DIR=\"/usr/include\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c src/kj/time.c++  -fPIC -DPIC -o src/kj/.libs/time.o
libtool: compile:  /home/gmc/br-test-pkg/br-arm-full/host/bin/arm-linux-g++ -std=gnu++14 -DHAVE_CONFIG_H -I. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -I./src -DKJ_HEADER_WARNINGS -DCAPNP_HEADER_WARNINGS -DCAPNP_INCLUDE_DIR=\"/usr/include\" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -c src/kj/filesystem.c++  -fPIC -DPIC -o src/kj/.libs/filesystem.o
make[2]: Leaving directory '/home/gmc/br-test-pkg/br-arm-full/build/capnproto-0.8.0/c++'
Makefile:1289: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/home/gmc/br-test-pkg/br-arm-full/build/capnproto-0.8.0/c++'
package/pkg-generic.mk:266: recipe for target '/home/gmc/br-test-pkg/br-arm-full/build/capnproto-0.8.0/.stamp_built' failed
make: *** [/home/gmc/br-test-pkg/br-arm-full/build/capnproto-0.8.0/.stamp_built] Error 2
gmc at coltrane:~/br-test-pkg/br-arm-full$ grep rethrow_exception * -r
Binary file build/host-capnproto-0.8.0/c++/.libs/libkj-0.8.0.so matches
Binary file build/host-capnproto-0.8.0/c++/src/kj/.libs/exception.o matches
build/host-capnproto-0.8.0/c++/src/kj/exception.c++:      std::rethrow_exception(eptr);
build/capnproto-0.8.0/c++/src/kj/exception.c++:      std::rethrow_exception(eptr);
Binary file host/lib/libkj-0.8.0.so matches
Binary file host/opt/ext-toolchain/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/cc1 matches
Binary file host/opt/ext-toolchain/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/cc1plus matches
Binary file host/opt/ext-toolchain/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/lto1 matches
host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/future:          rethrow_exception(__res._M_error);
host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/bits/nested_exception.h:	rethrow_exception(_M_ptr);
host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/bits/exception_ptr.h:  void rethrow_exception(exception_ptr) __attribute__ ((__noreturn__));
host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/bits/exception_ptr.h:      friend void std::rethrow_exception(exception_ptr);
logfile:src/kj/exception.c++:432:7: error: ?rethrow_exception? is not a member of ?std?
logfile:       std::rethrow_exception(eptr);
gmc at coltrane:~/br-test-pkg/br-arm-full$ grep exception_ptr.h * -r
host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/exception:#include <bits/exception_ptr.h>
host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/bits/exception_ptr.h:/** @file bits/exception_ptr.h
gmc at coltrane:~/br-test-pkg/br-arm-full$ cat host/opt/ext-toolchain/arm-buildroot-linux-uclibcgnueabi/include/c++/5.5.0/exception
    ...
#if (__cplusplus >= 201103L) && (ATOMIC_INT_LOCK_FREE > 1)
#include <bits/exception_ptr.h>
#include <bits/nested_exception.h>
#endif
    ...
gmc at coltrane:~/br-test-pkg/br-arm-full$

Cheers,

Koen
