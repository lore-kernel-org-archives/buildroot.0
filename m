From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 27 Jan 2018 10:59:52 -0800
Subject: [Buildroot] [PATCH 0/5] Add Xilinx ZynqMP and ZCU106 board
 support
In-Reply-To: <87372rir1r.fsf@dell.be.48ers.dk>
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
 <87372rir1r.fsf@dell.be.48ers.dk>
Message-ID: <CAKmqyKPCKhWpm+z4P0-LMtu8c6VXpsq5cUecACYEsC1QbRhKoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 27, 2018 at 1:34 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
>
>  > Hi,
>  > this patchset adds basic support for the ZynqMP family of ARM64
>  > SoC+FPGA by Xilinx and for the ZCU106 board based on it.
>
> Thanks!
>
>  > The ZynqMP sets a few challenges that needed some work besides the
>  > usual defconfig + readme that is enough for more classic and simple
>  > SoCs.
>
>  > First, it requires ARM Trusted Firmware in the U-Boot mkimage format,
>  > not currently implemented. Nothing really hard here, this is addressed
>  > in patch 2 (with a trivial preliminary cleanup in patch 1).
>
>  > The next issue is the PMU (Platform Management Unit). It is a
>  > Microblaze core that handles power and clock gating and the like, and
>  > reprogramming it at runtime is necessary to boot any modern U-Boot and
>  > Linux. Since we can't build Microblaze code out of the ARM64
>  > toolchain, I've set up a repository with pre-built PMU firmwares and
>  > added a new package that just downloads from there. This is similar to
>  > the binaries-marvell and vexpress-firmware packages. This is added in
>  > patch 3.
>
> It would be nice if Xilinx could host these officially. How do they do
> it for Yocto?

We don't have anything nice for Yocto either. The files are behind a
click-through license so users have to manually download them.

There are instructions here:
https://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/tree/meta-xilinx-bsp/README.qemu.md

I don't think hosting the files is a good idea. That puts you are risk
for export compliance violations.

>
>
>  > Finally, U-Boot needs some tweaks in order for the PMU firmware to
>  > properly loaded and to initialize peripherals before starting
>  > Linux. This is done in patch 4.
>
> Is this now the offical supported boot flow from Xilinx? I haven't
> followed in details, but when I assisted with a Zynqmp based project
> last year they used Xilinx fsbl and bootgen instead of u-boot SPL.

It's not officially supported. It is what meta-xilinx uses for QEMU boot though.

Alistair

>
> As you probably know, fsbl is part of the embeddedsw repo:
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_fsb
>
> Bootgen is afaik not distributed separately, but zynq-mkimage is an open
> source alternative:
>
> https://github.com/antmicro/zynq-mkbootimage
>
> Now, I would also prefer the more "normal" boot flow of U-Boot SPL, but
> as you are using the Xilinx BSP pmu/u-boot/linux, there is also some
> value in sticking to the official/tested boot flow.
>
>
>  > With all these in place, patch 5 just adds the defconfig and board
>  > files.
>
> Which unfortunately are huge! :/ (>50K lines). As this is an official
> Xilinx board, aren't these files available somewhere?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
