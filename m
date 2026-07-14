Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6042FC44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BB2160A6A;
	Tue, 14 Jul 2026 13:15:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuk6jqPbedEi; Tue, 14 Jul 2026 13:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 158B5606E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784034909;
	bh=TsCSXJEIvu/ApnkWHBaC79M0cHCkrbdZrEbBMJdy0VQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p9qjUyIAXWPVdLKtAdr0xbWvnEVxXKDv6rbvKT4gY3BqtRVoOA3mi4PRwSAhuMNoL
	 VqEI0/1jhN0nDLlnmlebjkmjRMypgAeXU/uxfVsEV8Hax3a2FgXNZAgbb3rjTs/LRx
	 F14sIqRzvcavnEl7Quv9mrSXqRpL6II7Gs3cc2Q9Ln7LIskKq9Rlfo878hU3Mp07CY
	 ceVAsAiRaVWcbFXKq3Tz84ynBI/yLiysG18gixlcuoHPekcpiiOUl1WFwa7/Bw6+zG
	 bIwMV6w0l3JUujrNdhXgb3wLEedBNPvk3/0nbWTyj1CbmL3fWMmX/1YF+iGnmUIMjO
	 iuNkqi9KyFplA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158B5606E7;
	Tue, 14 Jul 2026 13:15:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 663F496C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 13:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FA19404C2
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 13:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nx0J_sCuMbaP for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 13:15:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90AA840081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90AA840081
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90AA840081
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 13:15:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso4233800f8f.3
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 06:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784034903; x=1784639703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+jZ3tZ0x+/9NpcP47G2la/7NVP90YqMTZLKQ04c/GvA=;
 b=S2/w/TCWt2WMBGYrYarLP/rltDlpBLsGqfPmT28S+YhlHH0gvSrUNZQstUmlKgm3l+
 APt5ZsjV+aJS1Ob3YMOXyPmujXnODcDQYkz6WgOaLetBGY+nnSUvrTq+ONYFhNLMcD3F
 WjCUYRrKeUFJtqnGMdeuLzp9Uh2wxVikv2s/QljOGgIQYJc5EvowDIpbv3/rubQBmQvG
 tTrF/5z1VcaO5tpA2p7dd/Hs1RU+9YLPClaSgaiDBCJrRzrc9nPiiD8lPNFfNlPAPUze
 PID7dTcmfQaZ3jttJ0DQyDYj+Pedj7wRyLxHwFn0if1PSZnUvbX2pLg9rm0iFBhFRXfT
 oPCw==
X-Gm-Message-State: AOJu0YwDtM6Wc8CqiosWsV8gNo4VOkR9sqW1FaqJYKn+NZ9ggSQP8mv6
 ZxUzV3TzAiSxFGkb1rGjlPAffmw1SKGAuLa4zVNllxSoSInJLKNHCh2zgZ7H
X-Gm-Gg: AfdE7cn9LOIYqHG/qqG4ZIdDFwqPAOM/s8tyTKZEz3dapNSDbFalopPYQdJDEe5Fuec
 w7oSI54txBr0UyGpW6i7mzDSV44wMJWrR9T7djUfj3gKwQbLW0WAHIWpFRIjpBlarGzpW0D20iR
 0qiUw/Nvm0083h5Z2UzJP29sP4IyGBFtCUwCFHRg++3LRMJD7YQukEnx39prUTnvmHcvR2zp7Ny
 LBrAMGke6G5b0WU3cROsLbML2sFyRSx5Gr3+BP1iRNHVO8N7mX/xGF1yk5r2xKVKUsIrBux1cmz
 466P/kue3SVvoZyGVA8JKGkW2DHh6HoAczYSSVpTp6YdP2VaGb3juiDnr1qDXB02pGJQtQiI4Np
 ODHAHeHweG7n4KMcBbIwWHTst43/IX4eW4JQW5rF+jvMpw+ATtbW+tUeQudXrEm87zi+pxczlW5
 HBD0EOdNM/T6+iB4kjAhUxJ8qCxrNXIt9N7tFZgQ==
X-Received: by 2002:a05:600c:3489:b0:490:d38c:7836 with SMTP id
 5b1f17b1804b1-493f87d66a1mr128348725e9.3.1784034903111; 
 Tue, 14 Jul 2026 06:15:03 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635aa34sm7588289f8f.15.2026.07.14.06.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 06:15:02 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 14 Jul 2026 15:14:44 +0200
Message-ID: <20260714131459.579633-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784034903; x=1784639703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+jZ3tZ0x+/9NpcP47G2la/7NVP90YqMTZLKQ04c/GvA=;
 b=qY9Ms9KIMi8QMJZlwZDTQOjEDmu3sIFurpCmswS8VRg2N/nvsegFK9xN9c+rbbttqe
 ooA6JLt9IuBgKk/dKtNr5Iufu+OdD10keHqsO9x37fi/U6NvVpZzLaexjiwzOsKsNvHQ
 jTIQpvA4CnQqGirSiXdvdpNvs4Iizf3aiI8IBHS7y967cZ/xPlBFWIW53hI+3PazKKTP
 /p9maS1ZieT/LuflU6OfLZNJLEfSsQgqWyk0KP9k+x+uXbg316XrdIXbYxCr5pwYiUvk
 g78+R5YG88SlIj5BtvpH0oNLx2TotzX3P3AF1tmYjAUx8tcbEYU8QUUPDo0S485lLo1u
 Ad0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=qY9Ms9KI
Subject: [Buildroot] [PATCH 1/1] package/zellij: bump to version 0.44.3
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

Changelog: https://github.com/zellij-org/zellij/blob/v0.44.3/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/zellij/zellij.hash | 2 +-
 package/zellij/zellij.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
index 90e3332dab..ac6a219270 100644
--- a/package/zellij/zellij.hash
+++ b/package/zellij/zellij.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a246ad21d0317fb184d150feccea1bf6a24443c88b97ae32bbcd201ecd174a1b  zellij-0.44.2-cargo6.tar.gz
+sha256  2a565f28d89c9e8caf2bad7a0f07f03747e3d3ee2d988297a41d1ffcfb034237  zellij-0.44.3-cargo6.tar.gz
 sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
index f1828cba78..4b4e7d6a3f 100644
--- a/package/zellij/zellij.mk
+++ b/package/zellij/zellij.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZELLIJ_VERSION = 0.44.2
+ZELLIJ_VERSION = 0.44.3
 ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
 ZELLIJ_LICENSE = MIT
 ZELLIJ_LICENSE_FILES = LICENSE.md
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
