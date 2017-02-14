From: Abhimanyu V <abhimanyu.vishwakarma@imgtec.com>
Date: Tue, 14 Feb 2017 16:56:44 +0530
Subject: [Buildroot] [PATCH 1/2] uccp420wlan: new package
Message-ID: <1487071605-21494-1-git-send-email-abhimanyu.vishwakarma@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>

Wifi kernel module and firmware for Imagination explorer RPU

Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
---
 package/Config.in                                  |  1 +
 ...001-fix-compilation-error-with-kernel-4.4.patch | 90 ++++++++++++++++++++++
 package/uccp420wlan/Config.in                      | 13 ++++
 package/uccp420wlan/uccp420wlan.mk                 | 20 +++++
 4 files changed, 124 insertions(+)
 create mode 100644 package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch
 create mode 100644 package/uccp420wlan/Config.in
 create mode 100644 package/uccp420wlan/uccp420wlan.mk

diff --git a/package/Config.in b/package/Config.in
index deff0fe..ef5f849 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -474,6 +474,7 @@ endmenu
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
+	source "package/uccp420wlan/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
 	source "package/udev/Config.in"
diff --git a/package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch b/package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch
new file mode 100644
index 0000000..43026b8
--- /dev/null
+++ b/package/uccp420wlan/0001-fix-compilation-error-with-kernel-4.4.patch
@@ -0,0 +1,90 @@
+commit b5f449a2c48d2fe7c9341b32fea5a62dd6699e38
+Author: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
+Date:   Mon Jan 2 16:15:22 2017 +0530
+
+    Fix compilation error with kernel 4.4
+
+    Revert "Fix errors/warnings while compiling against kmod-mac80211"
+    
+    This reverts commit e62baef655898526c69250bc63723241f3f4c46d.
+
+    Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
+
+diff --git a/src/80211_if.c b/src/80211_if.c
+index 6291194..5ce61b7 100644
+--- a/src/80211_if.c
++++ b/src/80211_if.c
+@@ -1467,7 +1467,9 @@ static void init_hw(struct ieee80211_hw *hw)
+ 
+ static int ampdu_action(struct ieee80211_hw *hw,
+ 				struct ieee80211_vif *vif,
+-				struct ieee80211_ampdu_params *params)
++				enum ieee80211_ampdu_mlme_action action,
++				struct ieee80211_sta *sta,
++				u16 tid, u16 *ssn, u8 buf_size, bool amsdu)
+ {
+ 	int ret = 0;
+ 	unsigned int val = 0;
+@@ -1476,14 +1478,14 @@ static int ampdu_action(struct ieee80211_hw *hw,
+ 	UCCP_DEBUG_80211IF("%s-80211IF: ampdu action started\n",
+ 			((struct mac80211_dev *)(hw->priv))->name);
+ 		/* TODO */
+-	switch (params->action) {
++	switch (action) {
+ 	case IEEE80211_AMPDU_RX_START:
+ 		{
+-		val = params->tid | TID_INITIATOR_AP;
++		val = tid | TID_INITIATOR_AP;
+ 		dev->tid_info[val].tid_state = TID_STATE_AGGR_START;
+-		dev->tid_info[val].ssn = params->ssn;
++		dev->tid_info[val].ssn = *ssn;
+ 		uccp420wlan_prog_ba_session_data(1,
+-						 params->tid,
++						 tid,
+ 						 &dev->tid_info[val].ssn,
+ 						 1,
+ 						 vif->addr,
+@@ -1492,10 +1494,10 @@ static int ampdu_action(struct ieee80211_hw *hw,
+ 		break;
+ 	case IEEE80211_AMPDU_RX_STOP:
+ 		{
+-		val = params->tid | TID_INITIATOR_AP;
++		val = tid | TID_INITIATOR_AP;
+ 		dev->tid_info[val].tid_state = TID_STATE_AGGR_STOP;
+ 		uccp420wlan_prog_ba_session_data(0,
+-						 params->tid,
++						 tid,
+ 						 &dev->tid_info[val].ssn,
+ 						 1,
+ 						 vif->addr,
+@@ -1504,24 +1506,24 @@ static int ampdu_action(struct ieee80211_hw *hw,
+ 		break;
+ 	case IEEE80211_AMPDU_TX_START:
+ 		{
+-		val = params->tid | TID_INITIATOR_STA;
+-		ieee80211_start_tx_ba_cb_irqsafe(vif, params->sta->addr, params->tid);
++		val = tid | TID_INITIATOR_STA;
++		ieee80211_start_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+ 		dev->tid_info[val].tid_state = TID_STATE_AGGR_START;
+-		dev->tid_info[val].ssn = params->ssn;
++		dev->tid_info[val].ssn = *ssn;
+ 		}
+ 		break;
+ 	case IEEE80211_AMPDU_TX_STOP_FLUSH:
+ 	case IEEE80211_AMPDU_TX_STOP_FLUSH_CONT:
+ 	case IEEE80211_AMPDU_TX_STOP_CONT:
+ 		{
+-		val = params->tid | TID_INITIATOR_STA;
++		val = tid | TID_INITIATOR_STA;
+ 		dev->tid_info[val].tid_state = TID_STATE_AGGR_STOP;
+-		ieee80211_stop_tx_ba_cb_irqsafe(vif, params->sta->addr, params->tid);
++		ieee80211_stop_tx_ba_cb_irqsafe(vif, sta->addr, tid);
+ 		}
+ 		break;
+ 	case IEEE80211_AMPDU_TX_OPERATIONAL:
+ 		{
+-		val = params->tid | TID_INITIATOR_STA;
++		val = tid | TID_INITIATOR_STA;
+ 		dev->tid_info[val].tid_state = TID_STATE_AGGR_OPERATIONAL;
+ 		}
+ 		break;
diff --git a/package/uccp420wlan/Config.in b/package/uccp420wlan/Config.in
new file mode 100644
index 0000000..8f0df12
--- /dev/null
+++ b/package/uccp420wlan/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_UCCP420WLAN
+	bool "uccp420wlan"
+	depends on BR2_LINUX_KERNEL
+	help
+	  SoftMAC (mac80211) based WiFi driver for Imagination's Explorer RPU uccp420.
+	  This supports Dual Band WiFi with 2.4GHz - 2x2 b/g/n 40MHz, 5GHz - 2x2 a/n/11ac 80MHz modes
+
+	  Used in creator ci40 board.
+
+	  https://github.com/CreatorDev/uccp420wlan
+
+comment "uccp420wlan needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
new file mode 100644
index 0000000..f3c8064
--- /dev/null
+++ b/package/uccp420wlan/uccp420wlan.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# uccp420wlan
+#
+################################################################################
+
+UCCP420WLAN_VERSION = v6.9
+UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,$(UCCP420WLAN_VERSION))
+UCCP420WLAN_LICENSE = GPLv2 (kernel module), proprietary (firmware blob)
+UCCP420WLAN_LICENSE_FILES = COPYING
+
+define UCCP420WLAN_INSTALL_FIRMWARE
+	mkdir -p $(TARGET_DIR)/lib/firmware/img/uccp420wlan
+	cp $(@D)/firmware/*.ldr $(TARGET_DIR)/lib/firmware/img/uccp420wlan
+endef
+
+UCCP420WLAN_POST_INSTALL_TARGET_HOOKS += UCCP420WLAN_INSTALL_FIRMWARE
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.7.4
