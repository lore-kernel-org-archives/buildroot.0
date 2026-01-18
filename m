Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706DFCA5FE1
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0C980D5C;
	Sun, 18 Jan 2026 22:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGtBOYOeiNnn; Sun, 18 Jan 2026 22:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 313DC80D59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768774373;
	bh=UPK+uAOAeEKFLmo8wDAMwredxwGr1yl/KsVUuuufP1s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W+GvmD8JnwvOwpHGKrdX0a41YpFwIbYsF2adi4lFhcL+kQvr+K32TbWhYjbSqOmDP
	 FlgxCicxeIW2G6Od0QEE6VdlrRUJDOQIB2yhiakX7deHXpO504PvT/pNgDksGJVSie
	 qbgWsoEM2n95rpvUC8Z2qkLiISGcTdbe3kiijAIlv1IWB+mob+ZHgCAlY/7+//ytOh
	 AdNjCUz74XVRRGEq0XR540kLra5MuVyv4X08s4lhHGZCkIEe0RamsfvslFgC9DWA9m
	 HzVafZdoU41lWdT+OKrY0Mb+5Wzdc5BBNFanRIIV/7soA2TIiWvX+n3FsXhqWU+kH4
	 fYWBKRHbQCQ8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 313DC80D59;
	Sun, 18 Jan 2026 22:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1D002CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B008A40663
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Shmv772Knz_v for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:12:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9432540677
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9432540677
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9432540677
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:12:50 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:17d1:a908:70b9:90c3])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D518C2003C3;
 Sun, 18 Jan 2026 23:12:44 +0100 (CET)
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 18 Jan 2026 23:12:38 +0100
Message-ID: <20260118221238.70962-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118221238.70962-1-vjardin@free.fr>
References: <20260107233633.2870caea@windsurf>
 <20260118221238.70962-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768774368;
 bh=VOZVXL7omcTzHhrOII3xuqJfM4FkrAlhI1Bmu3ziNU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i2oZ+cuh9ZganH+eu1clCOEqRyeYw8wW1tLZnaRcuOPCrdGOWXcXoJgO4QIFvctdi
 U5TC7yqYYLIVFB9vjCUyQ64/E69+aHB8OAxrhM5AOTQehSro7WMX8ypG1Z5iEc5l8e
 F/Ne1BTJmb0p3NMuB2qyVuOc63s6skK4+vvJOT7zeNA/TirvsfLja/4CPMVfbns9X0
 qg7GjEl0qj3aCivGucjJny2muJHm0iakWx5KXZnOHJvo+94dZ9UFRK8uV9Z/jyr3WF
 VZAehu+vofwWqwSBaujFPy2R3fboWXMXcv2kK8T0AbVgOTxZIUgiqNHsW7YuEhOvGa
 b7WKwsnvURzXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i2oZ+cuh
Subject: [Buildroot] [PATCH v2 1/1] package/dot1ag-utils: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dot1ag-utils provides tools for IEEE 802.1ag Connectivity Fault
Management (CFM) protocol testing and debugging.

https://github.com/Bumblebee-Networks/dot1ag-utils
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0001-fix-strncpy-truncation-warnings.patch | 60 +++++++++++++++++++
 package/dot1ag-utils/Config.in                | 11 ++++
 package/dot1ag-utils/dot1ag-utils.hash        |  3 +
 package/dot1ag-utils/dot1ag-utils.mk          | 14 +++++
 6 files changed, 90 insertions(+)
 create mode 100644 package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
 create mode 100644 package/dot1ag-utils/Config.in
 create mode 100644 package/dot1ag-utils/dot1ag-utils.hash
 create mode 100644 package/dot1ag-utils/dot1ag-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f982e3123a..f5d82280dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3356,6 +3356,7 @@ N:	Vincent Jardin <vjardin@free.fr>
 F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
+F:	package/dot1ag-utils/
 F:	package/dpdk/
 F:	package/libecoli/
 F:	package/libyang-cpp/
diff --git a/package/Config.in b/package/Config.in
index def3db0e50..918c82550e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -176,6 +176,7 @@ menu "Development tools"
 	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
 	source "package/diffutils/Config.in"
+	source "package/dot1ag-utils/Config.in"
 	source "package/dos2unix/Config.in"
 	source "package/fd/Config.in"
 	source "package/findutils/Config.in"
diff --git a/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch b/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
new file mode 100644
index 0000000000..a3b370a808
--- /dev/null
+++ b/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
@@ -0,0 +1,60 @@
+From: Vincent Jardin <vjardin@free.fr>
+Date: Tue, 7 Jan 2026 11:00:00 +0100
+Subject: [PATCH] dot1ag_eth: fix strncpy truncation warnings with modern GCC
+
+Modern GCC with -Werror fails when strncpy size equals the destination
+buffer size, as it may not null-terminate the string:
+
+  error: '__builtin_strncpy' specified bound 16 equals destination size
+         [-Werror=stringop-truncation]
+
+Fix by using sizeof(dest) - 1 to leave room for the null terminator.
+The structures are already zeroed with memset() before strncpy, so the
+last byte remains '\0'.
+
+Signed-off-by: Vincent Jardin <vjardin@free.fr>
+Upstream: not yet submitted
+---
+ src/dot1ag_eth.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/dot1ag_eth.c b/src/dot1ag_eth.c
+index 1111111..2222222 100644
+--- a/src/dot1ag_eth.c
++++ b/src/dot1ag_eth.c
+@@ -122,7 +122,7 @@ get_local_mac(uint8_t *ea, const char *ifname) {
+   }
+
+   /* bind BPF to the outgoing interface */
+-  strncpy(ifc.ifr_name, ifname, IFNAMSIZ);
++  strncpy(ifc.ifr_name, ifname, IFNAMSIZ - 1);
+   if (ioctl(bpf, BIOCSETIF, &ifc) > 0) {
+     perror("BIOCSETIF");
+     exit(EXIT_FAILURE);
+@@ -159,7 +159,7 @@ send_packet(const char *dev, const uint8_t *buf, size_t size) {
+
+   /* get interface index */
+   memset(&req, 0, sizeof(req));
+-  strncpy(req.ifr_name, dev, sizeof(req.ifr_name));
++  strncpy(req.ifr_name, dev, sizeof(req.ifr_name) - 1);
+
+   /* get MAC address of interface */
+   if (ioctl(s, SIOCGIFHWADDR, &req)) {
+@@ -202,7 +202,7 @@ send_packet_old(const char *ifname, const uint8_t *buf, size_t size) {
+
+     /* Get interface index once */
+     memset(&req, 0, sizeof(req));
+-    strncpy(req.ifr_name, ifname, sizeof(req.ifr_name));
++    strncpy(req.ifr_name, ifname, sizeof(req.ifr_name) - 1);
+     if (ioctl(s, SIOCGIFINDEX, &req) < 0) {
+       perror(ifname);
+       exit(EXIT_FAILURE);
+@@ -250,7 +250,7 @@ send_packet_old(const char *ifname, const uint8_t *buf, size_t size) {
+
+   /* get interface index */
+   memset(&req, 0, sizeof(req));
+-  strncpy(req.ifr_name, ifname, sizeof(req.ifr_name));
++  strncpy(req.ifr_name, ifname, sizeof(req.ifr_name) - 1);
+   if (ioctl(s, SIOCGIFINDEX, &req)) {
+     perror(ifname);
+     exit(EXIT_FAILURE);
diff --git a/package/dot1ag-utils/Config.in b/package/dot1ag-utils/Config.in
new file mode 100644
index 0000000000..2dc906f7d7
--- /dev/null
+++ b/package/dot1ag-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOT1AG_UTILS
+	bool "dot1ag-utils"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  802.1ag Ethernet OAM utilities: ethping, ethtrace,
+	  dot1agd, dot1ag_ccd, etc.
+
+	  User-space implementation of IEEE 802.1ag, useful to test
+	  Ethernet OAM / CFM connectivity (L2 ping/trace).
+
+	  https://github.com/Bumblebee-Networks/dot1ag-utils
diff --git a/package/dot1ag-utils/dot1ag-utils.hash b/package/dot1ag-utils/dot1ag-utils.hash
new file mode 100644
index 0000000000..5d0b3b8346
--- /dev/null
+++ b/package/dot1ag-utils/dot1ag-utils.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  2dcec34d4c9849b7d15a88aedb65eb6911a813e7f1535222513f4c7abecacc49  dot1ag-utils-4886d70ba83166bd1333eb04df8198a8ddfc5680.tar.gz
+sha256  08f7c06906976be9ee27339b268a57a85900928bcb394633382a73268fdc3868  LICENSE
diff --git a/package/dot1ag-utils/dot1ag-utils.mk b/package/dot1ag-utils/dot1ag-utils.mk
new file mode 100644
index 0000000000..7d433aa498
--- /dev/null
+++ b/package/dot1ag-utils/dot1ag-utils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# dot1ag-utils
+#
+################################################################################
+
+DOT1AG_UTILS_VERSION = 4886d70ba83166bd1333eb04df8198a8ddfc5680
+DOT1AG_UTILS_SITE = $(call github,Bumblebee-Networks,dot1ag-utils,$(DOT1AG_UTILS_VERSION))
+DOT1AG_UTILS_LICENSE = BSD-2-Clause
+DOT1AG_UTILS_LICENSE_FILES = LICENSE
+DOT1AG_UTILS_DEPENDENCIES = libpcap
+DOT1AG_UTILS_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
