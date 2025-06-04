Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDEEC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 04:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC4183C18;
	Wed,  4 Jun 2025 04:04:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPYqe9Z5M0Jd; Wed,  4 Jun 2025 04:04:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC4C683C0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC4C683C0F;
	Wed,  4 Jun 2025 04:04:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF1D722B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 04:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B05B283C18
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 04:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXeJdn0xhvCt for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 04:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFAAA83C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFAAA83C0B
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFAAA83C0B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 04:04:52 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-231e98e46c0so57297635ad.3
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 21:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749009891; x=1749614691;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Il9QmL36Eyp87Mzf2kIZNfB+SwzIc6aliapgP+bdDlw=;
 b=tgQ45KA5weq+6BoAt8rPz47mWspM+W3jiUqjtPjIh2I8wqZIIEgxEC45eYtLkzWjQQ
 G55Q6iCIVNwv2hieC+M5IBaViuXHOaHRUeEYS+1K1hxgkfAYzgzwo7QxQ5yT2/8WcsFh
 PaSZgaH2k6scjne1AyTng2Camm/7FUAOdr3iPjxSRR1JR/zI2Ro6xs43LWjrSYY6NA/D
 FTjqnfb4NrGbo0R/cpbnaYY2x8lufdOMVVOWBNSSa18eujxdPF7Sy4xYHZARvURBKJ6A
 z8aTClBhQWUe0jbTxenOn++MJgB9O8bijGqfiGArT+3N1x9NSkonYzxFcMtrLbgqXiFR
 +bmQ==
X-Gm-Message-State: AOJu0YwlkVsqWVvoNUmKGO1BLsa+gQQljOSUmdRZxnjuJUCnVEGnACxL
 YDUiuxTJqIilaTwKCDYLvHR3FdOR4sGu5I8+whdjcDQBz6TkMIh6jFZxR27cV9dg
X-Gm-Gg: ASbGncvKCGRZO8q2TIWCg/Q20h0pqRAnUaQt6W2noxRwCqx/cJKWHcWIgtIUp9RqWG8
 84idI7GOPg+eDPUPd9n9Qzr3Wxv+DnM07SoPQlLCgPRF5SSr4wyUnb8lfTeTNOJbzl0pS6fioGh
 jD7NIGOLoOtYJD9eRBFXUMohk76FSIcWhDJcIGxlvlikN9AUUmBVn2ysW44yM/Yr0mgClUKbN18
 IP0wJrUmoZwZ7D1Dd+MgGKXKlp6eettm5/pPvV36l5NPTsQuVHbHXsdD/uD4O7h2Q2rRHKY6Ek0
 IDm192YitPKO/T3lAuReJAIVJPzBBdvzuhtQmvB9+Zq+7iR9zBK6h52+6zAuwflK+TsByYh2n5+
 v5w+NiNniDjiEKxVH56q6vzoLYoSSX3ApaPyDy+GjQglDBV4i
X-Google-Smtp-Source: AGHT+IHoKIIV3ZRynd/kh49fHFqDHtfLEg4V2EnRouodI/0AGBMx3MfWwqlI/dj80LFhn25vLaBSLQ==
X-Received: by 2002:a17:903:1cc:b0:234:db06:ad1 with SMTP id
 d9443c01a7336-235e0f0323dmr20686555ad.0.1749009891098; 
 Tue, 03 Jun 2025 21:04:51 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-312ea4dd30bsm1857078a91.18.2025.06.03.21.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 21:04:50 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Jun 2025 21:04:47 -0700
Message-Id: <20250604040447.95530-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749009891; x=1749614691; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Il9QmL36Eyp87Mzf2kIZNfB+SwzIc6aliapgP+bdDlw=;
 b=fqtANGbJC8dVeipAwhrxCCoq07CI4nnLYMo8ZNjk6M57uNUxBdodywjvBJNv7dIVQ1
 VJAzgLUyWZVkrzVlM/GWbXpd7W4nuEVM5eCNKQOydafg0uZyrN0svw03TMUQcIZF8J6g
 ocvnfBY/xp4k7n2ORnzTb8WvyeBSzgk4Wfn8dcFLWyaIbKrJWlO0sPwbjWKeVxD5Qw+a
 N93fdX5D2CNk3eShwWoSu4Iylu0/8iCNT5fGWbJfiH+mcVqMQVQxFxJ3gwTtnCghiL91
 jl2ofGApcqXRtP1ha1oDm0/IBE32ILuFsFJYpfzSRjTXoDsB8OvefKsQZu2ol2queXVA
 9mKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fqtANGbJ
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: bump version to 10.2.4
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
Cc: John Stile <johns@msli.com>, Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/dhcpcd/dhcpcd.hash | 4 ++--
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index d820f5e47a..a5d80b135d 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,4 +1,4 @@
-# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.3
-sha256  4137a382d1a203bffdf8e757bbdfd0032433d06e5c69a3785b88b83251f89616  dhcpcd-10.2.3.tar.xz
+# sha256 from https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.2.4
+sha256  6721e606609226dbf4d864a78802a9e96beec0ee034a1bd84138b3e037bba7d9  dhcpcd-10.2.4.tar.xz
 # Locally calculated
 sha256  3aeab006b01c1573b42d4440d7edad0adfe61ad05848ca82e02e745424a2b4fa  LICENSE
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 10707158d9..5504914003 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 10.2.3
+DHCPCD_VERSION = 10.2.4
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = https://github.com/NetworkConfiguration/dhcpcd/releases/download/v$(DHCPCD_VERSION)
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
