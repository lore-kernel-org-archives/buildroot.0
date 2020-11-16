From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 15:51:00 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/tcpdump: fix
 CVE-2020-8037
Message-ID: <20201116143719.377427FFA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20d3a17f64cb0e018512b736009cf7ae82e8b7fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The ppp decapsulator in tcpdump 4.9.3 can be convinced to allocate a
large amount of memory.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e3a663f5705c492f52128b4a7ff514480332b6df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...scaping-don-t-allocate-a-too-large-buffer.patch | 67 ++++++++++++++++++++++
 package/tcpdump/tcpdump.mk                         |  3 +
 2 files changed, 70 insertions(+)

diff --git a/package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch b/package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
new file mode 100644
index 0000000000..9e8674ac90
--- /dev/null
+++ b/package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
@@ -0,0 +1,67 @@
+From 32027e199368dad9508965aae8cd8de5b6ab5231 Mon Sep 17 00:00:00 2001
+From: Guy Harris <guy@alum.mit.edu>
+Date: Sat, 18 Apr 2020 14:04:59 -0700
+Subject: [PATCH] PPP: When un-escaping, don't allocate a too-large buffer.
+
+The buffer should be big enough to hold the captured data, but it
+doesn't need to be big enough to hold the entire on-the-network packet,
+if we haven't captured all of it.
+
+(backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
+
+[Retrieved from:
+https://github.com/the-tcpdump-group/tcpdump/commit/32027e199368dad9508965aae8cd8de5b6ab5231]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ print-ppp.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/print-ppp.c b/print-ppp.c
+index 891761728..33fb03412 100644
+--- a/print-ppp.c
++++ b/print-ppp.c
+@@ -1367,19 +1367,29 @@ print_bacp_config_options(netdissect_options *ndo,
+ 	return 0;
+ }
+ 
++/*
++ * Un-escape RFC 1662 PPP in HDLC-like framing, with octet escapes.
++ * The length argument is the on-the-wire length, not the captured
++ * length; we can only un-escape the captured part.
++ */
+ static void
+ ppp_hdlc(netdissect_options *ndo,
+          const u_char *p, int length)
+ {
++	u_int caplen = ndo->ndo_snapend - p;
+ 	u_char *b, *t, c;
+ 	const u_char *s;
+-	int i, proto;
++	u_int i;
++	int proto;
+ 	const void *se;
+ 
++	if (caplen == 0)
++		return;
++
+         if (length <= 0)
+                 return;
+ 
+-	b = (u_char *)malloc(length);
++	b = (u_char *)malloc(caplen);
+ 	if (b == NULL)
+ 		return;
+ 
+@@ -1388,10 +1398,10 @@ ppp_hdlc(netdissect_options *ndo,
+ 	 * Do this so that we dont overwrite the original packet
+ 	 * contents.
+ 	 */
+-	for (s = p, t = b, i = length; i > 0 && ND_TTEST(*s); i--) {
++	for (s = p, t = b, i = caplen; i != 0; i--) {
+ 		c = *s++;
+ 		if (c == 0x7d) {
+-			if (i <= 1 || !ND_TTEST(*s))
++			if (i <= 1)
+ 				break;
+ 			i--;
+ 			c = *s++ ^ 0x20;
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 01a46b9b5f..8db35694ea 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -18,6 +18,9 @@ TCPDUMP_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
 TCPDUMP_DEPENDENCIES = libpcap
 
+# 0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
+TCPDUMP_IGNORE_CVES += CVE-2020-8037
+
 ifeq ($(BR2_STATIC_LIBS),y)
 TCPDUMP_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
 endif
