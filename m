From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Nov 2018 23:21:04 +0000
Subject: [Buildroot] [Bug 11476] New: stdio2.h error invalid use of
 __builtin_va_arg_pack
Message-ID: <bug-11476-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

            Bug ID: 11476
           Summary: stdio2.h error invalid use of __builtin_va_arg_pack
           Product: buildroot
           Version: 2018.02.7
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: goldstar611 at hotmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The following defconfig which should generated a glibc based toolchain (gcc5)
for powerpc 464 with floating point generates an error. This happens on
buildroot-2018.02.7

Defconfig:
```
BR2_powerpc=y
BR2_powerpc_464fp=y
BR2_SSP_REGULAR=y
BR2_RELRO_PARTIAL=y
BR2_FORTIFY_SOURCE_1=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_1=y
BR2_GCC_VERSION_5_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
# BR2_ENABLE_LOCALE_PURGE is not set
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
# BR2_TARGET_ROOTFS_TAR is not set
```

Error in console:
```
make[5]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build/powerpc-buildroot-linux-gnu/libsanitizer'
make[4]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build/powerpc-buildroot-linux-gnu/libsanitizer'
make[3]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build/powerpc-buildroot-linux-gnu/libsanitizer'
In file included from
/home/user/buildroot-2018.02.7/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/stdio.h:862:0,
                 from ../../../libitm/util.cc:27:
/home/user/buildroot-2018.02.7/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:
In function ?int sprintf(char*, const char*, ...)?:
/home/user/buildroot-2018.02.7/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:34:43:
error: invalid use of ?__builtin_va_arg_pack ()?
       __bos (__s), __fmt, __va_arg_pack ());
                                           ^
/home/user/buildroot-2018.02.7/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:
In function ?int snprintf(char*, size_t, const char*, ...)?:
/home/user/buildroot-2018.02.7/output/host/powerpc-buildroot-linux-gnu/sysroot/usr/include/bits/stdio2.h:65:44:
error: invalid use of ?__builtin_va_arg_pack ()?
        __bos (__s), __fmt, __va_arg_pack ());
                                            ^
Makefile:517: recipe for target 'util.lo' failed
make[5]: *** [util.lo] Error 1
make[5]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build/powerpc-buildroot-linux-gnu/libitm'
Makefile:697: recipe for target 'all-recursive' failed
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build/powerpc-buildroot-linux-gnu/libitm'
Makefile:360: recipe for target 'all' failed
make[3]: *** [all] Error 2
make[3]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build/powerpc-buildroot-linux-gnu/libitm'
Makefile:13203: recipe for target 'all-target-libitm' failed
make[2]: *** [all-target-libitm] Error 2
make[2]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build'
Makefile:871: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/build'
package/pkg-generic.mk:223: recipe for target
'/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/.stamp_built'
failed
make: ***
[/home/user/buildroot-2018.02.7/output/build/host-gcc-final-5.5.0/.stamp_built]
Error 2
```

I will retry on an older buildroot version and post a build log after make
clean if I still get errors

-- 
You are receiving this mail because:
You are on the CC list for the bug.
