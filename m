From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Jul 2021 22:38:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/slirp: security bump to version
 4.6.1
Message-ID: <20210701203842.470599-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mtod()-related buffer overflows (CVE-2021-3592 #44, CVE-2021-3593 #45,
CVE-2021-3594 #47, CVE-2021-3595 #46).

Drop patch (already in version)

https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.6.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t_len-before-reading-protocol-header.patch | 60 -------------------
 package/slirp/slirp.hash                      |  2 +-
 package/slirp/slirp.mk                        |  9 +--
 3 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch

diff --git a/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch b/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch
deleted file mode 100644
index 4046144712..0000000000
--- a/package/slirp/0001-slirp-check-pkt_len-before-reading-protocol-header.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 2e1dcbc0c2af64fcb17009eaf2ceedd81be2b27f Mon Sep 17 00:00:00 2001
-From: Prasad J Pandit <pjp@fedoraproject.org>
-Date: Thu, 26 Nov 2020 19:27:06 +0530
-Subject: [PATCH] slirp: check pkt_len before reading protocol header
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-While processing ARP/NCSI packets in 'arp_input' or 'ncsi_input'
-routines, ensure that pkt_len is large enough to accommodate the
-respective protocol headers, lest it should do an OOB access.
-Add check to avoid it.
-
-CVE-2020-29129 CVE-2020-29130
-  QEMU: slirp: out-of-bounds access while processing ARP/NCSI packets
- -> https://www.openwall.com/lists/oss-security/2020/11/27/1
-
-Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
-Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
-Message-Id: <20201126135706.273950-1-ppandit@redhat.com>
-Reviewed-by: Marc-Andr? Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/ncsi.c  | 4 ++++
- src/slirp.c | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/src/ncsi.c b/src/ncsi.c
-index 3c1dfef..75dcc08 100644
---- a/src/ncsi.c
-+++ b/src/ncsi.c
-@@ -148,6 +148,10 @@ void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
-     uint32_t checksum;
-     uint32_t *pchecksum;
- 
-+    if (pkt_len < ETH_HLEN + sizeof(struct ncsi_pkt_hdr)) {
-+        return; /* packet too short */
-+    }
-+
-     memset(ncsi_reply, 0, sizeof(ncsi_reply));
- 
-     memset(reh->h_dest, 0xff, ETH_ALEN);
-diff --git a/src/slirp.c b/src/slirp.c
-index 9bead0c..abb6f9a 100644
---- a/src/slirp.c
-+++ b/src/slirp.c
-@@ -860,6 +860,10 @@ static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
-         return;
-     }
- 
-+    if (pkt_len < ETH_HLEN + sizeof(struct slirp_arphdr)) {
-+        return; /* packet too short */
-+    }
-+
-     ar_op = ntohs(ah->ar_op);
-     switch (ar_op) {
-     case ARPOP_REQUEST:
--- 
-2.20.1
-
diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index fe295b3bfb..326b2ad246 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  388b4b08a8cc0996cc5155cb027a097dc1a7f2cfe84b1121496608ab5366cc48  libslirp-4.3.1.tar.xz
+sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index ff92c60517..43d2c520e9 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-SLIRP_VERSION = 4.3.1
+SLIRP_VERSION = 4.6.1
 SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
-# Other "official" tarballs don't ship .tarball-version resulting in a build
-# failure: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/24
-SLIRP_SITE = https://elmarco.fedorapeople.org
+SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_CPE_ID_VENDOR = libslirp_project
@@ -16,7 +14,4 @@ SLIRP_CPE_ID_PRODUCT = libslirp
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
-# 0001-slirp-check-pkt_len-before-reading-protocol-header.patch
-SLIRP_IGNORE_CVES += CVE-2020-29129 CVE-2020-29130
-
 $(eval $(meson-package))
-- 
2.30.2
