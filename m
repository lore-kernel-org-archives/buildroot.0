Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD0DC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 10:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2658A606A2;
	Sun,  8 Jun 2025 10:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-nP3N9w9phR; Sun,  8 Jun 2025 10:56:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6DD60DA0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6DD60DA0;
	Sun,  8 Jun 2025 10:56:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0B6C1A4
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA7FB409BE
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TR2YGxKgt4Io for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 10:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DFAF4409BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFAF4409BC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFAF4409BC
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 10:56:42 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2BFFFB00579;
 Sun,  8 Jun 2025 12:56:36 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2025 12:56:28 +0200
Message-ID: <20250608105628.13576-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749380199;
 bh=U8QRjJQH/J6WuxTkv6uL6h/xipBnTJf+RlfhZ+ACDRE=;
 h=From:To:Cc:Subject:Date:From;
 b=g29ZnUr9yGXu6SAhLwgCK3fb1/OEzNV86jw0Mu7MCEC9xoeVlD9ZTRJStsKFkP+/y
 jr7a92Rdcp4ZAbuf1E3N7akQ/8McgNeDnaTpP0jBoYiMuO2bqcs1cxhIbeyhzaS+r+
 uoyzKcmJDq5Ld6TX7vjWTf3lHyBWjs23mMkiA2oVGAmojf9IADtRXU+7at1tq1BYV9
 YDbxxZxFs1VWX2C3b8IM7fcJyquvhKPVCRYqZ0bbNoVEAMpdIU/dkkczAL0EjPeCbk
 mIwyU/0kTVnL6myb/tYiui+mrJ3YLpi6zHbGG2WQHndmvEOTx6g/EryYzYdylARqSQ
 kyX2CTX1FELHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=g29ZnUr9
Subject: [Buildroot] [PATCH 1/1] system/Config.in: add missing MMU
 dependency for catatonit
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

BR2_INIT_CATATONIT config, introduced in Buildroot commit [1] selects
BR2_PACKAGE_CATATONIT but forgot to propagate the MMU dependency.

This commit fixes that.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_CATATONIT
      Depends on [n]: BR2_USE_MMU [=n]
      Selected by [y]:
      - BR2_INIT_CATATONIT [=y] && <choice>

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/6dc177bee8b7fe1ae1607bd7c0819b0dc63397d7

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 system/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/Config.in b/system/Config.in
index 8ff6c7213e..da9e20a35c 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -151,6 +151,7 @@ comment "Special purpose (read help)"
 
 config BR2_INIT_CATATONIT
 	bool "catatonit"
+	depends on BR2_USE_MMU # catatonit
 	select BR2_PACKAGE_CATATONIT
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
 	help
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
