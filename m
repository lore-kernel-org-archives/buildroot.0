From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 22 Mar 2017 21:16:26 +1300
Subject: [Buildroot] [PATCH] tcpreplay: Bump version to v4.2.0
Message-ID: <20170322081626.6757-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 ...-capture-has-a-packet-that-is-too-large-2.patch | 44 ----------------------
 package/tcpreplay/tcpreplay.hash                   |  2 +-
 package/tcpreplay/tcpreplay.mk                     |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch

diff --git a/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch b/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch
deleted file mode 100644
index 233b6d959..000000000
--- a/package/tcpreplay/0001-278-fail-if-capture-has-a-packet-that-is-too-large-2.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From d689d14dbcd768c028eab2fb378d849e543dcfe9 Mon Sep 17 00:00:00 2001
-From: Fred Klassen <fklassen@appneta.com>
-Date: Sun, 26 Feb 2017 20:45:59 -0800
-Subject: [PATCH] #278 fail if capture has a packet that is too large (#286)
-
-* #278 fail if capture has a packet that is too large
-
-[baruch: remove the CHANGELOG update]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: upstream commit d689d14db
-
-diff --git a/src/tcpcapinfo.c b/src/tcpcapinfo.c
-index 775f1625b00f..96928820fe94 100644
---- a/src/tcpcapinfo.c
-+++ b/src/tcpcapinfo.c
-@@ -281,6 +281,15 @@ main(int argc, char *argv[])
-                 caplen = pcap_ph.caplen;
-             }
- 
-+            if (caplentoobig) {
-+                printf("\n\nCapture file appears to be damaged or corrupt.\n"
-+                        "Contains packet of size %u, bigger than snap length %u\n",
-+                        caplen, pcap_fh.snaplen);
-+
-+                close(fd);
-+                break;
-+            }
-+
-             /* check to make sure timestamps don't go backwards */
-             if (last_sec > 0 && last_usec > 0) {
-                 if ((pcap_ph.ts.tv_sec == last_sec) ? 
-@@ -306,7 +315,7 @@ main(int argc, char *argv[])
-                 }
- 
-                 close(fd);
--                continue;
-+                break;
-             }
- 
-             /* print the frame checksum */
--- 
-2.11.0
-
diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
index e7ba4400e..bc75d88e7 100644
--- a/package/tcpreplay/tcpreplay.hash
+++ b/package/tcpreplay/tcpreplay.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea	tcpreplay-4.1.2.tar.gz
+sha256	924f80cd1958a4c4447f0a6a54e8d3af7aebd3674aa4ef9973f69b43b1675221	tcpreplay-4.2.0.tar.gz
diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
index a8bcf1c5d..21784c1ff 100644
--- a/package/tcpreplay/tcpreplay.mk
+++ b/package/tcpreplay/tcpreplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPREPLAY_VERSION = 4.1.2
+TCPREPLAY_VERSION = 4.2.0
 TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
 TCPREPLAY_LICENSE = GPLv3
 TCPREPLAY_LICENSE_FILES = docs/LICENSE
-- 
2.11.0.24.ge6920cf
