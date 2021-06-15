From: Drew Fustini <drew@beagleboard.org>
Date: Mon, 14 Jun 2021 17:17:50 -0700
Subject: [Buildroot] [PATCH 4/4] configs/beaglev: switch to upstream opensbi
 generic platform
In-Reply-To: <20210615001750.421889-1-drew@beagleboard.org>
References: <20210615001750.421889-1-drew@beagleboard.org>
Message-ID: <20210615001750.421889-5-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch from the starfive-tech opensbi to upstream repo and use generic
platform now that it supports the console uart [1]. This landed after
the 0.9 release [2], so the current head of master branch is used [3].

FW_FDT_PATH is set to u-boot.dtb so that the device tree from u-boot
will be included in the OpenSBI build [4]. Note that u-boot must have
CONFIG_OF_SEPARATE enabled for u-boot to build u-boot.dtb [5].

[1] https://github.com/riscv/opensbi/commit/e822b7504df0583a6a227d51cb7da8ea9fc79c0a
[2] https://github.com/riscv/opensbi/commit/234ed8e427f4d92903123199f6590d144e0d9351
[3] https://github.com/riscv/opensbi/commit/79f9b4220ffa7f74356054be25d450d7958bf16c
[4] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
[5] https://github.com/lentinj/u-boot/blob/master/doc/README.fdt-control

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 configs/beaglev_defconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index fcbea2cdec86..29e3a52be36c 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -23,17 +23,19 @@ BR2_TARGET_BEAGLEV_DDRINIT=y
 BR2_TARGET_BEAGLEV_SECONDBOOT=y
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
-# HEAD of the Fedora branch
-BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,opensbi,2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5)/opensbi-2524b0ecd8684b42bc7a4c69794f40f11cbbe2a5.tar.gz"
-BR2_TARGET_OPENSBI_PLAT="starfive/vic7100"
+# upstream opensbi master branch
+BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,79f9b4220ffa7f74356054be25d450d7958bf16c)/opensbi-79f9b4220ffa7f74356054be25d450d7958bf16c.tar.gz"
+BR2_TARGET_OPENSBI_PLAT="generic"
 # BR2_TARGET_OPENSBI_INSTALL_DYNAMIC_IMG is not set
 # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+BR2_TARGET_OPENSBI_FW_FDT_PATH=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,64ead5b83959da8eb87b6963843addf5942e6ed4)/uboot-64ead5b83959da8eb87b6963843addf5942e6ed4.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
+BR2_TARGET_UBOOT_FORMAT_DTB=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_JH71XX_TOOLS=y
-- 
2.27.0
