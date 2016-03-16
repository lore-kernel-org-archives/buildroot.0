From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Mar 2016 19:13:10 +0000
Subject: [Buildroot] [Bug 8801] New: Compilation of Buildroot 2016.2 for
 Raspberry Pi with Musl 1.1.6 fails - no stddef.h header
Message-ID: <bug-8801-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8801

            Bug ID: 8801
           Summary: Compilation of Buildroot 2016.2 for Raspberry Pi with
                    Musl 1.1.6 fails - no stddef.h header
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: wzab01 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

To recreate the problem:

$ wget https://buildroot.org/downloads/buildroot-2016.02.tar.bz2
$ tar -xjf buildroot-2016.02.tar.bz2
$ cd buildroot-2016.02
$ make raspberrypi_defconfig
$ make menuconfig
In the "Toolchain" section select "Toolchain type" "External toolchain"
and then in "Toolchain" "Musl 1.1.6 toolchain (experimental)"
Leave the configuration menu, saving the configuration
$ make

After some time you'll get:

 CC      drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.o
 CC      fs/proc/array.o
drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.c:42:20: fatal error:
stddef.h: No such file or directory
 #include <stddef.h>
                    ^
compilation terminated.
scripts/Makefile.build:258: recipe for target
'drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.o' failed


If I'm forced to build the system quickly (as my students are, due to short lab
sessions), the only way is to switch off the EABIhf (by selection of the EABI
in the "Target options", Target ABI) and use the "Toolchain (Sourcery CodeBench
ARM 2014.05)"

Of course the optimal solution is to use the "Buildroot toolchain" with
standard EABIhf, but it takes very long to rebuild after "make clean"...

Regards,
Wojtek

-- 
You are receiving this mail because:
You are on the CC list for the bug.
