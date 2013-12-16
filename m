From: Sergey Alyoshin <alyoshin.s@gmail.com>
Date: Mon, 16 Dec 2013 20:25:06 +0400
Subject: [Buildroot] [PATCH v2] arm: mx5: Add fuse supply enable in fsl_iim
Message-ID: <1387211106-28975-1-git-send-email-alyoshin.s@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable fuse supply before fuse programming and disable after.

Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
Tested-by: Sergey Alyoshin <alyoshin.s@gmail.com>

Tested on i.MX53 custom board by writing MAC addresses in fuse bank 1.
---
 arch/arm/cpu/armv7/mx5/clock.c           |   12 ++++++++++++
 arch/arm/include/asm/arch-mx5/clock.h    |    1 +
 arch/arm/include/asm/arch-mx5/crm_regs.h |    3 +++
 drivers/misc/fsl_iim.c                   |   17 ++++++++++++++++-
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm/cpu/armv7/mx5/clock.c b/arch/arm/cpu/armv7/mx5/clock.c
index fb3b128..2ca87e4 100644
--- a/arch/arm/cpu/armv7/mx5/clock.c
+++ b/arch/arm/cpu/armv7/mx5/clock.c
@@ -749,6 +749,18 @@ void enable_nfc_clk(unsigned char enable)
 		MXC_CCM_CCGR5_EMI_ENFC(cg));
 }
 
+#ifdef CONFIG_FSL_IIM
+void enable_efuse_prog_supply(bool enable)
+{
+	if (enable)
+		setbits_le32(&mxc_ccm->cgpr,
+				MXC_CCM_CGPR_EFUSE_PROG_SUPPLY_GATE);
+	else
+		clrbits_le32(&mxc_ccm->cgpr,
+				MXC_CCM_CGPR_EFUSE_PROG_SUPPLY_GATE);
+}
+#endif
+
 /* Config main_bus_clock for periphs */
 static int config_periph_clk(u32 ref, u32 freq)
 {
diff --git a/arch/arm/include/asm/arch-mx5/clock.h b/arch/arm/include/asm/arch-mx5/clock.h
index 9ee79ae..3db4112 100644
--- a/arch/arm/include/asm/arch-mx5/clock.h
+++ b/arch/arm/include/asm/arch-mx5/clock.h
@@ -53,5 +53,6 @@ void enable_usboh3_clk(bool enable);
 void mxc_set_sata_internal_clock(void);
 int enable_i2c_clk(unsigned char enable, unsigned i2c_num);
 void enable_nfc_clk(unsigned char enable);
+void enable_efuse_prog_supply(bool enable);
 
 #endif /* __ASM_ARCH_CLOCK_H */
diff --git a/arch/arm/include/asm/arch-mx5/crm_regs.h b/arch/arm/include/asm/arch-mx5/crm_regs.h
index 392881c..efe57e0 100644
--- a/arch/arm/include/asm/arch-mx5/crm_regs.h
+++ b/arch/arm/include/asm/arch-mx5/crm_regs.h
@@ -305,6 +305,9 @@ struct mxc_ccm_reg {
 /* Define the bits in register CCDR */
 #define MXC_CCM_CCDR_IPU_HS_MASK			(0x1 << 17)
 
+/* Define the bits in register CGPR */
+#define MXC_CCM_CGPR_EFUSE_PROG_SUPPLY_GATE		(1 << 4)
+
 /* Define the bits in register CCGRx */
 #define MXC_CCM_CCGR_CG_MASK				0x3
 #define MXC_CCM_CCGR_CG_OFF				0x0
diff --git a/drivers/misc/fsl_iim.c b/drivers/misc/fsl_iim.c
index 44ae7b1..8ac4d21 100644
--- a/drivers/misc/fsl_iim.c
+++ b/drivers/misc/fsl_iim.c
@@ -16,6 +16,9 @@
 #ifndef CONFIG_MPC512X
 #include <asm/arch/imx-regs.h>
 #endif
+#if defined(CONFIG_MX51) || defined(CONFIG_MX53)
+#include <asm/arch/clock.h>
+#endif
 
 /* FSL IIM-specific constants */
 #define STAT_BUSY		0x80
@@ -93,6 +96,14 @@ struct fsl_iim {
 	} bank[8];
 };
 
+#if !defined(CONFIG_MX51) && !defined(CONFIG_MX53)
+#define enable_efuse_prog_supply(enable)
+#endif
+static void enable_fuse_prog(bool enable)
+{
+	enable_efuse_prog_supply(enable);
+}
+
 static int prepare_access(struct fsl_iim **regs, u32 bank, u32 word, int assert,
 				const char *caller)
 {
@@ -237,12 +248,16 @@ int fuse_prog(u32 bank, u32 word, u32 val)
 	if (ret)
 		return ret;
 
+	enable_fuse_prog(1);
 	for (bit = 0; val; bit++, val >>= 1)
 		if (val & 0x01) {
 			ret = prog_bit(regs, bank, word, bit);
-			if (ret)
+			if (ret) {
+				enable_fuse_prog(0);
 				return ret;
+			}
 		}
+	enable_fuse_prog(0);
 
 	return 0;
 }
-- 
1.7.10.4
