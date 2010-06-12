From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:21:34 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	bootloaders-cleanup
Message-ID: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new try (hopefully the last) at getting this
bootloaders-cleanup branch merged. Since the last post (June, 1st),
the changes are :

 * Added the ability to specify a custom tarball for U-Boot, as
   requested by Paul Jones. Initially, I added three options: latest
   U-Boot version, custom U-Boot stable official version, custom
   tarball. However, Peter Korsgaard disagreed with this "latest
   U-Boot version", so now we have the choice between a small set of
   U-Boot official stable versions or the custom tarball options.

 * Fixed how mkimage is built for the host: configuring U-Boot is no
   longer a pre-requisite, and the build process of mkimage has been
   simplified.

 * Use KERNEL_ARCH in Barebox and fix how the Barebox tarball was
   extracted.

 * More cleanup in the defconfig files regarding U-Boot related
   options

Thomas

The following changes since commit 7c709f4affc44f3bbc9a09fec8d84ae3807e31e7:
  Peter Korsgaard (1):
        file: don't force _GNU_SOURCE in CFLAGS

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot bootloaders-cleanup

Thomas Petazzoni (49):
      bootloaders: move bootloader build code to boot/
      yaboot: drop support
      boot: remove references to COPYTO
      u-boot: do not default to $(BOARD_NAME) for the board name
      u-boot: remove ancient versions
      u-boot: rename Makefile.in to u-boot.mk for coherency
      u-boot: remove option to configure download site
      u-boot: remove arch specific patches infrastructure
      u-boot: remove u-boot-status make target
      u-boot: remove reference to old 1.2.0-atmel version
      u-boot: simplify custom patch handling
      u-boot: remove patch for obsolete version
      u-boot: remove useless symbolic link
      u-boot: support building for mkimage
      u-boot: further simplify the configuration
      u-boot: remove unused U_BOOT_TARGET_TOOLS variable
      u-boot: add a few comments
      u-boot: re-add infrastructure to specify custom tarball
      u-boot: beautify option prompts
      u-boot: use BR2_TARGET_UBOOT_VERSION instead of BR2_UBOOT_VERSION
      defconfigs: remove references to old U-Boot versions
      grub: remove GRUB_SUPPORTED_ARCH
      grub2: remove GRUB2_ARCH_SUPPORTED
      grub/grub2: drop unnecessary dependency on uclibc
      grub/grub2: update splash image location
      grub2: bump version
      grub2: fix build
      grub2: remove non-existing options
      grub2: only available on x86 and PowerPC and mark as BROKEN
      syslinux: bump version and fix build
      syslinux: remove the unnecessary SYSLINUX_SUPPORTED_ARCH check
      nasm: new package, needed for syslinux
      syslinux: depends on host-nasm
      at91bootstrap: do not default to $(BOARD_NAME)
      at91bootstrap: simplify configuration
      at91bootstrap: fix the boot source selection
      at91bootstrap: fix incorrect config option comment
      at91bootstrap: remove unused/useless code
      at91bootstrap: add a check to verify that BR2_TARGET_AT91BOOTSTRAP_BOARD is set
      at91bootstrap: bump version to 2.13
      at91bootstrap: don't use the ATMEL_MIRROR thing
      at91bootstrap: fix install procedure
      at91bootstrap: fix AT91BOOTSTRAP_BINARY
      at91dataflashboot: fix configuration options
      at91dataflashboot: various fixes
      at91dataflashboot: add a patch step
      at91dataflashboot: add two patches
      Add support for the Barebox bootloader
      linux: fix dependency on mkimage

 Config.in                                          |    2 +
 Makefile                                           |    3 +-
 boot/Config.in                                     |   12 +
 .../device/Atmel => boot}/at91bootstrap/Config.in  |   26 +-
 .../Atmel => boot}/at91bootstrap/at91bootstrap.mk  |   47 +-
 .../at91dataflashboot}/Config.in                   |   16 +-
 .../at91dataflashboot-1.05-do-not-install.patch    |   22 +
 .../at91dataflashboot-1.05-eabi-fixes.patch        |   43 +
 .../at91dataflashboot/at91dataflashboot.mk         |   23 +-
 boot/barebox/Config.in                             |   14 +
 boot/barebox/barebox.mk                            |   61 ++
 boot/common.mk                                     |    1 +
 {target/x86 => boot}/grub/Config.in                |    0
 .../x86 => boot}/grub/grub.100-autoreconf.patch    |    0
 .../grub/grub.200-fix_mbr_handling.patch           |    0
 .../grub/grub.300-honor_UCLIBC_HAS_LFS.patch       |    0
 .../grub/grub.400-nic_update2.patch.bz2            |  Bin 328903 -> 328903 bytes
 {target/x86 => boot}/grub/grub.mk                  |   25 +-
 {target/x86 => boot}/grub/menu.lst                 |    0
 {target/x86 => boot}/grub/splash.xpm.gz            |  Bin 45185 -> 45185 bytes
 boot/grub2/Config.in                               |    9 +
 boot/grub2/grub2.mk                                |   93 +++
 {target/x86 => boot}/syslinux/Config.in            |    0
 boot/syslinux/syslinux-3.85-makefile.patch         |   17 +
 boot/syslinux/syslinux.mk                          |   54 ++
 boot/u-boot/Config.in                              |  112 +++
 boot/u-boot/u-boot.mk                              |  193 +++++
 configs/at91rm9200df_defconfig                     |   25 +-
 configs/at91rm9200df_ext_defconfig                 |   25 +-
 configs/at91sam9260dfc_defconfig                   |   25 +-
 configs/at91sam9260dfc_ext_defconfig               |   25 +-
 configs/at91sam9261ek_defconfig                    |   25 +-
 configs/at91sam9261ek_ext_defconfig                |   25 +-
 configs/at91sam9263ek_defconfig                    |   25 +-
 configs/at91sam9263ek_ext_defconfig                |   25 +-
 configs/at91sam9g20dfc_defconfig                   |   25 +-
 configs/at91sam9g20dfc_ext_defconfig               |   25 +-
 configs/atngw100-base_defconfig                    |    8 +-
 configs/atngw100_defconfig                         |   27 +-
 configs/atstk1005_defconfig                        |    8 +-
 configs/atstk100x_defconfig                        |    8 +-
 configs/integrator926_defconfig                    |    8 +-
 configs/integrator926_huge_defconfig               |    8 +-
 configs/v100sc2_defconfig                          |    3 +-
 package/nasm/nasm.mk                               |   19 +
 target/Config.in                                   |    9 -
 target/Makefile.in                                 |    8 -
 target/device/Atmel/Config.in                      |    4 -
 target/device/Atmel/Makefile.in                    |   12 -
 target/device/Atmel/arch-arm/Makefile.in           |    2 -
 .../2009.01/u-boot-2009.01-001-at91rm9200.patch    |  723 ------------------
 .../u-boot-2009.01-002-at91rm9200dk.h.patch        |  309 --------
 .../2009.01/u-boot-2009.01-003-at91rm9200dk.patch  |  324 --------
 .../2009.01/u-boot-2009.01-004-at91rm9200ek.patch  |  536 -------------
 .../2009.01/u-boot-2009.01-005-at91sam9g20ek.patch |  801 --------------------
 .../u-boot-2009.01-006-drivers-net-macb.c.patch    |   28 -
 .../u-boot/2009.01/u-boot-2009.01-007-tools.patch  |  576 --------------
 .../2009.01/u-boot-2009.01-008-Makefile.patch      |   64 --
 .../2009.01/u-boot-2009.01-009-factory.patch       |  323 --------
 .../2009.01/u-boot-2009.01-010-coloured_led.patch  |  196 -----
 .../u-boot/2009.01/u-boot-2009.01-011-spimux.patch |   93 ---
 .../2009.01/u-boot-2009.01-012-ethinit.patch       |   77 --
 .../2009.01/u-boot-2009.01-013-configs.patch       |  130 ----
 target/device/Atmel/arch-arm/u-boot/Config.in      |   21 -
 target/device/Atmel/arch-arm/u-boot/Makefile.in    |    4 -
 target/device/Config.in.u-boot                     |    9 -
 target/linux/Config.in.advanced                    |    1 -
 target/linux/Makefile.in.advanced                  |    4 +-
 target/powerpc/Makefile.in                         |    1 -
 target/powerpc/yaboot/Config.in                    |    5 -
 target/powerpc/yaboot/yaboot.mk                    |   44 --
 target/u-boot/Config.in                            |  378 ---------
 target/u-boot/Makefile.in                          |  293 -------
 ...boot-2009.01-include_asm-avr32_io.h.patch.avr32 |   13 -
 target/x86/Makefile.in                             |    3 -
 target/x86/grub2/Config.in                         |   13 -
 .../x86/grub2/grub-1.95-001-fix-grub-install.patch |   23 -
 target/x86/grub2/grub2.mk                          |  134 ----
 target/x86/syslinux/syslinux-3.82-makefile.patch   |   11 -
 target/x86/syslinux/syslinux.mk                    |   70 --
 80 files changed, 714 insertions(+), 5640 deletions(-)
 create mode 100644 boot/Config.in
 rename {target/device/Atmel => boot}/at91bootstrap/Config.in (71%)
 rename {target/device/Atmel => boot}/at91bootstrap/at91bootstrap.mk (65%)
 rename {target/device/Atmel/DataFlashBoot => boot/at91dataflashboot}/Config.in (53%)
 create mode 100644 boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
 create mode 100644 boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch
 rename target/device/Atmel/DataFlashBoot/DataflashBoot.mk => boot/at91dataflashboot/at91dataflashboot.mk (65%)
 create mode 100644 boot/barebox/Config.in
 create mode 100644 boot/barebox/barebox.mk
 create mode 100644 boot/common.mk
 rename {target/x86 => boot}/grub/Config.in (100%)
 rename {target/x86 => boot}/grub/grub.100-autoreconf.patch (100%)
 rename {target/x86 => boot}/grub/grub.200-fix_mbr_handling.patch (100%)
 rename {target/x86 => boot}/grub/grub.300-honor_UCLIBC_HAS_LFS.patch (100%)
 rename {target/x86 => boot}/grub/grub.400-nic_update2.patch.bz2 (100%)
 rename {target/x86 => boot}/grub/grub.mk (89%)
 rename {target/x86 => boot}/grub/menu.lst (100%)
 rename {target/x86 => boot}/grub/splash.xpm.gz (100%)
 create mode 100644 boot/grub2/Config.in
 create mode 100644 boot/grub2/grub2.mk
 rename {target/x86 => boot}/syslinux/Config.in (100%)
 create mode 100644 boot/syslinux/syslinux-3.85-makefile.patch
 create mode 100644 boot/syslinux/syslinux.mk
 create mode 100644 boot/u-boot/Config.in
 create mode 100644 boot/u-boot/u-boot.mk
 create mode 100644 package/nasm/nasm.mk
 delete mode 100644 target/device/Atmel/arch-arm/Makefile.in
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-001-at91rm9200.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-002-at91rm9200dk.h.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-003-at91rm9200dk.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-004-at91rm9200ek.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-005-at91sam9g20ek.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-006-drivers-net-macb.c.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-007-tools.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-008-Makefile.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-009-factory.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-010-coloured_led.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-011-spimux.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-012-ethinit.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/2009.01/u-boot-2009.01-013-configs.patch
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/Config.in
 delete mode 100644 target/device/Atmel/arch-arm/u-boot/Makefile.in
 delete mode 100644 target/device/Config.in.u-boot
 delete mode 100644 target/powerpc/Makefile.in
 delete mode 100644 target/powerpc/yaboot/Config.in
 delete mode 100644 target/powerpc/yaboot/yaboot.mk
 delete mode 100644 target/u-boot/Config.in
 delete mode 100644 target/u-boot/Makefile.in
 delete mode 100644 target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
 delete mode 100644 target/x86/Makefile.in
 delete mode 100644 target/x86/grub2/Config.in
 delete mode 100644 target/x86/grub2/grub-1.95-001-fix-grub-install.patch
 delete mode 100644 target/x86/grub2/grub2.mk
 delete mode 100644 target/x86/syslinux/syslinux-3.82-makefile.patch
 delete mode 100644 target/x86/syslinux/syslinux.mk

Thanks,
-- 
Thomas Petazzoni
