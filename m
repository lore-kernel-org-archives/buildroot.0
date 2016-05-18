From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 May 2016 23:55:04 +0000
Subject: [Buildroot] [Bug 8946] New: Valgrind fails to build with stack
 protection turned on
Message-ID: <bug-8946-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8946

            Bug ID: 8946
              Host: ARM
            Target: IMX6
             Build: Ubuntu 16.04
           Summary: Valgrind fails to build with stack protection turned
                    on
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nnabavian at sonendo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

arm-none-linux-gnueabi-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os  -fstack-protector   -o memcheck-arm-linux -O2 -g
-std=gnu99 -Wall -Wmissing-prototypes -Wshadow -Wpointer-arith
-Wstrict-prototypes -Wmissing-declarations -Wcast-qual -Wwrite-strings
-Wempty-body -Wformat -Wformat-security -Wignored-qualifiers
-Wmissing-parameter-type -Wold-style-declaration -fno-stack-protector
-fno-strict-aliasing -fno-builtin  -marm -mcpu=cortex-a8 -O2 -static
-nodefaultlibs -nostartfiles -u _start   memcheck_arm_linux-mc_leakcheck.o
memcheck_arm_linux-mc_malloc_wrappers.o memcheck_arm_linux-mc_main.o
memcheck_arm_linux-mc_translate.o memcheck_arm_linux-mc_machine.o
memcheck_arm_linux-mc_errors.o ../coregrind/libcoregrind-arm-linux.a
../VEX/libvex-arm-linux.a -lgcc 
mkdir -p ../.in_place; \
for f in ; do \
  rm -f ../.in_place/$f.dSYM; \
  ln -f -s ../memcheck/$f.dSYM ../.in_place; \
done
memcheck_arm_linux-mc_main.o: In function `mc_post_reg_write':
/projects/nitrogen6x/buildroot-2016.05-rc1/output/build/valgrind-3.11.0/memcheck/mc_main.c:4165:
undefined reference to `__stack_chk_fail'

and many more of the same

/projects/nitrogen6x/buildroot-2016.05-rc1/output/build/valgrind-3.11.0/VEX/priv/main_util.c:493:
undefined reference to `__stack_chk_guard'
collect2: error: ld returned 1 exit status
Makefile:1014: recipe for target 'memcheck-arm-linux' failed
make[5]: *** [memcheck-arm-linux] Error 1
Makefile:1290: recipe for target 'all-recursive' failed
make[4]: *** [all-recursive] Error 1
Makefile:825: recipe for target 'all-recursive' failed
make[3]: *** [all-recursive] Error 1
Makefile:694: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:195: recipe for target
'/projects/nitrogen6x/buildroot-2016.05-rc1/output/build/valgrind-3.11.0/.stamp_built'
failed
make[1]: ***
[/projects/nitrogen6x/buildroot-2016.05-rc1/output/build/valgrind-3.11.0/.stamp_built]
Error 2
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
