From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Tue, 15 Mar 2016 09:57:24 +0100
Subject: [Buildroot] Compilation of Buildroot 2016.2 for Raspberry Pi with
 Musl 1.1.6 fails - no stddef.h header
Message-ID: <CAMduVEfcO2XM1SZVGuvaUCKhbNrZwfG7-oYw=B757iZDYU3cAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.c:42:20:
fatal error: stddef.h: No such file or directory
 #include <stddef.h>
                    ^
compilation terminated.
scripts/Makefile.build:258: recipe for target
'drivers/misc/vc04_services/interface/vchiq_arm/vchiq_shim.o' failed


If I'm forced to build the system quickly (as my students are, due to
short lab sessions), the only way is to switch off the EABIhf (by
selection of the EABI in the "Target options", Target ABI) and use the
"Toolchain (Sourcery CodeBench ARM 2014.05)"

Of course the optimal solution is to use the "Buildroot toolchain"
with standard EABIhf, but it takes very long to rebuild after "make
clean"...

Regards,
Wojtek
-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
standard: 8192R/FE58A848 (0720 9430 85DB 7CCD F4C5  5F1E 5107 91FB FE58 A848)
confidential: 16384R/C76D2FB0 (C4E7 9597 CF22 7B5D 28BF  4656 FED7
A63F C76D 2FB0)
