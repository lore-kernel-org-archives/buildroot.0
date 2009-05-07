From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  7 May 2009 08:36:14 +0000 (UTC)
Subject: [Buildroot] [Bug 321] New: alsa-lib uses host include files for
 python which breaks builds on 64 bit Linux
Message-ID: <bug-321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=321

              Host: OpenSuse 11.1 64 bit on Core i7 processor
            Target: at91sam9261ek_defconfig
           Summary: alsa-lib uses host include files for python which breaks
                    builds on 64 bit Linux
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ulf.samuelsson at atmel.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


at91sam9261ek_defconfig was updated to use the latest 
binutils, gcc, kernel headers etc, and this is yet
to be committed.

When you build alsa-lib, with python enabled, it tries to include some python
headers.
These are included from the host machine and not the target machine.

/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc
-Os -pipe -Os 
-I/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir/usr/include
-I/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir/include
--sysroot=/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir/
-isysroot /home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir
-mabi=apcs-gnu -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-shared  .libs/sbase.o  -Wl,--rpath
-Wl,/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/alsa-lib-1.0.18/src/.libs
-L/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir/lib
-L/home/ulf/projects/Buildroot/20090506/buildroot/build_arm/staging_dir/usr/lib
-lm ../../../src/.libs/libasound.so  -mabi=apcs-gnu -mabi=apcs-gnu -Wl,-soname
-Wl,smixer-sbase.so -o .libs/smixer-sbase.so
In file included from /usr/include/python2.6/Python.h:58,
                 from python.c:22:
/usr/include/python2.6/pyport.h:685:2: error: #error "LONG_BIT definition
appears wrong for platform (bad gcc/glibc config?)."


Since the host is 64 bit and the target is 32 bit, the check fails.
It would not fail the test if the host is running 32 bit Linux.
The real problem (using host includes) still exist and can cause subtle bugs


This was also reported to the mailing list by Matt Wood 
Dec 19, 2008; 07:48pm.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
