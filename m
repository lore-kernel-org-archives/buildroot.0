From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:20:49 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] tcpreplay: patch security
	issue
Message-ID: <20170317234445.7B545825C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fd28c44ce87b7480a24e596f7a34e3d30e577333
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Add upstream patch for CVE-2017-6429: Buffer overflow when reading crafted
pcap file with large packets.

https://github.com/appneta/tcpreplay/issues/278

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 62bf2bfd53885fbd62a8e9345c7f3d7a4d619342)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-capture-has-a-packet-that-is-too-large-2.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch b/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch
new file mode 100644
index 0000000..233b6d9
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
