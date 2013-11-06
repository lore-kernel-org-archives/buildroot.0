From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Nov 2013 09:15:23 -0300
Subject: [Buildroot] [PATCH] aircrack-ng: add security patch for
	CVE-2010-1159
Message-ID: <1383740123-24381-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch

diff --git a/package/aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch b/package/aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch
new file mode 100644
index 0000000..634a01e
--- /dev/null
+++ b/package/aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch
@@ -0,0 +1,24 @@
+Fix for buffer overflow CVE-2010-1159.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/airodump-ng.c
++++ b/src/airodump-ng.c
+@@ -2126,7 +2126,7 @@
+                     st_cur->wpa.eapol_size = ( h80211[z + 2] << 8 )
+                             +   h80211[z + 3] + 4;
+ 
+-                    if ((int)pkh.len - z < st_cur->wpa.eapol_size  || st_cur->wpa.eapol_size == 0)
++                    if (caplen - z < st_cur->wpa.eapol_size  || st_cur->wpa.eapol_size == 0 || caplen - z < 81 + 16 || st_cur->wpa.eapol_size > 256)
+ 					{
+ 						// Ignore the packet trying to crash us.
+                     	goto write_packet;
+@@ -2158,7 +2158,7 @@
+                     st_cur->wpa.eapol_size = ( h80211[z + 2] << 8 )
+                             +   h80211[z + 3] + 4;
+ 
+-                    if ((int)pkh.len - z < st_cur->wpa.eapol_size  || st_cur->wpa.eapol_size == 0)
++		    if (caplen - z < st_cur->wpa.eapol_size  || st_cur->wpa.eapol_size == 0 || caplen - z < 81 + 16 || st_cur->wpa.eapol_size > 256)
+ 					{
+ 						// Ignore the packet trying to crash us.
+                     	goto write_packet;
-- 
1.8.1.5
