Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6DEEB4903
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 11:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FFE961113;
	Thu, 12 Feb 2026 11:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFukNt7MJuQW; Thu, 12 Feb 2026 11:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30D0F60DB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770894637;
	bh=Nu9HE9Bl+XtDOnAHsNiZwP30b0cuR1bgAwkYUsX5S0I=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Ufo0KTFkOHXfHScmJmVyjrGvinM850iYCocTDoGGnooM3dSReQg+yxiKLLDTREmk2
	 JHach6edHabbsJmwI0foPrz4uGT8348VSLRjl4LUDXNCNoBaX+IYHPL2rzNrqQnSUZ
	 NSU3kR8ooHX06KNapCfZqqUcHWrdVFyFbMpZe87j0SyX2A0iEJHBH51siRDPlRHJSI
	 D06THrFjvjSd3IKQKL0y289Go3mVCccqxsaXGH0PHV41NL+9Fm12mC2sHMPdj+zk9Z
	 bbJPCNZNgEbjd92BjkwEkD6dvSgcMDWNkvom+hvQ9tvn8RT193fIerGmfOJ5JTVNL8
	 BW6dNHiygrVvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30D0F60DB0;
	Thu, 12 Feb 2026 11:10:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E5DEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0FA740153
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB84aFZ9LPrY for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 11:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 235C540116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 235C540116
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 235C540116
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 11:10:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F0F41814BA; Thu, 12 Feb 2026 12:10:32 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 12:10:14 +0100
Message-ID: <20260212111019.4129325-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212111019.4129325-1-buildroot@heine.tech>
References: <20260212111019.4129325-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770894632; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=brihRI/Og+QOg0Uu25lalYXYPnmFzeTPia5Bk3UWAV0=;
 b=RnQA7yceAAX1GghiWywbTS1iULBNhyujdk6Wh8t/H2+XT3467CAcCMaWactgCI7zWf6NFd
 nQBccFELT60m1xLxiyzXzqvAbMpt4NYmC1L87lS5garUCUj/IplB9KFACeSjjqK/2tlmY+
 mdabRnl/cVO6kM8j9u8JiZ7+FGiWqPE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=RnQA7yce
Subject: [Buildroot] [PATCH 2/2] package/grpc: bump to version 1.78.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
https://github.com/grpc/grpc/releases/tag/v1.78.0
(v1.77.0 was never released, so no log)

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/grpc.hash | 2 +-
 package/grpc/grpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 130e098c9e..289a6f8191 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0af37b800953130b47c075b56683ee60bdc3eda3c37fc6004193f5b569758204  grpc-1.76.0.tar.gz
+sha256  e2ace790a5f2d0f83259d1390a816a33b013ea34df2e86084d927e58daa4c5d9  grpc-1.78.0.tar.gz
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 77cbc366f0..c99863e92b 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.76.0
+GRPC_VERSION = 1.78.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
