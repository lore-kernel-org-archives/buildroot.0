From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:36:35 +0200
Subject: [Buildroot] Buildroot radxa_rock_pi4_defconfig no longer builds
Message-ID: <20190810143635.27e1b850@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The radxa_rock_pi4_defconfig in Buildroot doesn't build:

https://gitlab.com/buildroot.org/buildroot/-/jobs/269139271

When building ATF, it fails with:

arm-none-eabi-gcc -g -mcpu=cortex-m0 -mthumb -Wall -O3 -nostdlib -mfloat-abi=soft -ffunction-sections -fdata-sections -fomit-frame-pointer -fno-common -Iinclude/ -I../../include/shared/ -MMD -MT /builds/buildroot.org/buildroot/output/build/arm-trusted-firmware-v2.0/build/rk3399/release/m0/dram.o -c src/dram.c -o /builds/buildroot.org/buildroot/output/build/arm-trusted-firmware-v2.0/build/rk3399/release/m0/dram.o 
make[2]: arm-none-eabi-gcc: Command not found

It seems like it tries to build some code for a Cortex-M0 co-processor,
with the arm-none-eabi-gcc toolchain, which is not available.

I believe this is a common problem: we are building for a AArch64
system, but some bits of the firmware need to be built for an ARM
32-bit co-processor, and this requires a separate toolchain. I know
there is the same problem when building ATF for the Marvell Armada 3720
SoC.

The only solution that I can see is to create a separate package (a
regular package, not a toolchain package) that installs in $(HOST_DIR)
a bare-metal ARM 32 bit toolchain. Then the ATF package needs to be
adjusted so that it can optionally depend on such a package, and pass
the appropriate flags to tell ATF the prefix of that toolchain.

Would you be willing to work on that ? It would be good to make sure it
also works for the Marvell Armada 3720 case.

You can look at
http://lists.busybox.net/pipermail/buildroot/2019-February/242251.html
where a previous proposal was made, and which was reviewed.
Unfortunately, the author never came back with a second iteration of
the patch series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
