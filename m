Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0B9107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F106440EE1;
	Fri, 13 Mar 2026 21:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQo2j9-PVu3q; Fri, 13 Mar 2026 21:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B42540EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438687;
	bh=JitdZnVDMDchRSofTdl5ZeRf3BvIxwJ7Zj+u+CrlrJw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eq4Tf/mvrYE7vSxaRmkCuFLfq01J4/oqZwAuqR9X254K9zvUCFrsrJWY4NHTXJo5U
	 4ozy9AWd1UiY/+sCvjM13spv53sNxWq5oRI6ILglrKtzpQ6YMnEaLhDGhOTLzaQCQw
	 SgjOV7PYKN3wd26TL6yI/LVK8F12kDeAt95lPLAfWVQkILtWOxoELD4IVwgUybv/U9
	 5n5LsdlsfWJk3tWShrU/VqebRWHTJ7G6/PPvSvv5QqZwiYqeIrhKYCaP/puZsictbn
	 XpLhXAdWhLxNA/w6D3juKKDvqoxZo66wjVsgW0AtN1P419ZG7Fyi4AQHDqDpp7t5VX
	 mS2zAJ5PLg0tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B42540EF2;
	Fri, 13 Mar 2026 21:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4702F1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 392C140ECE
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVc2DPz-hzod for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AC9640ED1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC9640ED1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AC9640ED1
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:24 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 495FA19F59C;
 Fri, 13 Mar 2026 22:51:15 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2026 22:50:40 +0100
Message-ID: <20260313215044.2406044-4-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
References: <20260313215044.2406044-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438682;
 bh=4Tdo/w9U+4vUibJKvDGqfKxa5FTlMbut1L1YJpOOnhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZwI6NJ5By1wq+sgC2/VP2/sd9h113Cj1KA9eOw2ehM3189rIsYQ9YH6VMt7n3Q0uB
 Dd8fjSZYZ9BovkCAWCm2iyFpNz7Fg4QYJTjwo1qiBrIrFuaLThek5ew94IHN0ltrou
 Ld495piYJLV9aRW0f+W2/bPYhGjLO7R1TsqE+JLs/4APehofOK/BE+M3fzBpQA5kTF
 diesFCaU4JLvnalCsZ1u0tyAUp64yulemWeoMacowi8Z3cNvNnetvrsx6D9ujs2qNA
 AtjouOoZvX00ggS+E8nKdJl3n55bp3Yd3aaO4ptcqYuLQrz3l6x73/aTQdGOO3gZBi
 KakKHpa77DWCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZwI6NJ5B
Subject: [Buildroot] [PATCH v2 4/7] package/liburcu: enable host package
 variant
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

host-liburcu is needed for host-xfsprogs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/liburcu/liburcu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 656dfb2408..cf1b08e469 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -21,3 +21,4 @@ LIBURCU_INSTALL_STAGING = YES
 LIBURCU_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
