From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Nov 2017 06:56:48 +0000
Subject: [Buildroot] [Bug 10491] New: Cannot output security warning when
 compiled with buildroot cross compilers
Message-ID: <bug-10491-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10491

            Bug ID: 10491
           Summary: Cannot output security warning when compiled with
                    buildroot cross compilers
           Product: buildroot
           Version: 2013.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jasonvfang at 126.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I met a requirements, the executable binary must pass the checking by
https://github.com/slimm609/checksec.sh,

so I enabled following build configurations for my toolchain gcc:

_D_FORTIFY_SOURCE=2  -Wl,-z,relro,-z,now -fstack-protector-all 

but it didn't output any warning msgs during the compiling, while it showed
properly warning msg when i use host gcc build.

below were my build logs:
=====================================

jason at linux-server:~/tmp/test$ 
jason at linux-server:~/tmp/test$
/opt/buildroot-gcc463/usr/bin/mipsel-buildroot-linux-uclibc-gcc -Wall -O2
-D_FORTIFY_SOURCE=2  -Wl,-z,relro,-z,now -fstack-protector-all -fpie -pie
test.c -o testjason 

there were no any warning output.

While in host x86 gcc:
jason at linux-server:~/tmp/test$ 
jason at linux-server:~/tmp/test$ gcc  -Wall -O2 -D_FORTIFY_SOURCE=2 
-Wl,-z,relro,-z,now -fstack-protector-all -fpie -pie test.c -o testjason 
In file included from /usr/include/string.h:640:0,
                 from test.c:2:
In function ?memcpy?,
    inlined from ?main? at test.c:28:8:
/usr/include/x86_64-linux-gnu/bits/string3.h:51:3: warning: call to
__builtin___memcpy_chk will always overflow destination buffer [enabled by
default]
   return __builtin___memcpy_chk (__dest, __src, __len, __bos0 (__dest));
   ^
In function ?memset?,
    inlined from ?main? at test.c:35:8:
/usr/include/x86_64-linux-gnu/bits/string3.h:84:3: warning: call to
__builtin___memset_chk will always overflow destination buffer [enabled by
default]
   return __builtin___memset_chk (__dest, __ch, __len, __bos0 (__dest));
   ^
jason at linux-server:~/tmp/test$ 
=======================================


for build toolchain, I enabled libssp only in package/gcc/gcc.mk file:

HOST_GCC_COMMON_CONF_OPT = \
        --target=$(GNU_TARGET_NAME) \
        --with-sysroot=$(STAGING_DIR) \
        --disable-__cxa_atexit \
        --with-gnu-ld \
        --enable-libssp \
        --disable-multilib \
        --with-gmp=$(HOST_DIR)/usr \
        --with-mpfr=$(HOST_DIR)/usr

-- 
You are receiving this mail because:
You are on the CC list for the bug.
