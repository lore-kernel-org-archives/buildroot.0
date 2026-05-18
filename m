Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12DDCD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9296B60749;
	Mon, 18 May 2026 18:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gfnj4fMD5DBh; Mon, 18 May 2026 18:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEFCC6077F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779130381;
	bh=lavPCc6KpPb+8KHWTzU88zSButbxV10JtRowLRls9eQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=bLcr3z4eEIjBMCEHRJiSa27aV7MmFgI9vmz7zEP/0bgLnrWD+EG68NI2f71waEuhE
	 nq2F5pt4JQEYao5CJ3gfE4+vepEyYpxf/r6cMtdDicTDw1CGLvVF3UmlFExQ+Np8iq
	 Z0YWXEs0ZeP0BjcG4t3bWtZgghjbaqW0beMNw9IUtup72/8qQ7kN19jf6hDxBIe5YF
	 Si6QUy0vgDHtsnhH/+6/Q/v3BRqAG4YIiB1q1PilrgZu9FEvrvXHMEGUieAejY7eYH
	 aZL9VoCLbsnshxLxCw8pwiyVeMFVS6wKBEr2MRR+l6SJn2K/bjNJGertePoSJmlx3H
	 Sn9eYC2A/gZIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEFCC6077F;
	Mon, 18 May 2026 18:53:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12EF01B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBEA16077F
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qY3MeREpmwi4 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA9E360749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA9E360749
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA9E360749
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:52:58 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E7F6A5FFC0;
 Mon, 18 May 2026 20:52:52 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Chen Pei <cp0613@linux.alibaba.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Julien Olivain <ju.o@free.fr>
Date: Mon, 18 May 2026 20:52:47 +0200
Message-ID: <20260518185248.237609-1-ju.o@free.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779130376;
 bh=cuhmigRWsR55DBdqxSslyvF7IjUSTbRxftkS3VHA3BI=;
 h=From:To:Cc:Subject:Date:From;
 b=uOk90CClOjcCXUYY+4y8F1r6gbQi/Wec5bs6elbj0ImEYGNkNR1DQUs8mEtGX84lR
 gOnRe45SyKY2i9rvmJc+EoI4e+8iJFF1cx0TmkNzj5zmT96UknR7Vxvf0dMV/XImap
 7Qbgqh3umZl9F9tMjSC3QY/WWWQI4TqevmtsKhpQ05uzGDpnCmwxam5FuuWgqmoB2j
 lLCLLxXR+yv/jsCubgR7h67kn2YBcBjWp3ZZnExrWVowwIpOoSTe6LslGedksNBg0Q
 stFSVIXilMC301Ye+IwRCRSaMKR/mbpBnYvjQu7RmteQds0+BJkBwi6LNmtRhSfx9r
 n0z+wXri5SNHw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uOk90CCl
Subject: [Buildroot] [PATCH 1/2] package/drm-info: propagate json-c
 dependencies
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_JSON_C
  Depends on [n]: BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
  Selected by [y]:
  - BR2_PACKAGE_DRM_INFO [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/drm-info/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/drm-info/Config.in b/package/drm-info/Config.in
index 49b8fd6f2c..1a6e11e696 100644
--- a/package/drm-info/Config.in
+++ b/package/drm-info/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DRM_INFO
 	bool "drm_info"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBDRM
@@ -9,4 +10,5 @@ config BR2_PACKAGE_DRM_INFO
 	  https://gitlab.freedesktop.org/emersion/drm_info
 
 comment "drm_info needs a toolchain w/ threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
