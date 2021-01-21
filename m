From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Jan 2021 19:16:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/tcpdump: bump to version 4.99.0
In-Reply-To: <b121a9435d868681c957e7bc9243fb84676d80e3.1611249364.git.baruch@tkos.co.il>
References: <b121a9435d868681c957e7bc9243fb84676d80e3.1611249364.git.baruch@tkos.co.il>
Message-ID: <52e8d711bf5b239729edaef5edf614a1dd4ff27e.1611249364.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream security patch.

Rename --with-system-libpcap to --disable-local-libpcap following
upstream change.

The configure scripts uses pkg-config to find libpcap, add host-pkgconf
dependency.

pkg-config handles static build for us. Remove explicit static build
handling.

Use https for SITE to save redirect.

Update license file hash due to whitespace changes.

Format hashes with two space delimiters.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...ng-don-t-allocate-a-too-large-buffer.patch | 67 -------------------
 package/tcpdump/tcpdump.hash                  |  6 +-
 package/tcpdump/tcpdump.mk                    | 15 ++---
 3 files changed, 7 insertions(+), 81 deletions(-)
 delete mode 100644 package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch

diff --git a/package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch b/package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
deleted file mode 100644
index 9e8674ac90d6..000000000000
--- a/package/tcpdump/0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 32027e199368dad9508965aae8cd8de5b6ab5231 Mon Sep 17 00:00:00 2001
-From: Guy Harris <guy@alum.mit.edu>
-Date: Sat, 18 Apr 2020 14:04:59 -0700
-Subject: [PATCH] PPP: When un-escaping, don't allocate a too-large buffer.
-
-The buffer should be big enough to hold the captured data, but it
-doesn't need to be big enough to hold the entire on-the-network packet,
-if we haven't captured all of it.
-
-(backported from commit e4add0b010ed6f2180dcb05a13026242ed935334)
-
-[Retrieved from:
-https://github.com/the-tcpdump-group/tcpdump/commit/32027e199368dad9508965aae8cd8de5b6ab5231]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- print-ppp.c | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/print-ppp.c b/print-ppp.c
-index 891761728..33fb03412 100644
---- a/print-ppp.c
-+++ b/print-ppp.c
-@@ -1367,19 +1367,29 @@ print_bacp_config_options(netdissect_options *ndo,
- 	return 0;
- }
- 
-+/*
-+ * Un-escape RFC 1662 PPP in HDLC-like framing, with octet escapes.
-+ * The length argument is the on-the-wire length, not the captured
-+ * length; we can only un-escape the captured part.
-+ */
- static void
- ppp_hdlc(netdissect_options *ndo,
-          const u_char *p, int length)
- {
-+	u_int caplen = ndo->ndo_snapend - p;
- 	u_char *b, *t, c;
- 	const u_char *s;
--	int i, proto;
-+	u_int i;
-+	int proto;
- 	const void *se;
- 
-+	if (caplen == 0)
-+		return;
-+
-         if (length <= 0)
-                 return;
- 
--	b = (u_char *)malloc(length);
-+	b = (u_char *)malloc(caplen);
- 	if (b == NULL)
- 		return;
- 
-@@ -1388,10 +1398,10 @@ ppp_hdlc(netdissect_options *ndo,
- 	 * Do this so that we dont overwrite the original packet
- 	 * contents.
- 	 */
--	for (s = p, t = b, i = length; i > 0 && ND_TTEST(*s); i--) {
-+	for (s = p, t = b, i = caplen; i != 0; i--) {
- 		c = *s++;
- 		if (c == 0x7d) {
--			if (i <= 1 || !ND_TTEST(*s))
-+			if (i <= 1)
- 				break;
- 			i--;
- 			c = *s++ ^ 0x20;
diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index da5c9aa7491e..4aea5b7cb5a9 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# http://www.tcpdump.org/release/tcpdump-4.9.3.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.0.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256 2cd47cb3d460b6ff75f4a9940f594317ad456cfbf2bd2c8e5151e16559db6410  tcpdump-4.9.3.tar.gz
-sha256 9b03d5d13e66d6de02a4bb2d0dd1cb9f41808d045962cdcc42350d5291b141a1  LICENSE
+sha256  8cf2f17a9528774a7b41060323be8b73f76024f7778f59c34efa65d49d80b842  tcpdump-4.99.0.tar.gz
+sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 63991163ab8f..f8ea6576eefb 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.9.3
-TCPDUMP_SITE = http://www.tcpdump.org/release
+TCPDUMP_VERSION = 4.99.0
+TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
 TCPDUMP_CPE_ID_VENDOR = tcpdump
@@ -15,18 +15,11 @@ TCPDUMP_CONF_ENV = \
 	PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
 TCPDUMP_CONF_OPTS = \
 	--without-crypto \
-	--with-system-libpcap \
+	--disable-local-libpcap \
 	$(if $(BR2_PACKAGE_TCPDUMP_SMB),--enable-smb,--disable-smb)
-TCPDUMP_DEPENDENCIES = libpcap
+TCPDUMP_DEPENDENCIES = libpcap host-pkgconf
 TCPDUMP_SELINUX_MODULES = netutils
 
-# 0001-PPP-When-un-escaping-don-t-allocate-a-too-large-buffer.patch
-TCPDUMP_IGNORE_CVES += CVE-2020-8037
-
-ifeq ($(BR2_STATIC_LIBS),y)
-TCPDUMP_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
-endif
-
 # make install installs an unneeded extra copy of the tcpdump binary
 define TCPDUMP_REMOVE_DUPLICATED_BINARY
 	rm -f $(TARGET_DIR)/usr/sbin/tcpdump.$(TCPDUMP_VERSION)
-- 
2.29.2
