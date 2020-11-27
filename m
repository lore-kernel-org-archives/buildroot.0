From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2020 18:25:15 +0100
Subject: [Buildroot] [PATCH] package/slirp: add upstream security fix for
 CVE-2020-29129 / CVE-2020-29130
Message-ID: <20201127172516.7797-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
routines, ensure that pkt_len is large enough to accommodate the
respective protocol headers, lest it should do an OOB access.
Add check to avoid it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t_len-before-reading-protocol-header.patch | 60 +++++++++++++++++++
 package/slirp/slirp.mk                        |  3 +
 2 files changed, 63 insertions(+)
 create mode 100644 package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch

diff --git a/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch b/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch
new file mode 100644
index 0000000000..4046144712
--- /dev/null
+++ b/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch
@@ -0,0 +1,60 @@
+From 2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 26 Nov 2020 19:27:06 +0530
+Subject: [PATCH] slirp: check pkt_len before reading protocol header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
+routines, ensure that pkt_len is large enough to accommodate the
+respective protocol headers, lest it should do an OOB access.
+Add check to avoid it.
+
+CVE-2020-29129 CVE-2020-29130
+  QEMU: slirp: out-of-bounds access while processing ARP/NCSI packets
+ -> https://www.openwall.com/lists/oss-security/2020/11/27/1
+
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20201126135706.273950-1-ppandit@redhat.com>
+Reviewed-by: Marc-Andr? Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/ncsi.c  | 4 ++++
+ src/slirp.c | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/src/ncsi.c b/src/ncsi.c
+index 3c1dfef..75dcc08 100644
+--- a/src/ncsi.c
++++ b/src/ncsi.c
+@@ -148,6 +148,10 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
+     uint32_t checksum;
+     uint32_t *pchecksum;
+ 
++    if (pkt_len < ETH_HLEN + sizeof(struct ncsi_pkt_hdr)) {
++        return; /* packet too short */
++    }
++
+     memset(ncsi_reply, 0, sizeof(ncsi_reply));
+ 
+     memset(reh->h_dest, 0xff, ETH_ALEN);
+diff --git a/src/slirp.c b/src/slirp.c
+index 9bead0c..abb6f9a 100644
+--- a/src/slirp.c
++++ b/src/slirp.c
+@@ -860,6 +860,10 @@ static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
+         return;
+     }
+ 
++    if (pkt_len < ETH_HLEN + sizeof(struct slirp_arphdr)) {
++        return; /* packet too short */
++    }
++
+     ar_op = ntohs(ah->ar_op);
+     switch (ar_op) {
+     case ARPOP_REQUEST:
+-- 
+2.20.1
+
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index ed6d8855e5..33c568c058 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -14,4 +14,7 @@ SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
+# 0001-slirp-check-pkt_len-before-reading-protocol-header.patch
+SLIRP_IGNORE_CVES += CVE-2020-29129 CVE-2020-29130
+
 $(eval $(meson-package))
-- 
2.20.1
