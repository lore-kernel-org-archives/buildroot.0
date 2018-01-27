From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 10:34:08 +0100
Subject: [Buildroot] [PATCH 0/5] Add Xilinx ZynqMP and ZCU106 board
 support
In-Reply-To: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Fri, 26 Jan 2018 22:30:29 +0100")
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87372rir1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi,
 > this patchset adds basic support for the ZynqMP family of ARM64
 > SoC+FPGA by Xilinx and for the ZCU106 board based on it.

Thanks!

 > The ZynqMP sets a few challenges that needed some work besides the
 > usual defconfig + readme that is enough for more classic and simple
 > SoCs.

 > First, it requires ARM Trusted Firmware in the U-Boot mkimage format,
 > not currently implemented. Nothing really hard here, this is addressed
 > in patch 2 (with a trivial preliminary cleanup in patch 1).

 > The next issue is the PMU (Platform Management Unit). It is a
 > Microblaze core that handles power and clock gating and the like, and
 > reprogramming it at runtime is necessary to boot any modern U-Boot and
 > Linux. Since we can't build Microblaze code out of the ARM64
 > toolchain, I've set up a repository with pre-built PMU firmwares and
 > added a new package that just downloads from there. This is similar to
 > the binaries-marvell and vexpress-firmware packages. This is added in
 > patch 3.

It would be nice if Xilinx could host these officially. How do they do
it for Yocto?


 > Finally, U-Boot needs some tweaks in order for the PMU firmware to
 > properly loaded and to initialize peripherals before starting
 > Linux. This is done in patch 4.

Is this now the offical supported boot flow from Xilinx? I haven't
followed in details, but when I assisted with a Zynqmp based project
last year they used Xilinx fsbl and bootgen instead of u-boot SPL.

As you probably know, fsbl is part of the embeddedsw repo:
https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_fsbl

Bootgen is afaik not distributed separately, but zynq-mkimage is an open
source alternative:

https://github.com/antmicro/zynq-mkbootimage

Now, I would also prefer the more "normal" boot flow of U-Boot SPL, but
as you are using the Xilinx BSP pmu/u-boot/linux, there is also some
value in sticking to the official/tested boot flow.


 > With all these in place, patch 5 just adds the defconfig and board
 > files.

Which unfortunately are huge! :/ (>50K lines). As this is an official
Xilinx board, aren't these files available somewhere?

-- 
Bye, Peter Korsgaard
