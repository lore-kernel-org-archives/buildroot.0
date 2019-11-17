From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 17 Nov 2019 21:18:58 +0100
Subject: [Buildroot] [PATCH v3 for-next 00/11] gitlab Qemu runtime testing
Message-ID: <20191117201909.12900-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new iteration take into account the previous review with
some additional rework.

This series start by removing useless host-qemu build for
m68k_q800, enable serial console for x86/x86_64 and some
refactoring for csky and arm-versatile.

Replace the readme.txt file by a bash script that ease starting
Qemu. Then a new comment is added to each Qemu defconfig files in
order to provide the path to this new script.
This path help to link each Qemu defconfig with it's own script.

Add new python script to be used by gitlab to start Qemu when
a Qemu defconfig is built.

Finally add this new python script to .gitlab-ci.yml.

http://lists.busybox.net/pipermail/buildroot/2019-May/249432.html

Jugurtha BELKALEM (3):
  board/qemu/*/launch.sh: add qemu launch script
  support/scripts/boot-qemu-image.py: boot Qemu images with Qemu-system.
  gitlab.yml.in*: enable Qemu gitlab testing

Romain Naour (8):
  configs/qemu_m68k_q800: remove host-qemu
  configs/qemu{x86,x86_64}: add a serial console
  board/qemu/arm-versatile: move arm-versatile nommu stuff to
    board/qemu/arm-versatile-nommu
  board/qemu/csky: move csky610 stuff to board/qemu/csky610-virt
  board/qemu/csky: move csky807 stuff to board/qemu/csky807-virt
  board/qemu/csky: move csky810 stuff to board/qemu/csky810-virt
  board/qemu/csky: move csky860 stuff to board/qemu/csky860-virt
  configs/qemu-*: add a comment to provide the path launch.sh script for
    each Qemu defconfig

 .gitlab-ci.yml                                |   7 ++
 .gitlab-ci.yml.in                             |   7 ++
 board/qemu/aarch64-virt/launch.sh             |   7 ++
 board/qemu/aarch64-virt/readme.txt            |   7 --
 board/qemu/arm-versatile-nommu/launch.sh      |   8 ++
 .../linux.config}                             |   0
 .../patches/linux/versatile-nommu.patch       |   0
 board/qemu/arm-versatile/launch.sh            |   8 ++
 board/qemu/arm-versatile/readme.txt           |  12 --
 board/qemu/arm-vexpress-tz/launch.sh          |   3 +
 board/qemu/arm-vexpress/launch.sh             |  11 ++
 board/qemu/arm-vexpress/readme.txt            |  11 --
 board/qemu/csky/readme.txt                    |  12 --
 board/qemu/csky610-virt/launch.sh             |   5 +
 .../linux.config.fragment}                    |   0
 board/qemu/csky807-virt/launch.sh             |   5 +
 .../linux.config.fragment}                    |   0
 board/qemu/csky810-virt/launch.sh             |   5 +
 .../linux.config.fragment}                    |   0
 board/qemu/csky860-virt/launch.sh             |   5 +
 .../linux.config.fragment}                    |   0
 board/qemu/m68k-mcf5208/launch.sh             |   7 ++
 board/qemu/m68k-mcf5208/readme.txt            |   7 --
 board/qemu/m68k-q800/launch.sh                |   8 ++
 board/qemu/m68k-q800/readme.txt               |   8 --
 board/qemu/microblazebe-mmu/launch.sh         |   7 ++
 board/qemu/microblazebe-mmu/readme.txt        |   7 --
 board/qemu/microblazeel-mmu/launch.sh         |   7 ++
 board/qemu/microblazeel-mmu/readme.txt        |   7 --
 board/qemu/mips32r2-malta/launch.sh           |   2 +
 board/qemu/mips32r2-malta/readme.txt          |   9 --
 board/qemu/mips32r2el-malta/launch.sh         |   9 ++
 board/qemu/mips32r2el-malta/readme.txt        |   9 --
 board/qemu/mips32r6-malta/launch.sh           |   7 ++
 board/qemu/mips32r6-malta/readme.txt          |   7 --
 board/qemu/mips32r6el-malta/launch.sh         |   7 ++
 board/qemu/mips32r6el-malta/readme.txt        |   7 --
 board/qemu/mips64-malta/launch.sh             |   8 ++
 board/qemu/mips64-malta/readme.txt            |   8 --
 board/qemu/mips64el-malta/launch.sh           |   8 ++
 board/qemu/mips64el-malta/readme.txt          |   8 --
 board/qemu/mips64r6-malta/launch.sh           |   7 ++
 board/qemu/mips64r6-malta/readme.txt          |   7 --
 board/qemu/mips64r6el-malta/launch.sh         |   7 ++
 board/qemu/mips64r6el-malta/readme.txt        |   7 --
 board/qemu/nios2-10m50/launch.sh              |   7 ++
 board/qemu/nios2-10m50/readme.txt             |   7 --
 board/qemu/or1k/launch.sh                     |   9 ++
 board/qemu/or1k/readme.txt                    |   9 --
 board/qemu/ppc-g3beige/launch.sh              |   8 ++
 board/qemu/ppc-g3beige/readme.txt             |   8 --
 board/qemu/ppc-mac99/launch.sh                |   5 +
 board/qemu/ppc-mac99/readme.txt               |   5 -
 board/qemu/ppc-mpc8544ds/launch.sh            |   7 ++
 board/qemu/ppc-mpc8544ds/readme.txt           |   7 --
 board/qemu/ppc-virtex-ml507/launch.sh         |   7 ++
 board/qemu/ppc-virtex-ml507/readme.txt        |   7 --
 board/qemu/ppc64-e5500/launch.sh              |   7 ++
 board/qemu/ppc64-e5500/readme.txt             |   7 --
 board/qemu/ppc64-pseries/launch.sh            |   7 ++
 board/qemu/ppc64-pseries/readme.txt           |   7 --
 board/qemu/ppc64le-pseries/launch.sh          |   7 ++
 board/qemu/ppc64le-pseries/readme.txt         |   7 --
 board/qemu/riscv32-virt/launch.sh             |   7 ++
 board/qemu/riscv32-virt/readme.txt            |   7 --
 board/qemu/riscv64-virt/launch.sh             |   8 ++
 board/qemu/riscv64-virt/readme.txt            |   7 --
 board/qemu/sh4-r2d/launch.sh                  |   9 ++
 board/qemu/sh4-r2d/readme.txt                 |   8 --
 board/qemu/sh4eb-r2d/launch.sh                |   8 ++
 board/qemu/sh4eb-r2d/readme.txt               |   8 --
 board/qemu/sparc-ss10/launch.sh               |   7 ++
 board/qemu/sparc-ss10/readme.txt              |   7 --
 board/qemu/sparc64-sun4u/launch.sh            |   7 ++
 board/qemu/sparc64-sun4u/readme.txt           |   7 --
 board/qemu/x86/launch.sh                      |   9 ++
 board/qemu/x86/post-build.sh                  |  11 ++
 board/qemu/x86/readme.txt                     |   9 --
 board/qemu/x86_64/launch.sh                   |   9 ++
 board/qemu/x86_64/post-build.sh               |  11 ++
 board/qemu/x86_64/readme.txt                  |   9 --
 board/qemu/xtensa-lx60/launch.sh              |   7 ++
 board/qemu/xtensa-lx60/readme.txt             |   7 --
 configs/qemu_aarch64_virt_defconfig           |   2 +
 configs/qemu_arm_versatile_defconfig          |   2 +
 configs/qemu_arm_versatile_nommu_defconfig    |   6 +-
 configs/qemu_arm_vexpress_defconfig           |   2 +
 configs/qemu_arm_vexpress_tz_defconfig        |   2 +
 configs/qemu_csky610_virt_defconfig           |   4 +-
 configs/qemu_csky807_virt_defconfig           |   4 +-
 configs/qemu_csky810_virt_defconfig           |   4 +-
 configs/qemu_csky860_virt_defconfig           |   4 +-
 configs/qemu_m68k_mcf5208_defconfig           |   2 +
 configs/qemu_m68k_q800_defconfig              |   6 +-
 configs/qemu_microblazebe_mmu_defconfig       |   2 +
 configs/qemu_microblazeel_mmu_defconfig       |   2 +
 configs/qemu_mips32r2_malta_defconfig         |   2 +
 configs/qemu_mips32r2el_malta_defconfig       |   2 +
 configs/qemu_mips32r6_malta_defconfig         |   2 +
 configs/qemu_mips32r6el_malta_defconfig       |   2 +
 configs/qemu_mips64_malta_defconfig           |   2 +
 configs/qemu_mips64el_malta_defconfig         |   2 +
 configs/qemu_mips64r6_malta_defconfig         |   2 +
 configs/qemu_mips64r6el_malta_defconfig       |   2 +
 configs/qemu_nios2_10m50_defconfig            |   2 +
 configs/qemu_or1k_defconfig                   |   2 +
 configs/qemu_ppc64_e5500_defconfig            |   2 +
 configs/qemu_ppc64_pseries_defconfig          |   2 +
 configs/qemu_ppc64le_pseries_defconfig        |   2 +
 configs/qemu_ppc_g3beige_defconfig            |   2 +
 configs/qemu_ppc_mac99_defconfig              |   2 +
 configs/qemu_ppc_mpc8544ds_defconfig          |   2 +
 configs/qemu_ppc_virtex_ml507_defconfig       |   2 +
 configs/qemu_riscv32_virt_defconfig           |   2 +
 configs/qemu_riscv64_virt_defconfig           |   2 +
 configs/qemu_sh4_r2d_defconfig                |   2 +
 configs/qemu_sh4eb_r2d_defconfig              |   2 +
 configs/qemu_sparc64_sun4u_defconfig          |   2 +
 configs/qemu_sparc_ss10_defconfig             |   2 +
 configs/qemu_x86_64_defconfig                 |   6 +-
 configs/qemu_x86_defconfig                    |   6 +-
 configs/qemu_xtensa_lx60_defconfig            |   2 +
 configs/qemu_xtensa_lx60_nommu_defconfig      |   2 +
 support/scripts/boot-qemu-image.py            | 109 ++++++++++++++++++
 124 files changed, 511 insertions(+), 280 deletions(-)
 create mode 100755 board/qemu/aarch64-virt/launch.sh
 delete mode 100644 board/qemu/aarch64-virt/readme.txt
 create mode 100644 board/qemu/arm-versatile-nommu/launch.sh
 rename board/qemu/{arm-versatile/linux-nommu.config => arm-versatile-nommu/linux.config} (100%)
 rename board/qemu/{arm-versatile => arm-versatile-nommu}/patches/linux/versatile-nommu.patch (100%)
 create mode 100755 board/qemu/arm-versatile/launch.sh
 delete mode 100644 board/qemu/arm-versatile/readme.txt
 create mode 100644 board/qemu/arm-vexpress-tz/launch.sh
 create mode 100755 board/qemu/arm-vexpress/launch.sh
 delete mode 100644 board/qemu/arm-vexpress/readme.txt
 delete mode 100644 board/qemu/csky/readme.txt
 create mode 100644 board/qemu/csky610-virt/launch.sh
 rename board/qemu/{csky/linux-ck610.config.fragment => csky610-virt/linux.config.fragment} (100%)
 create mode 100644 board/qemu/csky807-virt/launch.sh
 rename board/qemu/{csky/linux-ck807.config.fragment => csky807-virt/linux.config.fragment} (100%)
 create mode 100644 board/qemu/csky810-virt/launch.sh
 rename board/qemu/{csky/linux-ck810.config.fragment => csky810-virt/linux.config.fragment} (100%)
 create mode 100644 board/qemu/csky860-virt/launch.sh
 rename board/qemu/{csky/linux-ck860.config.fragment => csky860-virt/linux.config.fragment} (100%)
 create mode 100755 board/qemu/m68k-mcf5208/launch.sh
 delete mode 100644 board/qemu/m68k-mcf5208/readme.txt
 create mode 100755 board/qemu/m68k-q800/launch.sh
 delete mode 100644 board/qemu/m68k-q800/readme.txt
 create mode 100755 board/qemu/microblazebe-mmu/launch.sh
 delete mode 100644 board/qemu/microblazebe-mmu/readme.txt
 create mode 100755 board/qemu/microblazeel-mmu/launch.sh
 delete mode 100644 board/qemu/microblazeel-mmu/readme.txt
 create mode 100755 board/qemu/mips32r2-malta/launch.sh
 delete mode 100644 board/qemu/mips32r2-malta/readme.txt
 create mode 100755 board/qemu/mips32r2el-malta/launch.sh
 delete mode 100644 board/qemu/mips32r2el-malta/readme.txt
 create mode 100755 board/qemu/mips32r6-malta/launch.sh
 delete mode 100644 board/qemu/mips32r6-malta/readme.txt
 create mode 100755 board/qemu/mips32r6el-malta/launch.sh
 delete mode 100644 board/qemu/mips32r6el-malta/readme.txt
 create mode 100755 board/qemu/mips64-malta/launch.sh
 delete mode 100644 board/qemu/mips64-malta/readme.txt
 create mode 100755 board/qemu/mips64el-malta/launch.sh
 delete mode 100644 board/qemu/mips64el-malta/readme.txt
 create mode 100755 board/qemu/mips64r6-malta/launch.sh
 delete mode 100644 board/qemu/mips64r6-malta/readme.txt
 create mode 100755 board/qemu/mips64r6el-malta/launch.sh
 delete mode 100644 board/qemu/mips64r6el-malta/readme.txt
 create mode 100755 board/qemu/nios2-10m50/launch.sh
 delete mode 100644 board/qemu/nios2-10m50/readme.txt
 create mode 100755 board/qemu/or1k/launch.sh
 delete mode 100644 board/qemu/or1k/readme.txt
 create mode 100755 board/qemu/ppc-g3beige/launch.sh
 delete mode 100644 board/qemu/ppc-g3beige/readme.txt
 create mode 100644 board/qemu/ppc-mac99/launch.sh
 delete mode 100644 board/qemu/ppc-mac99/readme.txt
 create mode 100755 board/qemu/ppc-mpc8544ds/launch.sh
 delete mode 100644 board/qemu/ppc-mpc8544ds/readme.txt
 create mode 100755 board/qemu/ppc-virtex-ml507/launch.sh
 delete mode 100644 board/qemu/ppc-virtex-ml507/readme.txt
 create mode 100755 board/qemu/ppc64-e5500/launch.sh
 delete mode 100644 board/qemu/ppc64-e5500/readme.txt
 create mode 100755 board/qemu/ppc64-pseries/launch.sh
 delete mode 100644 board/qemu/ppc64-pseries/readme.txt
 create mode 100755 board/qemu/ppc64le-pseries/launch.sh
 delete mode 100644 board/qemu/ppc64le-pseries/readme.txt
 create mode 100755 board/qemu/riscv32-virt/launch.sh
 delete mode 100644 board/qemu/riscv32-virt/readme.txt
 create mode 100755 board/qemu/riscv64-virt/launch.sh
 delete mode 100644 board/qemu/riscv64-virt/readme.txt
 create mode 100755 board/qemu/sh4-r2d/launch.sh
 delete mode 100644 board/qemu/sh4-r2d/readme.txt
 create mode 100755 board/qemu/sh4eb-r2d/launch.sh
 delete mode 100644 board/qemu/sh4eb-r2d/readme.txt
 create mode 100755 board/qemu/sparc-ss10/launch.sh
 delete mode 100644 board/qemu/sparc-ss10/readme.txt
 create mode 100755 board/qemu/sparc64-sun4u/launch.sh
 delete mode 100644 board/qemu/sparc64-sun4u/readme.txt
 create mode 100755 board/qemu/x86/launch.sh
 create mode 100755 board/qemu/x86/post-build.sh
 delete mode 100644 board/qemu/x86/readme.txt
 create mode 100755 board/qemu/x86_64/launch.sh
 create mode 100755 board/qemu/x86_64/post-build.sh
 delete mode 100644 board/qemu/x86_64/readme.txt
 create mode 100755 board/qemu/xtensa-lx60/launch.sh
 delete mode 100644 board/qemu/xtensa-lx60/readme.txt
 create mode 100755 support/scripts/boot-qemu-image.py

-- 
2.21.0
