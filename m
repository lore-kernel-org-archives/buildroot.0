Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346EBC48297
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 02:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1FC94042B;
	Wed,  7 Feb 2024 02:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw_wltmaCfcu; Wed,  7 Feb 2024 02:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC46540515
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC46540515;
	Wed,  7 Feb 2024 02:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBC731BF21A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8BB540515
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 02:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSytpYDEos9n for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 02:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDDAE4042B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDDAE4042B
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDDAE4042B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 02:33:00 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d73066880eso1691695ad.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 18:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707273180; x=1707877980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wm2lSFUVUUo2WJA1TyBFNtFTYwmNMc46hMoKku6+40A=;
 b=oiiLQcE40pOgIUqZI1hWi9wbNiWRszw8vKvUykkyYfTaevnF2anN+jfrEDIfTh2Ag/
 FYC1LUwSk/umJSiomvG/leHIqSjE1+6FQQK+UHNL29Z5FTIjB/jDMVCdj7kR/L1nj3pI
 DVEvu/TcPxbTCchrhLS7N4og9DkcP/b9hnvkEihGwV2u4uIa4HAuS0n+wn+QE/AQFLLa
 u/9T1To6CbotTVCtEOIp2vQrJ9Isxans2NjqRbIfNx3EiWyq2Mhf0CvQuJA2WF8Wof+8
 Z+DArbRNbJUb/lGgQYBCgfwKTFKtrc0bWSnz0SFrwof2BCsTaaNaG5eoZAjX3SMeuZ/b
 NyXQ==
X-Gm-Message-State: AOJu0YxkfI2ayklbcYigRcpdhAH7Gd1SGNFpCpQABep5Sg0CUW5OO5wa
 aI14Vf1Ut+Qb+qgS+Td3AFHY4b3ZDyxQYW7idsO8LdHssSuyLoj+8iuEs53KA8X+oTpEhM1pSXm
 B
X-Google-Smtp-Source: AGHT+IEAtJa/Ng+rx6bb2MAM45oPNFbOe7jfS0BaoH958zxcLQzEPdyMokJS67yw00TgaQe2tyFovA==
X-Received: by 2002:a17:903:595:b0:1d9:f015:b226 with SMTP id
 jv21-20020a170903059500b001d9f015b226mr23696plb.13.1707273179980; 
 Tue, 06 Feb 2024 18:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWFAxNj/jyq267JGQPGYNrW6e/ZB9pNDCHfEk1Pn8h4eli6ld8M2LRn+J+UcPQomyvrIV6JnzKaMnOJAoIwzE60rHuemaAh/9BBLfBUfbawYKmqIE77615i7EuTR0jBafRUtqHcvsQD1eAqeDNP+7QVD773oFRXj2O+Cln8G0kRk72dO0GAGpxoLcJjk4gEcIsCVA==
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ju16-20020a170903429000b001d8cbdb2a9asm220889plb.298.2024.02.06.18.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:32:59 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:32:57 -0800
Message-ID: <20240207023258.2572359-1-christian@aperture.us>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1707273180; x=1707877980; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wm2lSFUVUUo2WJA1TyBFNtFTYwmNMc46hMoKku6+40A=;
 b=PDw5MWZFI7J7y0YSAL6AXBNRLeKOKTmjyBXXoiHPhtsDJVGKAYEgm8xbYmqbAsG1tz
 GBSWu0T86snX8FMvdaplx8voX8QsCqbhb3S/mGn/lHOxDJKc/P9piyVOe3R/F+YlJinG
 qDshT/T8aQLjATB3ETUM0aevJlX3JNG21C6cD4WNcAmhoR4ESnYi2n8WbIJhzzBXaM7X
 TBoso5eIsMUaNE1YNJ5UM9ia3OC7mo+dO6luo9kGDuBR5o8dPxWLHfqxohtlolk++zYi
 7NCGFgCtG1fev28w5NBgD/c5nNT3SNwX4zoOJLo2pDRMZhnVFlkQ3B7wrZwhArZ4aUFp
 B6FQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=PDw5MWZF
Subject: [Buildroot] [PATCH v1 1/1] package/nerdctl: bump version to v1.7.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/nerdctl/releases/tag/v1.7.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 1fb0649fb2..52e249824f 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  574438dd7c88e6a607c6f82932f8ada174b1133a66ee0fa0f7510e7c3bebacb4  nerdctl-1.3.1.tar.gz
+sha256  fff8c348efa4ff6753e1aacded0dedddcb255c50b00d8b3a37a660b1fb1dd31a  nerdctl-1.7.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index 43e862f7f9..66b22df646 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 1.3.1
+NERDCTL_VERSION = 1.7.3
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
