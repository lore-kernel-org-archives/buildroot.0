Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E16C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 19:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F1F400E5;
	Wed, 13 Mar 2024 19:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9iKZXIbWDhO; Wed, 13 Mar 2024 19:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24390405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24390405CB;
	Wed, 13 Mar 2024 19:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 364BF1BF414
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 19:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3090A405CB
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 19:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQpS0RtmvkFl for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 19:25:43 +0000 (UTC)
X-Greylist: delayed 470 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Mar 2024 19:25:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD164400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD164400E5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=77.109.144.132;
 helo=mail.ott.net; envelope-from=stefan@ott.net; receiver=<UNKNOWN> 
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD164400E5
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 19:25:42 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 484844801060;
 Wed, 13 Mar 2024 20:17:45 +0100 (CET)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id e3630280
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Wed, 13 Mar 2024 20:17:45 +0100 (CET)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id 8d8657fb;
 Wed, 13 Mar 2024 19:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Mar 2024 20:17:36 +0100
Message-ID: <20240313191736.847855-1-stefan@ott.net>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1710357465; bh=Jxnr0iWxW75acjQn/bNLIL6uTCNkNcLBiP1SUqCwIOw=;
 h=From:To:Cc:Subject:Date:From;
 b=fHEvLu0G83nirHzMPWuGMkDNRI8UHKaeCHpZmVr4gL+WOCyB1uK/Rwo+ZHNzOG5m7
 lRU2dmGL38KxyAPMIfl9kaaM9cN4nhPIEPBqEMBY9K+6iLKrBOegwohLc2GfLFQy3X
 mByekKo/5hdwCgmTURswhffpmLhLoX+pPBB/4B7cXc0p/1qXEZ62KkyxBqjizBxSLP
 Aunlx8wklDi5huqraXyyy033S5xCYMxQtNmalkj60QUVd6m815/qcq0GXwhbs8ZxhN
 iB76W84QPvSwI1SuQy+b7dj80PoCyWTOTy1zlMG7ZvshESaXlTxBZW+s/M4a3TrFV3
 JqbAxFJHg/N7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=ott.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=ott.net header.i=@ott.net header.a=rsa-sha256
 header.s=onbz5 header.b=fHEvLu0G
Subject: [Buildroot] [PATCH] arch/Config.in.x86: enable SSE2 on Pentium M
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Pentium M does support SSE2 so it would make sense to enable it.

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 arch/Config.in.x86 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 49823fe885..93a223b7ae 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -72,6 +72,7 @@ config BR2_x86_pentium_m
 	depends on !BR2_x86_64
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
 config BR2_x86_pentium2
 	bool "pentium2"
 	depends on !BR2_x86_64
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
