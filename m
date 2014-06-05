From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Jun 2014 21:23:37 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: bump to version 2.2
Message-ID: <20140605201506.9D06799C9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad92b26df746ef1d9a78e75c6ac8e8557211cf0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are now upstream.

Enable epoll support since any modern kernel/toolchain supports it.

Interworking requires Hotspot functionality which we didn't enable
before so introduce a new option for them.

While at it group and sort the options in a more lean and friendly way.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/Config.in                   |   44 ++++---
 ...NFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch |  121 --------------------
 ...nternal-TLS-X.509-validation-of-PKCS-1-si.patch |   38 ------
 ...w-only-BT-01-for-signature-in-internal-TL.patch |   67 -----------
 ...rce-minimum-padding-for-decryption-in-int.patch |   35 ------
 package/wpa_supplicant/wpa_supplicant.mk           |    9 +-
 6 files changed, 32 insertions(+), 282 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 74145f1..5cb3f1b 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -7,11 +7,35 @@ config BR2_PACKAGE_WPA_SUPPLICANT
 
 if BR2_PACKAGE_WPA_SUPPLICANT
 
+config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	bool "Enable AP mode"
+	help
+	  With this option enabled, wpa_supplicant can act as an
+	  access point much like hostapd does with a limited feature set.
+	  This links in parts of hostapd functionality into wpa_supplicant,
+	  making it bigger but dispensing the need for a separate hostapd
+	  binary in some applications hence being smaller overall.
+
 config BR2_PACKAGE_WPA_SUPPLICANT_EAP
 	bool "Enable EAP"
 	help
 	  Enable support for EAP.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
+	bool "Enable HS20"
+	help
+	  Enable Hotspot 2.0 and IEEE 802.11u interworking functionality.
+
+config BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG
+        bool "Enable syslog support"
+	help
+	  Enable support for sending debug messages to syslog.
+
+config BR2_PACKAGE_WPA_SUPPLICANT_WPS
+	bool "Enable WPS"
+	help
+	  Enable support for Wi-Fi Protected Setup (WPS).
+
 config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 	bool "Install wpa_cli binary"
 	help
@@ -20,15 +44,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_CLI
 config BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE
 	bool "Install wpa_passphrase binary"
 	help
-	  Install wpa_passphrase command line utility
-
-config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
-	bool "Enable support for soft AP"
-	help
-	  With this option enabled, wpa_supplicant can act as
-	  access point. This can be used for open and WPA2-Personal networks
-	  (optionally, with WPS); this links in parts of hostapd functionality
-	  into wpa_supplicant.
+	  Install wpa_passphrase command line utility.
 
 config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD
 	bool "Enable support for old DBus control interface"
@@ -49,14 +65,4 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for new DBus control interface.
 
-config BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG
-	bool "Enable syslog support"
-	help
-	  Enable support for sending debug messages to syslog
-
-config BR2_PACKAGE_WPA_SUPPLICANT_WPS
-	bool "Enable support for WPS"
-	help
-	  Enable support for Wi-Fi Protected Setup (WPS)
-
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch b/package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch
deleted file mode 100644
index 946011c..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0001-Fix-CONFIG_WPS_NFC-y-build-without-CONFIG_P2P-y.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 88853aedf6cc4a152442b5bb2c4946683df6ff66 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Thu, 13 Feb 2014 15:29:09 +0200
-Subject: [PATCH] Fix CONFIG_WPS_NFC=y build without CONFIG_P2P=y
-
-Some of the control interface operations for P2P were not properly
-protected with #ifdef CONFIG_P2P.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- wpa_supplicant/ctrl_iface.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/wpa_supplicant/ctrl_iface.c b/wpa_supplicant/ctrl_iface.c
-index ddddad3..ed332da 100644
---- a/wpa_supplicant/ctrl_iface.c
-+++ b/wpa_supplicant/ctrl_iface.c
-@@ -951,6 +951,7 @@ static int wpas_ctrl_nfc_get_handover_req_wps(struct wpa_supplicant *wpa_s,
- }
- 
- 
-+#ifdef CONFIG_P2P
- static int wpas_ctrl_nfc_get_handover_req_p2p(struct wpa_supplicant *wpa_s,
- 					      char *reply, size_t max_len,
- 					      int ndef)
-@@ -973,6 +974,7 @@ static int wpas_ctrl_nfc_get_handover_req_p2p(struct wpa_supplicant *wpa_s,
- 
- 	return res;
- }
-+#endif /* CONFIG_P2P */
- 
- 
- static int wpas_ctrl_nfc_get_handover_req(struct wpa_supplicant *wpa_s,
-@@ -1001,10 +1003,12 @@ static int wpas_ctrl_nfc_get_handover_req(struct wpa_supplicant *wpa_s,
- 			wpa_s, reply, max_len, ndef);
- 	}
- 
-+#ifdef CONFIG_P2P
- 	if (os_strcmp(pos, "P2P-CR") == 0) {
- 		return wpas_ctrl_nfc_get_handover_req_p2p(
- 			wpa_s, reply, max_len, ndef);
- 	}
-+#endif /* CONFIG_P2P */
- 
- 	return -1;
- }
-@@ -1032,6 +1036,7 @@ static int wpas_ctrl_nfc_get_handover_sel_wps(struct wpa_supplicant *wpa_s,
- }
- 
- 
-+#ifdef CONFIG_P2P
- static int wpas_ctrl_nfc_get_handover_sel_p2p(struct wpa_supplicant *wpa_s,
- 					      char *reply, size_t max_len,
- 					      int ndef, int tag)
-@@ -1052,6 +1057,7 @@ static int wpas_ctrl_nfc_get_handover_sel_p2p(struct wpa_supplicant *wpa_s,
- 
- 	return res;
- }
-+#endif /* CONFIG_P2P */
- 
- 
- static int wpas_ctrl_nfc_get_handover_sel(struct wpa_supplicant *wpa_s,
-@@ -1084,6 +1090,7 @@ static int wpas_ctrl_nfc_get_handover_sel(struct wpa_supplicant *wpa_s,
- 			os_strcmp(pos, "WPS-CR") == 0, pos2);
- 	}
- 
-+#ifdef CONFIG_P2P
- 	if (os_strcmp(pos, "P2P-CR") == 0) {
- 		return wpas_ctrl_nfc_get_handover_sel_p2p(
- 			wpa_s, reply, max_len, ndef, 0);
-@@ -1093,6 +1100,7 @@ static int wpas_ctrl_nfc_get_handover_sel(struct wpa_supplicant *wpa_s,
- 		return wpas_ctrl_nfc_get_handover_sel_p2p(
- 			wpa_s, reply, max_len, ndef, 1);
- 	}
-+#endif /* CONFIG_P2P */
- 
- 	return -1;
- }
-@@ -1160,6 +1168,7 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
- 	struct wpabuf *req, *sel;
- 	int ret;
- 	char *pos, *role, *type, *pos2;
-+#ifdef CONFIG_P2P
- 	char *freq;
- 	int forced_freq = 0;
- 
-@@ -1169,6 +1178,7 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
- 		freq += 6;
- 		forced_freq = atoi(freq);
- 	}
-+#endif /* CONFIG_P2P */
- 
- 	role = cmd;
- 	pos = os_strchr(role, ' ');
-@@ -1237,11 +1247,14 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
- 
- 	if (os_strcmp(role, "INIT") == 0 && os_strcmp(type, "WPS") == 0) {
- 		ret = wpas_wps_nfc_report_handover(wpa_s, req, sel);
-+#ifdef CONFIG_AP
- 	} else if (os_strcmp(role, "RESP") == 0 && os_strcmp(type, "WPS") == 0)
- 	{
- 		ret = wpas_ap_wps_nfc_report_handover(wpa_s, req, sel);
- 		if (ret < 0)
- 			ret = wpas_er_wps_nfc_report_handover(wpa_s, req, sel);
-+#endif /* CONFIG_AP */
-+#ifdef CONFIG_P2P
- 	} else if (os_strcmp(role, "INIT") == 0 && os_strcmp(type, "P2P") == 0)
- 	{
- 		ret = wpas_p2p_nfc_report_handover(wpa_s, 1, req, sel, 0);
-@@ -1249,6 +1262,7 @@ static int wpas_ctrl_nfc_report_handover(struct wpa_supplicant *wpa_s,
- 	{
- 		ret = wpas_p2p_nfc_report_handover(wpa_s, 0, req, sel,
- 						   forced_freq);
-+#endif /* CONFIG_P2P */
- 	} else {
- 		wpa_printf(MSG_DEBUG, "NFC: Unsupported connection handover "
- 			   "reported: role=%s type=%s", role, type);
--- 
-1.8.3.2
-
diff --git a/package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch b/package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch
deleted file mode 100644
index 5a5b0c3..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9c29d48725fd40a82407a89f193cf009aeef9745 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Mon, 19 May 2014 23:25:38 +0300
-Subject: [PATCH] X.509: Fix internal TLS/X.509 validation of PKCS#1
- signature
-
-Verify that there is no extra data after the hash field. This is needed
-to avoid potential attacks using additional data to construct a value
-that passes the RSA operation and allows the hash value to be forged.
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
----
- src/tls/x509v3.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
-index a9483cb7fc2f..751a268e1caf 100644
---- a/src/tls/x509v3.c
-+++ b/src/tls/x509v3.c
-@@ -1783,6 +1783,15 @@ skip_digest_oid:
- 		return -1;
- 	}
- 
-+	if (hdr.payload + hdr.length < data + data_len) {
-+		wpa_hexdump(MSG_INFO,
-+			    "X509: Extra data after certificate signature hash",
-+			    hdr.payload + hdr.length,
-+			    data + data_len - hdr.payload - hdr.length);
-+		os_free(data);
-+		return -1;
-+	}
-+
- 	os_free(data);
- 
- 	wpa_printf(MSG_DEBUG, "X509: Certificate Digest matches with "
--- 
-2.0.0.rc2
-
diff --git a/package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch b/package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch
deleted file mode 100644
index 57d752d..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From e6d83cc7babb978ba53ae8686159b41ab0f448cc Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Mon, 19 May 2014 23:26:19 +0300
-Subject: [PATCH] PKCS #1: Allow only BT=01 for signature in internal TLS
-
-Based on PKCS #1, v1.5, 10.1.3, the block type shall be 01 for a
-signature. This avoids a potential attack vector for internal TLS/X.509
-implementation.
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
----
- src/tls/pkcs1.c | 29 ++++++++++-------------------
- 1 file changed, 10 insertions(+), 19 deletions(-)
-
-diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
-index b6fde5ee868a..af58a42987c6 100644
---- a/src/tls/pkcs1.c
-+++ b/src/tls/pkcs1.c
-@@ -142,35 +142,26 @@ int pkcs1_decrypt_public_key(struct crypto_rsa_key *key,
- 	 * BT = 00 or 01
- 	 * PS = k-3-||D|| times (00 if BT=00) or (FF if BT=01)
- 	 * k = length of modulus in octets
-+	 *
-+	 * Based on 10.1.3, "The block type shall be 01" for a signature.
- 	 */
- 
- 	if (len < 3 + 8 + 16 /* min hash len */ ||
--	    plain[0] != 0x00 || (plain[1] != 0x00 && plain[1] != 0x01)) {
-+	    plain[0] != 0x00 || plain[1] != 0x01) {
- 		wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature EB "
- 			   "structure");
- 		return -1;
- 	}
- 
- 	pos = plain + 3;
--	if (plain[1] == 0x00) {
--		/* BT = 00 */
--		if (plain[2] != 0x00) {
--			wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature "
--				   "PS (BT=00)");
--			return -1;
--		}
--		while (pos + 1 < plain + len && *pos == 0x00 && pos[1] == 0x00)
--			pos++;
--	} else {
--		/* BT = 01 */
--		if (plain[2] != 0xff) {
--			wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature "
--				   "PS (BT=01)");
--			return -1;
--		}
--		while (pos < plain + len && *pos == 0xff)
--			pos++;
-+	/* BT = 01 */
-+	if (plain[2] != 0xff) {
-+		wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature "
-+			   "PS (BT=01)");
-+		return -1;
- 	}
-+	while (pos < plain + len && *pos == 0xff)
-+		pos++;
- 
- 	if (pos - plain - 2 < 8) {
- 		/* PKCS #1 v1.5, 8.1: At least eight octets long PS */
--- 
-2.0.0.rc2
-
diff --git a/package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch b/package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch
deleted file mode 100644
index 7862de7..0000000
--- a/package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6c5be116dd6997f68e524247751cff53c74519d7 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Mon, 19 May 2014 23:26:43 +0300
-Subject: [PATCH] PKCS #1: Enforce minimum padding for decryption in
- internal TLS
-
-Follow the PKCS #1 v1.5, 8.1 constraint of at least eight octets long PS
-for the case where the internal TLS implementation decrypts PKCS #1
-formatted data. Similar limit was already in place for signature
-validation, but not for this decryption routine.
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
----
- src/tls/pkcs1.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
-index af58a42987c6..ea3e6171a1d1 100644
---- a/src/tls/pkcs1.c
-+++ b/src/tls/pkcs1.c
-@@ -113,6 +113,11 @@ int pkcs1_v15_private_key_decrypt(struct crypto_rsa_key *key,
- 		pos++;
- 	if (pos == end)
- 		return -1;
-+	if (pos - out - 2 < 8) {
-+		/* PKCS #1 v1.5, 8.1: At least eight octets long PS */
-+		wpa_printf(MSG_INFO, "LibTomCrypt: Too short padding");
-+		return -1;
-+	}
- 	pos++;
- 
- 	*outlen -= pos - out;
--- 
-2.0.0.rc2
-
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9321f08..2df4f5e 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPA_SUPPLICANT_VERSION = 2.1
+WPA_SUPPLICANT_VERSION = 2.2
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
 WPA_SUPPLICANT_LICENSE_FILES = README
@@ -20,10 +20,10 @@ WPA_SUPPLICANT_CONFIG_EDITS =
 WPA_SUPPLICANT_CONFIG_SET =
 
 WPA_SUPPLICANT_CONFIG_ENABLE = \
+	CONFIG_ELOOP_EPOLL	\
 	CONFIG_IEEE80211AC	\
 	CONFIG_IEEE80211N	\
 	CONFIG_IEEE80211R	\
-	CONFIG_INTERWORKING	\
 	CONFIG_INTERNAL_LIBTOMMATH
 
 WPA_SUPPLICANT_CONFIG_DISABLE = \
@@ -49,6 +49,11 @@ else
 	WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT),y)
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_HS20 \
+		CONFIG_INTERWORKING
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
 	WPA_SUPPLICANT_CONFIG_ENABLE += \
 		CONFIG_AP \
