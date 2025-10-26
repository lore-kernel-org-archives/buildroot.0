Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C42DCCF9E9
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 18:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF9D40F8D;
	Sun, 26 Oct 2025 18:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9H0AgCtPLtI; Sun, 26 Oct 2025 18:06:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9FAE40F87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9FAE40F87;
	Sun, 26 Oct 2025 18:06:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D765325B
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFBD640323
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeO1ANdLBRel for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 18:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C05D40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C05D40010
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C05D40010
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:06:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b64cdbb949cso867954266b.1
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 11:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761501983; x=1762106783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yyzQX3NwpODX8vh+/4RQ9FJGhox7ev38kY+STVpytAU=;
 b=wqk5IKZ7SiZzDTd+Tj8gwEcfAWNfzMdQEIOvE3wvcWSsyp5dZ2FVyZJ/EaENxhHUGp
 /Mg+Kov2rUhT116XXe+QcBq2HRMGnuA903fhQNz/IBE8v3jzTv4D/LFpZ7O9oi52UhTp
 dmDKW8TljJbDYilekDn8gJLBQ6M6IslWVK7AUQDvimZArLd/b2NFlhHVU6estB6wu2Mv
 zCMDYVZ8U27Z7n8/UU95yH+KU2W1F4sPGaXZ91TaQH6cnC1KXreOOLpO0DpDAMv/7h7c
 7sXVfXm2BzqFvln3QtF5UHkA+rEL/rCmYR0fcouqLitz6y2tRw0BtBTPMGGdwlyNozBp
 7ljw==
X-Gm-Message-State: AOJu0YynPtHQsW/tlFdPMnDDOBTaqt3KLnqvYHZ4GRw+kWlJjSbwUcXe
 nlxOyP8//6ACj5CfzvcHQRKCtFHqKt9zGQfWAtC7dtEczzTKAInBkVINu2mp/s6usixgPn57OUJ
 mqY8A
X-Gm-Gg: ASbGncvPhiLOCGlWcOj162+yPiXENl/chqgaShDqImz81jTKUqFbAOS3E+4mMNFYGq+
 rQ+I49+nUjvgkByUlhkyFkoxRL5EWRWnWg4Lis1Nwb+jl5rjxv1XjqT9Dw4YFWm62knBsRxOAil
 GnbwTz1M6Bx7EJpJJbvnSx/dcVVWqe2b3gtGQv/ZUKO8V2noNbRdtPbnQMWzxhE5f8VA6QzfaPF
 bwxcSko3vWKlTuwwkGEJohyqDP/ptK8+8kIvJo9+TwMVlbUUTZuqdcSWiBkJQh3nuQmFmvokPmi
 sJOuzUoDdDFRogOjUhlu7yXmgorQq9ihcFKAmtG9WoZkCRfd5Co6AacjQxAyKNXhTU20ZIP2w6O
 QHNZXs3PXc48M1VLenfzqpD2cr2eb+dGlOATliLQqIyR795F9cDrFyq6MIKSdcegJN9o7pMsSO8
 dp5UxMMCIzKqvPZsuWJAxEAuij16Hw2ef/Gd+P0KMW7DM6n6/sn/uOmiwJ7MgwQk3MwnG/fVSfX
 FJhDSDRyWECZb7s4Z9qiV+ir31Z0RU3v2graSc=
X-Google-Smtp-Source: AGHT+IFqxUJhhu0uAzdU7c91G6nAUp3EPlzwR7dUykyow7TGnJhKQRgtcamLEf4h8qVkd78Lbe1HfQ==
X-Received: by 2002:a17:907:3e90:b0:b6d:6950:a7b7 with SMTP id
 a640c23a62f3a-b6d6ff66da7mr854890966b.44.1761501983204; 
 Sun, 26 Oct 2025 11:06:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-58-41-5.retail.telecomitalia.it. [82.58.41.5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85359c0bsm528965166b.24.2025.10.26.11.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Oct 2025 11:06:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 26 Oct 2025 19:06:20 +0100
Message-ID: <20251026180620.1253575-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761501983; x=1762106783;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yyzQX3NwpODX8vh+/4RQ9FJGhox7ev38kY+STVpytAU=;
 b=HhdW5EqyuiS5I6pw12/MDgmXwfrzJ4bfckdOXqI0CWXQi3r57xpG3fsbAt8oL4/1nK
 WIK9rGeOH5Ul+c2HtGPUJutT9aKitxu4ZmUQk/ax/wK0ff4flimdlWrfa6S7s94WxvnO
 yfrx/LU8l2xg8CtiBg1dkKDwtppA8bHGJ4Zzw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HhdW5Eqy
Subject: [Buildroot] [PATCH] package/atop: bump to version 2.12.1
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

Release notes:
https://www.atoptool.nl/downloadatop.php

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index aeb9a469d7d3..7b4bd2e942fc 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086  atop-2.12.0.tar.gz
+sha256  4fdbe67c5dfaf89405639e18599f4eae77978073ffa54f3c78c368ab54bd12f6  atop-2.12.1.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index b4a5bda52e40..346bd0ff5718 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.12.0
+ATOP_VERSION = 2.12.1
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
