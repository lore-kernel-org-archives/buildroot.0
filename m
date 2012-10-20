From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Oct 2012 21:04:56 +0200
Subject: [Buildroot] [git commit] hostapd: add fix for CVE-2012-4445
Message-ID: <20121020190731.9BE5B997D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7aed4faa9b0e6b21dba82ad5d3be5db796517580
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/hostapd/hostapd-cve-2012-4445.patch |   49 +++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd-cve-2012-4445.patch b/package/hostapd/hostapd-cve-2012-4445.patch
new file mode 100644
index 0000000..034a458
--- /dev/null
+++ b/package/hostapd/hostapd-cve-2012-4445.patch
@@ -0,0 +1,49 @@
+From 567bacefd73782508bfe72d3624df495f0df4cd1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sun, 7 Oct 2012 20:06:29 +0300
+Subject: [PATCH] EAP-TLS server: Fix TLS Message Length validation
+
+EAP-TLS/PEAP/TTLS/FAST server implementation did not validate TLS
+Message Length value properly and could end up trying to store more
+information into the message buffer than the allocated size if the first
+fragment is longer than the indicated size. This could result in hostapd
+process terminating in wpabuf length validation. Fix this by rejecting
+messages that have invalid TLS Message Length value.
+
+This would affect cases that use the internal EAP authentication server
+in hostapd either directly with IEEE 802.1X or when using hostapd as a
+RADIUS authentication server and when receiving an incorrectly
+constructed EAP-TLS message. Cases where hostapd uses an external
+authentication are not affected.
+
+Thanks to Timo Warns for finding and reporting this issue.
+
+Signed-hostap: Jouni Malinen <j@w1.fi>
+intended-for: hostap-1
+(cherry picked from commit 586c446e0ff42ae00315b014924ec669023bd8de)
+---
+ src/eap_server/eap_server_tls_common.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/src/eap_server/eap_server_tls_common.c b/src/eap_server/eap_server_tls_common.c
+index e149ee3..2cbe700 100644
+--- a/src/eap_server/eap_server_tls_common.c
++++ b/src/eap_server/eap_server_tls_common.c
+@@ -224,6 +224,14 @@ static int eap_server_tls_process_fragment(struct eap_ssl_data *data,
+ 			return -1;
+ 		}
+ 
++		if (len > message_length) {
++			wpa_printf(MSG_INFO, "SSL: Too much data (%d bytes) in "
++				   "first fragment of frame (TLS Message "
++				   "Length %d bytes)",
++				   (int) len, (int) message_length);
++			return -1;
++		}
++
+ 		data->tls_in = wpabuf_alloc(message_length);
+ 		if (data->tls_in == NULL) {
+ 			wpa_printf(MSG_DEBUG, "SSL: No memory for message");
+-- 
+1.7.4-rc1
+
