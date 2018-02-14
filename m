From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 16:06:22 +0100
Subject: [Buildroot] Adding package libgit2
In-Reply-To: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20180214160622.789eb7e9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Adam, Yann: questions for you below.)

On Wed, 14 Feb 2018 12:13:50 +0100, Nicolas Cavallari wrote:
> While testing this package, there were lots of failures due to zlib-ng
> and libressl, but none due to libgit2.  None of these failures appears
> in the autobuilders.  Do they have trouble testing virtual packages ?

It's not a problem with virtual packages, but with Kconfig choices. If
you have a choice...endchoice block, with multiple options, then "make
randpackageconfig" does not any randomization of such choices, and only
the first option will ever be used.

So for the virtual packages that do have a "choice..endchoice", such as
jpeg, openssl and zlib, indeed only the first implementation is going
to be tested by the autobuilders. Yann had already spent a significant
amount of time a few years ago trying to fix this, and I think he has
lost more hairs than he really wanted to while trying to dive into the
Kconfig code base :)

I believe we could probably fix this by tweaking utils/genrandconfig:
we randomly inject BR2_PACKAGE_ZLIB_NG=y or BR2_PACKAGE_LIBRESSL=y. But
I'm not sure if "make randpackageconfig" will not override that, and if
we can convince it to not do that.

Cc'ing Kconfig guru Yann E. Morin on this :-)

> I identified 6 different failure reasons:
> 
> 
> 1) zlib-ng (armv5-ctng-linux-gnueabi, armv7-ctng-linux-gnueabihf,
> 	    sourcery-arm-armv4t, sourcery-arm, sourcery-arm-thumb2)
> 
> -- The following features have been enabled:
> [...]
>  * WITH_ACLE , Build with ACLE CRC
>  * WITH_NEON , Build with NEON intrinsics
>  * ACLE_CRC , Support CRC hash generation using the ACLE instruction set, using "-march=armv8-a+crc"
>  * NEON_FILLWINDOW , Support NEON instructions in fill_window_arm, using "-mfloat-abi=softfp -mfpu=neon"
> 
> [...]
> armv5-ctng-linux-gnueabi-gcc: error: unrecognized argument in option '-march=armv8-a+crc'
> 
> This option apparently appeared with GCC 4.9.  Should i send a patch ?

It is very bogus to use -march=armv8-+crc when building for ARM32-only
cores.

Perhaps this:

# Enable NEON and ACLE on ARM
ifeq ($(BR2_arm),y)
ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
endif

isn't entirely correct.

> 2) zlib-ng (br-aarch64-glibc, linaro-aarch64)
> 
> -- The following features have been disabled:
> 
>  * WITH_ACLE , Build with ACLE CRC
>  * WITH_NEON , Build with NEON intrinsics

They should probably be enabled for ARM64.

> -- Configuring done
> [...]
> [ 96%] Linking C executable minigzip64
> libz.so.1.2.11.zlib-ng: undefined reference to `crc32_acle'
> libz.so.1.2.11.zlib-ng: undefined reference to `adler32_neon'
> libz.so.1.2.11.zlib-ng: undefined reference to `crc32_acle'
> libz.so.1.2.11.zlib-ng: undefined reference to `adler32_neon'

Which should perhaps fix this ?

> 
> 
> 
> 3) zlib-ng (br-arm-full-static)
> [ 86%] Linking C static library libz.a
> /home/cavallar/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_fini':
> __uClibc_main.c:(.text+0x164): undefined reference to `__fini_array_end'
> __uClibc_main.c:(.text+0x168): undefined reference to `__fini_array_start'
> __uClibc_main.c:(.text+0x16c): undefined reference to `__fini_array_start'
> /home/cavallar/br-test-pkg/br-arm-full-static/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): In function `__uClibc_main':
> __uClibc_main.c:(.text+0x59c): undefined reference to `__preinit_array_start'
> __uClibc_main.c:(.text+0x5a0): undefined reference to `__preinit_array_end'
> __uClibc_main.c:(.text+0x5a4): undefined reference to `__preinit_array_start'
> __uClibc_main.c:(.text+0x5a8): undefined reference to `__init_array_start'
> __uClibc_main.c:(.text+0x5ac): undefined reference to `__init_array_end'
> __uClibc_main.c:(.text+0x5b0): undefined reference to `__init_array_start'
> /home/cavallar/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: libz.so.1.2.11.zlib-ng: hidden symbol `__fini_array_end' isn't defined
> /home/cavallar/br-test-pkg/br-arm-full-static/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: final link failed: Bad value
> collect2: error: ld returned 1 exit status
> 
> I don't know much about static linking.

The CMake build system is trying to build a shared library, while the
toolchain only supports static linking. The CMakeLists.txt needs to be
fixed to obey to -DBUILD_SHARED_LIBS, and not build the shared library
if it's set to OFF.

> 4) zlib-ng (all other toolchains)
> 
> -- The following features have been enabled:
> [...]
>  * SSE2 , Support the SSE2 instruction set, using "-msse2"
> [...]
> /home/cavallar/br-test-pkg/br-arcle-hs38/build/zlib-ng-a17fefa147942edbf80ab22a16bcbc2419def12d/arch/x86/x86.c:17:10: fatal error: cpuid.h: No such file or directory
>  #include <cpuid.h>
>           ^~~~~~~~~
> compilation terminated.

Can you check what is the value of ${ARCH} in the CMakeLists.txt when
such problem occurs ? It is printed in the configure output:

message(STATUS "Architecture: ${ARCH}")

ARCH is set to ${CMAKE_SYSTEM_PROCESSOR}, and CMAKE_SYSTEM_PROCESSOR is
explicitly passed by Buildroot in package/pkg-cmake.mk. So it should be
correct. zlib-ng CMakeLists.txt uses its ${ARCH} variable to decide
whether the x86 code should be built or not:

if("${ARCH}" MATCHES "x86_64" OR "${ARCH}" MATCHES "AMD64")
    set(ARCHDIR "arch/x86")
    add_definitions(-DX86_64 -DX86_NOCHECK_SSE2 -DUNALIGNED_OK -DUNROLL_LESS)
    add_feature_info(SSE2 1 "Use the SSE2 instruction set, using \"${SSE2FLAG}\"")

So I guess there is something wrong going on with ${ARCH} or
${CMAKE_SYSTEM_PROCESSOR}, because a build targetting the ARC
architecture should not have ARCH=x86_64 or AMD64.

> 5) libressl (br-arm-full-nothread)
> PATH="$HOME/br-test-pkg/br-arm-full-nothread/host/bin:$HOME/br-test-pkg/br-arm-full-nothread/host/sbin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"  /usr/bin/make -j25  -C $HOME/br-test-pkg/br-arm-full-nothread/build/libressl-2.6.4/
> Making all in crypto
> /usr/bin/make  all-am
>   CC       compat/arc4random.lo
> In file included from compat/arc4random.h:16:0,
>                  from compat/arc4random.c:66:
> compat/arc4random_linux.h:28:21: fatal error: pthread.h: No such file or directory
>  #include <pthread.h>
>                      ^
> compilation terminated.
> 
> Only this file seems to use locks.  It could be patched away, or
> libressl could depends on threads, but i don't think kconfig will like
> that?

Kconfig will be OK with this, since nobody selects libressl. However,
I'm pretty we had discussed this issue before. Adam ?

> 
> 6) libressl (br-microblazeel-full, br-m68k-68040-full, br-openrisc-uclibc)
> Making all in ocspcheck
>   CCLD     ocspcheck
> /home/cavallar/br-test-pkg/br-m68k-68040-full/build/libressl-2.6.4/crypto/.libs/libcrypto.so: undefined reference to `__register_atfork'
> collect2: error: ld returned 1 exit status
> 
> They have a MMU, but uclibc still doesn't provide __register_atfork() ?

I think this has been fixed in uClibc-ng as of commit
9e38e0aa45cca21d5023d0af94377f0e1e41d2f4, which appeared in uClibc-ng
1.0.27. I guess I haven't rebuilt the toolchains since then, causing
this problem.

I could definitely rebuild the toolchains to fix this problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
