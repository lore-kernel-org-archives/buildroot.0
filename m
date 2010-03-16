From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 16 Mar 2010 20:04:17 +0000 (UTC)
Subject: [Buildroot] [Bug 1321] New: Buildroot link fails due to lack of
	--sysroot option
Message-ID: <bug-1321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1321

              Host: Gentoo Linux
            Target: Atmel ARM9
             Build: 2010.2
           Summary: Buildroot link fails due to lack of --sysroot option
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1297)
 --> (https://bugs.busybox.net/attachment.cgi?id=1297)
Patch to fix busybox link failure by setting EXTRA_LDFLAGS appropriately

Buildroot link fails:

   make[1]: Leaving directory
`/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0'
   touch /home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0/.config
   /usr/bin/make -j2 CC=/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc
CROSS_COMPILE="/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-" \
                   CROSS="/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-"
PREFIX="/home/nextgen/buildroot/buildroot/output/target" \
                   ARCH=arm \
                   EXTRA_CFLAGS="-Os -pipe -O2  --sysroot
/home/nextgen/buildroot/buildroot/output/staging/
-I/home/nextgen/buildroot/buildroot/output/toolchain/linu$
   make[1]: Entering directory
`/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0'
   scripts/kconfig/conf -s Config.in
   #
   # using defaults found in .config
   #
     SPLIT   include/autoconf.h -> include/config/*
     HOSTCC  applets/usage
   applets/usage.c: In function 'main':
   applets/usage.c:32: warning: ignoring return value of 'write', declared with
attribute warn_unused_result
     GEN     include/bbconfigopts.h
     HOSTCC  applets/applet_tables
     GEN     include/usage_compressed.h
     GEN     include/applet_tables.h
     CC      applets/applets.o
     HOSTCC  applets/usage_pod
   applets/usage_pod.c: In function 'main':
   applets/usage_pod.c:58: warning: format not a string literal and no format
arguments
     LD      applets/built-in.o
     DOC     busybox.pod
     DOC     BusyBox.txt

   [1431 warnings about type punned pointers later]

     CC      util-linux/switch_root.o
     CC      util-linux/umount.o
     AR      util-linux/lib.a
     LINK    busybox_unstripped
   Trying libraries: crypt m
   Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
   Output of:
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -Wall -Wshadow
-Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter
-Wunused-function -$
   ==========
  
/home/nextgen/buildroot/toolchain/usr/bin/../lib/gcc/arm-linux-uclibc/4.4.3/../../../../arm-linux-uclibc/bin/ld:
crt1.o: No such file: No such file or directory
   collect2: ld returned 1 exit status
   make[1]: *** [busybox_unstripped] Error 1
   make[1]: Leaving directory
`/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0'
   make: ***
[/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0/busybox] Error 2

Though the proper --sysroot option is being used during compilation
(see the EXTRA_CFLAGS value at the beginning of the log) no --sysroot
option is used for the linking.  Thus the linker can't find crt1.o.

The EXTRA_LDFLAGS needs to be passed to buildroot's "make" with the
appropriate --sysroot option (already set up in TARGET_LDFLAGS).

Patch is attached.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
