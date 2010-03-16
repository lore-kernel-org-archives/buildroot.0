From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 16 Mar 2010 19:27:42 +0000 (UTC)
Subject: [Buildroot] Packages won't build after update to 2010.2
Message-ID: <hnom3e$46n$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After updating to 2010.2, the updated versions of a several packages
won't build.  For example, busybox-1.16 fails like this:

   make[1]: Leaving directory `/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0'
   touch /home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0/.config
   /usr/bin/make -j2 CC=/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc CROSS_COMPILE="/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-" \
                   CROSS="/home/nextgen/buildroot/toolchain/usr/bin/arm-linux-" PREFIX="/home/nextgen/buildroot/buildroot/output/target" \
                   ARCH=arm \
                   EXTRA_CFLAGS="-Os -pipe -O2  --sysroot /home/nextgen/buildroot/buildroot/output/staging/ -I/home/nextgen/buildroot/buildroot/output/toolchain/linu$
   make[1]: Entering directory `/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0'
   scripts/kconfig/conf -s Config.in
   #
   # using defaults found in .config
   #
     SPLIT   include/autoconf.h -> include/config/*
     HOSTCC  applets/usage
   applets/usage.c: In function 'main':
   applets/usage.c:32: warning: ignoring return value of 'write', declared with attribute warn_unused_result
     GEN     include/bbconfigopts.h
     HOSTCC  applets/applet_tables
     GEN     include/usage_compressed.h
     GEN     include/applet_tables.h
     CC      applets/applets.o
     HOSTCC  applets/usage_pod
   applets/usage_pod.c: In function 'main':
   applets/usage_pod.c:58: warning: format not a string literal and no format arguments
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
   /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -$
   ==========
   /home/nextgen/buildroot/toolchain/usr/bin/../lib/gcc/arm-linux-uclibc/4.4.3/../../../../arm-linux-uclibc/bin/ld: crt1.o: No such file: No such file or directory
   collect2: ld returned 1 exit status
   make[1]: *** [busybox_unstripped] Error 1
   make[1]: Leaving directory `/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0'
   make: *** [/home/nextgen/buildroot/buildroot/output/build/busybox-1.16.0/busybox] Error 2
 
I believe the failure is due to the fact that no --sysroot option is
being specified in the link command.  There _is_ a coorect --sysroot
option during compilation (see the EXTRA_CFLAGS value at the beginning
of the log), so I know that SYSROOT_DIR is set correctly.

After updating, I see other related failures building other packages
(mtdutils fails during compilation because include files can't be
found).  Older versions of these packages always built fine.

It looks like the passing of --sysroot to external toolchains no
longer works...

-- 
Grant Edwards               grant.b.edwards        Yow! Here I am at the flea
                                  at               market but nobody is buying
                              gmail.com            my urine sample bottles ...
