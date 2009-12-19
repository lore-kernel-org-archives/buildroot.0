From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 19 Dec 2009 04:28:14 +0000 (UTC)
Subject: [Buildroot] In-tree build OK, out-of-tree build fails
Message-ID: <hghkou$vu0$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm building the default integrator926 config using an external
toolchain (buildroot generated) and an external download
directory.  The build works fine as long as it's done in-tree.

Adding O=/path/to/output fails at the busybox link stage.
Building the kernel and uboot is OK, but then the make fails
like so:

   [...]
     AR      runit/lib.a
     LD      selinux/built-in.o
     AR      selinux/lib.a
     LD      shell/built-in.o
     CC      shell/ash.o
     CC      shell/ash_ptr_hack.o
     AR      shell/lib.a
     LD      sysklogd/built-in.o
     CC      sysklogd/klogd.o
     CC      sysklogd/syslogd_and_logger.o
     AR      sysklogd/lib.a
     LD      util-linux/built-in.o
     CC      util-linux/dmesg.o
     CC      util-linux/fdformat.o
     CC      util-linux/freeramdisk.o
     CC      util-linux/getopt.o
     CC      util-linux/hexdump.o
     CC      util-linux/hwclock.o
     CC      util-linux/ipcrm.o
     CC      util-linux/ipcs.o
     CC      util-linux/losetup.o
     CC      util-linux/mdev.o
     CC      util-linux/mkswap.o
     CC      util-linux/more.o
     CC      util-linux/mount.o
     CC      util-linux/pivot_root.o
     CC      util-linux/rdate.o
     CC      util-linux/readprofile.o
     CC      util-linux/setarch.o
     CC      util-linux/swaponoff.o
     CC      util-linux/switch_root.o
     CC      util-linux/umount.o
     AR      util-linux/lib.a
     LD      util-linux/volume_id/built-in.o
     AR      util-linux/volume_id/lib.a
     LINK    busybox_unstripped
   Trying libraries: crypt m
   Failed: -Wl,--start-group -lcrypt -lm -Wl,--end-group
   Output of:
   /home/grante/buildroot-git/pre-built-tools/usr/bin/arm-linux-gcc -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -Os -o busybox_unstripped -Wl,--sort-common -Wl,--gc-sections -Wl,--start-group applets/built-in.o archival/lib.a archival/libunarchive/lib.a console-tools/lib.a coreutils/lib.a coreutils/libcoreutils/lib.a debianutils/lib.a e2fsprogs/lib.a editors/lib.a findutils/lib.a init/lib.a libbb/lib.a libpwdgrp/lib.a loginutils/lib.a mailutils/lib.a miscutils/lib.a modutils/lib.a networking/lib.a networking/libiproute/lib.a networking/udhcp/lib.a printutils/lib.a procps/lib.a runit/lib.a selinux/lib.a shell/lib.a sysk
 logd/lib.a util-linux/lib.a util-linux/volume_id/lib.a archival/built-in.o archival/libunarchive/built-in.o console-tools/built-in.o coreutils/built-in.o coreutils/libcoreutils/built-in.o debianutils/built-in.o e2fsprogs/built-in.o editors/built-in.o findutils/built-in.o init/built-in.o libbb/built-in.o libpwdgrp/built-in.o loginutils/built-in.o mailutils/built-in.o miscutils/built-in.o modutils/built-in.o networking/built-in.o networking/libiproute/built-in.o networking/udhcp/built-in.o printutils/built-in.o procps/built-in.o runit/built-in.o selinux/built-in.o shell/built-in.o sysklogd/built-in.o util-linux/built-in.o util-linux/volume_id/built-in.o -Wl,--end-group -Wl,--start-group -lcrypt -lm -Wl,--end-group
   ==========
   /home/grante/buildroot-git/pre-built-tools/usr/bin/../lib/gcc/arm-linux-uclibcgnueabi/4.3.4/../../../../arm-linux-uclibcgnueabi/bin/ld: crt1.o: No such file: No such file or directory
   collect2: ld returned 1 exit status
   make[1]: *** [busybox_unstripped] Error 1
   make[1]: Leaving directory `/home/grante/buildroot-git/output/build/busybox-1.13.4'
   make: *** [/home/grante/buildroot-git/output/build/busybox-1.13.4/busybox] Error 2
   
The "not found" file crt1.o is present in the output directory
in staging/usr/lib/crt1.o, but it looks like the gcc command
line used to link busybox is missing the required --sysroot
option.

I've repeated the build several times. Building in-tree always
works. Building out-of-tree with an internal toolchain also
works OK.

It looks like the combination of an external toolchain and
out-of-tree build is what fails.

-- 
Grant

   
