Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BE2C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 10:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3324E6078B;
	Tue,  7 Jul 2026 10:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0nxvVx7eXPC; Tue,  7 Jul 2026 10:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F79D606E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783418927;
	bh=3b5m/4y2ZD7zfy3CT5XxQb/dHfNtiBtuxQd2MKynttU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NgVa6T4R0GG7wxL9HOp5DgW/l6nntph3qCMWvro1Ga8/bTdssk9YxOMVnrIK4SZRj
	 d7E69d4vDutRmE4lZOtN4WDrPKwnPnVcle266tEbWGSP8amVM1Vp/0h0bPCXGVg/u3
	 cFr+Eoj7knsLJZ6qGLqAIABdD1k6e/JxsKJA/ZdQIaxv1Pt6A9kcnKTHBrmmBKcPZf
	 nmoOaPj2+ynMOIJJM9uYdT69/IRHSRavAhD4HnxzH+mWOg9XXz+EpUrTE2OwA2+Uql
	 b400pt/rOFjAnp6jd82vMLarTuTmRHQu7hv6x/EeFAPaZamSQBmGEMGAG0cQWL3q0n
	 PbD8hUAkmIDTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F79D606E2;
	Tue,  7 Jul 2026 10:08:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 704052A8
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56625606E2
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btCKa-GJCd5j for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 10:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54915606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54915606A9
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54915606A9
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 10:08:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-474560436c3so3815140f8f.0
 for <buildroot@buildroot.org>; Tue, 07 Jul 2026 03:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783418923; x=1784023723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SfrKduvOA4pyH719T56zA/K8ARfEt0/R5R3om6ekBag=;
 b=pkh+gO1MbK6avDOiZJY0YV3nDmDHEtqQny7uYYA8X+qs1iWEb/BNJJCxbCIgaJmUcU
 UmjfAyur+qOZlTQYTcwTwNojAuEF9qaCKY0Kb7HYKAwAc87DCb4BajQwZ9ZPCYkSGKsG
 bOLEO5E0OoYWDUFw0S5pDEjQbNNEjnAxX3C8ymydChZFI22GUGVeUFQ6MWR2tKwtUgWu
 sbwLmnLDOC5ohTdaJaSHd7u3xor43FkpB4TWBaxbMuJmrm7hMGh5cKy5G++0rhkZlwaV
 ctki9CEGHbrxrM5pnOmLkOet63JpQw1DPEyEqgzgGsa8UVW0FA0GGXiWeGlUAABHqMZu
 UQmg==
X-Gm-Message-State: AOJu0YxJQjmIrl2weHCqVgWvqrn+NtXN1tSxJyS9O5StQH04VWIJfjoT
 cUWR4jRzTgf9j0KVrK91p7z67Sa6tu2q11C1rm1DgK1jfmC4hrb+L1WdGK1IPyhtGBy/ESgggAu
 bJjMN6vU=
X-Gm-Gg: AfdE7clFvpK5bwDN6E6aKPTcvwrWiwzzw3dEDwIyA6Uh96mT7FfaVRE4uxaZbb8ZeRe
 1PKwzf1Q8zd1aFtAcO5W93qWKNGeEE8dIWD59mu/TttWSr/p3tfxR7apE/a/KAEFobV/JPfYA2w
 OzzXBMF8am9Hld/rtX8D7s4rr6DxdMRYiJtoVZDx3kK4xluFRM7yLIvENyEMqqU6+xOflKGdyTK
 mPDb/lyGiuhXs5SZgTv5MT+m9rfkrdhBcQaTkMtKIHgirEscSoFOwylustRUySN1gvSD/G27GBt
 I1qCA/Wkldj/72hY3kMadtczB7uLjSoNhjO1v69ypVY8WXBfB4UJzo+muwGooG6RZXYrGSRW4VB
 U+JtjvDhGgzBfkbAc3sajCtUBo9/df/AURjd4JrPuoVHtWOA9b+bPHb2T9NZeLVZgavpIpWmuoW
 N3VcuwTdNZ/XySuZFCosqgF647gtKol73bmasV4X0TgrVZHw5+4kJ0r+xIlg/OqyyGlu2DcMrVj
 XeLe0VenezQ42DZS33znKkYNPGvvcDkxNeQk+3bv/GV
X-Received: by 2002:a05:600c:37cd:b0:493:9661:f55d with SMTP id
 5b1f17b1804b1-493df09a412mr48872425e9.30.1783418922926; 
 Tue, 07 Jul 2026 03:08:42 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.93.155]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0fbb410sm45612475e9.12.2026.07.07.03.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 03:08:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue,  7 Jul 2026 12:08:35 +0200
Message-ID: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783418923; x=1784023723;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SfrKduvOA4pyH719T56zA/K8ARfEt0/R5R3om6ekBag=;
 b=lpvz4vcDpem88ez2QvfWtsqX0n1QBPNCb8mNUhtnhW/t9kqwuc5LAfGIzOPFs3cuc+
 lPiiuKdO8U5/wn3l+ly2zRohsUsUMyphIKp4unBjqBHFKm6LWopUE+dGn2N7uBW9CQte
 9aIIg0X+EWmYaSGon7uF4Vmv2cRJeTBr1WpqE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=lpvz4vcD
Subject: [Buildroot] [PATCH 1/3] package/p11-kit: allow building host variant
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/p11-kit/p11-kit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 68b189418396..1755edb64edd 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -45,3 +45,4 @@ P11_KIT_CONF_OPTS += \
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
