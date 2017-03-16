From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Mar 2017 20:41:23 +0200
Subject: [Buildroot] [PATCH] tcpreplay: patch security issue
Message-ID: <ca98f5adf97d81a7ae436c03567ac62f733698fe.1489689683.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch for CVE-2017-6429: Buffer overflow when reading crafted
pcap file with large packets.

https://github.com/appneta/tcpreplay/issues/278

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...-capture-has-a-packet-that-is-too-large-2.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch

diff --git a/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch b/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch
new file mode 100644
index 000000000000..233b6d959f68
--- /dev/null
+++ b/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch
@@ -0,0 +1,44 @@
+From d689d14dbcd768c028eab2fb378d849e543dcfe9 Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fklassen@appneta.com>
+Date: Sun, 26 Feb 2017 20:45:59 -0800
+Subject: [PATCH] #278 fail if capture has a packet that is too large (#286)
+
+* #278 fail if capture has a packet that is too large
+
+[baruch: remove the CHANGELOG update]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: upstream commit d689d14db
+
+diff --git a/src/tcpcapinfo.c b/src/tcpcapinfo.c
+index 775f1625b00f..96928820fe94 100644
+--- a/src/tcpcapinfo.c
++++ b/src/tcpcapinfo.c
+@@ -281,6 +281,15 @@ main(int argc, char *argv[])
+                 caplen = pcap_ph.caplen;
+             }
+ 
++            if (caplentoobig) {
++                printf("\n\nCapture file appears to be damaged or corrupt.\n"
++                        "Contains packet of size %u, bigger than snap length %u\n",
++                        caplen, pcap_fh.snaplen);
++
++                close(fd);
++                break;
++            }
++
+             /* check to make sure timestamps don't go backwards */
+             if (last_sec > 0 && last_usec > 0) {
+                 if ((pcap_ph.ts.tv_sec == last_sec) ? 
+@@ -306,7 +315,7 @@ main(int argc, char *argv[])
+                 }
+ 
+                 close(fd);
+-                continue;
++                break;
+             }
+ 
+             /* print the frame checksum */
+-- 
+2.11.0
+
-- 
2.11.0
