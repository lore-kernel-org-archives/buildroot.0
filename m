From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Mar 2014 10:35:13 -0300
Subject: [Buildroot] [PATCH 3/3] wpa_supplicant: add fix for WPS NFC support
In-Reply-To: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393940113-3419-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1393940113-3419-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WPS NFC support wouldn't build properly unless AP mode was enabled.
Add upstream fix to correct this and enable NFC support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...NFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch | 121 +++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk           |   1 -
 2 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch

diff --git a/package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch b/package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch
new file mode 100644
index 0000000..946011c
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch
@@ -0,0 +1,121 @@
+From 88853aedf6cc4a152442b5bb2c4946683df6ff66 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Thu, 13 Feb 2014 15:29:09 +0200
+Subject: [PATCH] Fix CONFIG_WPS_NFC=y build without CONFIG_P2P=y
+
+Some of the control interface operations for P2P were not properly
+protected with #ifdef CONFIG_P2P.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ wpa_supplicant/ctrl_iface.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/wpa_supplicant/ctrl_iface.c b/wpa_supplicant/ctrl_iface.c
+index ddddad3..ed332da 100644
+--- a/wpa_supplicant/ctrl_iface.c
++++ b/wpa_supplicant/ctrl_iface.c
+@@ -951,6 +951,7 @@ static int wpas_ctrl_nfc_get_handover_req_wps(struct wpa_supplicant *wpa_s,
+ }
+ 
+ 
++#ifdef CONFIG_P2P
+ static int wpas_ctrl_nfc_get_handover_req_p2p(struct wpa_supplicant *wpa_s,
+ 					      char *reply, size_t max_len,
+ 					      int ndef)
+@@ -973,6 +974,7 @@ static int wpas_ctrl_nfc_get_handover_req_p2p(struct wpa_supplicant *wpa_s,
+ 
+ 	return res;
+ }
++#endif /* CONFIG_P2P */
+ 
+ 
+ static int wpas_ctrl_nfc_get_handover_req(struct wpa_supplicant *wpa_s,
+@@ -1001,10 +1003,12 @@ static int wpas_ctrl_nfc_get_handover_req(struct wpa_supplicant *wpa_s,
+ 			wpa_s, reply, max_len, ndef);
+ 	}
+ 
++#ifdef CONFIG_P2P
+ 	if (os_strcmp(pos, "P2P-CR") == 0) {
+ 		return wpas_ctrl_nfc_get_handover_req_p2p(
+ 			wpa_s, reply, max_len, ndef);
+ 	}
++#endif /* CONFIG_P2P */
+ 
+ 	return -1;
+ }
+@@ -1032,6 +1036,7 @@ static int wpas_ctrl_nfc_get_handover_sel_wps(struct wpa_supplicant *wpa_s,
+ }
+ 
+ 
++#ifdef CONFIG_P2P
+ static int wpas_ctrl_nfc_get_handover_sel_p2p(struct wpa_supplicant *wpa_s,
+ 					      char *reply, size_t max_len,
+ 					      int ndef, int tag)
+@@ -1052,6 +1057,7 @@ static int wpas_ctrl_nfc_get_handover_sel_p2p(struct wpa_supplicant *wpa_s,
+ 
+ 	return res;
+ }
++#endif /* CONFIG_P2P */
+ 
+ 
+ static int wpas_ctrl_nfc_get_handover_sel(struct wpa_supplicant *wpa_s,
+@@ -1084,6 +1090,7 @@ static int wpas_ctrl_nfc_get_handover_sel(struct wpa_supplicant *wpa_s,
+ 			os_strcmp(pos, "WPS-CR") == 0, pos2);
+ 	}
+ 
++#ifdef CONFIG_P2P
+ 	if (os_strcmp(pos, "P2P-CR") == 0) {
+ 		return wpas_ctrl_nfc_get_handover_sel_p2p(
+ 			wpa_s, reply, max_len, ndef, 0);
+@@ -1093,6 +1100,7 @@ static int wpas_ctrl_nfc_get_handover_sel(struct wpa_supplicant *wpa_s,
+ 		return wpas_ctrl_nfc_get_handover_sel_p2p(
+ 			wpa_s, reply, max_len, ndef, 1);
+ 	}
++#endif /* CONFIG_P2P */
+ 
+ 	return -1;
+ }
+@@ -1160,6 +1168,7 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
+ 	struct wpabuf *req, *sel;
+ 	int ret;
+ 	char *pos, *role, *type, *pos2;
++#ifdef CONFIG_P2P
+ 	char *freq;
+ 	int forced_freq = 0;
+ 
+@@ -1169,6 +1178,7 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
+ 		freq += 6;
+ 		forced_freq = atoi(freq);
+ 	}
++#endif /* CONFIG_P2P */
+ 
+ 	role = cmd;
+ 	pos = os_strchr(role, ' ');
+@@ -1237,11 +1247,14 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
+ 
+ 	if (os_strcmp(role, "INIT") == 0 && os_strcmp(type, "WPS") == 0) {
+ 		ret = wpas_wps_nfc_report_handover(wpa_s, req, sel);
++#ifdef CONFIG_AP
+ 	} else if (os_strcmp(role, "RESP") == 0 && os_strcmp(type, "WPS") == 0)
+ 	{
+ 		ret = wpas_ap_wps_nfc_report_handover(wpa_s, req, sel);
+ 		if (ret < 0)
+ 			ret = wpas_er_wps_nfc_report_handover(wpa_s, req, sel);
++#endif /* CONFIG_AP */
++#ifdef CONFIG_P2P
+ 	} else if (os_strcmp(role, "INIT") == 0 && os_strcmp(type, "P2P") == 0)
+ 	{
+ 		ret = wpas_p2p_nfc_report_handover(wpa_s, 1, req, sel, 0);
+@@ -1249,6 +1262,7 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
+ 	{
+ 		ret = wpas_p2p_nfc_report_handover(wpa_s, 0, req, sel,
+ 						   forced_freq);
++#endif /* CONFIG_P2P */
+ 	} else {
+ 		wpa_printf(MSG_DEBUG, "NFC: Unsupported connection handover "
+ 			   "reported: role=%s type=%s", role, type);
+-- 
+1.8.3.2
+
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 3802033..9fcda2e 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -57,7 +57,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
-	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS_NFC
 endif
 
 # Try to use openssl if it's already available
-- 
1.8.3.2
