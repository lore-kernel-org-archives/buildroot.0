From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Apr 2015 10:08:46 +0300
Subject: [Buildroot] [PATCH] wpa_supplicant: add fix for CVE-2015-1863
Message-ID: <ae747360e1b88e5f8f2ecfd38130aebc21a73682.1429859326.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing CVE-2015-1863: buffer overflow of SSID buffer within
struct p2p_device that is allocated from heap.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...e-SSID-element-length-before-copying-it-C.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/wpa_supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch

diff --git a/package/wpa_supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch b/package/wpa_supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
new file mode 100644
index 000000000000..989bc4f786a3
--- /dev/null
+++ b/package/wpa_supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
@@ -0,0 +1,45 @@
+From 9ed4eee345f85e3025c33c6e20aa25696e341ccd Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Tue, 7 Apr 2015 11:32:11 +0300
+Subject: [PATCH] P2P: Validate SSID element length before copying it
+ (CVE-2015-1863)
+
+Upstream commit 9ed4eee345f85e3025c33c6e20aa25696e341ccd.
+
+This fixes a possible memcpy overflow for P2P dev->oper_ssid in
+p2p_add_device(). The length provided by the peer device (0..255 bytes)
+was used without proper bounds checking and that could have resulted in
+arbitrary data of up to 223 bytes being written beyond the end of the
+dev->oper_ssid[] array (of which about 150 bytes would be beyond the
+heap allocation) when processing a corrupted management frame for P2P
+peer discovery purposes.
+
+This could result in corrupted state in heap, unexpected program
+behavior due to corrupted P2P peer device information, denial of service
+due to process crash, exposure of memory contents during GO Negotiation,
+and potentially arbitrary code execution.
+
+Thanks to Google security team for reporting this issue and smart
+hardware research group of Alibaba security team for discovering it.
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/p2p/p2p.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
+index f584fae..a45fe73 100644
+--- a/src/p2p/p2p.c
++++ b/src/p2p/p2p.c
+@@ -778,6 +778,7 @@ int p2p_add_device(struct p2p_data *p2p, const u8 *addr, int freq,
+ 	if (os_memcmp(addr, p2p_dev_addr, ETH_ALEN) != 0)
+ 		os_memcpy(dev->interface_addr, addr, ETH_ALEN);
+ 	if (msg.ssid &&
++	    msg.ssid[1] <= sizeof(dev->oper_ssid) &&
+ 	    (msg.ssid[1] != P2P_WILDCARD_SSID_LEN ||
+ 	     os_memcmp(msg.ssid + 2, P2P_WILDCARD_SSID, P2P_WILDCARD_SSID_LEN)
+ 	     != 0)) {
+-- 
+1.9.1
+
-- 
2.1.4
