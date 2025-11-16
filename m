Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE4BCCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 18:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E2260B71;
	Sun, 16 Nov 2025 18:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tksV185QS3C; Sun, 16 Nov 2025 18:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604F760B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604F760B69;
	Sun, 16 Nov 2025 18:47:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8861F158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FB33404BD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKaOfcCvypTB for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 18:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0584401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0584401AD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0584401AD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:47:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BDE34A4C6CC6;
 Sun, 16 Nov 2025 19:47:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKhmT-000000005Xq-1PVA;
 Sun, 16 Nov 2025 18:47:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Sun, 16 Nov 2025 19:47:21 +0100
Message-ID: <20251116184721.3825784-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763318841;
 bh=08Bb5G90L7ncI5mOKelkXXSmXP5NJt0bqq/dFRceEmY=;
 h=From:To:Cc:Subject:Date:From;
 b=VlmtBK7mIzVncSEW4SlDHX+4e/oqGe/ZE1uCxP+fLZoQiQ+SBja0bCJrkEKwiERDW
 pn7i+E+su/B84a98HtxIBFNjKV8PMxN/Iu0RY7mcN3mAYwl7b8NKUshp++lu3jNTnO
 K5ERdmAcansSRTSNQWePAMdWSbhj5HBH/pnltLuvSlfBOYmVJEOhAODJ41jHIo9o6m
 g10upqKqYxiATwYESjHkSlKhp4S3KFg8d/NBeTlZw4wlJWn96zRpP9Xr3HZsqyMvvc
 Ugr0//QD32YdmpuNxqZwpTpF26VRw6pzvlRCfXh4aa2WWT9trgyZpY2Sp3//Zbq5/A
 czDxLOg1triqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=VlmtBK7m
Subject: [Buildroot] [PATCH v2 1/1] package/batman-adv: bump version to
 2025.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.open-mesh.org/batman-adv.git/tree/CHANGELOG.rst?h=v2025.4

Removed patch which is included in this release.

Upstream removed network coding support:
https://git.open-mesh.org/batman-adv.git/commit/?id=2cefbadba8b2c547058b7d2e5da96692ef3580d7
Add legacy support for the corresponding Config.in option.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed network coding support (Julien)

 Config.in.legacy                              |  6 +++
 ...er-includes-for-distributed-arp-tabl.patch | 39 -------------------
 package/batman-adv/Config.in                  |  8 ----
 package/batman-adv/batman-adv.hash            |  6 +--
 package/batman-adv/batman-adv.mk              |  5 +--
 5 files changed, 11 insertions(+), 53 deletions(-)
 delete mode 100644 package/batman-adv/0001-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index 24e627a28b..5af56c856b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_BATMAN_ADV_NC
+	bool "batman-adv removed network coding"
+	select BR2_LEGACY
+	help
+	  batman-adv removed B.A.T.M.A.N. network coding
+
 config BR2_PACKAGE_DVBSNOOP
 	bool "dvbsnoop has been removed"
 	select BR2_LEGACY
diff --git a/package/batman-adv/0001-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch b/package/batman-adv/0001-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch
deleted file mode 100644
index ab3f642cfe..0000000000
--- a/package/batman-adv/0001-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From dc072c88ef0eaa80215dbc25923678c6a3d46e25 Mon Sep 17 00:00:00 2001
-From: Sven Eckelmann <sven@narfation.org>
-Date: Wed, 16 Oct 2024 09:23:06 +0200
-Subject: [PATCH] batman-adv: Reorder includes for distributed-arp-table.c
-
-The commit ee60832ebec4 ("batman-adv: move asm/unaligned.h to
-linux/unaligned.h") changed the include without adjusting the order (to
-match the rest of the file).
-
-Signed-off-by: Sven Eckelmann <sven@narfation.org>
-Upstream: https://git.open-mesh.org/batman-adv.git/commit/fd3a0eff09429719e61e60b7dc3d2a373183a5ad
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- net/batman-adv/distributed-arp-table.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/net/batman-adv/distributed-arp-table.c b/net/batman-adv/distributed-arp-table.c
-index 801eff8a..48b72c2b 100644
---- a/net/batman-adv/distributed-arp-table.c
-+++ b/net/batman-adv/distributed-arp-table.c
-@@ -7,7 +7,6 @@
- #include "distributed-arp-table.h"
- #include "main.h"
- 
--#include <linux/unaligned.h>
- #include <linux/atomic.h>
- #include <linux/bitops.h>
- #include <linux/byteorder/generic.h>
-@@ -32,6 +31,7 @@
- #include <linux/stddef.h>
- #include <linux/string.h>
- #include <linux/udp.h>
-+#include <linux/unaligned.h>
- #include <linux/workqueue.h>
- #include <net/arp.h>
- #include <net/genetlink.h>
--- 
-2.47.1
-
diff --git a/package/batman-adv/Config.in b/package/batman-adv/Config.in
index b1fe5b3f28..774d930794 100644
--- a/package/batman-adv/Config.in
+++ b/package/batman-adv/Config.in
@@ -18,14 +18,6 @@ config BR2_PACKAGE_BATMAN_ADV_DEBUG
 	help
 	  Enables B.A.T.M.A.N. debugging.
 
-config BR2_PACKAGE_BATMAN_ADV_NC
-	bool "enable network coding"
-	help
-	  Enables B.A.T.M.A.N. network coding.
-	  Note: this requires promiscuous mode on ALL nodes!
-
-	  https://www.open-mesh.org/projects/batman-adv/wiki/NetworkCoding
-
 config BR2_PACKAGE_BATMAN_ADV_BATMAN_V
 	bool "enable B.A.T.M.A.N. V protocol"
 	default y
diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 8ed0a30635..947b75cb30 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,7 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2024.4.tar.gz.sha1
-sha1  36bdc78a00bfa51d8afa689be1b651b9da9f8860  batman-adv-2024.4.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2025.4.tar.gz.sha1
+sha1  ec1e431bda8bd6988e25a54ab18b5ff127fabded  batman-adv-2025.4.tar.gz
 # locally computed
-sha256  a554df6fc7abccc6b243f56ea7b184486c95ea986db1133f87aafe237da92f21  batman-adv-2024.4.tar.gz
+sha256  62490a8f8b58c02e819216f3e963249984645d3e460156a043b73fc53e24f86d  batman-adv-2025.4.tar.gz
 
 # Hash for license files
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index dbc96592cd..2ed090031d 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2024.4
+BATMAN_ADV_VERSION = 2025.4
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
@@ -25,8 +25,7 @@ BATMAN_ADV_MODULE_MAKE_OPTS = \
 	CONFIG_BATMAN_ADV_DAT=y \
 	CONFIG_BATMAN_ADV_MCAST=y \
 	CONFIG_BATMAN_ADV_BATMAN_V=$(if $(BR2_PACKAGE_BATMAN_ADV_BATMAN_V),y,n) \
-	CONFIG_BATMAN_ADV_DEBUG=$(if $(BR2_PACKAGE_BATMAN_ADV_DEBUG),y,n) \
-	CONFIG_BATMAN_ADV_NC=$(if $(BR2_PACKAGE_BATMAN_ADV_NC),y,n)
+	CONFIG_BATMAN_ADV_DEBUG=$(if $(BR2_PACKAGE_BATMAN_ADV_DEBUG),y,n)
 
 BATMAN_ADV_MODULE_SUBDIRS = net/batman-adv
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
