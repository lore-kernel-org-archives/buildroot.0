From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 Feb 2017 18:39:54 +0100
Subject: [Buildroot] [PATCH 0/7] gcc5 fixes for defconfigs
Message-ID: <20170228174001.23830-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Ever since we switched to gcc5 as default, a number of defconfigs have
been failing. Since we currently don't test the defconfigs this went
largely unnoticed.

 This series fixes the remaining defconfigs. Since I don't have access
to most of the boards, I couldn't test the changes, so I've opted for
the safe fix: apply the patch that adds gcc5 support to kernel and boot
loader.

 To avoid repeating the same exercise when we switch to gcc6 as default,
I've opted for the patch that removes the version-specific
compiler-gcc[345].h.

 Since the same kernel patch is used by a number of defconfigs, I've
put it in a common directory under board/, and use BR2_GLOBAL_PATCH_DIR
to refer to it. For U-Boot that wasn't possible because the context is
always slightly different. Therefore the patches are in board-specific
directories. The two Altera platforms can still share some of the
patches.

 This series has only been build-tested, not runtime tested. However,
the compiler-gcc.h change should be safe (if it breaks something, it
would be compilation itself because a definition is missing).

 Note: the yocto repository used by minnowboard_defconfig seems to be
either broken or unreliable. AFAIK minnowboard should be fully supported
by the upstream kernel, so it would be nice if someone who has the board
could try that.

 Regards,
 Arnout

----------------------------------------------------------------
The following changes since commit 35e02aeb7b493d61bbc3e90903337b4964e0213c:

  assimp: fix gcc version condition (2017-02-27 22:53:24 +0100)

are available in the git repository at:

  http://gitlab.com/arnout/buildroot fix-defconfigs-gcc5

for you to fetch changes up to 70688c47309c7e5bfde7a835c5af5670e8c6c942:

  altera_sockit_defconfig: fix build with gcc5 (2017-02-28 18:27:38 +0100)

----------------------------------------------------------------
Arnout Vandecappelle (7):
      board: add shared patch to fix linux gcc5 issues
      minnowboard_defconfig: fix build with gcc5
      telit_evk_pro3_defconfig: fix build with gcc5
      roseapplepi_defconfig: use common kernel patch for gcc5
      via_imx6_vab820_defconfig: fix build with gcc5
      altera_socdk_defconfig: fix build with gcc5
      altera_sockit_defconfig: fix build with gcc5

 ...ux-Change-extern-inline-to-static-inline-.patch |  62 ++
 ...c.h-remove-dependency-on-compiler-gcc-345.patch | 191 +++++++
 .../0002-ARM-asm-io.h-use-static-inline.patch      |  81 +++
 ...mon-main.c-make-show_boot_progress-__weak.patch |  43 ++
 .../patches/uboot/0004-arm-board-use-__weak.patch  |  88 +++
 .../patches/uboot/0004-arm-board-use-__weak.patch  |  80 +++
 ...socfpga-don-t-use-extern-inline-functions.patch | 161 ++++++
 ...add-to-sockit-a-working-preloader-design.patch} |  20 +-
 ...c-integrate-the-various-compiler-gcc-345-.patch | 173 ++++++
 ...LVMLinux-use-static-inline-in-ARM-ftrace.patch} |  17 +-
 ...ove-inline-keyword-for-exported-functions.patch | 159 ++++++
 .../linux/0002-kernel-add-support-for-gcc-5.patch  |  99 ----
 .../0001-watchdog-add-keep-alive-support.patch}    |  12 +-
 ...2-watchdog-add-at91sam9-watchdog-support.patch} |  14 +-
 ...003-at91sam9260-9g20-add-wathdog-support.patch} |   8 +-
 ...004-at91sam9260-9g20-fix-wathdog-support.patch} |   8 +-
 .../0005-watchdog-enable-for-evk-pro3.patch}       |   8 +-
 ...ild-update-compiler-.h-to-newest-versions.patch | 632 +++++++++++++++++++++
 ...c.h-remove-dependency-on-compiler-gcc-345.patch | 191 +++++++
 .../0002-ARM-asm-io.h-use-static-inline.patch      |  81 +++
 ...mon-main.c-make-show_boot_progress-__weak.patch |  35 ++
 .../patches/uboot/0004-arm-board-use-__weak.patch  |  88 +++
 configs/altera_socdk_defconfig                     |   3 +
 configs/altera_sockit_defconfig                    |   4 +-
 configs/minnowboard_defconfig                      |   3 +
 configs/roseapplepi_defconfig                      |   2 +-
 configs/telit_evk_pro3_defconfig                   |   4 +-
 configs/via_imx6_vab820_defconfig                  |   3 +
 28 files changed, 2125 insertions(+), 145 deletions(-)
 create mode 100644 board/altera/patches/linux/0003-ARM-LLVMLinux-Change-extern-inline-to-static-inline-.patch
 create mode 100644 board/altera/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
 create mode 100644 board/altera/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
 create mode 100644 board/altera/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
 create mode 100644 board/altera/socdk/patches/uboot/0004-arm-board-use-__weak.patch
 create mode 100644 board/altera/sockit/patches/uboot/0004-arm-board-use-__weak.patch
 create mode 100644 board/altera/sockit/patches/uboot/0005-socfpga-don-t-use-extern-inline-functions.patch
 rename board/altera/sockit/{uboot-sockit-preloader-sample-design.patch => patches/uboot/0006-board-add-to-sockit-a-working-preloader-design.patch} (98%)
 create mode 100644 board/linux-gcc-patches/linux/0001-compiler-gcc-integrate-the-various-compiler-gcc-345-.patch
 rename board/{roseapplepi/patches/linux/0003-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch => linux-gcc-patches/linux/0002-ARM-8158-1-LLVMLinux-use-static-inline-in-ARM-ftrace.patch} (82%)
 create mode 100644 board/minnowboard/patches/linux/0001-pch_gbe-remove-inline-keyword-for-exported-functions.patch
 delete mode 100644 board/roseapplepi/patches/linux/0002-kernel-add-support-for-gcc-5.patch
 rename board/telit/evk-pro3/{barebox-2013.04.0-0001-watchdog-add-keep-alive-support.patch => patches/barebox/0001-watchdog-add-keep-alive-support.patch} (89%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0002-watchdog-add-at91sam9-watchdog-support.patch => patches/barebox/0002-watchdog-add-at91sam9-watchdog-support.patch} (96%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0003-at91sam9260-9g20-add-wathdog-support.patch => patches/barebox/0003-at91sam9260-9g20-add-wathdog-support.patch} (87%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0004-at91sam9260-9g20-fix-wathdog-support.patch => patches/barebox/0004-at91sam9260-9g20-fix-wathdog-support.patch} (82%)
 rename board/telit/evk-pro3/{barebox-2013.04.0-0005-watchdog-enable-for-evk-pro3.patch => patches/barebox/0005-watchdog-enable-for-evk-pro3.patch} (80%)
 create mode 100644 board/telit/evk-pro3/patches/barebox/0006-build-update-compiler-.h-to-newest-versions.patch
 create mode 100644 board/via/imx6_vab820/patches/uboot/0001-compiler-gcc.h-remove-dependency-on-compiler-gcc-345.patch
 create mode 100644 board/via/imx6_vab820/patches/uboot/0002-ARM-asm-io.h-use-static-inline.patch
 create mode 100644 board/via/imx6_vab820/patches/uboot/0003-common-main.c-make-show_boot_progress-__weak.patch
 create mode 100644 board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
