From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 13:01:34 +0100
Subject: [Buildroot] [git commit] tcpdump: add security fix patch
Message-ID: <20141202120522.E03AF80075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d948a7aa19831f8274b4136f1a8692616c1ebe8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-9140, PPP dissector vulnerability.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/0005-fix-CVE-2014-9140.patch |   59 ++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/tcpdump/0005-fix-CVE-2014-9140.patch b/package/tcpdump/0005-fix-CVE-2014-9140.patch
new file mode 100644
index 0000000..86365d0
--- /dev/null
+++ b/package/tcpdump/0005-fix-CVE-2014-9140.patch
@@ -0,0 +1,59 @@
+From 0f95d441e4b5d7512cc5c326c8668a120e048eda Mon Sep 17 00:00:00 2001
+From: Guy Harris <guy@alum.mit.edu>
+Date: Wed, 22 Oct 2014 12:31:21 -0700
+Subject: [PATCH] Do bounds checking when unescaping PPP.
+
+Clean up a const issue while we're at it.
+
+Upstream commit 0f95d441e4b5d.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ print-ppp.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/print-ppp.c b/print-ppp.c
+index 8e098f05a953..9a983e6179cd 100644
+--- a/print-ppp.c
++++ b/print-ppp.c
+@@ -1351,14 +1351,15 @@ static void
+ ppp_hdlc(netdissect_options *ndo,
+          const u_char *p, int length)
+ {
+-	u_char *b, *s, *t, c;
++	u_char *b, *t, c;
++	const u_char *s;
+ 	int i, proto;
+ 	const void *se;
+ 
+         if (length <= 0)
+                 return;
+ 
+-	b = (uint8_t *)malloc(length);
++	b = (u_char *)malloc(length);
+ 	if (b == NULL)
+ 		return;
+ 
+@@ -1367,14 +1368,13 @@ ppp_hdlc(netdissect_options *ndo,
+ 	 * Do this so that we dont overwrite the original packet
+ 	 * contents.
+ 	 */
+-	for (s = (u_char *)p, t = b, i = length; i > 0; i--) {
++	for (s = p, t = b, i = length; i > 0 && ND_TTEST(*s); i--) {
+ 		c = *s++;
+ 		if (c == 0x7d) {
+-			if (i > 1) {
+-				i--;
+-				c = *s++ ^ 0x20;
+-			} else
+-				continue;
++			if (i <= 1 || !ND_TTEST(*s))
++				break;
++			i--;
++			c = *s++ ^ 0x20;
+ 		}
+ 		*t++ = c;
+ 	}
+-- 
+2.1.3
+
