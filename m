From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:32 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	remove-external-toolchain
Message-ID: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patchset removes the external source toolchain feature from
Buildroot. It was used to build AVR32 toolchains because the AVR32
architecture is unfortunately not supported by upstream
gcc/binutils/gdb/uClibc. So the whole external source toolchain
infrastructure was implemented to allow to get these components from
other places than the normal mirrors.

However, this infrastructure is far more complicated than it needs to
be. This patchset replaces it by integrated the avr32 special versions
as normal gcc/binutils/gdb/uClibc versions. The respective .mk files
detect whether the version name contains avr32, and if it does, then
it switches to the AT91 mirror. Only the latest versions of
binutils/gcc/uClibc/gdb for AVR32 were kept (they are already fairly
ancient).

I've compiled tested an AVR32 toolchain + BusyBox and an ARM toolchain
+ Busybox.


The following changes since commit 8bbb56dd9109354f66e428b4a0f83d637851643b:
  Peter Korsgaard (1):
        kernel-headers: bump 2.6.31.x / 2.6.32.x stable versions

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot remove-external-toolchain

Thomas Petazzoni (23):
      binutils: add avr32 special version
      gcc: add avr32 special version
      gcc: add 4.2.2-avr32-2.1.5 patches
      gdb: add avr32 special verson
      uclibc: add avr32 special version
      gcc: on avr32, only allow avr32 gcc versions
      gcc: improve configuration for snapshot versions
      gcc: remove support for external source toolchains
      gcc: remove GCC_OFFICIAL_VERSION and just use GCC_VERSION instead
      binutils: do not allow selection of non-avr32 versions on AVR32
      binutils: remove support for external source toolchains
      gdb: do not allow selection of non-avr32 versions on AVR32
      uclibc: do not allow selection of non-avr32 versions on AVR32
      uclibc: remove support for external source toolchains
      Use BR2_TOOLCHAIN_BUILDROOT instead of BR2_TOOLCHAIN_SOURCE
      Remove external source toolchain options
      gcc: remove external sources patches
      gdb: remove external sources patches
      uclibc: remove external sources patches
      binutils: remove external source patches
      Update non-AVR32 defconfigs
      update AVR32 defconfigs
      remove unused AVR32 specific uClibc configuration

 Makefile                                           |    4 +-
 configs/arm_toolchain_defconfig                    |   11 -
 configs/at91rm9200df_defconfig                     |   11 -
 configs/at91rm9200df_ext_bare_defconfig            |   11 -
 configs/at91rm9200df_ext_defconfig                 |   11 -
 configs/at91sam9260dfc_defconfig                   |   11 -
 configs/at91sam9260dfc_ext_bare_defconfig          |   11 -
 configs/at91sam9260dfc_ext_defconfig               |   11 -
 configs/at91sam9261ek_defconfig                    |   11 -
 configs/at91sam9261ek_ext_bare_defconfig           |   11 -
 configs/at91sam9261ek_ext_defconfig                |   11 -
 configs/at91sam9263ek_defconfig                    |   11 -
 configs/at91sam9263ek_ext_bare_defconfig           |   11 -
 configs/at91sam9263ek_ext_defconfig                |   11 -
 configs/at91sam9g20dfc_defconfig                   |   11 -
 configs/at91sam9g20dfc_ext_bare_defconfig          |   11 -
 configs/at91sam9g20dfc_ext_defconfig               |   11 -
 configs/atngw100-base_defconfig                    |   44 +---
 configs/atngw100_defconfig                         |   50 ++---
 configs/atstk1005_defconfig                        |   47 ++---
 configs/atstk100x_defconfig                        |   50 ++---
 configs/i386_defconfig                             |   12 -
 configs/i686_defconfig                             |   12 -
 configs/integrator926_defconfig                    |   11 -
 configs/integrator926_huge_defconfig               |   11 -
 configs/kb9202_defconfig                           |    7 -
 configs/v100sc2_defconfig                          |   24 +--
 package/Makefile.in                                |    4 +-
 target/Config.in                                   |    2 +-
 target/device/Atmel/uClibc.config.avr32            |  227 --------------------
 target/device/Config.in.toolchain                  |  219 -------------------
 target/xtensa/defconfig                            |    3 +-
 toolchain/Config.in                                |   12 -
 toolchain/Config.in.1                              |    2 +-
 toolchain/Config.in.2                              |    6 +-
 toolchain/binutils/Config.in                       |   14 +-
 toolchain/binutils/binutils.mk                     |   15 +-
 ...-fix-removal-of-redundant-cast-operations.patch |    0
 ...conditional-insn-which-clobbers-cc_status.patch |    0
 ...use-movh-to-move-immediates-into-register.patch |    0
 toolchain/gcc/Config.in                            |   33 ++--
 toolchain/gcc/Makefile.in                          |    2 +-
 .../901-avr32-revert-broken-uclibc-stuff.patch     |   42 ----
 toolchain/gcc/gcc-uclibc-3.x.mk                    |   39 +---
 toolchain/gcc/gcc-uclibc-4.x.mk                    |   41 +---
 toolchain/gdb/Config.in                            |    8 +-
 toolchain/gdb/gdb.mk                               |   13 +-
 toolchain/uClibc/Config.in                         |   19 ++-
 .../uClibc-0.9.28.3-avr32-2.0-001-libext.patch     |   13 --
 ...libc-0.9.28.3-avr32-2.0-002-rm-whitespace.patch |   77 -------
 ...uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch |    0
 toolchain/uClibc/uclibc.mk                         |   28 +--
 52 files changed, 159 insertions(+), 1108 deletions(-)
 delete mode 100644 target/device/Atmel/uClibc.config.avr32
 delete mode 100644 target/device/Config.in.toolchain
 delete mode 100644 toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.0/.empty
 delete mode 100644 toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.3/.empty
 delete mode 100644 toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.5/.empty
 delete mode 100644 toolchain/binutils/ext_source/Atmel/avr32/2.18-avr32-1.0.1/.empty
 rename toolchain/gcc/{ext_source/Atmel/avr32 => }/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch (100%)
 rename toolchain/gcc/{ext_source/Atmel/avr32 => }/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch (100%)
 rename toolchain/gcc/{ext_source/Atmel/avr32 => }/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch (100%)
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.3-avr32-2.1.5/.empty
 delete mode 100644 toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.0/.empty
 delete mode 100644 toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.1.3/.empty
 delete mode 100644 toolchain/gdb/ext_source/Atmel/avr32/6.7.1-avr32-2.1.5/.empty
 delete mode 100644 toolchain/uClibc/ext_source/Atmel/avr32/0.9.28.3-avr32-2.0/uClibc-0.9.28.3-avr32-2.0-001-libext.patch
 delete mode 100644 toolchain/uClibc/ext_source/Atmel/avr32/0.9.28.3-avr32-2.0/uClibc-0.9.28.3-avr32-2.0-002-rm-whitespace.patch
 delete mode 100644 toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.3/.empty
 delete mode 100644 toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.5/.empty
 delete mode 100644 toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/.empty
 rename toolchain/uClibc/{ext_source/Atmel/avr32/0.9.30-avr32-2.1.5 => }/uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch (100%)

Thanks,
-- 
Thomas Petazzoni
