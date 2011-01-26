From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jan 2011 16:15:20 +0000 (UTC)
Subject: [Buildroot] [Bug 3145] New: jffs2 image generation fails
Message-ID: <bug-3145-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3145

           Summary: jffs2 image generation fails
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mjhammel at graphics-muse.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2881
  --> https://bugs.busybox.net/attachment.cgi?id=2881
adds --enabled-shared to config options for host build

Enabling "Target File Systems->jffs2 root file system" causes the build to fail
when it tries to build host prerequisites.  The initial failure is from a lack
of a shared library being built for host-lzo:

make[3]: Entering directory
`/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs'
gcc -I../include -I../ubi-utils/include -D_FILE_OFFSET_BITS=64 -O2 -g -Wall
-Wextra -Wwrite-strings -Wno-sign-compare -c -o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs.o
mkfs.ubifs.c -g
-Wp,-MD,/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/.mkfs.ubifs.c.dep
gcc -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -g -o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/crc16.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/crc32.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/lpt.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/compr.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/devtable.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/hashtable/hashtable.o
/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/hashtable/hashtable_itr.o
-lz -llzo2 -lm -luuid
-L/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/../ubi-utils/
-lubi
/usr/bin/ld: cannot find -llzo2
collect2: ld returned 1 exit status
make[3]: ***
[/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs/mkfs.ubifs]
Error 1
make[3]: Leaving directory
`/home/mjhammel/src/cei/system_build/bld/buildroot-2010.05/output/build/host-mtd-1.3.1/mkfs.ubifs'
make[2]: *** [subdirs_mkfs.ubifs_install] Error 2

A fix for this is attached.  Once fixed, this exposes a bug in the mtd host
build and install commands in the mtd.mk.  This is fixed by updating these
commands.  I'll add the attachment for this fix after submitting this bug.

Once this is fixed it exposes a bug in the host mtd build where mtd/mkfs.ubifs
fails trying to reference a shared object for libubi.  A workaround (which may
or may not be a proper fix) is to change the reference in the
mkfs.ubifs/Makefile to be a reference to the libubi.o object module instead. 
This, at least, allows the build to complete, though it is unclear if
mkfs.ubifs actually works since in this scenario I don't think it's used.  I'll
add the attachment for this fix after submitting this bug.

I have not been able to test these with 2010.08 or 2010.11 because my 2010.05
configuration, which uses an external glibc Crosstool-NG based toolchain,
fails.   I'll ask on the mailing list for help on that one - may just be
something foolish I've done.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
