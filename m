From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 17 Feb 2020 21:50:25 +0100
Subject: [Buildroot] [PATCH v5 0/5] gitlab Qemu runtime testing
Message-ID: <20200217205030.8157-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new iteration take into account the previous review with
some additional rework [1] [2] [5] [6].

Remove patch already merged.

Based on the Yann's review during the Buildroot Developper meeting
FOSDEM 2020 [2], add a tag in each readme file to easily retrieve
the qemu command line to be used for runtime testing in gitlab.

This tag is used by a post-image script to generate a script
called start-qemu.sh that can be used by users or by a new python
script for running the test in gitlab but only when a Qemu
defconfig is built.

Finally add this new python script to .gitlab-ci.yml.

This series has been tested on Gitlab [3], please ignore the
failing test related to missing host-python3 modules needed by
optee-os package [4].

This new iteration has been tested in gitlab [7].

[1] http://lists.busybox.net/pipermail/buildroot/2019-May/249432.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-February/273189.html
[3] https://gitlab.com/kubu93/buildroot/pipelines/116298701
[4] http://lists.busybox.net/pipermail/buildroot/2020-February/273738.html
[5] http://lists.busybox.net/pipermail/buildroot/2020-February/273820.html
[6] http://lists.busybox.net/pipermail/buildroot/2020-February/273822.html
[7] https://gitlab.com/kubu93/buildroot/pipelines/116967006

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Jugurtha BELKALEM (2):
  support/scripts/boot-qemu-image.py: boot Qemu images with Qemu-system.
  gitlab.yml.in*: enable Qemu gitlab testing

Romain Naour (3):
  board/qemu: add defconfig file name as tag after the qemu command line
  board/qemu: add post-image script for gitlab qemu testing
  configs/qemu*: use the post-image script with "$(BR2_DEFCONFIG)" as
    argument.

 .gitlab-ci.yml                             |   7 ++
 .gitlab-ci.yml.in                          |   7 ++
 board/qemu/aarch64-virt/readme.txt         |   2 +-
 board/qemu/arm-versatile/readme.txt        |   4 +-
 board/qemu/arm-vexpress/readme.txt         |   2 +-
 board/qemu/csky/readme.txt                 |  11 ++-
 board/qemu/m68k-mcf5208/readme.txt         |   2 +-
 board/qemu/m68k-q800/readme.txt            |   2 +-
 board/qemu/microblazebe-mmu/readme.txt     |   2 +-
 board/qemu/microblazeel-mmu/readme.txt     |   2 +-
 board/qemu/mips32r2-malta/readme.txt       |   2 +-
 board/qemu/mips32r2el-malta/readme.txt     |   2 +-
 board/qemu/mips32r6-malta/readme.txt       |   2 +-
 board/qemu/mips32r6el-malta/readme.txt     |   2 +-
 board/qemu/mips64-malta/readme.txt         |   2 +-
 board/qemu/mips64el-malta/readme.txt       |   2 +-
 board/qemu/mips64r6-malta/readme.txt       |   2 +-
 board/qemu/mips64r6el-malta/readme.txt     |   2 +-
 board/qemu/nios2-10m50/readme.txt          |   2 +-
 board/qemu/or1k/readme.txt                 |   2 +-
 board/qemu/post-image.sh                   |  50 ++++++++++
 board/qemu/ppc-g3beige/readme.txt          |   2 +-
 board/qemu/ppc-mac99/readme.txt            |   2 +-
 board/qemu/ppc-mpc8544ds/readme.txt        |   2 +-
 board/qemu/ppc-virtex-ml507/readme.txt     |   2 +-
 board/qemu/ppc64-e5500/readme.txt          |   2 +-
 board/qemu/ppc64-pseries/readme.txt        |   2 +-
 board/qemu/ppc64le-pseries/readme.txt      |   2 +-
 board/qemu/riscv32-virt/readme.txt         |   2 +-
 board/qemu/riscv64-virt/readme.txt         |   2 +-
 board/qemu/sh4-r2d/readme.txt              |   2 +-
 board/qemu/sh4eb-r2d/readme.txt            |   2 +-
 board/qemu/sparc-ss10/readme.txt           |   2 +-
 board/qemu/sparc64-sun4u/readme.txt        |   2 +-
 board/qemu/x86/readme.txt                  |   2 +-
 board/qemu/x86_64/readme.txt               |   2 +-
 board/qemu/xtensa-lx60/readme.txt          |   4 +-
 configs/qemu_aarch64_virt_defconfig        |   4 +
 configs/qemu_arm_versatile_defconfig       |   4 +
 configs/qemu_arm_versatile_nommu_defconfig |   4 +
 configs/qemu_arm_vexpress_defconfig        |   4 +
 configs/qemu_csky610_virt_defconfig        |   4 +
 configs/qemu_csky807_virt_defconfig        |   4 +
 configs/qemu_csky810_virt_defconfig        |   4 +
 configs/qemu_csky860_virt_defconfig        |   4 +
 configs/qemu_m68k_mcf5208_defconfig        |   4 +
 configs/qemu_m68k_q800_defconfig           |   4 +
 configs/qemu_microblazebe_mmu_defconfig    |   4 +
 configs/qemu_microblazeel_mmu_defconfig    |   4 +
 configs/qemu_mips32r2_malta_defconfig      |   4 +
 configs/qemu_mips32r2el_malta_defconfig    |   4 +
 configs/qemu_mips32r6_malta_defconfig      |   4 +
 configs/qemu_mips32r6el_malta_defconfig    |   4 +
 configs/qemu_mips64_malta_defconfig        |   4 +
 configs/qemu_mips64el_malta_defconfig      |   4 +
 configs/qemu_mips64r6_malta_defconfig      |   4 +
 configs/qemu_mips64r6el_malta_defconfig    |   4 +
 configs/qemu_nios2_10m50_defconfig         |   4 +
 configs/qemu_or1k_defconfig                |   4 +
 configs/qemu_ppc64_e5500_defconfig         |   4 +
 configs/qemu_ppc64_pseries_defconfig       |   4 +
 configs/qemu_ppc64le_pseries_defconfig     |   4 +
 configs/qemu_ppc_g3beige_defconfig         |   4 +
 configs/qemu_ppc_mac99_defconfig           |   4 +
 configs/qemu_ppc_mpc8544ds_defconfig       |   4 +
 configs/qemu_ppc_virtex_ml507_defconfig    |   4 +
 configs/qemu_riscv32_virt_defconfig        |   4 +
 configs/qemu_riscv64_virt_defconfig        |   4 +
 configs/qemu_sh4_r2d_defconfig             |   4 +
 configs/qemu_sh4eb_r2d_defconfig           |   4 +
 configs/qemu_sparc64_sun4u_defconfig       |   4 +
 configs/qemu_sparc_ss10_defconfig          |   4 +
 configs/qemu_x86_64_defconfig              |   4 +
 configs/qemu_x86_defconfig                 |   4 +
 configs/qemu_xtensa_lx60_defconfig         |   4 +
 configs/qemu_xtensa_lx60_nommu_defconfig   |   4 +
 support/scripts/boot-qemu-image.py         | 105 +++++++++++++++++++++
 77 files changed, 368 insertions(+), 38 deletions(-)
 create mode 100755 board/qemu/post-image.sh
 create mode 100755 support/scripts/boot-qemu-image.py

-- 
2.24.1
