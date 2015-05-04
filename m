From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  4 May 2015 21:04:39 +0300
Subject: [Buildroot] [PATCH 1/2] hostapd: apply upstream security patches
Message-ID: <b4f58df743722b3573c4adf90495d3757aefaef0.1430762680.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds patches for three different upstream security advisories. No
CVE numbers stated.

http://w1.fi/security/2015-2/wps-upnp-http-chunked-transfer-encoding.txt
http://w1.fi/security/2015-3/integer-underflow-in-ap-mode-wmm-action-frame.txt
http://w1.fi/security/2015-4/eap-pwd-missing-payload-length-validation.txt

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...Fix-HTTP-chunked-transfer-encoding-parser.patch |  50 +++++++
 ...integer-underflow-in-WMM-Action-frame-par.patch |  42 ++++++
 package/hostapd/0003-EAP-pwd-fixes.patch           | 154 +++++++++++++++++++++
 3 files changed, 246 insertions(+)
 create mode 100644 package/hostapd/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
 create mode 100644 package/hostapd/0002-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
 create mode 100644 package/hostapd/0003-EAP-pwd-fixes.patch

diff --git a/package/hostapd/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch b/package/hostapd/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
new file mode 100644
index 000000000000..d9dccf911669
--- /dev/null
+++ b/package/hostapd/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
@@ -0,0 +1,50 @@
+From 5acd23f4581da58683f3cf5e36cb71bbe4070bd7 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Tue, 28 Apr 2015 17:08:33 +0300
+Subject: [PATCH] WPS: Fix HTTP chunked transfer encoding parser
+
+strtoul() return value may end up overflowing the int h->chunk_size and
+resulting in a negative value to be stored as the chunk_size. This could
+result in the following memcpy operation using a very large length
+argument which would result in a buffer overflow and segmentation fault.
+
+This could have been used to cause a denial service by any device that
+has been authorized for network access (either wireless or wired). This
+would affect both the WPS UPnP functionality in a WPS AP (hostapd with
+upnp_iface parameter set in the configuration) and WPS ER
+(wpa_supplicant with WPS_ER_START control interface command used).
+
+Validate the parsed chunk length value to avoid this. In addition to
+rejecting negative values, we can also reject chunk size that would be
+larger than the maximum configured body length.
+
+Thanks to Kostya Kortchinsky of Google security team for discovering and
+reporting this issue.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/wps/httpread.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/wps/httpread.c b/src/wps/httpread.c
+index 2f08f37275c0..d2855e32fd0f 100644
+--- a/src/wps/httpread.c
++++ b/src/wps/httpread.c
+@@ -533,6 +533,13 @@ static void httpread_read_handler(int sd, void *eloop_ctx, void *sock_ctx)
+ 					if (!isxdigit(*cbp))
+ 						goto bad;
+ 					h->chunk_size = strtoul(cbp, NULL, 16);
++					if (h->chunk_size < 0 ||
++					    h->chunk_size > h->max_bytes) {
++						wpa_printf(MSG_DEBUG,
++							   "httpread: Invalid chunk size %d",
++							   h->chunk_size);
++						goto bad;
++					}
+ 					/* throw away chunk header
+ 					 * so we have only real data
+ 					 */
+-- 
+2.1.4
+
diff --git a/package/hostapd/0002-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch b/package/hostapd/0002-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
new file mode 100644
index 000000000000..307297b9e3c9
--- /dev/null
+++ b/package/hostapd/0002-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
@@ -0,0 +1,42 @@
+From ef566a4d4f74022e1fdb0a2addfe81e6de9f4aae Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Wed, 29 Apr 2015 02:21:53 +0300
+Subject: [PATCH] AP WMM: Fix integer underflow in WMM Action frame parser
+
+The length of the WMM Action frame was not properly validated and the
+length of the information elements (int left) could end up being
+negative. This would result in reading significantly past the stack
+buffer while parsing the IEs in ieee802_11_parse_elems() and while doing
+so, resulting in segmentation fault.
+
+This can result in an invalid frame being used for a denial of service
+attack (hostapd process killed) against an AP with a driver that uses
+hostapd for management frame processing (e.g., all mac80211-based
+drivers).
+
+Thanks to Kostya Kortchinsky of Google security team for discovering and
+reporting this issue.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/ap/wmm.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/ap/wmm.c b/src/ap/wmm.c
+index 6d4177c2a847..314e244bc956 100644
+--- a/src/ap/wmm.c
++++ b/src/ap/wmm.c
+@@ -274,6 +274,9 @@ void hostapd_wmm_action(struct hostapd_data *hapd,
+ 		return;
+ 	}
+ 
++	if (left < 0)
++		return; /* not a valid WMM Action frame */
++
+ 	/* extract the tspec info element */
+ 	if (ieee802_11_parse_elems(pos, left, &elems, 1) == ParseFailed) {
+ 		hostapd_logger(hapd, mgmt->sa, HOSTAPD_MODULE_IEEE80211,
+-- 
+2.1.4
+
diff --git a/package/hostapd/0003-EAP-pwd-fixes.patch b/package/hostapd/0003-EAP-pwd-fixes.patch
new file mode 100644
index 000000000000..16a1f5398833
--- /dev/null
+++ b/package/hostapd/0003-EAP-pwd-fixes.patch
@@ -0,0 +1,154 @@
+This patch combines the following upstream security fixes:
+
+28a069a545b0 EAP-pwd peer: Fix asymmetric fragmentation behavior
+3035cc2894e0 EAP-pwd server: Fix Total-Length parsing for fragment reassembly
+477c74395acd EAP-pwd peer: Fix Total-Length parsing for fragment reassembly
+e28a58be2618 EAP-pwd server: Fix payload length validation for Commit and Confirm
+dd2f043c9c43 EAP-pwd peer: Fix payload length validation for Commit and Confirm
+
+Details at 
+http://w1.fi/security/2015-4/eap-pwd-missing-payload-length-validation.txt
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
+index f2b092669a42..e58b13a42f73 100644
+--- a/src/eap_peer/eap_pwd.c
++++ b/src/eap_peer/eap_pwd.c
+@@ -355,6 +355,23 @@ eap_pwd_perform_commit_exchange(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	BIGNUM *mask = NULL, *x = NULL, *y = NULL, *cofactor = NULL;
+ 	u16 offset;
+ 	u8 *ptr, *scalar = NULL, *element = NULL;
++	size_t prime_len, order_len;
++
++	if (data->state != PWD_Commit_Req) {
++		ret->ignore = TRUE;
++		goto fin;
++	}
++
++	prime_len = BN_num_bytes(data->grp->prime);
++	order_len = BN_num_bytes(data->grp->order);
++
++	if (payload_len != 2 * prime_len + order_len) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Commit payload length %u (expected %u)",
++			   (unsigned int) payload_len,
++			   (unsigned int) (2 * prime_len + order_len));
++		goto fin;
++	}
+ 
+ 	if (((data->private_value = BN_new()) == NULL) ||
+ 	    ((data->my_element = EC_POINT_new(data->grp->group)) == NULL) ||
+@@ -554,6 +571,18 @@ eap_pwd_perform_confirm_exchange(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	u8 conf[SHA256_MAC_LEN], *cruft = NULL, *ptr;
+ 	int offset;
+ 
++	if (data->state != PWD_Confirm_Req) {
++		ret->ignore = TRUE;
++		goto fin;
++	}
++
++	if (payload_len != SHA256_MAC_LEN) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Confirm payload length %u (expected %u)",
++			   (unsigned int) payload_len, SHA256_MAC_LEN);
++		goto fin;
++	}
++
+ 	/*
+ 	 * first build up the ciphersuite which is group | random_function |
+ 	 *	prf
+@@ -837,11 +866,23 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
+ 	 * if it's the first fragment there'll be a length field
+ 	 */
+ 	if (EAP_PWD_GET_LENGTH_BIT(lm_exch)) {
++		if (len < 2) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Frame too short to contain Total-Length field");
++			ret->ignore = TRUE;
++			return NULL;
++		}
+ 		tot_len = WPA_GET_BE16(pos);
+ 		wpa_printf(MSG_DEBUG, "EAP-pwd: Incoming fragments whose "
+ 			   "total length = %d", tot_len);
+ 		if (tot_len > 15000)
+ 			return NULL;
++		if (data->inbuf) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Unexpected new fragment start when previous fragment is still in use");
++			ret->ignore = TRUE;
++			return NULL;
++		}
+ 		data->inbuf = wpabuf_alloc(tot_len);
+ 		if (data->inbuf == NULL) {
+ 			wpa_printf(MSG_INFO, "Out of memory to buffer "
+@@ -927,6 +968,7 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
+ 	/*
+ 	 * we have output! Do we need to fragment it?
+ 	 */
++	lm_exch = EAP_PWD_GET_EXCHANGE(lm_exch);
+ 	len = wpabuf_len(data->outbuf);
+ 	if ((len + EAP_PWD_HDR_SIZE) > data->mtu) {
+ 		resp = eap_msg_alloc(EAP_VENDOR_IETF, EAP_TYPE_PWD, data->mtu,
+diff --git a/src/eap_server/eap_server_pwd.c b/src/eap_server/eap_server_pwd.c
+index 66bd5d2e9179..2bfc3c27647d 100644
+--- a/src/eap_server/eap_server_pwd.c
++++ b/src/eap_server/eap_server_pwd.c
+@@ -656,9 +656,21 @@ eap_pwd_process_commit_resp(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	BIGNUM *x = NULL, *y = NULL, *cofactor = NULL;
+ 	EC_POINT *K = NULL, *point = NULL;
+ 	int res = 0;
++	size_t prime_len, order_len;
+ 
+ 	wpa_printf(MSG_DEBUG, "EAP-pwd: Received commit response");
+ 
++	prime_len = BN_num_bytes(data->grp->prime);
++	order_len = BN_num_bytes(data->grp->order);
++
++	if (payload_len != 2 * prime_len + order_len) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Commit payload length %u (expected %u)",
++			   (unsigned int) payload_len,
++			   (unsigned int) (2 * prime_len + order_len));
++		goto fin;
++	}
++
+ 	if (((data->peer_scalar = BN_new()) == NULL) ||
+ 	    ((data->k = BN_new()) == NULL) ||
+ 	    ((cofactor = BN_new()) == NULL) ||
+@@ -774,6 +786,13 @@ eap_pwd_process_confirm_resp(struct eap_sm *sm, struct eap_pwd_data *data,
+ 	u8 conf[SHA256_MAC_LEN], *cruft = NULL, *ptr;
+ 	int offset;
+ 
++	if (payload_len != SHA256_MAC_LEN) {
++		wpa_printf(MSG_INFO,
++			   "EAP-pwd: Unexpected Confirm payload length %u (expected %u)",
++			   (unsigned int) payload_len, SHA256_MAC_LEN);
++		goto fin;
++	}
++
+ 	/* build up the ciphersuite: group | random_function | prf */
+ 	grp = htons(data->group_num);
+ 	ptr = (u8 *) &cs;
+@@ -923,11 +942,21 @@ static void eap_pwd_process(struct eap_sm *sm, void *priv,
+ 	 * the first fragment has a total length
+ 	 */
+ 	if (EAP_PWD_GET_LENGTH_BIT(lm_exch)) {
++		if (len < 2) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Frame too short to contain Total-Length field");
++			return;
++		}
+ 		tot_len = WPA_GET_BE16(pos);
+ 		wpa_printf(MSG_DEBUG, "EAP-pwd: Incoming fragments, total "
+ 			   "length = %d", tot_len);
+ 		if (tot_len > 15000)
+ 			return;
++		if (data->inbuf) {
++			wpa_printf(MSG_DEBUG,
++				   "EAP-pwd: Unexpected new fragment start when previous fragment is still in use");
++			return;
++		}
+ 		data->inbuf = wpabuf_alloc(tot_len);
+ 		if (data->inbuf == NULL) {
+ 			wpa_printf(MSG_INFO, "EAP-pwd: Out of memory to "
-- 
2.1.4
