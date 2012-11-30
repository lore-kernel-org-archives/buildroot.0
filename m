From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:59:35 -0800
Subject: [Buildroot] [git commit branch/next] Add board files for snowball
Message-ID: <20121130160326.2E3B099369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4052e3325c240034e24cbb1b445adf32320baa98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/calao/snowball/linux-3.4.patch |   45 ++++++++++++++++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/board/calao/snowball/linux-3.4.patch b/board/calao/snowball/linux-3.4.patch
new file mode 100644
index 0000000..4e6fb51
--- /dev/null
+++ b/board/calao/snowball/linux-3.4.patch
@@ -0,0 +1,45 @@
+From 3d1a9b44b9dcd2c0f5d54c09596c96c0524d8340 Mon Sep 17 00:00:00 2001
+From: Gregory Hermant <gregory.hermant@calao-systems.com>
+Date: Tue, 13 Nov 2012 11:47:41 +0100
+Subject: [PATCH] trace-debug[stm]: Fix for BT/WLAN instability
+
+Pins under mop500_ske_pins array are used for different
+functionalities in snowball. Ex: GPIO161 pin configured
+for keypad here must stay configured as GPIO alternate
+function for operating PMU_EN pin of BT/WLAN chip in snowball.
+So forbid configuring these pins, for snowball
+
+Signed-off-by: Rajanikanth H.V <rajanikanth.hv@stericsson.com>
+Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
+---
+ arch/arm/mach-ux500/board-mop500-stm.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-ux500/board-mop500-stm.c b/arch/arm/mach-ux500/board-mop500-stm.c
+index 1bef2a0..532fb9e 100644
+--- a/arch/arm/mach-ux500/board-mop500-stm.c
++++ b/arch/arm/mach-ux500/board-mop500-stm.c
+@@ -121,7 +121,9 @@ static int stm_ste_disable_ape_on_mipi60(void)
+ 	if (retval)
+ 		STM_ERR("Failed to disable MIPI60\n");
+ 	else {
+-		retval = nmk_config_pins(ARRAY_AND_SIZE(mop500_ske_pins));
++		if (!machine_is_snowball())
++			retval = nmk_config_pins(
++				ARRAY_AND_SIZE(mop500_ske_pins));
+ 		if (retval)
+ 			STM_ERR("Failed to enable SKE gpio\n");
+ 	}
+@@ -314,7 +316,8 @@ static int stm_ste_connection(enum stm_connection_type con_type)
+ 		/* Enable altC3 on GPIO70-74 (STMMOD) and GPIO75-76 (UARTMOD) */
+ 		prcmu_enable_stm_mod_uart();
+ 		/* Enable APE on MIPI60 */
+-		retval = nmk_config_pins_sleep(ARRAY_AND_SIZE(mop500_ske_pins));
++		if (!machine_is_snowball())
++			retval = nmk_config_pins_sleep(ARRAY_AND_SIZE(mop500_ske_pins));
+ 		if (retval)
+ 			STM_ERR("Failed to disable SKE GPIO\n");
+ 		else {
+-- 
+1.7.9.5
+
