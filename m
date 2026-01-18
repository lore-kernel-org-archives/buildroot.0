Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE75C98315
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E8A40231;
	Sun, 18 Jan 2026 22:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZlrcZBqYp53; Sun, 18 Jan 2026 22:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA8040235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768774888;
	bh=UPK+uAOAeEKFLmo8wDAMwredxwGr1yl/KsVUuuufP1s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mt2v0NNXLuX6GeM7+1FbeK36tWspUT/F2gz+QD/+wMGGzowertmbrxNDXG4v7i73L
	 hDsQ1mHTTEJLEd3ATh6Vz3n1bB84I8MtonuUro85oUGAx1EpBEwa0WZyBSIkODeL+V
	 rVMiCFLMGYL79PfmUKcjQRC1dd7SsmuPnXuYfDlhvFBmoLFY6jOi2aWRjeJThUcF3c
	 qld9AjqevYjT4UdWL7Oos3Pujhe78tV4DXW67nfazLkJh1dqmxpLFcoKKuSfctJJCR
	 kNObdDAwHO7t3ZppxqAFe0V+d/c14ekI7Vu9sDJmKApiagBbnC+RUEJ66fOf0iKLGP
	 7rZT1lORKV3lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA8040235;
	Sun, 18 Jan 2026 22:21:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D2DA12CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C154260705
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FD3ebPIOkSJp for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68CE5606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68CE5606F6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68CE5606F6
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:21:25 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:17d1:a908:70b9:90c3])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9C8032003C6;
 Sun, 18 Jan 2026 23:21:20 +0100 (CET)
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
	Vincent Jardin <vjardin@free.fr>
Date: Sun, 18 Jan 2026 23:21:15 +0100
Message-ID: <20260118222115.71411-2-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260118222115.71411-1-vjardin@free.fr>
References: <20260107233633.2870caea@windsurf>
 <20260118222115.71411-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768774883;
 bh=VOZVXL7omcTzHhrOII3xuqJfM4FkrAlhI1Bmu3ziNU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gSPjmFxEpeCo8jyU2C+X8V3gLzsOx4owEN+TnJt4D+VCCvhFiSsblV0vdxGIqDP55
 pk0myc+NQBJem3K9OJq6HXXJ89QY/ujauuMIdpdEF2BeFmV7GPUh8W+0loS2YVBHpE
 AStnrwKPzy2QmZtTva8Hn8FdILgaE/GDauBr39o1ZurHobx0L2fj29oYjd33ii9wiP
 BhG1/4SqoMU00H9mOFu6BOfVyEfI2sTg3Tn+KLhq8ahfCCluNlDJ8ug5Fl5oYieL8h
 3bZTyFtFT9TKIFiTAk7Q8UdrKwkq4JFaAV7RIfDMAXuxmO7UpsHjlLknMCdnEJ78JQ
 tgtu8bC/1XlIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gSPjmFxE
Subject: [Buildroot] [PATCH v3 1/1] package/dot1ag-utils: new package
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
