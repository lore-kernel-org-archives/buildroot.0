From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:45:51 +0200
Subject: [Buildroot] [git commit branch/next] package/aircrack-ng: fix build
 with gcc 10
Message-ID: <20200812144330.4B8A385F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1f03aef306eb596b8061be20b4baa1a018bd890
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
 - http://autobuild.buildroot.org/results/98ab591a88e06a985b0a7aac5abbf665289134b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Expand-packed-definition.patch            | 26 ++++++++
 .../aircrack-ng/0002-Fix-duplicated-symbols.patch  | 74 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/package/aircrack-ng/0001-Expand-packed-definition.patch b/package/aircrack-ng/0001-Expand-packed-definition.patch
new file mode 100644
index 0000000000..f0c033a1aa
--- /dev/null
+++ b/package/aircrack-ng/0001-Expand-packed-definition.patch
@@ -0,0 +1,26 @@
+From d4496006ac1e0c99908108b998ae39afb0658733 Mon Sep 17 00:00:00 2001
+From: Joseph Benden <joe@benden.us>
+Date: Tue, 7 Jul 2020 11:42:40 -0700
+Subject: [PATCH] Expand __packed definition.
+
+Signed-off-by: Joseph Benden <joe@benden.us>
+[Retrieved from:
+https://github.com/aircrack-ng/aircrack-ng/commit/d4496006ac1e0c99908108b998ae39afb0658733]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/radiotap/radiotap.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/radiotap/radiotap.h b/lib/radiotap/radiotap.h
+index 57f784b8d..bb5a41dfc 100644
+--- a/lib/radiotap/radiotap.h
++++ b/lib/radiotap/radiotap.h
+@@ -56,7 +56,7 @@ struct ieee80211_radiotap_header {
+ 	 * @it_present: (first) present word
+ 	 */
+ 	uint32_t it_present;
+-} __packed;
++} __attribute__((__packed__));
+ 
+ /* version is always 0 */
+ #define PKTHDR_RADIOTAP_VERSION	0
diff --git a/package/aircrack-ng/0002-Fix-duplicated-symbols.patch b/package/aircrack-ng/0002-Fix-duplicated-symbols.patch
new file mode 100644
index 0000000000..f181580808
--- /dev/null
+++ b/package/aircrack-ng/0002-Fix-duplicated-symbols.patch
@@ -0,0 +1,74 @@
+From f6f1396807607f5649d20631db517cfca3a1f5c4 Mon Sep 17 00:00:00 2001
+From: Joseph Benden <joe@benden.us>
+Date: Tue, 7 Jul 2020 11:44:40 -0700
+Subject: [PATCH] Fix duplicated symbols.
+
+Signed-off-by: Joseph Benden <joe@benden.us>
+[Retrieved from:
+https://github.com/aircrack-ng/aircrack-ng/commit/f6f1396807607f5649d20631db517cfca3a1f5c4]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/airodump-ng/airodump-ng.c                 | 2 --
+ src/airventriloquist-ng/airventriloquist-ng.c | 6 +++---
+ src/tkiptun-ng/tkiptun-ng.c                   | 4 ++--
+ 3 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/src/airodump-ng/airodump-ng.c b/src/airodump-ng/airodump-ng.c
+index 3ae6994dd..e72bc88e2 100644
+--- a/src/airodump-ng/airodump-ng.c
++++ b/src/airodump-ng/airodump-ng.c
+@@ -92,8 +92,6 @@
+ #include "radiotap/radiotap_iter.h"
+ 
+ struct devices dev;
+-uint8_t h80211[4096] __attribute__((aligned(16)));
+-uint8_t tmpbuf[4096] __attribute__((aligned(16)));
+ 
+ static const unsigned char llcnull[] = {0, 0, 0, 0};
+ 
+diff --git a/src/airventriloquist-ng/airventriloquist-ng.c b/src/airventriloquist-ng/airventriloquist-ng.c
+index ac6b7647e..267d95540 100644
+--- a/src/airventriloquist-ng/airventriloquist-ng.c
++++ b/src/airventriloquist-ng/airventriloquist-ng.c
+@@ -173,7 +173,7 @@ static struct local_options
+ } lopt;
+ 
+ struct devices dev;
+-struct wif *_wi_in, *_wi_out;
++extern struct wif *_wi_in, *_wi_out;
+ 
+ struct ARP_req
+ {
+@@ -195,8 +195,8 @@ struct APt
+ };
+ 
+ unsigned long nb_pkt_sent;
+-u_int8_t h80211[4096];
+-static u_int8_t tmpbuf[4096];
++extern u_int8_t h80211[4096];
++extern u_int8_t tmpbuf[4096];
+ 
+ static int tcp_test(const char * ip_str, const short port)
+ {
+diff --git a/src/tkiptun-ng/tkiptun-ng.c b/src/tkiptun-ng/tkiptun-ng.c
+index dc67f5d58..43db0bc23 100644
+--- a/src/tkiptun-ng/tkiptun-ng.c
++++ b/src/tkiptun-ng/tkiptun-ng.c
+@@ -267,7 +267,7 @@ static struct local_options
+ 
+ // unused, but needed for link
+ struct devices dev;
+-struct wif *_wi_in, *_wi_out;
++extern struct wif *_wi_in, *_wi_out;
+ 
+ struct ARP_req
+ {
+@@ -289,7 +289,7 @@ struct APt
+ };
+ 
+ unsigned long nb_pkt_sent;
+-unsigned char h80211[4096];
++extern unsigned char h80211[4096];
+ static unsigned char srcbuf[4096];
+ static char strbuf[512];
+ static int alarmed;
