From: Tim Barr <tbarr@multitech.com>
Date: Wed, 2 Sep 2009 14:47:20 -0500
Subject: [Buildroot] Problem with compile using ARM926T vs. generic_arm
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E61218C078@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to update my build from buildroot-2009.01 and a 2.6.25
kernel to buildroot-2009.05 and a 2.6.28 kernel. When I try to make the
at91sam9g20dfc project, so that I have a baseline configuration to
modify for my board design, I get an the following error if the
buildroot Target Architecture Variant is set to arm926t:

CC arch/arm/mm/dma-mapping.o
{standard input}: Assembler messages:
{standard input}:1293: Error: selected processor does not support `pld
[ip,#0]'
{standard input}:1305: Error: selected processor does not support `pld
[ip,#0]'
{standard input}:1325: Error: selected processor does not support `pld
[ip,#0]'
make[2]: *** [arch/arm/kernel/traps.o] Error 1
make[1]: *** [arch/arm/kernel] Error 2
make[1]: *** Waiting for unfinished jobs....
CC arch/arm/mm/extable.o
CC arch/arm/mm/fault.o
{standard input}: Assembler messages:
{standard input}:351: Error: selected processor does not support `pld
[r2,#0]'
{standard input}:367: Error: selected processor does not support `pld
[r2,#0]'
{standard input}:580: Error: selected processor does not support `pld
[r2,#0]'
{standard input}:596: Error: selected processor does not support `pld
[r2,#0]'
{standard input}:827: Error: selected processor does not support `pld
[r2,#0]'
{standard input}:855: Error: selected processor does not support `pld
[r2,#0]'
make[2]: *** [arch/arm/mm/dma-mapping.o] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/arm/mm] Error 2

But the make succeeds if the Target Architecture Variant is set to
generic_arm. The processor is an ARM926EJ-S, so I would assume that
arm926t is the correct setting. That is the variant that I was using in
buildroot-2009.01 when I was building a 2.6.25 kernel. I am worried that
I may run into problems because the build is not tuned for an arm9. I
did notice that -march is being set to arm4vt instead of arm5vt, is that
the problem?? And if so, how is that fixed??

/usr/bin/make -j2 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm
CFLAGS_KERNEL="-Os -pipe -O2
-I/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/usr/include
-I/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/include
--sysroot=/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/
-isysroot /home/falingtrea/buildroot-2009.05/build_arm/staging_dir
-mtune=arm9tdmi -march=armv4t -mabi=apcs-gnu -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
INSTALL_MOD_PATH=/home/falingtrea/buildroot-2009.05/project_build_arm/at
91sam9g20dfc/root
CROSS_COMPILE=/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/u
sr/bin/arm-linux-uclibc-
LDFLAGS="-L/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/lib
-L/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/usr/lib
--sysroot=/home/falingtrea/buildroot-2009.05/build_arm/staging_dir/"
LZMA="/home/falingtrea/buildroot-2009.05/toolchain_build_arm/bin/lzma"
PATH=/home/falingtrea/buildroot-2009.05/project_build_arm/at91sam9g20dfc
/u-boot-tools:/opt/timesys/toolchains/armv5l-linux/bin:/opt/timesys/bin:
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
\
-C
/home/falingtrea/buildroot-2009.05/project_build_arm/at91sam9g20dfc/linu
x-2.6.28.2 uImage

Tim Barr 
Development Engineer 
Multi-Tech Systems, Inc. 
