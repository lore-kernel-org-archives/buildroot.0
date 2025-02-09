Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D077DC02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 11:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DA3F81281;
	Sun,  9 Feb 2025 11:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzTunUH51m-Y; Sun,  9 Feb 2025 11:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A952E8129E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A952E8129E;
	Sun,  9 Feb 2025 11:50:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C598199
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 687CE400E7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIvqOxHBWmF8 for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 11:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 53EAB400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53EAB400DA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53EAB400DA
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 11:50:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb83.dip0.t-ipconnect.de [79.214.203.131])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2ED25A4C49F7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 12:50:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38034)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1th5pL-000000000q0-0n60
 for buildroot@buildroot.org; Sun, 09 Feb 2025 11:50:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Feb 2025 12:50:18 +0100
Message-Id: <20250209115018.799719-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739101819;
 bh=XaEddN6zGgacqqzZ1lyINfgmX02M9KQHDuVrx8V1gBo=;
 h=From:To:Subject:Date:From;
 b=JSbQEBPgL8I6v20FlJ6PSgbG9MjK1YvOyWFIHWMAa3zAoBNXpRx7dX3EwKN2qUvXc
 650c0zB3+amKcmn/kYJIjJCnpwCutWomd2ObzxFausXuM5XT1M6kSWrlHTwva577wY
 Ei7JSRT3/zZSi99uGGZHjJR/538sUli6EfXtw60Asxrleb/rpnsxAGa07gwfxX71gl
 afhFRk3loa74W76vOgD3Bd73uYCA7E3jw8EudhwHf/Vs9QRT5W08Xq87cj1xsvvpQO
 8yJcETlrft5g2RY1MUOnZ7/lMZRMPjRd7d8ONrVs0ex8qwLvEcledlLL2LOadVE9bL
 cTdcyE+/ywTKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=JSbQEBPg
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-iptvsimple: bump version
 to 21.10.2-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index d46bbbb2b5..59082d01be 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  865f70cd4843dfc0b7d2765e507696f4affc57d4afd97ec4a9382fba3f798ff1  kodi-pvr-iptvsimple-21.10.1-Omega.tar.gz
+sha256  4ab62a6ee946de406fa2ae502f9e7b1c591ff6aabc2777b5c26ad5b748e2cd02  kodi-pvr-iptvsimple-21.10.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index bfa9ef20a4..aa75fc5f65 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.10.1-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.10.2-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
