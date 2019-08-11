From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 11 Aug 2019 10:07:15 +0530
Subject: [Buildroot] Buildroot radxa_rock_pi4_defconfig no longer builds
In-Reply-To: <20190810143635.27e1b850@windsurf.home>
References: <20190810143635.27e1b850@windsurf.home>
Message-ID: <CAMty3ZCmfinZybYWeiD_eKV20uJM0B7aF9haXC9ScLbLA-BaCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Aug 10, 2019 at 6:06 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> The radxa_rock_pi4_defconfig in Buildroot doesn't build:
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/269139271
>
> When building ATF, it fails with:
>
> arm-none-eabi-gcc -g -mcpu=cortex-m0 -mthumb -Wall -O3 -nostdlib -mfloat-abi=soft -ffunction-sections -fdata-sections -fomit-frame-pointer -fno-common -Iinclude/ -I../../include/shared/ -MMD -MT /builds/buildroot.org/buildroot/output/build/arm-trusted-firmware-v2.0/build/rk3399/release/m0/dram.o -c src/dram.c -o /builds/buildroot.org/buildroot/output/build/arm-trusted-firmware-v2.0/build/rk3399/release/m0/dram.o
> make[2]: arm-none-eabi-gcc: Command not found
>
> It seems like it tries to build some code for a Cortex-M0 co-processor,
> with the arm-none-eabi-gcc toolchain, which is not available.
>
> I believe this is a common problem: we are building for a AArch64
> system, but some bits of the firmware need to be built for an ARM
> 32-bit co-processor, and this requires a separate toolchain. I know
> there is the same problem when building ATF for the Marvell Armada 3720
> SoC.
>
> The only solution that I can see is to create a separate package (a
> regular package, not a toolchain package) that installs in $(HOST_DIR)
> a bare-metal ARM 32 bit toolchain. Then the ATF package needs to be
> adjusted so that it can optionally depend on such a package, and pass
> the appropriate flags to tell ATF the prefix of that toolchain.
>
> Would you be willing to work on that ? It would be good to make sure it
> also works for the Marvell Armada 3720 case.

Yes, installing arm32 cross tool would work since the ATF here on
rockchip does require 32 and 64 tool-chains. I can confirm it with my
build just know.

>
> You can look at
> http://lists.busybox.net/pipermail/buildroot/2019-February/242251.html
> where a previous proposal was made, and which was reviewed.
> Unfortunately, the author never came back with a second iteration of
> the patch series.

Will check with this series and get back to you as soon as possible.

Thanks for noticing, I thought that this was fixed before.

Jagan.
