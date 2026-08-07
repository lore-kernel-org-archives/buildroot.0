Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD38C2A09B
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8310D81306;
	Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp9YU6boB-7p; Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71C38130D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107320;
	bh=YQIY9RA3N3Yev3JxGX1SVMQ2Snk1uTN0lQ6TU8uifgU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPq0P8JO8DGtFbO2qTn4KD5L6cnvxZSQY21pbjXQQAtknj+eHTnY6aSxfU20dxApy
	 SBvxxjxUfh2Pl2W0s5+cUepCezAocSBfSJcuRzGJLqJQtRMGmA0JKXW3hPsCd4akh0
	 ezT0Ne9HiA1Ltq3jLITwbjlo3hanlQ0dQe16cGINp5YkTWWN+iwkQ00I9nh2uqi6N9
	 eQE0IcYMjh/wHtbk3Sy2Pw1mDiXLLvWMAJJljI6asBQG1fh1pyToWmpZGhQ8veMyA0
	 DKog4NvKKBZBaCthJSRqa/tEpnYNfhaozt7LcekK3pS0p7rqs4zp0JgMyI0cpGS0DU
	 k/ByKBXt5//SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A71C38130D;
	Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00369392
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA91940A8F
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xMfys1zN6TD for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1939340A9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1939340A9A
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1939340A9A
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-69edc72e513so533533a12.3
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107315; x=1786712115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VotY1Ti2fs9tEwDbjDZ8ZU6sSLj27GKt3lrms/IHmKs=;
 b=P2p5MgujA/S4tG5RpKHGBEbLJxCUhXOI/Mjvz/E7oHndEgIRijBUuCEaI3ngznGxfT
 U5Hz9AwcM34PvgSc+LqrnsMYT7ubm2fSwp+P9/2I8nKFE0DHqYoBUoEJE/Pl264rGHxq
 UVHVQ/SPZCxJD+t3vY3PuiJpJ7QbcHj0qfp24/Ulmb1SWzvXvo0N+pg1oyynZWrxzTev
 OFvfOnbazPFr733Q3lppDpWBHZaj6GF/vvaZw6zai6qjMuY+uYsCogxsvzLRKb57hn7T
 FFYYQv5g357ZT1GVXCGOuL/kcvmqmaLG3nWR2byZ3COF7+gbvtQswhOUXGnpsTi5WVgJ
 6xJA==
X-Gm-Message-State: AOJu0Yzyxh69Gb/rzDYFjMG+R8y+DfA+afu1rP5zkaE3OL6eBoS8jKgQ
 9xqnqjtAMTwunRvIwFRlyEhviwLkRT9cLWnbj7ua6CpOakHWCGmnt085/Xh/ajWPpUKmaGy8z6F
 qFgxrnLw=
X-Gm-Gg: AR+sD11+7m9KnpaPzj/ADuDVVVtezVPSEV5554NFEluqm770XKd/W+W756L8CroMrSI
 pV743Y6KSwsHiwJzn50fQMgrqnQFPhG4YUPwX4WMzpFiOeSSpkDm+SpS7Fc8F5yw9scSBcvcNij
 6EJSqvwlZsbClZUfbWQJ5EGHbt8b/Pex6kAsRnRlWkp9nE6S/VHa/DpZ+1SU9jLNeAP4zLrD0w/
 ic/D8mVAaoMBzMpMbuizkqwYdyXdBRjQ8lYQBDiG5MyNYfKLTrvmuhI/YCDtQtffqLtXmd4Uub4
 r4fzuTePvKQLvoRIGCzqMzrEw7UBcVwLi7qbme2Yt1T2NabRRcpE5N6443PovmHP8KKsRlg8Dqh
 W53+l91z1iKRsgMum+CJcFz6MP0NxHRczEmGt2lOxquASAxh3jOynj957tTIesE4BbYsyOxdPuh
 h+OXqd+U5za02MBO6Ju84tsb5lP845YZBkBE3rOA6KgHNBTOPJQRiyB41YgWqJvqyRm/AxUHf+w
 d5umCIsmeZwTBg2g3sA94ZDsk+5zK3sQN+VuiyoMdS4GrarmnLduR5X4uyKozGgjd2s6KcJYNRm
 qmygTyibAEfG/kJXOzxf3c9RhU+fwoaSbrM+eeu2S5cHrjROPJmr5g6TTzOpRQhePEpNX7DqSbk
 =
X-Received: by 2002:a17:907:e915:b0:c12:732a:fe52 with SMTP id
 a640c23a62f3a-c2039d76e7bmr634675266b.4.1786107314815; 
 Fri, 07 Aug 2026 05:55:14 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:14 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:02 +0200
Message-ID: <20260807125510.1285300-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107315; x=1786712115;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VotY1Ti2fs9tEwDbjDZ8ZU6sSLj27GKt3lrms/IHmKs=;
 b=m43YPTlEJw7cNVxYNzexev3cjdfSo53TFrEfwxvdinxxipWStshSJlc1yFLI3miG6j
 X6xmhjgb9MgulfAAOd5lYJdTe9iVksZkwV4farzMAeQjSQr8enaCXjw7fLKiwNbbFrT8
 uy7YW8UniUPuQCCSgOMCP9A3vk/LdGWVC8Frs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=m43YPTlE
Subject: [Buildroot] [PATCH 03/11] package/mender-update-modules: bump to
 version 3745bbea3
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 package/mender-update-modules/mender-update-modules.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index f6de69c42c..08dd47cf98 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
+sha256  52b3b19bd3ad437caa7d1bce7f4766055a204909889f3436c8459da28dcef771  mender-update-modules-3745bbea3fc8ce73cf6489a58fb77dfb66660ebf.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/mender-update-modules/mender-update-modules.mk b/package/mender-update-modules/mender-update-modules.mk
index 0024acc189..d18b5111ae 100644
--- a/package/mender-update-modules/mender-update-modules.mk
+++ b/package/mender-update-modules/mender-update-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_UPDATE_MODULES_VERSION = d8c4683e6660af6c65069e10ee4b8ee50ec1af46
+MENDER_UPDATE_MODULES_VERSION = 3745bbea3fc8ce73cf6489a58fb77dfb66660ebf
 MENDER_UPDATE_MODULES_SITE = $(call github,mendersoftware,mender-update-modules,$(MENDER_UPDATE_MODULES_VERSION))
 MENDER_UPDATE_MODULES_LICENSE = Apache-2.0
 MENDER_UPDATE_MODULES_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
