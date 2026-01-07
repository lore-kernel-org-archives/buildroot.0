Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFFDD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43B740FDF;
	Wed,  7 Jan 2026 17:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anhPslOYZmnk; Wed,  7 Jan 2026 17:53:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3251240FD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808430;
	bh=cAjY37M6MAwrVgLvUOyi3UsDw24LN+eisO+JRIsOAvc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Eikw4Zq8UFFuQkEBI5FiE8ZOv8PIJcm40WSkVmGwPWZhqAVYc/5pQ7JvfYxlfwPDa
	 rcUuegQk6Bj4tYH3dxvHU07oxWxOfS74APtsQqM/hsb4S/Sp789BrFG6yI0jhBLJmn
	 WRrYq6mkSZfluP/6snEGd+KjkiE4ApLaeKAsLNIo13/YRbyZdmG/LlnHq61wx9KWZb
	 58Zv0bFLs2lbYChPOaIj74jH7dEPtWVKkmYsLJDeiKrjG7IjNDxTJnAkEwv0ZZGJvG
	 jLj/FdqNexIQx/y8YOJ5Eu6FCilokG7yx7vN9hWmrOWBRhXAds1SAB9GjG6Q4fz6Ef
	 UgVI0fhC+YcIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3251240FD4;
	Wed,  7 Jan 2026 17:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F79B25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258F160667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQtv9zNj08-n for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:53:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1213E60661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1213E60661
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1213E60661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:53:47 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5F23813F8A9;
 Wed,  7 Jan 2026 18:53:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 18:53:39 +0100
Message-ID: <20260107175339.2469977-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107175339.2469977-1-vjardin@free.fr>
References: <20260107175339.2469977-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808425;
 bh=aWtmX7fNFDCZ8hVUI+QRnLri2e+Y/hZ2NYHtZlZJ5fg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tOnsRP/hcd2ePsEP2RL563V3ku+0u249oYXc0UiglVLsQnHzkbMMmZjOFpwkumoXd
 3hkx/T0KoqTEe4ifElpozfpXHCoi9Wz41SrrDV0GsCywvJiYliFPYIx4SCDdDr04sH
 2C/PeYCDz4yvZws+GTaN112xNCw53kBOPNWBVW/2rsgrm4Wmdo77T7mfbxskPcvBMC
 QSuEta/Opux3N4BUbgjnIGn+v8sScePGKtnNitDCdVKCDOclgo6ulwM4q9GnFAdCwI
 9PpgveNAvuil3QLrWUQTYgO4iRQPjCu42+mixNDRqspXJdFmgauEnfO+SrZ0MRxqwL
 wfLB8ncgnO0dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tOnsRP/h
Subject: [Buildroot] [PATCH v1 1/1] package/dot1ag-utils: new package
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

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...0001-fix-strncpy-truncation-warnings.patch | 59 +++++++++++++++++++
 package/dot1ag-utils/Config.in                | 11 ++++
 package/dot1ag-utils/dot1ag-utils.hash        |  3 +
 package/dot1ag-utils/dot1ag-utils.mk          | 17 ++++++
 6 files changed, 92 insertions(+)
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
index def3db0e50..90e2b085f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2433,6 +2433,7 @@ endif
 	source "package/dhcpcd/Config.in"
 	source "package/dhcpdump/Config.in"
 	source "package/dnsmasq/Config.in"
+	source "package/dot1ag-utils/Config.in"
 	source "package/drbd-utils/Config.in"
 	source "package/dropbear/Config.in"
 	source "package/easyframes/Config.in"
diff --git a/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch b/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
new file mode 100644
index 0000000000..b987a45aa3
--- /dev/null
+++ b/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
@@ -0,0 +1,59 @@
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
index 0000000000..eabe0d9b51
--- /dev/null
+++ b/package/dot1ag-utils/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DOT1AG_UTILS
+	bool "dot1ag-utils (IEEE 802.1ag tools)"
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
index 0000000000..1cde7299a0
--- /dev/null
+++ b/package/dot1ag-utils/dot1ag-utils.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# dot1ag-utils
+#
+################################################################################
+
+DOT1AG_UTILS_VERSION = 4886d70ba83166bd1333eb04df8198a8ddfc5680
+DOT1AG_UTILS_SITE = $(call github,Bumblebee-Networks,dot1ag-utils,$(DOT1AG_UTILS_VERSION))
+
+DOT1AG_UTILS_LICENSE       = BSD-2-Clause
+DOT1AG_UTILS_LICENSE_FILES = LICENSE
+
+DOT1AG_UTILS_DEPENDENCIES = libpcap
+
+DOT1AG_UTILS_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
