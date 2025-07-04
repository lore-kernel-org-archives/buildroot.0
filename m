Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5803EC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207C940E7D;
	Fri,  4 Jul 2025 16:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYGBp61B7yL5; Fri,  4 Jul 2025 16:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53D3641187
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53D3641187;
	Fri,  4 Jul 2025 16:53:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A566F7AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B54841187
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln60GRL3zcTH for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:53:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C56CB40E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56CB40E7D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C56CB40E7D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:53:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D40BAA4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:53:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56554)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjfM-000000005n0-3cH3
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:53:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:53:36 +0200
Message-Id: <20250704165336.3647761-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648016;
 bh=ERq0Vioh8YZ+MYGwXFo3r/pVFS4YYgb9L/d6dYcRr6g=;
 h=From:To:Subject:Date:From;
 b=L6fl1BViAzYD3p+dKN6qsru5KjIUtYw17L84ikd0xmBTnzPfQrILKcMzJNA2AxJif
 0idXDc2HMMZtfX8VF9uoMcesXyHRmxYQ7Hy1SWGqGUGqM3TAfqc3yljBhwF8BYaoOh
 PSok4gkXuuwgH/Wm49Xo8XzAQ2iw4W+ifK/58/OK+EdHZsP5+Rn2Bcr3QP41z05TW0
 C1e0Y09lRuMsAa0CPtJyiYgouY/y14IrdrInc9AQMxR8gD0khTZwyL+ls84sKZtCgj
 QHhK1Qhq6ZgopM4OUmELVjKSOF0RNEF08SZl83u65FfIxO0+/kqdlG/WztUQq38DrO
 1X4HnzQr8P6uA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=L6fl1BVi
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.20.1
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

Release notes: https://github.com/strukturag/libheif/releases

Version 1.19.6 fixes CVE-2025-43966 & CVE-2025-43967:
https://github.com/strukturag/libheif/releases/tag/v1.19.6

Updated license hash due to upstream commit:
https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 26b21e1897..6c129873cb 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c4002a622bec9f519f29d84bfdc6024e33fd67953a5fb4dc2c2f11f67d5e45bf  libheif-1.18.2.tar.gz
-sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
+sha256  55cc76b77c533151fc78ba58ef5ad18562e84da403ed749c3ae017abaf1e2090  libheif-1.20.1.tar.gz
+sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 4783ada19e..f6e14888eb 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.18.2
+LIBHEIF_VERSION = 1.20.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
