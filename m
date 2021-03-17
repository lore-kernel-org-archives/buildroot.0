From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Mar 2021 07:28:48 +0900
Subject: [Buildroot] [PATCH 3/4] Rename custom kernel defconfig files to
 *_defconfig
In-Reply-To: <20210317222849.1658538-1-masahiroy@kernel.org>
References: <20210317222849.1658538-1-masahiroy@kernel.org>
Message-ID: <20210317222849.1658538-3-masahiroy@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no consistency in file names for
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE. Some are suffiex with "defconfig",
and some with ".config".

Rename *.config to *_defconfig because this is the convention in the
upstream Linux kernel.

I used the following shell script for the conversion:

for f in $(find configs -name '*_defconfig')
do
	old_name=$(sed -n 's/BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="\(.*\.config\)"/\1/p' $f)
	if [ -n "$old_name" ]; then
		new_name=${old_name%.config}_defconfig
		if [ -e "$old_name" ]; then
			git mv $old_name $new_name
		fi
		sed -i 's:="'$old_name'":="'$new_name'":' $f
	fi
done

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .../armadeus/apf27/{linux-4.12.config => linux-4.12_defconfig}  | 0
 board/armadeus/apf51/{linux-4.4.config => linux-4.4_defconfig}  | 0
 board/chromebook/elm/{linux.config => linux_defconfig}          | 0
 board/intel/galileo/{linux-3.14.config => linux-3.14_defconfig} | 0
 board/minnowboard/{linux.config => linux_defconfig}             | 0
 board/olpc/xo-1.75/{linux.config => linux_defconfig}            | 0
 board/olpc/xo-1/{linux.config => linux_defconfig}               | 0
 board/pc/{linux.config => linux_defconfig}                      | 0
 board/pcengines/apu2/{linux.config => linux_defconfig}          | 0
 board/qemu/aarch64-virt/{linux.config => linux_defconfig}       | 0
 board/qemu/m68k-mcf5208/{linux.config => linux_defconfig}       | 0
 board/qemu/m68k-q800/{linux.config => linux_defconfig}          | 0
 board/qemu/microblazebe-mmu/{linux.config => linux_defconfig}   | 0
 board/qemu/microblazeel-mmu/{linux.config => linux_defconfig}   | 0
 board/qemu/mips32r2-malta/{linux.config => linux_defconfig}     | 0
 board/qemu/mips32r2el-malta/{linux.config => linux_defconfig}   | 0
 board/qemu/mips32r6-malta/{linux.config => linux_defconfig}     | 0
 board/qemu/mips32r6el-malta/{linux.config => linux_defconfig}   | 0
 board/qemu/mips64-malta/{linux.config => linux_defconfig}       | 0
 board/qemu/mips64el-malta/{linux.config => linux_defconfig}     | 0
 board/qemu/mips64r6-malta/{linux.config => linux_defconfig}     | 0
 board/qemu/mips64r6el-malta/{linux.config => linux_defconfig}   | 0
 board/qemu/or1k/{linux.config => linux_defconfig}               | 0
 board/qemu/ppc-g3beige/{linux.config => linux_defconfig}        | 0
 board/qemu/ppc-mpc8544ds/{linux.config => linux_defconfig}      | 0
 board/qemu/sh4-r2d/{linux.config => linux_defconfig}            | 0
 board/qemu/sh4eb-r2d/{linux.config => linux_defconfig}          | 0
 board/qemu/sparc-ss10/{linux.config => linux_defconfig}         | 0
 board/qemu/sparc64-sun4u/{linux.config => linux_defconfig}      | 0
 board/qemu/x86/{linux.config => linux_defconfig}                | 0
 board/qemu/x86_64/{linux.config => linux_defconfig}             | 0
 .../xtensa-lx60/{linux-nommu.config => linux-nommu_defconfig}   | 0
 board/qemu/xtensa-lx60/{linux.config => linux_defconfig}        | 0
 board/roseapplepi/{linux.config => linux_defconfig}             | 0
 .../stm32mp157a-dk1/{linux.config => linux_defconfig}           | 0
 .../stm32mp157c-dk2/{linux.config => linux_defconfig}           | 0
 .../ts5500/{linux-4.14.config => linux-4.14_defconfig}          | 0
 configs/armadeus_apf27_defconfig                                | 2 +-
 configs/armadeus_apf51_defconfig                                | 2 +-
 configs/chromebook_elm_defconfig                                | 2 +-
 configs/galileo_defconfig                                       | 2 +-
 configs/minnowboard_max-graphical_defconfig                     | 2 +-
 configs/minnowboard_max_defconfig                               | 2 +-
 configs/olpc_xo175_defconfig                                    | 2 +-
 configs/olpc_xo1_defconfig                                      | 2 +-
 configs/pc_x86_64_bios_defconfig                                | 2 +-
 configs/pc_x86_64_efi_defconfig                                 | 2 +-
 configs/pcengines_apu2_defconfig                                | 2 +-
 configs/qemu_aarch64_virt_defconfig                             | 2 +-
 configs/qemu_m68k_mcf5208_defconfig                             | 2 +-
 configs/qemu_m68k_q800_defconfig                                | 2 +-
 configs/qemu_microblazebe_mmu_defconfig                         | 2 +-
 configs/qemu_microblazeel_mmu_defconfig                         | 2 +-
 configs/qemu_mips32r2_malta_defconfig                           | 2 +-
 configs/qemu_mips32r2el_malta_defconfig                         | 2 +-
 configs/qemu_mips32r6_malta_defconfig                           | 2 +-
 configs/qemu_mips32r6el_malta_defconfig                         | 2 +-
 configs/qemu_mips64_malta_defconfig                             | 2 +-
 configs/qemu_mips64el_malta_defconfig                           | 2 +-
 configs/qemu_mips64r6_malta_defconfig                           | 2 +-
 configs/qemu_mips64r6el_malta_defconfig                         | 2 +-
 configs/qemu_or1k_defconfig                                     | 2 +-
 configs/qemu_ppc_g3beige_defconfig                              | 2 +-
 configs/qemu_ppc_mpc8544ds_defconfig                            | 2 +-
 configs/qemu_sh4_r2d_defconfig                                  | 2 +-
 configs/qemu_sh4eb_r2d_defconfig                                | 2 +-
 configs/qemu_sparc64_sun4u_defconfig                            | 2 +-
 configs/qemu_sparc_ss10_defconfig                               | 2 +-
 configs/qemu_x86_64_defconfig                                   | 2 +-
 configs/qemu_x86_defconfig                                      | 2 +-
 configs/qemu_xtensa_lx60_defconfig                              | 2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig                        | 2 +-
 configs/roseapplepi_defconfig                                   | 2 +-
 configs/stm32mp157a_dk1_defconfig                               | 2 +-
 configs/stm32mp157c_dk2_defconfig                               | 2 +-
 configs/ts5500_defconfig                                        | 2 +-
 76 files changed, 39 insertions(+), 39 deletions(-)
 rename board/armadeus/apf27/{linux-4.12.config => linux-4.12_defconfig} (100%)
 rename board/armadeus/apf51/{linux-4.4.config => linux-4.4_defconfig} (100%)
 rename board/chromebook/elm/{linux.config => linux_defconfig} (100%)
 rename board/intel/galileo/{linux-3.14.config => linux-3.14_defconfig} (100%)
 rename board/minnowboard/{linux.config => linux_defconfig} (100%)
 rename board/olpc/xo-1.75/{linux.config => linux_defconfig} (100%)
 rename board/olpc/xo-1/{linux.config => linux_defconfig} (100%)
 rename board/pc/{linux.config => linux_defconfig} (100%)
 rename board/pcengines/apu2/{linux.config => linux_defconfig} (100%)
 rename board/qemu/aarch64-virt/{linux.config => linux_defconfig} (100%)
 rename board/qemu/m68k-mcf5208/{linux.config => linux_defconfig} (100%)
 rename board/qemu/m68k-q800/{linux.config => linux_defconfig} (100%)
 rename board/qemu/microblazebe-mmu/{linux.config => linux_defconfig} (100%)
 rename board/qemu/microblazeel-mmu/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips32r2-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips32r2el-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips32r6-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips32r6el-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips64-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips64el-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips64r6-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/mips64r6el-malta/{linux.config => linux_defconfig} (100%)
 rename board/qemu/or1k/{linux.config => linux_defconfig} (100%)
 rename board/qemu/ppc-g3beige/{linux.config => linux_defconfig} (100%)
 rename board/qemu/ppc-mpc8544ds/{linux.config => linux_defconfig} (100%)
 rename board/qemu/sh4-r2d/{linux.config => linux_defconfig} (100%)
 rename board/qemu/sh4eb-r2d/{linux.config => linux_defconfig} (100%)
 rename board/qemu/sparc-ss10/{linux.config => linux_defconfig} (100%)
 rename board/qemu/sparc64-sun4u/{linux.config => linux_defconfig} (100%)
 rename board/qemu/x86/{linux.config => linux_defconfig} (100%)
 rename board/qemu/x86_64/{linux.config => linux_defconfig} (100%)
 rename board/qemu/xtensa-lx60/{linux-nommu.config => linux-nommu_defconfig} (100%)
 rename board/qemu/xtensa-lx60/{linux.config => linux_defconfig} (100%)
 rename board/roseapplepi/{linux.config => linux_defconfig} (100%)
 rename board/stmicroelectronics/stm32mp157a-dk1/{linux.config => linux_defconfig} (100%)
 rename board/stmicroelectronics/stm32mp157c-dk2/{linux.config => linux_defconfig} (100%)
 rename board/technologic/ts5500/{linux-4.14.config => linux-4.14_defconfig} (100%)

diff --git a/board/armadeus/apf27/linux-4.12.config b/board/armadeus/apf27/linux-4.12_defconfig
similarity index 100%
rename from board/armadeus/apf27/linux-4.12.config
rename to board/armadeus/apf27/linux-4.12_defconfig
diff --git a/board/armadeus/apf51/linux-4.4.config b/board/armadeus/apf51/linux-4.4_defconfig
similarity index 100%
rename from board/armadeus/apf51/linux-4.4.config
rename to board/armadeus/apf51/linux-4.4_defconfig
diff --git a/board/chromebook/elm/linux.config b/board/chromebook/elm/linux_defconfig
similarity index 100%
rename from board/chromebook/elm/linux.config
rename to board/chromebook/elm/linux_defconfig
diff --git a/board/intel/galileo/linux-3.14.config b/board/intel/galileo/linux-3.14_defconfig
similarity index 100%
rename from board/intel/galileo/linux-3.14.config
rename to board/intel/galileo/linux-3.14_defconfig
diff --git a/board/minnowboard/linux.config b/board/minnowboard/linux_defconfig
similarity index 100%
rename from board/minnowboard/linux.config
rename to board/minnowboard/linux_defconfig
diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux_defconfig
similarity index 100%
rename from board/olpc/xo-1.75/linux.config
rename to board/olpc/xo-1.75/linux_defconfig
diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux_defconfig
similarity index 100%
rename from board/olpc/xo-1/linux.config
rename to board/olpc/xo-1/linux_defconfig
diff --git a/board/pc/linux.config b/board/pc/linux_defconfig
similarity index 100%
rename from board/pc/linux.config
rename to board/pc/linux_defconfig
diff --git a/board/pcengines/apu2/linux.config b/board/pcengines/apu2/linux_defconfig
similarity index 100%
rename from board/pcengines/apu2/linux.config
rename to board/pcengines/apu2/linux_defconfig
diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux_defconfig
similarity index 100%
rename from board/qemu/aarch64-virt/linux.config
rename to board/qemu/aarch64-virt/linux_defconfig
diff --git a/board/qemu/m68k-mcf5208/linux.config b/board/qemu/m68k-mcf5208/linux_defconfig
similarity index 100%
rename from board/qemu/m68k-mcf5208/linux.config
rename to board/qemu/m68k-mcf5208/linux_defconfig
diff --git a/board/qemu/m68k-q800/linux.config b/board/qemu/m68k-q800/linux_defconfig
similarity index 100%
rename from board/qemu/m68k-q800/linux.config
rename to board/qemu/m68k-q800/linux_defconfig
diff --git a/board/qemu/microblazebe-mmu/linux.config b/board/qemu/microblazebe-mmu/linux_defconfig
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux.config
rename to board/qemu/microblazebe-mmu/linux_defconfig
diff --git a/board/qemu/microblazeel-mmu/linux.config b/board/qemu/microblazeel-mmu/linux_defconfig
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux.config
rename to board/qemu/microblazeel-mmu/linux_defconfig
diff --git a/board/qemu/mips32r2-malta/linux.config b/board/qemu/mips32r2-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips32r2-malta/linux.config
rename to board/qemu/mips32r2-malta/linux_defconfig
diff --git a/board/qemu/mips32r2el-malta/linux.config b/board/qemu/mips32r2el-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips32r2el-malta/linux.config
rename to board/qemu/mips32r2el-malta/linux_defconfig
diff --git a/board/qemu/mips32r6-malta/linux.config b/board/qemu/mips32r6-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips32r6-malta/linux.config
rename to board/qemu/mips32r6-malta/linux_defconfig
diff --git a/board/qemu/mips32r6el-malta/linux.config b/board/qemu/mips32r6el-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips32r6el-malta/linux.config
rename to board/qemu/mips32r6el-malta/linux_defconfig
diff --git a/board/qemu/mips64-malta/linux.config b/board/qemu/mips64-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips64-malta/linux.config
rename to board/qemu/mips64-malta/linux_defconfig
diff --git a/board/qemu/mips64el-malta/linux.config b/board/qemu/mips64el-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips64el-malta/linux.config
rename to board/qemu/mips64el-malta/linux_defconfig
diff --git a/board/qemu/mips64r6-malta/linux.config b/board/qemu/mips64r6-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips64r6-malta/linux.config
rename to board/qemu/mips64r6-malta/linux_defconfig
diff --git a/board/qemu/mips64r6el-malta/linux.config b/board/qemu/mips64r6el-malta/linux_defconfig
similarity index 100%
rename from board/qemu/mips64r6el-malta/linux.config
rename to board/qemu/mips64r6el-malta/linux_defconfig
diff --git a/board/qemu/or1k/linux.config b/board/qemu/or1k/linux_defconfig
similarity index 100%
rename from board/qemu/or1k/linux.config
rename to board/qemu/or1k/linux_defconfig
diff --git a/board/qemu/ppc-g3beige/linux.config b/board/qemu/ppc-g3beige/linux_defconfig
similarity index 100%
rename from board/qemu/ppc-g3beige/linux.config
rename to board/qemu/ppc-g3beige/linux_defconfig
diff --git a/board/qemu/ppc-mpc8544ds/linux.config b/board/qemu/ppc-mpc8544ds/linux_defconfig
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux.config
rename to board/qemu/ppc-mpc8544ds/linux_defconfig
diff --git a/board/qemu/sh4-r2d/linux.config b/board/qemu/sh4-r2d/linux_defconfig
similarity index 100%
rename from board/qemu/sh4-r2d/linux.config
rename to board/qemu/sh4-r2d/linux_defconfig
diff --git a/board/qemu/sh4eb-r2d/linux.config b/board/qemu/sh4eb-r2d/linux_defconfig
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux.config
rename to board/qemu/sh4eb-r2d/linux_defconfig
diff --git a/board/qemu/sparc-ss10/linux.config b/board/qemu/sparc-ss10/linux_defconfig
similarity index 100%
rename from board/qemu/sparc-ss10/linux.config
rename to board/qemu/sparc-ss10/linux_defconfig
diff --git a/board/qemu/sparc64-sun4u/linux.config b/board/qemu/sparc64-sun4u/linux_defconfig
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux.config
rename to board/qemu/sparc64-sun4u/linux_defconfig
diff --git a/board/qemu/x86/linux.config b/board/qemu/x86/linux_defconfig
similarity index 100%
rename from board/qemu/x86/linux.config
rename to board/qemu/x86/linux_defconfig
diff --git a/board/qemu/x86_64/linux.config b/board/qemu/x86_64/linux_defconfig
similarity index 100%
rename from board/qemu/x86_64/linux.config
rename to board/qemu/x86_64/linux_defconfig
diff --git a/board/qemu/xtensa-lx60/linux-nommu.config b/board/qemu/xtensa-lx60/linux-nommu_defconfig
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-nommu.config
rename to board/qemu/xtensa-lx60/linux-nommu_defconfig
diff --git a/board/qemu/xtensa-lx60/linux.config b/board/qemu/xtensa-lx60/linux_defconfig
similarity index 100%
rename from board/qemu/xtensa-lx60/linux.config
rename to board/qemu/xtensa-lx60/linux_defconfig
diff --git a/board/roseapplepi/linux.config b/board/roseapplepi/linux_defconfig
similarity index 100%
rename from board/roseapplepi/linux.config
rename to board/roseapplepi/linux_defconfig
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/linux.config b/board/stmicroelectronics/stm32mp157a-dk1/linux_defconfig
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/linux.config
rename to board/stmicroelectronics/stm32mp157a-dk1/linux_defconfig
diff --git a/board/stmicroelectronics/stm32mp157c-dk2/linux.config b/board/stmicroelectronics/stm32mp157c-dk2/linux_defconfig
similarity index 100%
rename from board/stmicroelectronics/stm32mp157c-dk2/linux.config
rename to board/stmicroelectronics/stm32mp157c-dk2/linux_defconfig
diff --git a/board/technologic/ts5500/linux-4.14.config b/board/technologic/ts5500/linux-4.14_defconfig
similarity index 100%
rename from board/technologic/ts5500/linux-4.14.config
rename to board/technologic/ts5500/linux-4.14_defconfig
diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 457a14b02d..8b28e5373e 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-4.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf27/linux-4.12_defconfig"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0xA0008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index 26b6a447d4..f31dd5bb35 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.186"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4_defconfig"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x90008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/chromebook_elm_defconfig b/configs/chromebook_elm_defconfig
index 4f82370fb9..33a4657c9b 100644
--- a/configs/chromebook_elm_defconfig
+++ b/configs/chromebook_elm_defconfig
@@ -19,7 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9"
 
 # Build Kernel with a Custom config.
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/elm/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/elm/linux_defconfig"
 
 # DTS support
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
index 03ca23f414..9bddf368f3 100644
--- a/configs/galileo_defconfig
+++ b/configs/galileo_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,mdr78,Linux-x1000,8b3c9d8ce1656a26b1097d9091d53bfb39fef640)/linux-8b3c9d8ce1656a26b1097d9091d53bfb39fef640.tar.gz"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.14_defconfig"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 3b769ca6e7..a0ab92f0d6 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -26,7 +26,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.11"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux_defconfig"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 1270f23953..ee7ec06dbe 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -26,7 +26,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.11"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux_defconfig"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
diff --git a/configs/olpc_xo175_defconfig b/configs/olpc_xo175_defconfig
index bb7aa047f6..9429de4954 100644
--- a/configs/olpc_xo175_defconfig
+++ b/configs/olpc_xo175_defconfig
@@ -8,7 +8,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.2"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1.75/linux_defconfig"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/olpc_xo1_defconfig b/configs/olpc_xo1_defconfig
index 41226d892c..e09abeaba4 100644
--- a/configs/olpc_xo1_defconfig
+++ b/configs/olpc_xo1_defconfig
@@ -7,7 +7,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olpc/xo-1/linux_defconfig"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olpc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 1c1f7a3666..0d0603265d 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -31,7 +31,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux_defconfig"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 984fc8f92f..ee31d2897d 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -33,7 +33,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux_defconfig"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
index 68cebb8f6a..c5f5186c9e 100644
--- a/configs/pcengines_apu2_defconfig
+++ b/configs/pcengines_apu2_defconfig
@@ -7,7 +7,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux_defconfig"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_ISO9660=y
 BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index aa00ddf831..5c5d13667e 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -23,7 +23,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux_defconfig"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index c45a775556..a12c1a2ebe 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index abd0560cb1..546a654636 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 638c6629da..4e3033b0ad 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux_defconfig"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 6e62cc3304..00999bc548 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux_defconfig"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 434e3d9530..4c4d8befd2 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 2b8b2e8df1..d691fb40ca 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index bf1306a2b2..2fc40b526d 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/mips32r6-malta/patches"
 
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 5edf591bcf..c227377f88 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/mips32r6el-malta/patches"
 
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index ec841b5a09..5d911e2121 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 680ccbbd60..e5011507d5 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 53c5c09788..a381216533 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/mips64r6-malta/patches"
 
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 8230b1a9f9..a06d5da2ef 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/mips64r6el-malta/patches"
 
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 21d86e22ce..518f309d00 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux_defconfig"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 6e41afe8d7..369ad42a65 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 55e6db5a0d..29040cea49 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux_defconfig"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index a14277dd05..9d42d1b6a9 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -22,7 +22,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux_defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 4911ba0353..bab0910103 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux_defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
 # host-qemu for gitlab testing
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index cff0c2968a..aa68a665f2 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux_defconfig"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 0181f16846..a265e9966e 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux_defconfig"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 25e0d43f49..1e9bb40377 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -23,7 +23,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux_defconfig"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index bcd325b7ec..7a791ddc66 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -24,7 +24,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux_defconfig"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 50c1c4ccf0..66302d955b 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -23,7 +23,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux_defconfig"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index baf72da9b8..093e8caa08 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -27,7 +27,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu_defconfig"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index 2af94d010b..87db5118da 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/roseapplepi/linux_defconfig"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 6883aaba7b..5326044919 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -7,7 +7,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dk1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 50d875749b..621eb67f18 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -7,7 +7,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157c-dk2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/ts5500_defconfig b/configs/ts5500_defconfig
index 871c02e95f..df3609a75f 100644
--- a/configs/ts5500_defconfig
+++ b/configs/ts5500_defconfig
@@ -14,7 +14,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5500/linux-4.14.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/technologic/ts5500/linux-4.14_defconfig"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # rootfs
-- 
2.27.0
