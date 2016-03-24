From: Julien CORJON <corjon.j@ecagroup.com>
Date: Thu, 24 Mar 2016 13:13:49 +0000
Subject: [Buildroot] Fail to build host-gcc-final-4.9.3 with GLIBC / CPP
	support
Message-ID: <9cb4c66e-af90-4f58-a832-7a43c7a50248@MAIL-SINTERS-01.sinters-int.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

host-gcc-final fail to build with the following defconfig:
   BR2_arm=y
   BR2_cortex_a9=y
   BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
   BR2_TOOLCHAIN_BUILDROOT_CXX=y

git bisect point the following commit:
   f67a4f50e2ace3a2c83ac707807ec00a1a4a39b6 is the first bad commit
   commit f67a4f50e2ace3a2c83ac707807ec00a1a4a39b6
   Author: Max Filippov <jcmvbkbc@gmail.com>
   Date:   Sun Mar 13 06:45:16 2016 +0300

     gcc: preserve CXXFLAGS_FOR_TARGET

     gcc-4.7.x, gcc-4.8.x and gcc-4.9.x don't propagate 
CXXFLAGS_FOR_TARGET to
     CXXFLAGS for libstdc++ build. As a result libstdc++ is built without
     TARGET_CFLAGS and may fail to link with applications using it, see e.g.

 
http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/

     Instead of passing TARGET_ABI or TARGET_CFLAGS for libstdc++ in
     --enable-cxx-flags parameter backport the patch that fixes propagation
     of CXXFLAGS_FOR_TARGET to CXXFLAGS.

     This issue is fixed in gcc-5.x

     Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
     Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

build error is:
...
libtool: compile: 
/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/./gcc/xg++ 
-B/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/./gcc/ 
-nostdinc++ -nostdinc++ 
-I/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/arm-buildroot-linux-gnueabi/libstdc++-v3/include/arm-buildroot-linux-gnueabi 
-I/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/arm-buildroot-linux-gnueabi/libstdc++-v3/include 
-I/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/libstdc++-v3/libsupc++ 
-I/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/libstdc++-v3/include/backward 
-I/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/libstdc++-v3/testsuite/util 
-L/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/arm-buildroot-linux-gnueabi/libstdc++-v3/src 
-L/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/arm-buildroot-linux-gnueabi/libstdc++-v3/src/.libs 
-L/tmp/buildroot-bisect-sanitizer/output/build/host-gcc-final-4.9.3/build/arm-buildroot-linux-gnueabi/libstdc++-v3/libsupc++/.libs 
-B/tmp/buildroot-bisect-sanitizer/output/host/usr/arm-buildroot-linux-gnueabi/bin/ 
-B/tmp/buildroot-bisect-sanitizer/output/host/usr/arm-buildroot-linux-gnueabi/lib/ 
-isystem 
/tmp/buildroot-bisect-sanitizer/output/host/usr/arm-buildroot-linux-gnueabi/include 
-isystem 
/tmp/buildroot-bisect-sanitizer/output/host/usr/arm-buildroot-linux-gnueabi/sys-include 
-DHAVE_CONFIG_H -I. -I../../../libitm -I../../../libitm/config/linux/arm 
-I../../../libitm/config/linux -I../../../libitm/config/arm 
-I../../../libitm/config/posix -I../../../libitm/config/generic 
-I../../../libitm -ftls-model=initial-exec -Wall -pthread -Werror 
-std=gnu++0x -funwind-tables -fno-exceptions -fno-rtti -fabi-version=4 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os 
-D_GNU_SOURCE -MT futex.lo -MD -MP -MF .deps/futex.Tpo -c 
../../../libitm/config/linux/futex.cc -o futex.o >/dev/null 2>&1
In file included from 
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:17:0:
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:257:72: 
error: size of array ?assertion_failed__837? is negative
      typedef char IMPL_PASTE(assertion_failed_##_, line)[2*(int)(pred)-1]
                                                                         ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:251:30: 
note: in expansion of macro ?IMPL_COMPILER_ASSERT?
  #define COMPILER_CHECK(pred) IMPL_COMPILER_ASSERT(pred, __LINE__)
                               ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h:1062:3: 
note: in expansion of macro ?COMPILER_CHECK?
    COMPILER_CHECK(sizeof(((__sanitizer_##CLASS *) NULL)->MEMBER) == \
    ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:837:1: 
note: in expansion of macro ?CHECK_SIZE_AND_OFFSET?
  CHECK_SIZE_AND_OFFSET(dirent, d_ino);
  ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:257:72: 
error: size of array ?assertion_failed__841? is negative
      typedef char IMPL_PASTE(assertion_failed_##_, line)[2*(int)(pred)-1]
                                                                         ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:251:30: 
note: in expansion of macro ?IMPL_COMPILER_ASSERT?
  #define COMPILER_CHECK(pred) IMPL_COMPILER_ASSERT(pred, __LINE__)
                               ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h:1062:3: 
note: in expansion of macro ?COMPILER_CHECK?
    COMPILER_CHECK(sizeof(((__sanitizer_##CLASS *) NULL)->MEMBER) == \
    ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:841:1: 
note: in expansion of macro ?CHECK_SIZE_AND_OFFSET?
  CHECK_SIZE_AND_OFFSET(dirent, d_off);
  ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:257:72: 
error: size of array ?assertion_failed__841? is negative
      typedef char IMPL_PASTE(assertion_failed_##_, line)[2*(int)(pred)-1]
                                                                         ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:251:30: 
note: in expansion of macro ?IMPL_COMPILER_ASSERT?
  #define COMPILER_CHECK(pred) IMPL_COMPILER_ASSERT(pred, __LINE__)
                               ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h:1064:3: 
note: in expansion of macro ?COMPILER_CHECK?
    COMPILER_CHECK(offsetof(__sanitizer_##CLASS, MEMBER) ==          \
    ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:841:1: 
note: in expansion of macro ?CHECK_SIZE_AND_OFFSET?
  CHECK_SIZE_AND_OFFSET(dirent, d_off);
  ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:257:72: 
error: size of array ?assertion_failed__843? is negative
      typedef char IMPL_PASTE(assertion_failed_##_, line)[2*(int)(pred)-1]
                                                                         ^
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:251:30: 
note: in expansion of macro ?IMPL_COMPILER_ASSERT?
  #define COMPILER_CHECK(pred) IMPL_COMPILER_ASSERT(pred, __LINE__)
                               ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h:1064:3: 
note: in expansion of macro ?COMPILER_CHECK?
    COMPILER_CHECK(offsetof(__sanitizer_##CLASS, MEMBER) ==          \
    ^
../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:843:1: 
note: in expansion of macro ?CHECK_SIZE_AND_OFFSET?
  CHECK_SIZE_AND_OFFSET(dirent, d_reclen);
  ^
Makefile:416: recipe for target 'sanitizer_platform_limits_posix.lo' failed
...

Do you have any hint?

Regards,

Julien Corjon
