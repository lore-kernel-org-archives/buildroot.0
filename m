From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:14 +0200
Subject: [Buildroot] [PATCH 00/23] Remove Blackfin architecture
Message-ID: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The Blackfin architecture has for a long time been complicated to
maintain, with poor support in upstream binutils/gcc. As of April
2018, the Blackfin architecture has been dropped from the upstream
Linux kernel [1]. Also, the Analog Device engineer who used to be in touch
with the Buildroot community also privately said we should drop the
support for this architecture, which Analog Devices is no longer
using, promoting and maintaining.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f5a8eb632b562bd9c16c389f5db3a5260fba4157

Therefore, it is time to remove it from Buildroot, and this patch
series does exactly this.

It starts by removing the autobuilder toolchain configuration, and the
only defconfig that was using Blackfin. Then it removes the Blackfin
architecture option itself. The rest of the series is about removing
Blackfin logic everywhere else in the toolchain and packages,
including removing Blackfin-specific patches.

Thomas

Thomas Petazzoni (23):
  support/config-fragments/autobuild: remove Blackfin configuration
  configs/gdb_bfin_bf512: remove defconfig
  arch: remove Blackfin architecture
  arch: drop BR2_BINFMT_FLAT_SEP_DATA support
  boot/uboot: remove Blackfin related code
  linux: remove Blackfin related code
  toolchain, gcc, gdb, binutils, uclibc: remove Blackfin code
  gcc: remove Blackfin patches
  binutils: remove Blackfin patches
  package: remove Blackfin related code
  cairo: remove Blackfin related patch
  ffmpeg: remove Blackfin related patch
  gdb: remove Blackfin patch
  gdb/7.10: remove Blackfin patch
  graphite2: remove Blackfin related patch
  icu: remove Blackfin patch
  libselinux: remove Blackfin patch
  libpng: remove Blackfin patch
  libsemanage: remove Blackfin patch
  libsepol: remove Blackfin patch
  p7zip: remove Blackfin patch
  wayland: remove Blackfin patch
  php: remove Blackfin patch

 .gitlab-ci.yml                                     |    1 -
 Config.in.legacy                                   |   15 +
 DEVELOPERS                                         |    1 -
 Makefile                                           |    1 -
 arch/Config.in                                     |   28 +-
 arch/Config.in.bfin                                |  102 -
 board/gdb/bfin-bf512/linux.config                  |   87 -
 board/gdb/bfin-bf512/readme.txt                    |   11 -
 board/gdb/post-build.sh                            |    4 -
 boot/uboot/Config.in                               |    4 -
 boot/uboot/uboot.mk                                |    4 -
 configs/gdb_bfin_bf512_defconfig                   |   33 -
 linux/Config.in                                    |    2 +-
 package/Makefile.in                                |    6 -
 package/acpitool/Config.in                         |    2 -
 package/alsa-lib/alsa-lib.mk                       |    6 -
 package/armadillo/Config.in                        |    2 -
 package/atest/Config.in                            |    2 -
 package/avrdude/Config.in                          |    2 -
 package/binutils/2.27/0905-bfin-rofixup-bug.patch  |   21 -
 .../binutils/2.28.1/0905-bfin-rofixup-bug.patch    |   21 -
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch |   31 -
 ...LINKER-BUG-.rofixup-section-size-mismatch.patch |   31 -
 package/binutils/binutils.mk                       |    6 -
 package/busybox/Config.in                          |    2 -
 package/cairo/0001-blackfin-build-fix.patch        |   55 -
 ...ork-build.patch => 0001-fix-nofork-build.patch} |    0
 ...-49-build.patch => 0002-fix-gcc-49-build.patch} |    0
 package/clapack/Config.in                          |    4 -
 package/dvblast/Config.in                          |    2 -
 package/elfutils/Config.in                         |    4 -
 .../ffmpeg/0001-bfin-disable-optimization.patch    |   26 -
 ...g-pthreads.patch => 0001-ffmpeg-pthreads.patch} |    0
 ...bgcc-mkmap-symver-support-skip_underscore.patch |   60 -
 ...ig-bfin-use-the-generic-linker-version-in.patch | 1944 --------------------
 ...-fix-DWARF-compilation-with-FDPIC-targets.patch |   59 -
 package/gcc/6.4.0/895-bfin-define-REENTRANT.patch  |   17 -
 package/gcc/Config.in.host                         |    7 -
 package/gcc/gcc-final/gcc-final.mk                 |    4 -
 package/gcc/gcc.mk                                 |   41 -
 .../0006-Revert-sim-unify-SIM_CPU-definition.patch |  372 ----
 ...-Sync-proc_service-definition-with-GLIBC.patch} |    0
 ...efine-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} |    0
 ...fine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch} |    0
 ...0009-Fix-gdbserver-build-on-uClibc-noMMU.patch} |    0
 ...gidefs.h.patch => 0010-use-asm-sgidefs.h.patch} |    0
 ...-Sync-proc_service-definition-with-GLIBC.patch} |    0
 ...lit-out-common-mach-model-defines-into-ar.patch |  155 --
 ...efine-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} |    0
 ...fine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch} |    0
 ...0004-Fix-gdbserver-build-on-uClibc-noMMU.patch} |    0
 ...gidefs.h.patch => 0005-use-asm-sgidefs.h.patch} |    0
 package/gdb/Config.in                              |    1 -
 package/gdb/gdb.mk                                 |    8 -
 package/gptfdisk/Config.in                         |    1 -
 .../graphite2/0001-disable-double-promotion.patch  |   23 -
 package/gstreamer/gst-plugins-bad/Config.in        |    1 -
 package/gstreamer1/gst1-plugins-good/Config.in     |    2 -
 .../icu/0003-detect-compiler-symbol-prefix.patch   |  116 --
 ....patch => 0003-link-icudata-as-data-only.patch} |    0
 ...h => 0004-fix-static-linking-with-icu-uc.patch} |    0
 package/iprutils/Config.in                         |    1 -
 package/leveldb/Config.in                          |    3 -
 package/libbsd/Config.in                           |    1 -
 package/libev/Config.in                            |    2 -
 package/libfreeimage/Config.in                     |    3 -
 package/libmicrohttpd/libmicrohttpd.mk             |    9 +-
 package/libnspr/Config.in                          |    2 +-
 ...-prefix-to-symbol-names-in-version-script.patch |   55 -
 ...-musl-build.patch => 0001-fix-musl-build.patch} |    0
 .../0001-workaround-blackfin-issue.patch           |   24 -
 ...uild-follow-standard-semantics-for-DESTD.patch} |    0
 ...elative.patch => 0003-revert-ln-relative.patch} |    0
 ...uild-follow-standard-semantics-for-DESTD.patch} |    0
 .../0001-workaround-blackfin-issue.patch           |   25 -
 ...c-only.patch => 0002-support-static-only.patch} |    0
 .../libsepol/0002-workaround-blackfin-issue.patch  |   26 -
 ...elative.patch => 0003-revert-ln-relative.patch} |    0
 package/libvpx/Config.in                           |    2 -
 package/libxslt/libxslt.mk                         |    6 -
 package/linux-tools/Config.in                      |    1 -
 package/lua-ev/Config.in                           |    1 -
 package/micropython/Config.in                      |    3 -
 package/mplayer/Config.in                          |    2 +-
 package/ncurses/Config.in                          |    2 -
 package/p7zip/0001-bfin.patch                      |   19 -
 package/pciutils/Config.in                         |    2 -
 ...ch => 0006-Call-apxs-with-correct-prefix.patch} |    0
 package/php/0006-avoid-bfin-gcc-segfault.patch     |   17 -
 ....c-build-empty-php_load_zend_extension_c.patch} |    0
 package/poco/Config.in                             |    4 +-
 package/powertop/Config.in                         |    2 -
 package/ptpd2/ptpd2.mk                             |    6 -
 package/qemu/qemu.mk                               |    1 -
 package/riemann-c-client/riemann-c-client.mk       |    5 -
 package/ruby/ruby.mk                               |    7 -
 package/sg3_utils/Config.in                        |    2 -
 package/tvheadend/Config.in                        |    2 +-
 package/uclibc/Config.in                           |    3 +-
 package/uclibc/uclibc.mk                           |    8 -
 ...hitectures-with-non-empty-__USER_LABEL_PR.patch |   57 -
 ...01-configure-add-option-to-disable-tests.patch} |    0
 package/xenomai/Config.in                          |    2 +-
 .../config-fragments/autobuild/br-bfin-full.config |   12 -
 .../autobuild/toolchain-configs.csv                |    3 -
 toolchain/Config.in                                |    1 -
 toolchain/toolchain-buildroot/Config.in            |    2 +-
 utils/test-pkg                                     |    2 +-
 108 files changed, 30 insertions(+), 3622 deletions(-)
 delete mode 100644 arch/Config.in.bfin
 delete mode 100644 board/gdb/bfin-bf512/linux.config
 delete mode 100644 board/gdb/bfin-bf512/readme.txt
 delete mode 100755 board/gdb/post-build.sh
 delete mode 100644 configs/gdb_bfin_bf512_defconfig
 delete mode 100644 package/binutils/2.27/0905-bfin-rofixup-bug.patch
 delete mode 100644 package/binutils/2.28.1/0905-bfin-rofixup-bug.patch
 delete mode 100644 package/binutils/2.29.1/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
 delete mode 100644 package/binutils/2.30/0006-Fixes-LINKER-BUG-.rofixup-section-size-mismatch.patch
 delete mode 100644 package/cairo/0001-blackfin-build-fix.patch
 rename package/cairo/{0003-fix-nofork-build.patch => 0001-fix-nofork-build.patch} (100%)
 rename package/cairo/{0005-fix-gcc-49-build.patch => 0002-fix-gcc-49-build.patch} (100%)
 delete mode 100644 package/ffmpeg/0001-bfin-disable-optimization.patch
 rename package/ffmpeg/{0002-ffmpeg-pthreads.patch => 0001-ffmpeg-pthreads.patch} (100%)
 delete mode 100644 package/gcc/6.4.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
 delete mode 100644 package/gcc/6.4.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
 delete mode 100644 package/gcc/6.4.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
 delete mode 100644 package/gcc/6.4.0/895-bfin-define-REENTRANT.patch
 delete mode 100644 package/gdb/7.10.1/0006-Revert-sim-unify-SIM_CPU-definition.patch
 rename package/gdb/7.10.1/{0007-Sync-proc_service-definition-with-GLIBC.patch => 0006-Sync-proc_service-definition-with-GLIBC.patch} (100%)
 rename package/gdb/7.10.1/{0008-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0007-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (100%)
 rename package/gdb/7.10.1/{0009-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch => 0008-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch} (100%)
 rename package/gdb/7.10.1/{0010-Fix-gdbserver-build-on-uClibc-noMMU.patch => 0009-Fix-gdbserver-build-on-uClibc-noMMU.patch} (100%)
 rename package/gdb/7.10.1/{0011-use-asm-sgidefs.h.patch => 0010-use-asm-sgidefs.h.patch} (100%)
 rename package/gdb/7.11.1/{0002-Sync-proc_service-definition-with-GLIBC.patch => 0001-Sync-proc_service-definition-with-GLIBC.patch} (100%)
 delete mode 100644 package/gdb/7.11.1/0001-sim-bfin-split-out-common-mach-model-defines-into-ar.patch
 rename package/gdb/7.11.1/{0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (100%)
 rename package/gdb/7.11.1/{0004-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch => 0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch} (100%)
 rename package/gdb/7.11.1/{0005-Fix-gdbserver-build-on-uClibc-noMMU.patch => 0004-Fix-gdbserver-build-on-uClibc-noMMU.patch} (100%)
 rename package/gdb/7.11.1/{0006-use-asm-sgidefs.h.patch => 0005-use-asm-sgidefs.h.patch} (100%)
 delete mode 100644 package/graphite2/0001-disable-double-promotion.patch
 delete mode 100644 package/icu/0003-detect-compiler-symbol-prefix.patch
 rename package/icu/{0004-link-icudata-as-data-only.patch => 0003-link-icudata-as-data-only.patch} (100%)
 rename package/icu/{0005-fix-static-linking-with-icu-uc.patch => 0004-fix-static-linking-with-icu-uc.patch} (100%)
 delete mode 100644 package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
 rename package/libselinux/{0002-fix-musl-build.patch => 0001-fix-musl-build.patch} (100%)
 delete mode 100644 package/libselinux/0001-workaround-blackfin-issue.patch
 rename package/libselinux/{0003-libselinux-build-follow-standard-semantics-for-DESTD.patch => 0002-libselinux-build-follow-standard-semantics-for-DESTD.patch} (100%)
 rename package/libselinux/{0004-revert-ln-relative.patch => 0003-revert-ln-relative.patch} (100%)
 rename package/libsemanage/{0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch => 0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch} (100%)
 delete mode 100644 package/libsemanage/0001-workaround-blackfin-issue.patch
 rename package/libsepol/{0003-support-static-only.patch => 0002-support-static-only.patch} (100%)
 delete mode 100644 package/libsepol/0002-workaround-blackfin-issue.patch
 rename package/libsepol/{0004-revert-ln-relative.patch => 0003-revert-ln-relative.patch} (100%)
 delete mode 100644 package/p7zip/0001-bfin.patch
 rename package/php/{0007-Call-apxs-with-correct-prefix.patch => 0006-Call-apxs-with-correct-prefix.patch} (100%)
 delete mode 100644 package/php/0006-avoid-bfin-gcc-segfault.patch
 rename package/php/{0008-main-php_ini.c-build-empty-php_load_zend_extension_c.patch => 0007-main-php_ini.c-build-empty-php_load_zend_extension_c.patch} (100%)
 delete mode 100644 package/wayland/0001-Support-architectures-with-non-empty-__USER_LABEL_PR.patch
 rename package/wayland/{0002-configure-add-option-to-disable-tests.patch => 0001-configure-add-option-to-disable-tests.patch} (100%)
 delete mode 100644 support/config-fragments/autobuild/br-bfin-full.config

-- 
2.14.3
