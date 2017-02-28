From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 Feb 2017 18:40:01 +0100
Subject: [Buildroot] [PATCH 7/7] altera_sockit_defconfig: fix build with gcc5
In-Reply-To: <20170228174001.23830-1-arnout@mind.be>
References: <20170228174001.23830-1-arnout@mind.be>
Message-ID: <20170228174001.23830-8-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel doesn't have the compiler-gcc5.h header, so include the universal
patch that fixes this issue. A third patch is needed to fix static
inline issues.

U-Boot doesn't have the compiler-gcc5.h header and has several other
problems. Get upstream patches to fix those.

Most patches are shared between the two Altera platforms, so they go
in board/altera/patches. The 4th U-Boot patch, however, needs a
slightly different context so we put it in board/altera/sockit/patches.
A 5th patch is needed for more static inline issues; this is done by
simply taking the code from the socdk version of U-Boot. The existing
U-Boot preloader patch is also moved to board/altera/sockit/patches.

The patches are numbered taking into account the more global ones that
precede them. Therefore, the linux patch starts at 0003 (since
board/linux-gcc-patches already has 0001 and 0002), and the
sockit-specific U-Boot patch starts at 0004.

Cc: Charles Manning <cdhmanning@gmail.com>
Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../patches/uboot/0004-arm-board-use-__weak.patch  |  24 +--
 ...socfpga-don-t-use-extern-inline-functions.patch | 161 +++++++++++++++++++++
 ...add-to-sockit-a-working-preloader-design.patch} |  20 +--
 configs/altera_sockit_defconfig                    |   4 +-
 4 files changed, 182 insertions(+), 27 deletions(-)
 copy board/{via/imx6_vab820 => altera/sockit}/patches/uboot/0004-arm-board-use-__weak.patch (80%)
 create mode 100644 board/altera/sockit/patches/uboot/0005-socfpga-don-t-use-extern-inline-functions.patch
 rename board/altera/sockit/{uboot-sockit-preloader-sample-design.patch => patches/uboot/0006-board-add-to-sockit-a-working-preloader-design.patch} (98%)

diff --git a/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch b/board/altera/sockit/patches/uboot/0004-arm-board-use-__weak.patch
similarity index 80%
copy from board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
copy to board/altera/sockit/patches/uboot/0004-arm-board-use-__weak.patch
index 7a96183af3..7e41c6fed4 100644
--- a/board/via/imx6_vab820/patches/uboot/0004-arm-board-use-__weak.patch
+++ b/board/altera/sockit/patches/uboot/0004-arm-board-use-__weak.patch
@@ -1,4 +1,4 @@
-From 99bd7b7fb4d58092f020a808bb57be3b4d4cfc51 Mon Sep 17 00:00:00 2001
+From 96b09bb60980d996fd2267912e23db621fa32e5e Mon Sep 17 00:00:00 2001
 From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Date: Tue, 28 Feb 2017 14:07:30 +0100
 Subject: [PATCH] arm: board: use __weak
@@ -10,14 +10,14 @@ Acked-by: Albert ARIBAUD <albert.u.boot@aribaud.net>
 (cherry picked from commit 8590c800ee60e46f15d6085e3c1fed0d6881fc62)
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
- arch/arm/lib/board.c | 40 ++++++++++++----------------------------
- 1 file changed, 12 insertions(+), 28 deletions(-)
+ arch/arm/lib/board.c | 36 +++++++++++-------------------------
+ 1 file changed, 11 insertions(+), 25 deletions(-)
 
 diff --git a/arch/arm/lib/board.c b/arch/arm/lib/board.c
-index 51b8628b3f..3685e65134 100644
+index 109a1ac752..6515f01380 100644
 --- a/arch/arm/lib/board.c
 +++ b/arch/arm/lib/board.c
-@@ -82,25 +82,15 @@ extern void dataflash_print_info(void);
+@@ -83,25 +83,15 @@ extern void dataflash_print_info(void);
   ************************************************************************
   * May be supplied by boards if desired
   */
@@ -52,7 +52,7 @@ index 51b8628b3f..3685e65134 100644
  
  /*
   ************************************************************************
-@@ -215,27 +205,21 @@ typedef int (init_fnc_t) (void);
+@@ -216,20 +206,16 @@ typedef int (init_fnc_t) (void);
  
  int print_cpuinfo(void);
  
@@ -73,16 +73,8 @@ index 51b8628b3f..3685e65134 100644
 -int arch_cpu_init(void)
 -	__attribute__((weak, alias("__arch_cpu_init")));
  
--int __power_init_board(void)
-+__weak int power_init_board(void)
- {
- 	return 0;
- }
--int power_init_board(void)
--	__attribute__((weak, alias("__power_init_board")));
- 
- 	/* Record the board_init_f() bootstage (after arch_cpu_init()) */
- static int mark_bootstage(void)
+ init_fnc_t *init_sequence[] = {
+ 	arch_cpu_init,		/* basic arch cpu dependent setup */
 -- 
 2.11.0
 
diff --git a/board/altera/sockit/patches/uboot/0005-socfpga-don-t-use-extern-inline-functions.patch b/board/altera/sockit/patches/uboot/0005-socfpga-don-t-use-extern-inline-functions.patch
new file mode 100644
index 0000000000..66aa1181f2
--- /dev/null
+++ b/board/altera/sockit/patches/uboot/0005-socfpga-don-t-use-extern-inline-functions.patch
@@ -0,0 +1,161 @@
+From 678b44d8ee5b5e8adba81df354a1af3d3d676fb2 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Tue, 28 Feb 2017 18:14:00 +0100
+Subject: [PATCH] socfpga: don't use extern inline functions
+
+gcc5 doesn't like extern inline functions. Make them static inline
+instead.
+
+The code is taken from the Altera socdk U-Boot version
+(rel_socfpga_v2013.01.01_14.02.02).
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ arch/arm/cpu/armv7/socfpga/gic.c        | 45 ---------------------------
+ arch/arm/include/asm/arch-socfpga/gic.h | 55 +++++++++++++++++++++++++++------
+ 2 files changed, 46 insertions(+), 54 deletions(-)
+
+diff --git a/arch/arm/cpu/armv7/socfpga/gic.c b/arch/arm/cpu/armv7/socfpga/gic.c
+index 3b1eb5b6f1..dab1f11f63 100644
+--- a/arch/arm/cpu/armv7/socfpga/gic.c
++++ b/arch/arm/cpu/armv7/socfpga/gic.c
+@@ -22,28 +22,6 @@
+ 
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+-static const struct gic_cpu_if *gic_cpu_if_base = (void *)SOCFPGA_GIC_CPU_IF;
+-
+-inline void gic_dic_disable_secure (void)
+-{
+-	clrbits_le32(CONFIG_GIC_DIC_CONTROL,0x1);
+-}
+-
+-inline void gic_dic_disable_nonsecure (void)
+-{
+-	clrbits_le32(CONFIG_GIC_DIC_CONTROL,0x2);
+-}
+-
+-inline void gic_dic_enable_secure (void)
+-{
+-	setbits_le32(CONFIG_GIC_DIC_CONTROL,0x1);
+-}
+-
+-inline void gic_dic_enable_nonsecure (void)
+-{
+-	setbits_le32(CONFIG_GIC_DIC_CONTROL,0x2);
+-}
+-
+ void gic_dic_clear_enable_all_intr (void)
+ {
+ 	/* disable SGI and PPI */
+@@ -132,28 +110,5 @@ void gic_dic_clear_pending (unsigned char intrID)
+ 		(1 << mod));
+ }
+ 
+-inline void gic_cpu_disable (void)
+-{
+-	writel(0x0,&gic_cpu_if_base->ICCICR);
+-}
+ 
+-inline void gic_cpu_enable (void)
+-{
+-	writel(0x1,&gic_cpu_if_base->ICCICR);
+-}
+-
+-inline void gic_cpu_set_priority_mask (unsigned char priority_mask)
+-{
+-	writel(priority_mask,&gic_cpu_if_base->ICCPMR);
+-}
+-
+-inline unsigned long gic_cpu_get_pending_intr (void)
+-{
+-	return readl(&gic_cpu_if_base->ICCHPIR);
+-}
+-
+-inline void gic_cpu_end_of_intr (unsigned char intrID)
+-{
+-	writel(intrID,&gic_cpu_if_base->ICCEOIR);
+-}
+ 
+diff --git a/arch/arm/include/asm/arch-socfpga/gic.h b/arch/arm/include/asm/arch-socfpga/gic.h
+index a1588acb88..6243d5b2b0 100644
+--- a/arch/arm/include/asm/arch-socfpga/gic.h
++++ b/arch/arm/include/asm/arch-socfpga/gic.h
+@@ -18,6 +18,8 @@
+ #ifndef	_GIC_H_
+ #define	_GIC_H_
+ 
++static const struct gic_cpu_if *gic_cpu_if_base = (void *)SOCFPGA_GIC_CPU_IF;
++
+ void nic301_slave_ns(void);
+ 
+ struct gic_cpu_if {
+@@ -42,10 +44,6 @@ struct gic_cpu_if {
+ #define CONFIG_GIC_DIC_PPI_STATUS	(SOCFPGA_GIC_DIC + 0xd00)
+ #define CONFIG_GIC_DIC_SPI_STATUS	(SOCFPGA_GIC_DIC + 0xd04)
+ 
+-inline void gic_dic_disable_secure (void);
+-inline void gic_dic_disable_nonsecure (void);
+-inline void gic_dic_enable_secure (void);
+-inline void gic_dic_enable_nonsecure (void);
+ void gic_dic_clear_enable_all_intr (void);
+ void gic_dic_clear_pending_all_intr (void);
+ void gic_dic_set_enable (unsigned char intrID);
+@@ -56,10 +54,49 @@ void gic_dic_set_config (unsigned char intrID,
+ void gic_dic_set_pending (unsigned char intrID);
+ void gic_dic_clear_pending (unsigned char intrID);
+ 
+-inline void gic_cpu_disable (void);
+-inline void gic_cpu_enable (void);
+-inline void gic_cpu_set_priority_mask (unsigned char priority_mask);
+-inline unsigned long gic_cpu_get_pending_intr (void);
+-inline void gic_cpu_end_of_intr (unsigned char intrID);
++static inline void gic_cpu_disable(void)
++{
++	writel(0x0, &gic_cpu_if_base->ICCICR);
++}
++
++static inline void gic_cpu_enable(void)
++{
++	writel(0x1, &gic_cpu_if_base->ICCICR);
++}
++
++static inline void gic_cpu_set_priority_mask(unsigned char priority_mask)
++{
++	writel(priority_mask, &gic_cpu_if_base->ICCPMR);
++}
++
++static inline unsigned long gic_cpu_get_pending_intr(void)
++{
++	return readl(&gic_cpu_if_base->ICCHPIR);
++}
++
++static inline void gic_cpu_end_of_intr(unsigned char intrID)
++{
++	writel(intrID, &gic_cpu_if_base->ICCEOIR);
++}
++
++static inline void gic_dic_disable_secure(void)
++{
++	clrbits_le32(CONFIG_GIC_DIC_CONTROL, 0x1);
++}
++
++static inline void gic_dic_disable_nonsecure(void)
++{
++	clrbits_le32(CONFIG_GIC_DIC_CONTROL, 0x2);
++}
++
++static inline void gic_dic_enable_secure(void)
++{
++	setbits_le32(CONFIG_GIC_DIC_CONTROL, 0x1);
++}
++
++static inline void gic_dic_enable_nonsecure(void)
++{
++	setbits_le32(CONFIG_GIC_DIC_CONTROL, 0x2);
++}
+ 
+ #endif /* _GIC_H_ */
+-- 
+2.11.0
+
diff --git a/board/altera/sockit/uboot-sockit-preloader-sample-design.patch b/board/altera/sockit/patches/uboot/0006-board-add-to-sockit-a-working-preloader-design.patch
similarity index 98%
rename from board/altera/sockit/uboot-sockit-preloader-sample-design.patch
rename to board/altera/sockit/patches/uboot/0006-board-add-to-sockit-a-working-preloader-design.patch
index ddf0abce77..7bc168cc1a 100644
--- a/board/altera/sockit/uboot-sockit-preloader-sample-design.patch
+++ b/board/altera/sockit/patches/uboot/0006-board-add-to-sockit-a-working-preloader-design.patch
@@ -1,4 +1,4 @@
-From c70f2ebb350da20af1a0ed4b7960b8e5a1952713 Mon Sep 17 00:00:00 2001
+From 7e075b45cab6bedf78e4dbcee6b453a23bd3a5e4 Mon Sep 17 00:00:00 2001
 From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
 Date: Thu, 20 Feb 2014 11:51:31 -0500
 Subject: [PATCH] board: add to sockit a working preloader design
@@ -15,7 +15,7 @@ Subject: [PATCH] board: add to sockit a working preloader design
  8 files changed, 218 insertions(+), 218 deletions(-)
 
 diff --git a/board/altera/socfpga_cyclone5/build.h b/board/altera/socfpga_cyclone5/build.h
-index e5d9c3c..a369015 100644
+index e5d9c3ce30..a369015bfc 100644
 --- a/board/altera/socfpga_cyclone5/build.h
 +++ b/board/altera/socfpga_cyclone5/build.h
 @@ -29,7 +29,7 @@
@@ -28,7 +28,7 @@ index e5d9c3c..a369015 100644
  /*
   * Handoff files must provide user option whether to enable
 diff --git a/board/altera/socfpga_cyclone5/iocsr_config.c b/board/altera/socfpga_cyclone5/iocsr_config.c
-index fa663e1..90fc154 100644
+index fa663e1304..90fc154d0b 100644
 --- a/board/altera/socfpga_cyclone5/iocsr_config.c
 +++ b/board/altera/socfpga_cyclone5/iocsr_config.c
 @@ -7,113 +7,113 @@ const unsigned long iocsr_scan_chain0_table[((CONFIG_HPS_IOCSR_SCANCHAIN0_LENGTH
@@ -543,7 +543,7 @@ index fa663e1..90fc154 100644
  };
  
 diff --git a/board/altera/socfpga_cyclone5/pinmux_config.c b/board/altera/socfpga_cyclone5/pinmux_config.c
-index 730067e..cfd74cd 100644
+index 730067e696..cfd74cd7c7 100644
 --- a/board/altera/socfpga_cyclone5/pinmux_config.c
 +++ b/board/altera/socfpga_cyclone5/pinmux_config.c
 @@ -23,7 +23,7 @@ unsigned long sys_mgr_init_table[CONFIG_HPS_PINMUX_NUM] = {
@@ -597,7 +597,7 @@ index 730067e..cfd74cd 100644
  	0, /* GENERALIO20 */
  	0, /* GENERALIO21 */
 diff --git a/board/altera/socfpga_cyclone5/pinmux_config.h b/board/altera/socfpga_cyclone5/pinmux_config.h
-index fb483ab..64c750a 100644
+index fb483ab57e..64c750a24d 100644
 --- a/board/altera/socfpga_cyclone5/pinmux_config.h
 +++ b/board/altera/socfpga_cyclone5/pinmux_config.h
 @@ -11,15 +11,15 @@
@@ -621,7 +621,7 @@ index fb483ab..64c750a 100644
  
  #define CONFIG_HPS_SDMMC_BUSWIDTH (4)
 diff --git a/board/altera/socfpga_cyclone5/sdram/sdram_config.h b/board/altera/socfpga_cyclone5/sdram/sdram_config.h
-index b90d6f3..dd027ef 100755
+index b90d6f30ff..dd027efbf8 100755
 --- a/board/altera/socfpga_cyclone5/sdram/sdram_config.h
 +++ b/board/altera/socfpga_cyclone5/sdram/sdram_config.h
 @@ -4,16 +4,16 @@
@@ -665,7 +665,7 @@ index b90d6f3..dd027ef 100755
  #define CONFIG_HPS_SDR_CTRLCFG_DRAMINTR_INTREN			(0)
  #define CONFIG_HPS_SDR_CTRLCFG_STATICCFG_MEMBL			(2)
 diff --git a/board/altera/socfpga_cyclone5/sdram/sequencer_auto.h b/board/altera/socfpga_cyclone5/sdram/sequencer_auto.h
-index e8c5484..919676d 100644
+index e8c548446a..919676d895 100644
 --- a/board/altera/socfpga_cyclone5/sdram/sequencer_auto.h
 +++ b/board/altera/socfpga_cyclone5/sdram/sequencer_auto.h
 @@ -34,7 +34,7 @@
@@ -716,7 +716,7 @@ index e8c5484..919676d 100644
  #define __RW_MGR_READ_B2B_WAIT2 0x6A
  #define __RW_MGR_LFSR_WR_RD_BANK_0_WAIT 0x31
 diff --git a/board/altera/socfpga_cyclone5/sdram/sequencer_auto_ac_init.c b/board/altera/socfpga_cyclone5/sdram/sequencer_auto_ac_init.c
-index e16efa1..20b4ca1 100644
+index e16efa1ab6..20b4ca14b8 100644
 --- a/board/altera/socfpga_cyclone5/sdram/sequencer_auto_ac_init.c
 +++ b/board/altera/socfpga_cyclone5/sdram/sequencer_auto_ac_init.c
 @@ -6,16 +6,16 @@ const alt_u32 ac_rom_init[36] =
@@ -745,7 +745,7 @@ index e16efa1..20b4ca1 100644
  	0x30780000,
  	0x38780000,
 diff --git a/board/altera/socfpga_cyclone5/sdram/sequencer_defines.h b/board/altera/socfpga_cyclone5/sdram/sequencer_defines.h
-index 52faf3f..b85b85c 100644
+index 52faf3f6d0..b85b85cacd 100644
 --- a/board/altera/socfpga_cyclone5/sdram/sequencer_defines.h
 +++ b/board/altera/socfpga_cyclone5/sdram/sequencer_defines.h
 @@ -1,28 +1,28 @@
@@ -816,5 +816,5 @@ index 52faf3f..b85b85c 100644
  #define SKEW_CALIBRATION 0
  #define STATIC_FULL_CALIBRATION 1
 -- 
-1.9.0
+2.11.0
 
diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index 0addbde1e5..48c1264338 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -6,6 +6,9 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_FPU_NEON=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 
+# Older Linux and U-Boot require the gcc5 patch
+BR2_GLOBAL_PATCH_DIR="board/linux-gcc-patches board/altera/patches board/altera/sockit/patches"
+
 # Linux headers same as kernel, a 3.13 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
@@ -31,7 +34,6 @@ BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.rocketboards.org/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
-BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
-- 
2.11.0
