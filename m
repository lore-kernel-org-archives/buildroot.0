From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 13:32:18 +0100
Subject: [Buildroot] [git commit] aircrack-ng: add security patch for
	CVE-2010-1159
Message-ID: <20131106123311.39FC08F6F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac147527e2681737ed096466b4f773d9a39bef2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../aircrack-ng/aircrack-ng-01-CVE-2010-1159.patch |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

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
