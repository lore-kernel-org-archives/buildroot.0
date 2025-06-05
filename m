Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E287CC5AE59
	for <buildroot@archiver.kernel.org>; Thu,  5 Jun 2025 07:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 946C26064A;
	Thu,  5 Jun 2025 07:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcRgtamOWRrE; Thu,  5 Jun 2025 07:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C746C606D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C746C606D3;
	Thu,  5 Jun 2025 07:12:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AED3D1A6
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A09C5606E0
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVFrs6IWre1b for <buildroot@buildroot.org>;
 Thu,  5 Jun 2025 07:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEE386064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEE386064A
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEE386064A
 for <buildroot@buildroot.org>; Thu,  5 Jun 2025 07:12:47 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-747fba9f962so620687b3a.0
 for <buildroot@buildroot.org>; Thu, 05 Jun 2025 00:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749107567; x=1749712367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0dBS4skoAHWTXxwHbDAKDNb355Z+/y3Bp2SiGHZDXgo=;
 b=IXEyujqxEErkXwdFp9j1umamgzG1trGG7rmkZoHInsGkQz5Jq7M0PKO8sNwwojBp9o
 w6pww/IH0GyIXxRVdhOxtsjhMm/Y3YbN58dM8VLmuW3zYAPVtPL0AvhgjWWdIXHesqy2
 w8SfLRZMFTKd5aRNdH+8ApzKjEvnHibZ6IsvQejt65ixgxPi7UmPzYHWF1SnbZkNHIex
 i3KYORpItgmG0yJKwBTxgxjNcNMNRrRknalekX0gY9c6FQ/Tx0zQYvwY/cAGTKcL0YQq
 JBSM0hyg8xlMulVzQRFtwJRbwl66bwDPVeUfpaxE6565FuHgM8U2QZd7xO6V4wMeqbas
 ycgg==
X-Gm-Message-State: AOJu0YwuMnpXr7POx7jHlpMPzIXKUmUiDvVZErLHfBipis/hT8Kx3wD5
 UYFI1prN03NPpttfr27JnfedBVn+J5IQDyP9525NUTDgXCHaHo1xFya7sbld2Ah4
X-Gm-Gg: ASbGncssLiLPUKratYwO4ittlJqCsqbBwAnchCiJEAZ1AvP3U45BFkdjp4ka3pYGu/w
 /tqy1ACQaNk2UOvNWQ2oLLoOu3Jng8+qwFVtCO1MSawmub3X4oUusTbY7wu9RLW+gk+fN/2Ix7Q
 g5W9gQC1E9cxS0aRHiqVtKRWsz9kymhOcU678U6bPVE4fBh1g9MFxbpaNjmr/U7O+cvGogF/Rf3
 o65nDMg2ZGJOCMSqFUqOnIqB2mFQ550qfocQUzlFEieswVErQaz4fX6vm5V3ajpIvum7xk9FlQ4
 le4B6s1Lqm9rjkEytbNSZaiTVquohCOpZAbGqVia9v30CDVERvjPNcoB2EQ1NZ7+apFPCLyckGE
 Yzfore2wYfMhflDb3NyFiN25V0s+VFvhdp2XKjw==
X-Google-Smtp-Source: AGHT+IFV/fj3z11KKuauATKWEpRuUZzTmkZYA6ODsstYaoceS3f142lMtosxepTxtJy8kzc7NwVVpg==
X-Received: by 2002:a05:6a00:4f83:b0:73d:fdd9:a55 with SMTP id
 d2e1a72fcca58-748184aa922mr3337881b3a.8.1749107566453; 
 Thu, 05 Jun 2025 00:12:46 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafb01sm12657072b3a.104.2025.06.05.00.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 00:12:45 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, Kadambini Nema <kadambini.nema@gmail.com>
Date: Thu,  5 Jun 2025 00:12:33 -0700
Message-Id: <20250605071233.195370-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749107567; x=1749712367; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0dBS4skoAHWTXxwHbDAKDNb355Z+/y3Bp2SiGHZDXgo=;
 b=M9qOlhJd4Nq9mSKQCRaqRRpFFAT75+qFc2XgRjmJ+kNG/P6sw5FdDk+zH8RobG5Ids
 aJpCvLRdyG/QlW3snLDmAGAfFTPUWh33zQMNmQKeBNY+bfpUaeV/SXpXo6apSR8Cter8
 HhM7hLb+xvYPxMhX49YX/WyW3dFk00S0OJtSIkMttzzQBNcPppMtNvAck0lChEK/l6hI
 o50dn+eWEvPzFp34KrVb50ZGODIG4y9VsZ5bfO0H+Wfz/IxZgHOn1Ytznw4snhUqyqzS
 UVF6SeEMyIJKR0xbBq6sXhEK4P76XxKEy+JwU/kXSJCAvLYjEwUz+Y+VALp44LXT6D9/
 Skdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M9qOlhJd
Subject: [Buildroot] [PATCH 1/1] package/frr: bump version to 10.3.1
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
https://github.com/FRRouting/frr/releases/tag/frr-10.3.1

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 7786cc8009..414aaec7dd 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0f10aca9074c773c12be8a07382c7560d625d4a2c842d82261d18bb8f4b26f6c  frr-10.3.tar.gz
+sha256  df4bc4f644f93be09f75c0e0e325b2f6a3ee6d1c6db429b6f36874e88a66ee33  frr-10.3.1.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 78979e2beb..23a2ca6037 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.3
+FRR_VERSION = 10.3.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
