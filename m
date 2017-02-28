From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 28 Feb 2017 18:39:56 +0100
Subject: [Buildroot] [PATCH 2/7] minnowboard_defconfig: fix build with gcc5
In-Reply-To: <20170228174001.23830-1-arnout@mind.be>
References: <20170228174001.23830-1-arnout@mind.be>
Message-ID: <20170228174001.23830-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The kernel don't have the compiler-gcc5.h header, so include the
universal patch that fixes this issue.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ove-inline-keyword-for-exported-functions.patch | 159 +++++++++++++++++++++
 configs/minnowboard_defconfig                      |   3 +
 2 files changed, 162 insertions(+)
 create mode 100644 board/minnowboard/patches/linux/0001-pch_gbe-remove-inline-keyword-for-exported-functions.patch

diff --git a/board/minnowboard/patches/linux/0001-pch_gbe-remove-inline-keyword-for-exported-functions.patch b/board/minnowboard/patches/linux/0001-pch_gbe-remove-inline-keyword-for-exported-functions.patch
new file mode 100644
index 0000000000..7a58a1a87a
--- /dev/null
+++ b/board/minnowboard/patches/linux/0001-pch_gbe-remove-inline-keyword-for-exported-functions.patch
@@ -0,0 +1,159 @@
+From a6c8ff27855951cf49bc0ecf7c7ad4dd91437357 Mon Sep 17 00:00:00 2001
+From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+Date: Fri, 28 Jun 2013 14:02:52 +0300
+Subject: [PATCH] pch_gbe: remove inline keyword for exported functions
+
+There is no much sense to mark functions inline that are going to be used in
+the other compile modules.
+
+[Arnout: this patch is needed to fix the build with gcc5]
+
+Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+(cherry picked from commit bd79680956573dd70bfa207af6b143aa94980b96)
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_api.c | 21 +++++++++++----------
+ .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c    |  2 +-
+ drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_phy.c |  3 +--
+ 3 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_api.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_api.c
+index 5ae03e815ee9..82e72b21a8fb 100644
+--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_api.c
++++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_api.c
+@@ -19,6 +19,7 @@
+  */
+ #include "pch_gbe.h"
+ #include "pch_gbe_phy.h"
++#include "pch_gbe_api.h"
+ 
+ /* bus type values */
+ #define pch_gbe_bus_type_unknown	0
+@@ -112,7 +113,7 @@ static void pch_gbe_plat_init_function_pointers(struct pch_gbe_hw *hw)
+  *	0:	Successfully
+  *	ENOSYS:	Function is not registered
+  */
+-inline s32 pch_gbe_hal_setup_init_funcs(struct pch_gbe_hw *hw)
++s32 pch_gbe_hal_setup_init_funcs(struct pch_gbe_hw *hw)
+ {
+ 	if (!hw->reg) {
+ 		pr_err("ERROR: Registers not mapped\n");
+@@ -126,7 +127,7 @@ inline s32 pch_gbe_hal_setup_init_funcs(struct pch_gbe_hw *hw)
+  * pch_gbe_hal_get_bus_info - Obtain bus information for adapter
+  * @hw:	Pointer to the HW structure
+  */
+-inline void pch_gbe_hal_get_bus_info(struct pch_gbe_hw *hw)
++void pch_gbe_hal_get_bus_info(struct pch_gbe_hw *hw)
+ {
+ 	if (!hw->func->get_bus_info)
+ 		pr_err("ERROR: configuration\n");
+@@ -141,7 +142,7 @@ inline void pch_gbe_hal_get_bus_info(struct pch_gbe_hw *hw)
+  *	0:	Successfully
+  *	ENOSYS:	Function is not registered
+  */
+-inline s32 pch_gbe_hal_init_hw(struct pch_gbe_hw *hw)
++s32 pch_gbe_hal_init_hw(struct pch_gbe_hw *hw)
+ {
+ 	if (!hw->func->init_hw) {
+ 		pr_err("ERROR: configuration\n");
+@@ -159,7 +160,7 @@ inline s32 pch_gbe_hal_init_hw(struct pch_gbe_hw *hw)
+  *	0:	Successfully
+  *	Negative value:	Failed
+  */
+-inline s32 pch_gbe_hal_read_phy_reg(struct pch_gbe_hw *hw, u32 offset,
++s32 pch_gbe_hal_read_phy_reg(struct pch_gbe_hw *hw, u32 offset,
+ 					u16 *data)
+ {
+ 	if (!hw->func->read_phy_reg)
+@@ -176,7 +177,7 @@ inline s32 pch_gbe_hal_read_phy_reg(struct pch_gbe_hw *hw, u32 offset,
+  *	0:	Successfully
+  *	Negative value:	Failed
+  */
+-inline s32 pch_gbe_hal_write_phy_reg(struct pch_gbe_hw *hw, u32 offset,
++s32 pch_gbe_hal_write_phy_reg(struct pch_gbe_hw *hw, u32 offset,
+ 					u16 data)
+ {
+ 	if (!hw->func->write_phy_reg)
+@@ -188,7 +189,7 @@ inline s32 pch_gbe_hal_write_phy_reg(struct pch_gbe_hw *hw, u32 offset,
+  * pch_gbe_hal_phy_hw_reset - Hard PHY reset
+  * @hw:	    Pointer to the HW structure
+  */
+-inline void pch_gbe_hal_phy_hw_reset(struct pch_gbe_hw *hw)
++void pch_gbe_hal_phy_hw_reset(struct pch_gbe_hw *hw)
+ {
+ 	if (!hw->func->reset_phy)
+ 		pr_err("ERROR: configuration\n");
+@@ -200,7 +201,7 @@ inline void pch_gbe_hal_phy_hw_reset(struct pch_gbe_hw *hw)
+  * pch_gbe_hal_phy_sw_reset - Soft PHY reset
+  * @hw:	    Pointer to the HW structure
+  */
+-inline void pch_gbe_hal_phy_sw_reset(struct pch_gbe_hw *hw)
++void pch_gbe_hal_phy_sw_reset(struct pch_gbe_hw *hw)
+ {
+ 	if (!hw->func->sw_reset_phy)
+ 		pr_err("ERROR: configuration\n");
+@@ -215,7 +216,7 @@ inline void pch_gbe_hal_phy_sw_reset(struct pch_gbe_hw *hw)
+  *	0:	Successfully
+  *	ENOSYS:	Function is not registered
+  */
+-inline s32 pch_gbe_hal_read_mac_addr(struct pch_gbe_hw *hw)
++s32 pch_gbe_hal_read_mac_addr(struct pch_gbe_hw *hw)
+ {
+ 	if (!hw->func->read_mac_addr) {
+ 		pr_err("ERROR: configuration\n");
+@@ -228,7 +229,7 @@ inline s32 pch_gbe_hal_read_mac_addr(struct pch_gbe_hw *hw)
+  * pch_gbe_hal_power_up_phy - Power up PHY
+  * @hw:	Pointer to the HW structure
+  */
+-inline void pch_gbe_hal_power_up_phy(struct pch_gbe_hw *hw)
++void pch_gbe_hal_power_up_phy(struct pch_gbe_hw *hw)
+ {
+ 	if (hw->func->power_up_phy)
+ 		hw->func->power_up_phy(hw);
+@@ -238,7 +239,7 @@ inline void pch_gbe_hal_power_up_phy(struct pch_gbe_hw *hw)
+  * pch_gbe_hal_power_down_phy - Power down PHY
+  * @hw:	Pointer to the HW structure
+  */
+-inline void pch_gbe_hal_power_down_phy(struct pch_gbe_hw *hw)
++void pch_gbe_hal_power_down_phy(struct pch_gbe_hw *hw)
+ {
+ 	if (hw->func->power_down_phy)
+ 		hw->func->power_down_phy(hw);
+diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+index f487ad71922f..a1b2be0aba94 100644
+--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
++++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+@@ -289,7 +289,7 @@ static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
+ 	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+ }
+ 
+-inline void pch_gbe_mac_load_mac_addr(struct pch_gbe_hw *hw)
++static inline void pch_gbe_mac_load_mac_addr(struct pch_gbe_hw *hw)
+ {
+ 	iowrite32(0x01, &hw->reg->MAC_ADDR_LOAD);
+ }
+diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_phy.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_phy.c
+index bb8d8b45788d..7ee1c035b65e 100644
+--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_phy.c
++++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_phy.c
+@@ -245,7 +245,7 @@ void pch_gbe_phy_power_down(struct pch_gbe_hw *hw)
+  * pch_gbe_phy_set_rgmii - RGMII interface setting
+  * @hw:	            Pointer to the HW structure
+  */
+-inline void pch_gbe_phy_set_rgmii(struct pch_gbe_hw *hw)
++void pch_gbe_phy_set_rgmii(struct pch_gbe_hw *hw)
+ {
+ 	pch_gbe_phy_sw_reset(hw);
+ }
+@@ -280,7 +280,6 @@ void pch_gbe_phy_init_setting(struct pch_gbe_hw *hw)
+ 	pch_gbe_phy_read_reg_miic(hw, PHY_PHYSP_CONTROL, &mii_reg);
+ 	mii_reg |= PHYSP_CTRL_ASSERT_CRS_TX;
+ 	pch_gbe_phy_write_reg_miic(hw, PHY_PHYSP_CONTROL, mii_reg);
+-
+ 	 /* Setup a TX clock delay for certain boards */
+ 	 if (hw->phy.tx_clk_delay)
+ 		pch_gbe_phy_tx_clk_delay(hw);
+-- 
+2.11.0
+
diff --git a/configs/minnowboard_defconfig b/configs/minnowboard_defconfig
index f4afc86bf8..10849e99bc 100644
--- a/configs/minnowboard_defconfig
+++ b/configs/minnowboard_defconfig
@@ -8,6 +8,9 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard"
 
+# Older Linux requires the gcc5 patch
+BR2_GLOBAL_PATCH_DIR="board/linux-gcc-patches board/minnowboard/patches"
+
 # Linux headers same as kernel, a 3.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.11.0
