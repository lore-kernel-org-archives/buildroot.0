From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 5 May 2018 19:59:47 -0300
Subject: [Buildroot] defconfig build issues
In-Reply-To: <20180505215257.6745fc2f@windsurf>
References: <20180505215257.6745fc2f@windsurf>
Message-ID: <CAOMZO5CdrcKNO81YPBhvy4_YsevA40y6GF5RU7OnL7xcnGN45Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, May 5, 2018 at 4:52 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> freescale_imx6sololiteevk_defconfig
> ===================================
>
> Error: No BOOT_FROM tag in board/freescale/mx6slevk/imximage.cfg.cfgtmp
> arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/66561693
>
> I think this has already been fixed in other defconfigs.

Yes, this has been fixed in U-Boot mainline.

I think I will send a patch removing this target as we have a
imx6ulevk_defconfig target that is based on U-Boot and kernel
mainline.

I prefer to maintain the mainline version rather than the target based
on NXP U-Boot and kernel versions.

> freescale_imx31_3stack_defconfig
> ================================
>
> arch/arm/mach-imx/built-in.o: In function `init_mmdc_lpddr2_settings':
> platform-spi_imx.c:(.text+0x8f18): undefined reference to `imx6sll_lpddr2_freq_change'
> arch/arm/mach-imx/built-in.o: In function `imx6ul_cpuidle_init':
> platform-spi_imx.c:(.init.text+0x195c): undefined reference to `mx6ull_lpm_wfi_end'
> platform-spi_imx.c:(.init.text+0x1960): undefined reference to `mx6ull_lpm_wfi_start'
> platform-spi_imx.c:(.init.text+0x1964): undefined reference to `imx6ull_low_power_idle'
> arch/arm/mach-imx/built-in.o: In function `imx6sl_init_late':
> platform-spi_imx.c:(.init.text+0x56f0): undefined reference to `imx6sll_cpuidle_init'
> Makefile:969: recipe for target 'vmlinux' failed
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/66561688
>
> I've already reported this a while ago. Any fix coming in the near future ?

The 4.9 NXP kernel does not support mx31. I don't have access to this
board, so I will send a patch removing it.

If someone is interested on this board, then a patch adding a
defconfig based on U-Boot and kernel mainline can be added later.

>
> freescale_imx6ulevk_defconfig
> =============================
>
> ./scripts/dtc-version.sh: line 17: dtc: command not found
> ./scripts/dtc-version.sh: line 18: dtc: command not found
> *** Your dtc is too old, please upgrade to dtc 1.4 or newer
>
> https://gitlab.com/buildroot.org/buildroot/-/jobs/66561695
>
> This one is easy: U-Boot needs DTC, just one option to add in the defconfig.

Same here. Will drop this one as we have imx6ulevk_defconfig target
which uses mainline U-Boot and kernel.
