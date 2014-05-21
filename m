From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 May 2014 12:54:00 +0300
Subject: [Buildroot] [PATCH] wpa_supplicant: fix internal TLS implementation
	security issues
Message-ID: <3d007c49bd84753f091cf084fa01f6ad21450935.1400666040.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patches fixing internal TLS validation of X.509 certificates. See
http://lists.shmoo.com/pipermail/hostap/2014-May/030273.html for details.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...nternal-TLS-X.509-validation-of-PKCS-1-si.patch | 38 ++++++++++++
 ...w-only-BT-01-for-signature-in-internal-TL.patch | 67 ++++++++++++++++++++++
 ...rce-minimum-padding-for-decryption-in-int.patch | 35 +++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch
 create mode 100644 package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch

diff --git a/package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch b/package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch
new file mode 100644
index 000000000000..5a5b0c3845f0
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0002-X.509-Fix-internal-TLS-X.509-validation-of-PKCS-1-si.patch
@@ -0,0 +1,38 @@
+From 9c29d48725fd40a82407a89f193cf009aeef9745 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Mon, 19 May 2014 23:25:38 +0300
+Subject: [PATCH] X.509: Fix internal TLS/X.509 validation of PKCS#1
+ signature
+
+Verify that there is no extra data after the hash field. This is needed
+to avoid potential attacks using additional data to construct a value
+that passes the RSA operation and allows the hash value to be forged.
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+---
+ src/tls/x509v3.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
+index a9483cb7fc2f..751a268e1caf 100644
+--- a/src/tls/x509v3.c
++++ b/src/tls/x509v3.c
+@@ -1783,6 +1783,15 @@ skip_digest_oid:
+ 		return -1;
+ 	}
+ 
++	if (hdr.payload + hdr.length < data + data_len) {
++		wpa_hexdump(MSG_INFO,
++			    "X509: Extra data after certificate signature hash",
++			    hdr.payload + hdr.length,
++			    data + data_len - hdr.payload - hdr.length);
++		os_free(data);
++		return -1;
++	}
++
+ 	os_free(data);
+ 
+ 	wpa_printf(MSG_DEBUG, "X509: Certificate Digest matches with "
+-- 
+2.0.0.rc2
+
diff --git a/package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch b/package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch
new file mode 100644
index 000000000000..57d752d0bbef
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0003-PKCS-1-Allow-only-BT-01-for-signature-in-internal-TL.patch
@@ -0,0 +1,67 @@
+From e6d83cc7babb978ba53ae8686159b41ab0f448cc Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Mon, 19 May 2014 23:26:19 +0300
+Subject: [PATCH] PKCS #1: Allow only BT=01 for signature in internal TLS
+
+Based on PKCS #1, v1.5, 10.1.3, the block type shall be 01 for a
+signature. This avoids a potential attack vector for internal TLS/X.509
+implementation.
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+---
+ src/tls/pkcs1.c | 29 ++++++++++-------------------
+ 1 file changed, 10 insertions(+), 19 deletions(-)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index b6fde5ee868a..af58a42987c6 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -142,35 +142,26 @@ int pkcs1_decrypt_public_key(struct crypto_rsa_key *key,
+ 	 * BT = 00 or 01
+ 	 * PS = k-3-||D|| times (00 if BT=00) or (FF if BT=01)
+ 	 * k = length of modulus in octets
++	 *
++	 * Based on 10.1.3, "The block type shall be 01" for a signature.
+ 	 */
+ 
+ 	if (len < 3 + 8 + 16 /* min hash len */ ||
+-	    plain[0] != 0x00 || (plain[1] != 0x00 && plain[1] != 0x01)) {
++	    plain[0] != 0x00 || plain[1] != 0x01) {
+ 		wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature EB "
+ 			   "structure");
+ 		return -1;
+ 	}
+ 
+ 	pos = plain + 3;
+-	if (plain[1] == 0x00) {
+-		/* BT = 00 */
+-		if (plain[2] != 0x00) {
+-			wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature "
+-				   "PS (BT=00)");
+-			return -1;
+-		}
+-		while (pos + 1 < plain + len && *pos == 0x00 && pos[1] == 0x00)
+-			pos++;
+-	} else {
+-		/* BT = 01 */
+-		if (plain[2] != 0xff) {
+-			wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature "
+-				   "PS (BT=01)");
+-			return -1;
+-		}
+-		while (pos < plain + len && *pos == 0xff)
+-			pos++;
++	/* BT = 01 */
++	if (plain[2] != 0xff) {
++		wpa_printf(MSG_INFO, "LibTomCrypt: Invalid signature "
++			   "PS (BT=01)");
++		return -1;
+ 	}
++	while (pos < plain + len && *pos == 0xff)
++		pos++;
+ 
+ 	if (pos - plain - 2 < 8) {
+ 		/* PKCS #1 v1.5, 8.1: At least eight octets long PS */
+-- 
+2.0.0.rc2
+
diff --git a/package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch b/package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch
new file mode 100644
index 000000000000..7862de7a6494
--- /dev/null
+++ b/package/wpa_supplicant/wpa_supplicant-0004-PKCS-1-Enforce-minimum-padding-for-decryption-in-int.patch
@@ -0,0 +1,35 @@
+From 6c5be116dd6997f68e524247751cff53c74519d7 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Mon, 19 May 2014 23:26:43 +0300
+Subject: [PATCH] PKCS #1: Enforce minimum padding for decryption in
+ internal TLS
+
+Follow the PKCS #1 v1.5, 8.1 constraint of at least eight octets long PS
+for the case where the internal TLS implementation decrypts PKCS #1
+formatted data. Similar limit was already in place for signature
+validation, but not for this decryption routine.
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+---
+ src/tls/pkcs1.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
+index af58a42987c6..ea3e6171a1d1 100644
+--- a/src/tls/pkcs1.c
++++ b/src/tls/pkcs1.c
+@@ -113,6 +113,11 @@ int pkcs1_v15_private_key_decrypt(struct crypto_rsa_key *key,
+ 		pos++;
+ 	if (pos == end)
+ 		return -1;
++	if (pos - out - 2 < 8) {
++		/* PKCS #1 v1.5, 8.1: At least eight octets long PS */
++		wpa_printf(MSG_INFO, "LibTomCrypt: Too short padding");
++		return -1;
++	}
+ 	pos++;
+ 
+ 	*outlen -= pos - out;
+-- 
+2.0.0.rc2
+
-- 
2.0.0.rc2
