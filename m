From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Dec 2009 08:54:46 +0000 (UTC)
Subject: [Buildroot] [Bug 779] New: uClibc (re)building fail
Message-ID: <bug-779-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=779

            Target: ARM 920 (AT91RM9200)
             Build: 2009.11
           Summary: uClibc (re)building fail
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: peter.stosz at freemail.hu
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


1) Download BR2009.11

2) Customize with menuconfig, target ABI is OABI

# BR2_iwmmxt is not set
BR2_ARM_TYPE="ARM920T"
# BR2_ARM_EABI is not set
BR2_ARM_OABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="apcs-gnu"

3) Customize Linux(2.6.27), target is ABI is OABI
CONFIG_HZ=128
# CONFIG_AEABI is not set
CONFIG_ARCH_FLATMEM_HAS_HOLES=y

4) Customize BusyBox(1.15), build system, everything is OK, target system boot
and running

5) If I touch (nothing modify) the uClibc config and try to (re)make a system,
I get something: (.ARM.exidx+0x0): undefined reference to
`__aeabi_unwind_cpp_pr0'

uClibc's config:
#
# Target Architecture Features and Options
#
TARGET_ARCH="arm"
FORCE_OPTIONS_FOR_ARCH=y
CONFIG_ARM_OABI=y
# CONFIG_ARM_EABI is not set
# USE_BX is not set
# CONFIG_GENERIC_ARM is not set
# CONFIG_ARM610 is not set
# CONFIG_ARM710 is not set
# CONFIG_ARM7TDMI is not set
# CONFIG_ARM720T is not set
CONFIG_ARM920T=y



6) Clean, working config (without step 5), I add some options (target toolchain
building) in buildroot config (without touching uClibc config), and start make
process, I get this:
  CC libc/unistd/usershell.os
  CC libc/unistd/usleep.os
  CC libpthread/linuxthreads.old/forward.oS
  CC libpthread/linuxthreads.old/libc_pthread_init.oS
  CC libc/misc/elf/dl-iterate-phdr.oS
  CC libc/misc/internals/__uClibc_main.oS
  CC libpthread/linuxthreads.old/libc_pthread_init.os
  CC libc/misc/elf/dl-support.os
  CC libc/misc/elf/dl-core.os
  CC libc/misc/elf/dl-iterate-phdr.os
  CC libc/misc/internals/__uClibc_main.os
  CC libc/stdlib/atexit.os
  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/libc.a
  AR cr lib/uclibc_nonshared.a
  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
  AR cr libc/libc_so.a
  STRIP -x -R .note -R .comment libc/libc_so.a
  LD libuClibc-0.9.30.1.so
/srv/buildroot-2009.11/output/staging/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.4.2/libgcc.a(_divdi3.o):(.ARM.exidx+0x0):
undefined reference to `__aeabi_unwind_cpp_pr0'
collect2: ld returned 1 exit status
make[1]: *** [lib/libc.so] Error 1
make[1]: Leaving directory
`/srv/buildroot-2009.11/output/toolchain/uClibc-0.9.30.1'
make: *** [/srv/buildroot-2009.11/output/target/usr/lib/libc.a] Error 2


Build environment:
Ubuntu 9.10 with bash, not dash.
Linux xxxxx 2.6.31-15-generic #50-Ubuntu SMP Tue Nov 10 14:53:52 UTC 2009
x86_64 GNU/Linux

Target environment:
AT91RM9200 based custom board


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
