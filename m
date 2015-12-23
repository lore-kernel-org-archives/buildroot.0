From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2015 20:15:31 +0000
Subject: [Buildroot] [Bug 8571] New: strace for ARC compile error
Message-ID: <bug-8571-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8571

            Bug ID: 8571
           Summary: strace for ARC compile error
           Product: buildroot
           Version: unspecified
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mail at waldemar-brodkorb.de
                CC: buildroot at uclibc.org

Latest strace 4.11 for ARC does not compile:

/home/wbx/buildroot/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-DHAVE_CONFIG_H   -I./linux/arc -I./linux/arc -I./linux -I./linux -I. -I. 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
-Wwrite-strings -Wsign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -matomic -Os  -c -o strace-term.o `test -f 'term.c' ||
echo './'`term.c
In file included from syscall.c:34:0:
syscall.c:85:63: error: ?sys_ARCH_mmap? undeclared here (not in a function)
 #define SEN(syscall_name) SEN_ ## syscall_name, SYS_FUNC_NAME(sys_ ##
syscall_name)
                                                               ^
defs.h:799:51: note: in definition of macro ?MPERS_FUNC_NAME__?
 #define MPERS_FUNC_NAME__(prefix, name) prefix ## name
                                                   ^
defs.h:801:31: note: in expansion of macro ?MPERS_FUNC_NAME_?
 #define MPERS_FUNC_NAME(name) MPERS_FUNC_NAME_(MPERS_PREFIX, name)
                               ^
defs.h:803:37: note: in expansion of macro ?MPERS_FUNC_NAME?
 #define SYS_FUNC_NAME(syscall_name) MPERS_FUNC_NAME(syscall_name)
                                     ^
syscall.c:85:49: note: in expansion of macro ?SYS_FUNC_NAME?
 #define SEN(syscall_name) SEN_ ## syscall_name, SYS_FUNC_NAME(sys_ ##
syscall_name)
                                                 ^
./linux/32/syscallent.h:230:24: note: in expansion of macro ?SEN?
 [222] = { 6, TD|TM|SI, SEN(ARCH_mmap),   "mmap2"   },
                        ^
/home/wbx/buildroot/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-DHAVE_CONFIG_H   -I./linux/arc -I./linux/arc -I./linux -I./linux -I. -I. 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall
-Wwrite-strings -Wsign-compare -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -matomic -Os  -c -o strace-time.o `test -f 'time.c' ||
echo './'`time.c
In file included from syscall.c:1351:0:
./linux/arc/get_syscall_args.c: In function ?get_syscall_args?:
./linux/arc/get_syscall_args.c:5:19: warning: pointer targets in initialization
differ in signedness [-Wpointer-sign]
  long *arc_args = &arc_regs.scratch.r0;
                   ^
make[3]: *** [strace-syscall.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory `/home/wbx/buildroot/output/build/strace-4.11'

-- 
You are receiving this mail because:
You are on the CC list for the bug.
