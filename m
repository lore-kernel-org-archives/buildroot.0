From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 28 Jan 2018 00:28:08 +0100
Subject: [Buildroot] [PATCH 0/5] Add Xilinx ZynqMP and ZCU106 board
 support
In-Reply-To: <87372rir1r.fsf@dell.be.48ers.dk>
References: <1517002234-17608-1-git-send-email-luca@lucaceresoli.net>
 <87372rir1r.fsf@dell.be.48ers.dk>
Message-ID: <f11dc98b-fd40-3865-6214-38507acc5176@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Alistair,

On 27/01/2018 10:34, Peter Korsgaard wrote:
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
> It would be nice if Xilinx could host these officially.

The topic is quite tricky, and I should probably have explained it in my
initial cover letter. Sorry, I'll try to amend now.

There are two main (development and boot) flows around which ZynqMP
users focus on (by "ZynqMP users" I mean those who discuss on the
meta-xilinx ML): the "Xilinx way" and the "open source way". The one I'm
pushing to Buildroot is the latter.

The "Xilinx way" uses the Xilinx tools (Vivado, XSDK, bootgen) and the
Petalinux buildsystem.
Boot components are PMUFW, FSBL, ATF, U-Boot.

The "Open source way" does not use the Xilinx tools during the build
(1), only Yocto and the meta-xilinx-bsp (2) layer.
Boot components are PMUFW, U-Boot SPL, ATF, U-Boot.

(1) except for generating the psu_init_gpl.[hc] and pm_cfg_obj.c files,
    which does not need to be re-made at every build
(2) known as meta-xilinx until a few weeks ago [3]

To know how the chip resources are to be managed, the PMU firmware needs
a ?configuration object? (pm_cfg_obj) to be passed from the outside even
before U-Boot proper can start.

In the "Xilinx way" the FSBL is generated with a hard-coded pm_cfg_obj,
and it is able to pass it to PMUFW. This means the PMUFW is quite
generic and could technically be hosted somewhere and used by most
users. It also means the FSBL changes based on how the chip is configured.

In the "open source way" U-Boot SPL is used. SPL is unable to pass the
pm_cfg_obj to PMUFW (and there are also licensing issues to do that). So
the "current best workaround" is to hard-code the pm_cfg_obj in PMUFW
(not FSBL or SPL) and let it configure itself. This implies the SPL is
now generic, while the PMUFW changes based on how the chip is
configured. (more info on [0])

Thus the reply to your concern ("It would be nice if Xilinx could host
these [PMU firmwares] officially"): since we are speaking about the
"open source way", I don't expect Xilinx to host them. And it wouldn't
make any sense since there can be hundreds of different PMUFWs based on
the hard-coded pm_cfg_obj, at least until a better solution is devised
and implemented.

> How do they do it for Yocto?

I don't know exactly how Yocto passes the config object to FSBL in the
"Xilinx way", I never used that.

In the "Open source way" meta-xilinx-bsp is able to build a PMUFW
without the pm_cfg_obj, and there is a tweak around [1] to hard-code and
self-load it. BTW I suspect that tweak will land in meta-xilinx-bsp in
the near future.

>  > Finally, U-Boot needs some tweaks in order for the PMU firmware to
>  > properly loaded and to initialize peripherals before starting
>  > Linux. This is done in patch 4.
> 
> Is this now the offical supported boot flow from Xilinx? I haven't
> followed in details, but when I assisted with a Zynqmp based project
> last year they used Xilinx fsbl and bootgen instead of u-boot SPL.
> 
> As you probably know, fsbl is part of the embeddedsw repo:
> https://github.com/Xilinx/embeddedsw/tree/master/lib/sw_apps/zynqmp_fsbl
> 
> Bootgen is afaik not distributed separately, but zynq-mkimage is an open
> source alternative:
> 
> https://github.com/antmicro/zynq-mkbootimage

Well, mixing the two ways (xilinx and open source) brings in complexity
and leads to things that don't make much sense to me, although there
might be use cases where it does. It's hard to find a good motivation
for building FSBL with anything but the Xilinx tools (see [2] for some
reasons).

> Now, I would also prefer the more "normal" boot flow of U-Boot SPL, but
> as you are using the Xilinx BSP pmu/u-boot/linux, there is also some
> value in sticking to the official/tested boot flow.

I guess it's now clear that I'm not using the "Xilinx BSP" flow. :)
Again sorry for not having explained that in the beginning.

Disclaimer: I'm not saying one flow is better that the other one.

>  > With all these in place, patch 5 just adds the defconfig and board
>  > files.
> 
> Which unfortunately are huge! :/ (>50K lines).

Yup. :( Patch 5 never got to the ML (awaiting moderator approval) due to
such a large size.

> As this is an official
> Xilinx board, aren't these files available somewhere?

Pretty stupid on my side, but I never tested with Buildroot the
psu_init_gpl files bundled with U-Boot. I'm quite optimistic they will
work, and in that case I will use them and have a reasonable patch.

OTOH I think there still is some value in keeping the
BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_DIR option, so users who need a
different configuration can apply it easily.

[0] http://lucaceresoli.net/en/zynqmp-pmufw-builder/
[1]
https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/pmu-firmware/pmu-firmware_2017.1.bbappend
[2]
https://lists.yoctoproject.org/pipermail/meta-xilinx/2017-November/003365.html
[3]
https://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/commit/?id=a18947c20dba2c0c38db8bde1ad4684995df4bbd

-- 
Luca
