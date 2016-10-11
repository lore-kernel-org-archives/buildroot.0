From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 11 Oct 2016 21:05:08 +0200
Subject: [Buildroot] [PATCH] package/hostapd: bump to version 2.6
Message-ID: <20161011190508.2207-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all patches as they are applied to or were fetched from upstream.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...-peer-Fix-last-fragment-length-validation.patch | 54 --------------
 ...erver-Fix-last-fragment-length-validation.patch | 51 -------------
 .../hostapd/0003-vlan-fix-musl-build-error.patch   | 60 ---------------
 ...sl-libc-conflict-with-Linux-kernel-header.patch | 60 ---------------
 ...ject-a-Credential-with-invalid-passphrase.patch | 85 ----------------------
 package/hostapd/hostapd.hash                       |  2 +-
 package/hostapd/hostapd.mk                         |  2 +-
 7 files changed, 2 insertions(+), 312 deletions(-)
 delete mode 100644 package/hostapd/0001-EAP-pwd-peer-Fix-last-fragment-length-validation.patch
 delete mode 100644 package/hostapd/0002-EAP-pwd-server-Fix-last-fragment-length-validation.patch
 delete mode 100644 package/hostapd/0003-vlan-fix-musl-build-error.patch
 delete mode 100644 package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch
 delete mode 100644 package/hostapd/0005-WPS-Reject-a-Credential-with-invalid-passphrase.patch

diff --git a/package/hostapd/0001-EAP-pwd-peer-Fix-last-fragment-length-validation.patch b/package/hostapd/0001-EAP-pwd-peer-Fix-last-fragment-length-validation.patch
deleted file mode 100644
index 82c2639..0000000
--- a/package/hostapd/0001-EAP-pwd-peer-Fix-last-fragment-length-validation.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8057821706784608b828e769ccefbced95591e50 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sun, 1 Nov 2015 18:18:17 +0200
-Subject: [PATCH] EAP-pwd peer: Fix last fragment length validation
-
-All but the last fragment had their length checked against the remaining
-room in the reassembly buffer. This allowed a suitably constructed last
-fragment frame to try to add extra data that would go beyond the buffer.
-The length validation code in wpabuf_put_data() prevents an actual
-buffer write overflow from occurring, but this results in process
-termination. (CVE-2015-5315)
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_peer/eap_pwd.c | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/src/eap_peer/eap_pwd.c b/src/eap_peer/eap_pwd.c
-index 1f78544..75ceef1 100644
---- a/src/eap_peer/eap_pwd.c
-+++ b/src/eap_peer/eap_pwd.c
-@@ -903,7 +903,7 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
- 	/*
- 	 * buffer and ACK the fragment
- 	 */
--	if (EAP_PWD_GET_MORE_BIT(lm_exch)) {
-+	if (EAP_PWD_GET_MORE_BIT(lm_exch) || data->in_frag_pos) {
- 		data->in_frag_pos += len;
- 		if (data->in_frag_pos > wpabuf_size(data->inbuf)) {
- 			wpa_printf(MSG_INFO, "EAP-pwd: Buffer overflow attack "
-@@ -916,7 +916,8 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
- 			return NULL;
- 		}
- 		wpabuf_put_data(data->inbuf, pos, len);
--
-+	}
-+	if (EAP_PWD_GET_MORE_BIT(lm_exch)) {
- 		resp = eap_msg_alloc(EAP_VENDOR_IETF, EAP_TYPE_PWD,
- 				     EAP_PWD_HDR_SIZE,
- 				     EAP_CODE_RESPONSE, eap_get_id(reqData));
-@@ -930,10 +931,8 @@ eap_pwd_process(struct eap_sm *sm, void *priv, struct eap_method_ret *ret,
- 	 * we're buffering and this is the last fragment
- 	 */
- 	if (data->in_frag_pos) {
--		wpabuf_put_data(data->inbuf, pos, len);
- 		wpa_printf(MSG_DEBUG, "EAP-pwd: Last fragment, %d bytes",
- 			   (int) len);
--		data->in_frag_pos += len;
- 		pos = wpabuf_head_u8(data->inbuf);
- 		len = data->in_frag_pos;
- 	}
--- 
-1.9.1
-
diff --git a/package/hostapd/0002-EAP-pwd-server-Fix-last-fragment-length-validation.patch b/package/hostapd/0002-EAP-pwd-server-Fix-last-fragment-length-validation.patch
deleted file mode 100644
index bfc4c74..0000000
--- a/package/hostapd/0002-EAP-pwd-server-Fix-last-fragment-length-validation.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From bef802ece03f9ae9d52a21f0cf4f1bc2c5a1f8aa Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sun, 1 Nov 2015 18:24:16 +0200
-Subject: [PATCH] EAP-pwd server: Fix last fragment length validation
-
-All but the last fragment had their length checked against the remaining
-room in the reassembly buffer. This allowed a suitably constructed last
-fragment frame to try to add extra data that would go beyond the buffer.
-The length validation code in wpabuf_put_data() prevents an actual
-buffer write overflow from occurring, but this results in process
-termination. (CVE-2015-5314)
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/eap_server/eap_server_pwd.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/eap_server/eap_server_pwd.c b/src/eap_server/eap_server_pwd.c
-index cb83ff7..9f787ab 100644
---- a/src/eap_server/eap_server_pwd.c
-+++ b/src/eap_server/eap_server_pwd.c
-@@ -970,7 +970,7 @@ static void eap_pwd_process(struct eap_sm *sm, void *priv,
- 	/*
- 	 * the first and all intermediate fragments have the M bit set
- 	 */
--	if (EAP_PWD_GET_MORE_BIT(lm_exch)) {
-+	if (EAP_PWD_GET_MORE_BIT(lm_exch) || data->in_frag_pos) {
- 		if ((data->in_frag_pos + len) > wpabuf_size(data->inbuf)) {
- 			wpa_printf(MSG_DEBUG, "EAP-pwd: Buffer overflow "
- 				   "attack detected! (%d+%d > %d)",
-@@ -981,6 +981,8 @@ static void eap_pwd_process(struct eap_sm *sm, void *priv,
- 		}
- 		wpabuf_put_data(data->inbuf, pos, len);
- 		data->in_frag_pos += len;
-+	}
-+	if (EAP_PWD_GET_MORE_BIT(lm_exch)) {
- 		wpa_printf(MSG_DEBUG, "EAP-pwd: Got a %d byte fragment",
- 			   (int) len);
- 		return;
-@@ -990,8 +992,6 @@ static void eap_pwd_process(struct eap_sm *sm, void *priv,
- 	 * buffering fragments so that's how we know it's the last)
- 	 */
- 	if (data->in_frag_pos) {
--		wpabuf_put_data(data->inbuf, pos, len);
--		data->in_frag_pos += len;
- 		pos = wpabuf_head_u8(data->inbuf);
- 		len = data->in_frag_pos;
- 		wpa_printf(MSG_DEBUG, "EAP-pwd: Last fragment, %d bytes",
--- 
-1.9.1
-
diff --git a/package/hostapd/0003-vlan-fix-musl-build-error.patch b/package/hostapd/0003-vlan-fix-musl-build-error.patch
deleted file mode 100644
index da1ffcb..0000000
--- a/package/hostapd/0003-vlan-fix-musl-build-error.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 67ba6ed9871b2cab16eeee93818f05d9c49ccbab Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 8 Mar 2016 12:05:01 +0100
-Subject: [PATCH] vlan: fix musl build error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-caddr_t is legacy BSD and should be avoided [1].
-
-This fixes compile errors with the musl libc:
-
-../src/ap/vlan_init.c: In function 'br_delif':
-../src/ap/vlan_init.c:218:18: error: '__caddr_t' undeclared (first use in this function)
-  ifr.ifr_data = (__caddr_t) args;
-
-Upstream status: Pending [2]
-
-[1] http://stackoverflow.com/questions/6381526/what-is-the-significance-of-caddr-t-and-when-is-it-used
-[2] http://lists.infradead.org/pipermail/hostap/2016-March/035350.html
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/ap/vlan_init.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/ap/vlan_init.c b/src/ap/vlan_init.c
-index fd1c8dd..1670c0d 100644
---- a/src/ap/vlan_init.c
-+++ b/src/ap/vlan_init.c
-@@ -215,7 +215,7 @@ static int br_delif(const char *br_name, const char *if_name)
- 	args[1] = if_index;
- 
- 	os_strlcpy(ifr.ifr_name, br_name, sizeof(ifr.ifr_name));
--	ifr.ifr_data = (__caddr_t) args;
-+	ifr.ifr_data = (void *) args;
- 
- 	if (ioctl(fd, SIOCDEVPRIVATE, &ifr) < 0 && errno != EINVAL) {
- 		/* No error if interface already removed. */
-@@ -266,7 +266,7 @@ static int br_addif(const char *br_name, const char *if_name)
- 	args[1] = if_index;
- 
- 	os_strlcpy(ifr.ifr_name, br_name, sizeof(ifr.ifr_name));
--	ifr.ifr_data = (__caddr_t) args;
-+	ifr.ifr_data = (void *) args;
- 
- 	if (ioctl(fd, SIOCDEVPRIVATE, &ifr) < 0) {
- 		if (errno == EBUSY) {
-@@ -394,7 +394,7 @@ static int br_getnumports(const char *br_name)
- 
- 	os_memset(ifindices, 0, sizeof(ifindices));
- 	os_strlcpy(ifr.ifr_name, br_name, sizeof(ifr.ifr_name));
--	ifr.ifr_data = (__caddr_t) arg;
-+	ifr.ifr_data = (void *) arg;
- 
- 	if (ioctl(fd, SIOCDEVPRIVATE, &ifr) < 0) {
- 		wpa_printf(MSG_ERROR, "VLAN: %s: BRCTL_GET_PORT_LIST "
--- 
-2.7.2
-
diff --git a/package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch b/package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch
deleted file mode 100644
index 3e753d6..0000000
--- a/package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 71a517e922c91e2c6cad28d339a081b5f6de0932 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 8 Mar 2016 21:07:12 +0100
-Subject: [PATCH] vlan: fix musl libc conflict with Linux kernel headers
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Due to both <netinet/in.h> (in "utils/includes.h") and <linux/in6.h> (in
-<linux/if_bridge.h>) being included, the in6_addr is being redefined: once from
-the C library headers and once from the Linux kernel headers. This causes some
-build failures with for example the musl C library:
-
-In file included from /usr/include/linux/if_bridge.h:18,
-                 from ../src/ap/vlan_init.c:17:
-/usr/include/linux/in6.h:32: error: redefinition of 'struct in6_addr'
-/usr/include/linux/in6.h:49: error: redefinition of 'struct sockaddr_in6'
-/usr/include/linux/in6.h:59: error: redefinition of 'struct ipv6_mreq'
-
-Mixing C library and Linux kernel headers is a bit problematic [1] and should be
-avoided if possible [2]. In order to fix this, define just the macros needed
-from <linux/if_bridge.h> as done in Busybox for the brctl applet [3].
-
-Upstream status: Pending [4]
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=15850
-[2] http://www.openwall.com/lists/musl/2015/10/06/1
-[3] https://git.busybox.net/busybox/commit/?id=5fa6d1a632505789409a2ba6cf8e112529f9db18
-[4] http://lists.infradead.org/pipermail/hostap/2016-March/035357.html
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/ap/vlan_init.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/src/ap/vlan_init.c b/src/ap/vlan_init.c
-index 1670c0d..f2e3da0 100644
---- a/src/ap/vlan_init.c
-+++ b/src/ap/vlan_init.c
-@@ -14,7 +14,16 @@
- #include <sys/ioctl.h>
- #include <linux/sockios.h>
- #include <linux/if_vlan.h>
--#include <linux/if_bridge.h>
-+/* From <linux/if_bridge.h> */
-+#define BRCTL_GET_VERSION 0
-+#define BRCTL_GET_BRIDGES 1
-+#define BRCTL_ADD_BRIDGE 2
-+#define BRCTL_DEL_BRIDGE 3
-+#define BRCTL_ADD_IF 4
-+#define BRCTL_DEL_IF 5
-+#define BRCTL_GET_BRIDGE_INFO 6
-+#define BRCTL_GET_PORT_LIST 7
-+#define BRCTL_SET_BRIDGE_FORWARD_DELAY 8
- #endif /* CONFIG_FULL_DYNAMIC_VLAN */
- 
- #include "utils/common.h"
--- 
-2.7.2
-
diff --git a/package/hostapd/0005-WPS-Reject-a-Credential-with-invalid-passphrase.patch b/package/hostapd/0005-WPS-Reject-a-Credential-with-invalid-passphrase.patch
deleted file mode 100644
index 282aa95..0000000
--- a/package/hostapd/0005-WPS-Reject-a-Credential-with-invalid-passphrase.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From ecbb0b3dc122b0d290987cf9c84010bbe53e1022 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Fri, 4 Mar 2016 17:20:18 +0200
-Subject: [PATCH] WPS: Reject a Credential with invalid passphrase
-
-WPA/WPA2-Personal passphrase is not allowed to include control
-characters. Reject a Credential received from a WPS Registrar both as
-STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or
-WPA2PSK authentication type and includes an invalid passphrase.
-
-This fixes an issue where hostapd or wpa_supplicant could have updated
-the configuration file PSK/passphrase parameter with arbitrary data from
-an external device (Registrar) that may not be fully trusted. Should
-such data include a newline character, the resulting configuration file
-could become invalid and fail to be parsed.
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream (ecbb0b3dc122b0d290987cf9c84010bbe53e1022)
-
- src/utils/common.c         | 12 ++++++++++++
- src/utils/common.h         |  1 +
- src/wps/wps_attr_process.c | 10 ++++++++++
- 3 files changed, 23 insertions(+)
-
-diff --git a/src/utils/common.c b/src/utils/common.c
-index 450e2c6519ba..27b7c02de10b 100644
---- a/src/utils/common.c
-+++ b/src/utils/common.c
-@@ -697,6 +697,18 @@ int is_hex(const u8 *data, size_t len)
- }
- 
- 
-+int has_ctrl_char(const u8 *data, size_t len)
-+{
-+	size_t i;
-+
-+	for (i = 0; i < len; i++) {
-+		if (data[i] < 32 || data[i] == 127)
-+			return 1;
-+	}
-+	return 0;
-+}
-+
-+
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len)
-diff --git a/src/utils/common.h b/src/utils/common.h
-index 701dbb236ed5..a97224070385 100644
---- a/src/utils/common.h
-+++ b/src/utils/common.h
-@@ -488,6 +488,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
- 
- char * wpa_config_parse_string(const char *value, size_t *len);
- int is_hex(const u8 *data, size_t len);
-+int has_ctrl_char(const u8 *data, size_t len);
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len);
-diff --git a/src/wps/wps_attr_process.c b/src/wps/wps_attr_process.c
-index eadb22fe2e78..e8c4579309ab 100644
---- a/src/wps/wps_attr_process.c
-+++ b/src/wps/wps_attr_process.c
-@@ -229,6 +229,16 @@ static int wps_workaround_cred_key(struct wps_credential *cred)
- 		cred->key_len--;
- #endif /* CONFIG_WPS_STRICT */
- 	}
-+
-+
-+	if (cred->auth_type & (WPS_AUTH_WPAPSK | WPS_AUTH_WPA2PSK) &&
-+	    (cred->key_len < 8 || has_ctrl_char(cred->key, cred->key_len))) {
-+		wpa_printf(MSG_INFO, "WPS: Reject credential with invalid WPA/WPA2-Personal passphrase");
-+		wpa_hexdump_ascii_key(MSG_INFO, "WPS: Network Key",
-+				      cred->key, cred->key_len);
-+		return -1;
-+	}
-+
- 	return 0;
- }
- 
--- 
-2.8.1
-
diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index 869849b..fb89147 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8e272d954dc0d7026c264b79b15389ec2b2c555b32970de39f506b9f463ec74a  hostapd-2.5.tar.gz
+sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d  hostapd-2.6.tar.gz
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 5aa2b9a..a499011 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOSTAPD_VERSION = 2.5
+HOSTAPD_VERSION = 2.6
 HOSTAPD_SITE = http://hostap.epitest.fi/releases
 HOSTAPD_SUBDIR = hostapd
 HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
-- 
2.10.0
