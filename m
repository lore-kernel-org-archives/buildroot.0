From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 May 2018 21:52:57 +0200
Subject: [Buildroot] defconfig build issues
Message-ID: <20180505215257.6745fc2f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The following defconfigs are failing to build currently:

  freescale_imx6sololiteevk_defconfig
  freescale_imx31_3stack_defconfig
  freescale_imx6ulevk_defconfig
  s6lx9_microboard_defconfig
  socrates_cyclone5_defconfig
  raspberrypi3_qt5we_defconfig

If you are interested in keeping those defconfigs in Buildroot, please
see below the details of the failures. I propose that any defconfig
that isn't fixed by 2018.05-rc2 will be removed from Buildroot.

freescale_imx6sololiteevk_defconfig
===================================

Error: No BOOT_FROM tag in board/freescale/mx6slevk/imximage.cfg.cfgtmp
arch/arm/imx-common/Makefile:91: recipe for target 'u-boot-dtb.imx' failed

https://gitlab.com/buildroot.org/buildroot/-/jobs/66561693

I think this has already been fixed in other defconfigs.

freescale_imx31_3stack_defconfig
================================

arch/arm/mach-imx/built-in.o: In function `init_mmdc_lpddr2_settings':
platform-spi_imx.c:(.text+0x8f18): undefined reference to `imx6sll_lpddr2_freq_change'
arch/arm/mach-imx/built-in.o: In function `imx6ul_cpuidle_init':
platform-spi_imx.c:(.init.text+0x195c): undefined reference to `mx6ull_lpm_wfi_end'
platform-spi_imx.c:(.init.text+0x1960): undefined reference to `mx6ull_lpm_wfi_start'
platform-spi_imx.c:(.init.text+0x1964): undefined reference to `imx6ull_low_power_idle'
arch/arm/mach-imx/built-in.o: In function `imx6sl_init_late':
platform-spi_imx.c:(.init.text+0x56f0): undefined reference to `imx6sll_cpuidle_init'
Makefile:969: recipe for target 'vmlinux' failed

https://gitlab.com/buildroot.org/buildroot/-/jobs/66561688

I've already reported this a while ago. Any fix coming in the near future ?

freescale_imx6ulevk_defconfig
=============================

./scripts/dtc-version.sh: line 17: dtc: command not found
./scripts/dtc-version.sh: line 18: dtc: command not found
*** Your dtc is too old, please upgrade to dtc 1.4 or newer

https://gitlab.com/buildroot.org/buildroot/-/jobs/66561695

This one is easy: U-Boot needs DTC, just one option to add in the defconfig.

s6lx9_microboard_defconfig
==========================

make[1]: *** No rule to make target 'simpleImage.'.  Stop.

https://gitlab.com/buildroot.org/buildroot/-/jobs/66561794

No idea about this one. I don't think it was failing before, and I
don't think this defconfig has been changed recently. Do we have a
regression in the Linux kernel build logic ?

socrates_cyclone5_defconfig
===========================

Could not fetch special ref 'rel_socfpga-4.1.33-ltsi_17.07.02_pr'; assuming it is not special.
error: pathspec 'rel_socfpga-4.1.33-ltsi_17.07.02_pr' did not match any file(s) known to git.

https://gitlab.com/buildroot.org/buildroot/-/jobs/66561801

The Linux kernel tag being used in the defconfig no longer exists.

raspberrypi3_qt5we_defconfig
============================

Your Buildroot configuration needs a compiler capable of building 32 bits binaries.
If you're running a Debian/Ubuntu distribution, install the g++-multilib package.
For other distributions, refer to their documentation.

https://gitlab.com/buildroot.org/buildroot/-/jobs/66561791

This defconfig includes WebKit, which wants a C++ multilib compiler on
the host, which isn't present in our Docker image used for the gitlab
CI builds. Should we add this to our Docker image ? Should we exclude
this defconfig from the gitlab CI testing ?

Thanks for your support,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
