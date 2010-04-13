From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:12 +0200
Subject: [Buildroot] [RFC] Bootloader cleanup work
Message-ID: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since I didn't get a lot of feedback on my latest "target/ cleanup
status" e-mail, dated April, 4th, I'm sending the different remaining
parts of the work I've done so far.

This part is the bootloader cleanup part. I think it needs more review
and testing than the filesystem cleanup I've done (especially the
U-Boot code). Here is a summary of the changes :

    - Instead of spreading all bootloader's code in various directories
      in target/, it is now gathered in a boot/ directory

    - In terms of configuration, a new top-level configuration item is
      available to configure bootloaders, instead of hiding them in
      "Target filesystem support"

    - Support for yaboot has been removed.

    - Support for U-Boot has been considerably simplified, with much
      fewer configuration options. I'd appreciate if people using the
      removed options could tell us why they are useful in their
      projects.

    - Support for grub, grub2 and syslinux has been slightly
      cleaned-up. More work is needed on grub2 to make it really useful.

Please tell me what you think about this, and whether I should
continue to push this.

Best regards,

Thomas

The following changes since commit 04ba0089a672863e333a2de6b19d9b77fd0b26c1:
  Thomas Petazzoni (1):
        Get rid of the OPTIMIZE_FOR_CPU variable

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot bootloaders-cleanup

Thomas Petazzoni (35):
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
      grub: remove GRUB_SUPPORTED_ARCH
      grub2: remove GRUB2_ARCH_SUPPORTED
      grub/grub2: drop unnecessary dependency on uclibc
      grub/grub2: update splash image location
      grub2: bump version
      grub2: fix build
      grub2: remove non-existing options
      syslinux: bump version and fix build
      syslinux: remove the unnecessary SYSLINUX_SUPPORTED_ARCH check
      at91bootstrap: do not default to $(BOARD_NAME)
      at91bootstrap: simplify configuration
      at91bootstrap: fix the boot source selection
      at91bootstrap: fix incorrect config option comment
      at91bootstrap: remove unused/useless code
      at91bootstrap: add a check to verify that BR2_TARGET_AT91BOOTSTRAP_BOARD is set
      at91dataflashboot: fix configuration options
      at91dataflashboot: various fixes
      at91dataflashboot: add a patch step
      at91dataflashboot: add two patches
      defconfigs: remove references to old U-Boot versions

 Config.in                                          |    2 +
 Makefile                                           |    1 +
 boot/Config.in                                     |   11 +
 .../device/Atmel => boot}/at91bootstrap/Config.in  |   26 +-
 .../Atmel => boot}/at91bootstrap/at91bootstrap.mk  |   25 +-
 .../at91dataflashboot}/Config.in                   |   16 +-
 .../at91dataflashboot-1.05-do-not-install.patch    |   22 +
 .../at91dataflashboot-1.05-eabi-fixes.patch        |   43 +
 .../at91dataflashboot/at91dataflashboot.mk         |   23 +-
 boot/common.mk                                     |    1 +
 {target/x86 => boot}/grub/Config.in                |    0
 .../x86 => boot}/grub/grub.100-autoreconf.patch    |    0
 .../grub/grub.200-fix_mbr_handling.patch           |    0
 .../grub/grub.300-honor_UCLIBC_HAS_LFS.patch       |    0
 .../grub/grub.400-nic_update2.patch.bz2            |  Bin 328903 -> 328903 bytes
 {target/x86 => boot}/grub/grub.mk                  |   25 +-
 {target/x86 => boot}/grub/menu.lst                 |    0
 {target/x86 => boot}/grub/splash.xpm.gz            |  Bin 45185 -> 45185 bytes
 boot/grub2/Config.in                               |    4 +
 boot/grub2/grub2.mk                                |   92 +++
 {target/x86 => boot}/syslinux/Config.in            |    0
 boot/syslinux/syslinux-3.85-makefile.patch         |   17 +
 {target/x86 => boot}/syslinux/syslinux.mk          |   46 +-
 boot/u-boot/Config.in                              |  103 +++
 boot/u-boot/u-boot.mk                              |  178 +++++
 configs/at91rm9200df_defconfig                     |    2 -
 configs/at91rm9200df_ext_defconfig                 |    2 -
 configs/at91sam9260dfc_defconfig                   |    2 -
 configs/at91sam9260dfc_ext_defconfig               |    2 -
 configs/at91sam9261ek_defconfig                    |    2 -
 configs/at91sam9261ek_ext_defconfig                |    2 -
 configs/at91sam9263ek_defconfig                    |    2 -
 configs/at91sam9263ek_ext_defconfig                |    2 -
 configs/at91sam9g20dfc_defconfig                   |    2 -
 configs/at91sam9g20dfc_ext_defconfig               |    2 -
 configs/atngw100-base_defconfig                    |    2 -
 configs/atngw100_defconfig                         |    2 -
 configs/atstk1005_defconfig                        |    2 -
 configs/atstk100x_defconfig                        |    2 -
 configs/integrator926_defconfig                    |    2 -
 configs/integrator926_huge_defconfig               |    2 -
 target/Config.in                                   |    9 -
 target/Makefile.in                                 |    6 -
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
 target/powerpc/Makefile.in                         |    1 -
 target/powerpc/yaboot/Config.in                    |    5 -
 target/powerpc/yaboot/yaboot.mk                    |   44 --
 target/u-boot/Config.in                            |  380 ----------
 target/u-boot/Makefile.in                          |  293 -------
 ...boot-2009.01-include_asm-avr32_io.h.patch.avr32 |   13 -
 target/x86/Makefile.in                             |    3 -
 target/x86/grub2/Config.in                         |   13 -
 .../x86/grub2/grub-1.95-001-fix-grub-install.patch |   23 -
 target/x86/grub2/grub2.mk                          |  134 ----
 target/x86/syslinux/syslinux-3.82-makefile.patch   |   11 -
 73 files changed, 523 insertions(+), 5311 deletions(-)
 create mode 100644 boot/Config.in
 rename {target/device/Atmel => boot}/at91bootstrap/Config.in (71%)
 rename {target/device/Atmel => boot}/at91bootstrap/at91bootstrap.mk (79%)
 rename {target/device/Atmel/DataFlashBoot => boot/at91dataflashboot}/Config.in (53%)
 create mode 100644 boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
 create mode 100644 boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch
 rename target/device/Atmel/DataFlashBoot/DataflashBoot.mk => boot/at91dataflashboot/at91dataflashboot.mk (65%)
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
 rename {target/x86 => boot}/syslinux/syslinux.mk (52%)
 create mode 100644 boot/u-boot/Config.in
 create mode 100644 boot/u-boot/u-boot.mk
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

Thanks,
-- 
Thomas Petazzoni
