Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD727C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D29181C46;
	Wed,  1 May 2024 19:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HpnrSS8_8Ob; Wed,  1 May 2024 19:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E1E81F4E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E1E81F4E;
	Wed,  1 May 2024 19:51:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 653E81BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D10381C46
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqESWFlHJNs6 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC917812F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC917812F8
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:51:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92FC78641A; Wed,  1 May 2024 19:51:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:41:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 640a79000b028eef3f54ba18e450c27bbeea9f56
X-Git-Newrev: 7931f78c16f08f7a850181ce4b316e2be7522f26
X-Patchwork-Hint: ignore
Message-Id: <20240501195108.92FC78641A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: new check for
 Buildroot's defconfig files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7931f78c16f08f7a850181ce4b316e2be7522f26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we do have support for checking hashes for custom versions
(for the few packages for which we do support custom versions, like the
kernel, some bootloaders...), we want to ensure that our defconfig
files, when they enable one or more such custom version, do enable
checking the hashes for those versions, and thus we want to require all
our defconfigs do enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Add a check for that condition.

We need to be careful that we only check Buildroot's defconfig, whether
in-tree or in a br2-external, and not kernel or other kconfig-based
defconfig files, like those in board/ sub-directories. So we only match
defconfig files that are in a configs/ directory, whether at the
toplevel (for in-tree defconfigs), or not (for br2-external defconfigs).

Since we only have two defconfigs that check hashes for custom versions,
regnerate .checkpackageignore to ignore all so-far broken defconfigs.

Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                    | 288 +++++++++++++++++++++++++++++++++
 utils/check-package                    |   9 ++
 utils/checkpackagelib/lib_defconfig.py |  20 +++
 3 files changed, 317 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3..0b169ea2f1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -116,6 +116,294 @@ boot/syslinux/0013-Fix-build-with-gnu-efi-version-3.0.9.patch lib_patch.Upstream
 boot/syslinux/0014-Fix-build-with-binutils-note-gnu-property-section.patch lib_patch.Upstream
 boot/syslinux/0016-Workaround-multiple-definition-of-symbol-errors.patch lib_patch.Upstream
 boot/syslinux/0017-Replace-builtin-strlen-that-appears-to-get-optimized.patch lib_patch.Upstream
+configs/aarch64_efi_defconfig lib_defconfig.ForceCheckHash
+configs/acmesystems_acqua_a5_256mb_defconfig lib_defconfig.ForceCheckHash
+configs/acmesystems_acqua_a5_512mb_defconfig lib_defconfig.ForceCheckHash
+configs/acmesystems_aria_g25_128mb_defconfig lib_defconfig.ForceCheckHash
+configs/acmesystems_aria_g25_256mb_defconfig lib_defconfig.ForceCheckHash
+configs/acmesystems_arietta_g25_128mb_defconfig lib_defconfig.ForceCheckHash
+configs/acmesystems_arietta_g25_256mb_defconfig lib_defconfig.ForceCheckHash
+configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
+configs/amarula_vyasa_rk3288_defconfig lib_defconfig.ForceCheckHash
+configs/andes_ae350_45_defconfig lib_defconfig.ForceCheckHash
+configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
+configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
+configs/arm_foundationv8_defconfig lib_defconfig.ForceCheckHash
+configs/armadeus_apf27_defconfig lib_defconfig.ForceCheckHash
+configs/armadeus_apf28_defconfig lib_defconfig.ForceCheckHash
+configs/armadeus_apf51_defconfig lib_defconfig.ForceCheckHash
+configs/aspeed_ast2500evb_defconfig lib_defconfig.ForceCheckHash
+configs/aspeed_ast2600evb_defconfig lib_defconfig.ForceCheckHash
+configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
+configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9g20dfc_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9x5ek_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9x5ek_dev_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9x5ek_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/at91sam9x5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d2_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d3_xplained_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d3_xplained_dev_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d3_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d3_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d3xek_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d4_xplained_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d4_xplained_dev_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d4_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/atmel_sama5d4_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/avenger96_defconfig lib_defconfig.ForceCheckHash
+configs/avnet_rzboard_v2l_defconfig lib_defconfig.ForceCheckHash
+configs/bananapi_m2_berry_defconfig lib_defconfig.ForceCheckHash
+configs/bananapi_m2_ultra_defconfig lib_defconfig.ForceCheckHash
+configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
+configs/bananapro_defconfig lib_defconfig.ForceCheckHash
+configs/beagleboardx15_defconfig lib_defconfig.ForceCheckHash
+configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
+configs/beaglebone_qt5_defconfig lib_defconfig.ForceCheckHash
+configs/beagleboneai_defconfig lib_defconfig.ForceCheckHash
+configs/beaglev_defconfig lib_defconfig.ForceCheckHash
+configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
+configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
+configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
+configs/chromebook_elm_defconfig lib_defconfig.ForceCheckHash
+configs/chromebook_snow_defconfig lib_defconfig.ForceCheckHash
+configs/ci20_defconfig lib_defconfig.ForceCheckHash
+configs/cubieboard2_defconfig lib_defconfig.ForceCheckHash
+configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash
+configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
+configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
+configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
+configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx28evk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx6dlsabreauto_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx6dlsabresd_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx6qsabreauto_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx6qsabresd_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx6sxsabresd_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx6ullevk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx7dsabresd_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8dxlevk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8mmevk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8mnevk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8mpevk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8mqevk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8qmmek_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx8qxpmek_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_imx93evk_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
+configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
+configs/friendlyarm_nanopi_r2s_defconfig lib_defconfig.ForceCheckHash
+configs/galileo_defconfig lib_defconfig.ForceCheckHash
+configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
+configs/grinn_chiliboard_defconfig lib_defconfig.ForceCheckHash
+configs/grinn_liteboard_defconfig lib_defconfig.ForceCheckHash
+configs/hifive_unleashed_defconfig lib_defconfig.ForceCheckHash
+configs/icnova-a20-adb4006_defconfig lib_defconfig.ForceCheckHash
+configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
+configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
+configs/imx6-sabresd_defconfig lib_defconfig.ForceCheckHash
+configs/imx6-sabresd_qt5_defconfig lib_defconfig.ForceCheckHash
+configs/imx6slevk_defconfig lib_defconfig.ForceCheckHash
+configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
+configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
+configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
+configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
+configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
+configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
+configs/imx8mmpico_defconfig lib_defconfig.ForceCheckHash
+configs/imx8mn_bsh_smm_s2_defconfig lib_defconfig.ForceCheckHash
+configs/imx8mn_bsh_smm_s2_pro_defconfig lib_defconfig.ForceCheckHash
+configs/imx8mpico_defconfig lib_defconfig.ForceCheckHash
+configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
+configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
+configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
+configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
+configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
+configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
+configs/lego_ev3_defconfig lib_defconfig.ForceCheckHash
+configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
+configs/ls1028ardb_defconfig lib_defconfig.ForceCheckHash
+configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
+configs/mangopi_mq1rdw2_defconfig lib_defconfig.ForceCheckHash
+configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_mpfs_icicle_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sam9x60ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sama5d2_icp_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sama5d2_icp_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sama7g5ek_mmc_defconfig lib_defconfig.ForceCheckHash
+configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
+configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
+configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
+configs/mx51evk_defconfig lib_defconfig.ForceCheckHash
+configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
+configs/mx6cubox_defconfig lib_defconfig.ForceCheckHash
+configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
+configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
+configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen6sx_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen6x_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen7_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen8m_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen8mm_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen8mn_defconfig lib_defconfig.ForceCheckHash
+configs/nitrogen8mp_defconfig lib_defconfig.ForceCheckHash
+configs/octavo_osd32mp1_brk_defconfig lib_defconfig.ForceCheckHash
+configs/octavo_osd32mp1_red_defconfig lib_defconfig.ForceCheckHash
+configs/odroidc2_defconfig lib_defconfig.ForceCheckHash
+configs/odroidxu4_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a10_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a13_olinuxino_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a20_olinuxino_lime2_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_imx233_olinuxino_defconfig lib_defconfig.ForceCheckHash
+configs/olimex_stmp157_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
+configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
+configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
+configs/openblocks_a6_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_lite_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_one_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_one_plus_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_pc_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_pc_plus_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_r1_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_zero3_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_zero_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_zero_plus2_defconfig lib_defconfig.ForceCheckHash
+configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
+configs/pandaboard_defconfig lib_defconfig.ForceCheckHash
+configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
+configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
+configs/pcengines_apu2_defconfig lib_defconfig.ForceCheckHash
+configs/pine64_defconfig lib_defconfig.ForceCheckHash
+configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
+configs/pine64_sopine_defconfig lib_defconfig.ForceCheckHash
+configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_aarch64_ebbr_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_aarch64_sbsa_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_aarch64_virt_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_arm_ebbr_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_arm_versatile_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_arm_vexpress_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_arm_vexpress_tz_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_m68k_mcf5208_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_m68k_q800_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_microblazebe_mmu_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_microblazeel_mmu_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips32r2_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips32r2el_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips32r6_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips32r6el_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips64_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips64el_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips64r6_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_mips64r6el_malta_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_nios2_10m50_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_or1k_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc64_e5500_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc64_pseries_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc64le_powernv8_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc64le_pseries_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc_bamboo_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc_e500mc_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc_g3beige_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc_mac99_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_ppc_mpc8544ds_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_riscv32_virt_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_riscv64_nommu_virt_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_riscv64_virt_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_riscv64_virt_efi_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_s390x_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_sh4_r2d_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_sh4eb_r2d_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_sparc64_sun4u_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_x86_64_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_x86_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_xtensa_lx60_defconfig lib_defconfig.ForceCheckHash
+configs/qemu_xtensa_lx60_nommu_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi0_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi0w_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi2_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi3_64_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi3_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi3_qt5we_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi4_64_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi4_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypi_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypicm4io_64_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypicm4io_defconfig lib_defconfig.ForceCheckHash
+configs/raspberrypizero2w_defconfig lib_defconfig.ForceCheckHash
+configs/riotboard_defconfig lib_defconfig.ForceCheckHash
+configs/roc_pc_rk3399_defconfig lib_defconfig.ForceCheckHash
+configs/rock64_defconfig lib_defconfig.ForceCheckHash
+configs/rock_pi_n8_defconfig lib_defconfig.ForceCheckHash
+configs/rockpro64_defconfig lib_defconfig.ForceCheckHash
+configs/roseapplepi_defconfig lib_defconfig.ForceCheckHash
+configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
+configs/sheevaplug_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_licheepi_nano_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_licheepi_zero_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maix_bit_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maix_bit_sdcard_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maix_dock_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maix_dock_sdcard_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maix_go_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maix_go_sdcard_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maixduino_defconfig lib_defconfig.ForceCheckHash
+configs/sipeed_maixduino_sdcard_defconfig lib_defconfig.ForceCheckHash
+configs/snps_arc700_axs101_defconfig lib_defconfig.ForceCheckHash
+configs/snps_arc700_nsim_defconfig lib_defconfig.ForceCheckHash
+configs/snps_archs38_axs103_defconfig lib_defconfig.ForceCheckHash
+configs/snps_archs38_haps_defconfig lib_defconfig.ForceCheckHash
+configs/snps_archs38_hsdk_defconfig lib_defconfig.ForceCheckHash
+configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
+configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
+configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
+configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
+configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
+configs/stm32f429_disco_xip_defconfig lib_defconfig.ForceCheckHash
+configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
+configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
+configs/stm32f769_disco_sd_defconfig lib_defconfig.ForceCheckHash
+configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
+configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
+configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
+configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
+configs/toradex_apalis_imx6_defconfig lib_defconfig.ForceCheckHash
+configs/ts4900_defconfig lib_defconfig.ForceCheckHash
+configs/ts5500_defconfig lib_defconfig.ForceCheckHash
+configs/ts7680_defconfig lib_defconfig.ForceCheckHash
+configs/uevm5432_defconfig lib_defconfig.ForceCheckHash
+configs/versal_vck190_defconfig lib_defconfig.ForceCheckHash
+configs/visionfive2_defconfig lib_defconfig.ForceCheckHash
+configs/visionfive_defconfig lib_defconfig.ForceCheckHash
+configs/wandboard_defconfig lib_defconfig.ForceCheckHash
+configs/warp7_defconfig lib_defconfig.ForceCheckHash
+configs/zynq_microzed_defconfig lib_defconfig.ForceCheckHash
+configs/zynq_zc702_defconfig lib_defconfig.ForceCheckHash
+configs/zynq_zc706_defconfig lib_defconfig.ForceCheckHash
+configs/zynq_zed_defconfig lib_defconfig.ForceCheckHash
+configs/zynqmp_kria_kd240_defconfig lib_defconfig.ForceCheckHash
+configs/zynqmp_kria_kr260_defconfig lib_defconfig.ForceCheckHash
+configs/zynqmp_kria_kv260_defconfig lib_defconfig.ForceCheckHash
+configs/zynqmp_zcu102_defconfig lib_defconfig.ForceCheckHash
+configs/zynqmp_zcu104_defconfig lib_defconfig.ForceCheckHash
+configs/zynqmp_zcu106_defconfig lib_defconfig.ForceCheckHash
 linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch lib_patch.Upstream
 package/18xx-ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/4th/0001-avoid-regen-during-install.patch lib_patch.Upstream
diff --git a/utils/check-package b/utils/check-package
index 61b66a8a67..cbb3613e19 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -10,6 +10,7 @@ import sys
 
 import checkpackagelib.base
 import checkpackagelib.lib_config
+import checkpackagelib.lib_defconfig
 import checkpackagelib.lib_hash
 import checkpackagelib.lib_ignore
 import checkpackagelib.lib_mk
@@ -113,6 +114,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"arch/",
     r"board/",
     r"boot/",
+    r"configs/",
     r"fs/",
     r"linux/",
     r"package/",
@@ -137,6 +139,11 @@ DO_NOT_CHECK_INTREE = re.compile(r"|".join([
 
 SYSV_INIT_SCRIPT_FILENAME = re.compile(r"/S\d\d[^/]+$")
 
+# For defconfigs: avoid matching kernel, uboot... defconfig files, so
+# limit to defconfig files in a configs/ directory, either in-tree or
+# in a br2-external tree.
+BR_DEFCONFIG_FILENAME = re.compile(r"^(.+/)?configs/[^/]+_defconfig$")
+
 
 def get_lib_from_filename(fname):
     if flags.intree_only:
@@ -152,6 +159,8 @@ def get_lib_from_filename(fname):
         return checkpackagelib.lib_ignore
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
+    if BR_DEFCONFIG_FILENAME.search(fname):
+        return checkpackagelib.lib_defconfig
     if fname.endswith(".hash"):
         return checkpackagelib.lib_hash
     if fname.endswith(".mk"):
diff --git a/utils/checkpackagelib/lib_defconfig.py b/utils/checkpackagelib/lib_defconfig.py
new file mode 100644
index 0000000000..ab0e361b57
--- /dev/null
+++ b/utils/checkpackagelib/lib_defconfig.py
@@ -0,0 +1,20 @@
+# See utils/checkpackagelib/readme.txt before editing this file.
+
+from checkpackagelib.base import _CheckFunction
+
+
+class ForceCheckHash(_CheckFunction):
+    """Checks that a defconfig does force checking all hashes"""
+
+    def before(self):
+        self.forces = False
+
+    def check_line(self, lineno, text):
+        if self.forces:
+            return
+        if text == "BR2_DOWNLOAD_FORCE_CHECK_HASHES=y\n":
+            self.forces = True
+
+    def after(self):
+        if not self.forces:
+            return [f"{self.filename}:0: missing BR2_DOWNLOAD_FORCE_CHECK_HASHES"]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
