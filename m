From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 18:16:13 +0000
Subject: [Buildroot] [Bug 9551] New: Coreutils fails to build target
 src/src_libsinglebin_pinky_a-pinky.o
Message-ID: <bug-9551-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9551

            Bug ID: 9551
           Summary: Coreutils fails to build target
                    src/src_libsinglebin_pinky_a-pinky.o
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: bilge at scriptfusion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Given the following config using the toolchain available from
https://github.com/Docker-nano/crosstool-NG/releases/download/2.0.0/x86_64-nano-linux-uclibc.tar.xz

BR2_x86_64=y
BR2_WGET="wget --passive-ftp -nd -t 3 -nv"
BR2_GLOBAL_PATCH_DIR="patches"
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/toolchain"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-nano-linux-uclibc"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="Docker-nano"
BR2_TARGET_GENERIC_ISSUE="Docker nano"
BR2_INIT_NONE=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_ROOTFS_OVERLAY="rootfs_overlay"
BR2_ROOTFS_POST_BUILD_SCRIPT="./post_build.sh"
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_COREUTILS=y
BR2_TARGET_ROOTFS_TAR_XZ=y

Coreutils build dies with the following error.

In file included from src/pinky.c:30:0:
./lib/readutmp.h:148:30: warning: implicit declaration of function 'UT_USER'
[-Wimplicit-function-declaration]
 enum { UT_USER_SIZE = sizeof UT_USER ((STRUCT_UTMP *) 0) };
                              ^
src/pinky.c: In function 'time_string':
src/pinky.c:186:14: warning: implicit declaration of function 'UT_TIME_MEMBER'
[-Wimplicit-function-declaration]
   time_t t = UT_TIME_MEMBER (utmp_ent);
              ^
src/pinky.c: In function 'print_entry':
src/pinky.c:210:29: error: dereferencing pointer to incomplete type
'STRUCT_UTMP {aka const struct UTMP_STRUCT_NAME}'
   char line[sizeof (utmp_ent->ut_line) + DEV_DIR_LEN + 1];
                             ^
src/pinky.c:238:22: warning: passing argument 2 of 'stzncpy' makes pointer from
integer without a cast [-Wint-conversion]
       stzncpy (name, UT_USER (utmp_ent), UT_USER_SIZE);
                      ^
In file included from src/pinky.c:25:0:
src/system.h:713:1: note: expected 'const char *' but argument is of type 'int'
 stzncpy (char *restrict dest, char const *restrict src, size_t len)
 ^
In file included from src/pinky.c:30:0:
src/pinky.c: In function 'scan_entries':
./lib/readutmp.h:203:16: error: subscripted value is neither array nor pointer
nor vector
    (UT_USER (U)[0]                                              \
                ^
src/pinky.c:441:11: note: in expansion of macro 'IS_USER_PROCESS'
       if (IS_USER_PROCESS (utmp_buf))
           ^
In file included from src/pinky.c:25:0:
src/pinky.c:448:32: warning: passing argument 1 of 'strncmp' makes pointer from
integer without a cast [-Wint-conversion]
                 if (STREQ_LEN (UT_USER (utmp_buf), argv_names[i],
UT_USER_SIZE))
                                ^
src/system.h:192:38: note: in definition of macro 'STREQ_LEN'
 #define STREQ_LEN(a, b, n) (strncmp (a, b, n) == 0)
                                      ^
In file included from ./lib/string.h:41:0,
                 from src/system.h:72,
                 from src/pinky.c:25:
/root/buildroot-2016.11/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/usr/include/string.h:101:12:
note: expected 'const char *' but argument is of type 'int'
 extern int strncmp (const char *__s1, const char *__s2, size_t __n)
            ^
src/pinky.c:457:15: error: increment of pointer to an incomplete type
'STRUCT_UTMP {aka const struct UTMP_STRUCT_NAME}'
       utmp_buf++;
               ^
Makefile:10084: recipe for target 'src/src_libsinglebin_pinky_a-pinky.o' failed
make[3]: *** [src/src_libsinglebin_pinky_a-pinky.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
'/root/buildroot-2016.11/output/build/coreutils-8.25'
Makefile:11287: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
'/root/buildroot-2016.11/output/build/coreutils-8.25'
Makefile:5833: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory
'/root/buildroot-2016.11/output/build/coreutils-8.25'
package/pkg-generic.mk:216: recipe for target
'/root/buildroot-2016.11/output/build/coreutils-8.25/.stamp_built' failed
make: *** [/root/buildroot-2016.11/output/build/coreutils-8.25/.stamp_built]
Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
