Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC341094489
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 16:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D310C8426B;
	Sat, 21 Mar 2026 16:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9O01RY230vfR; Sat, 21 Mar 2026 16:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9D2C8422A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774111125;
	bh=4sLLKmCQxro59KjMBBvzA8uku2pxOA+AsjA22ALbkF4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xu67e73+040hGbDCkAhK1QYZi1rM2w2Bg8WsP6KPRpZAu8OFgSsqSXxZiXX7C3dUe
	 ChcnSvUpNYzPvjqUIxKncl0nRBXw65G/EzGXkYsPiJdUwUKnEVrBDn4rBXloh/0vbY
	 zkXP7sSGPRojdQWqFZCGZn0T9IuMUL+MiIssQqJa+RDrk+vzkT5HHOuFaCZjbzcp7v
	 GMf+OAtKkCYrHP6kL2R/CEkXyLlhoPT1J3501krKTbawBEkLaAavBM56rwTPb7ZwgK
	 AUkJ7CM+HMxg703suYKSWZ3kdbV72OYmR9Ezhe3O70MK1gwlf0gD4qN+y888B51shn
	 Wun964bYtVjVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9D2C8422A;
	Sat, 21 Mar 2026 16:38:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF79334C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 16:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 946A4613D4
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 16:38:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ARA5qQHoSgr for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 16:38:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EF8760DE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF8760DE2
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EF8760DE2
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 16:38:43 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b941762394aso338181166b.1
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 09:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774111121; x=1774715921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPEq9HRe4WTvw8IK48EPEZQkO0xNv8iuTlPeVIKOYJU=;
 b=hZ4L0E8Fwekl0i90l5U3B0M0/3c69x+/DB0LA9+at/gqn0wsU9FXu4Cru+Ix6LcJ1V
 sGTt3SKbrDYVL4uGAw04VZy45JJWHn+fxC3PhFUY/OHdrV7SqFEvjy9A2depCavcpv0U
 I5C8okYkVQXydoO7kGwcrJE1uPhZolu87ne1NpqyRzGQcPOU2Afy99gjR/1GxZPOrkCo
 2pa3DK9q3DmeV4ZCI/qbqY/e52vD1Dg+50gFHS13crbKF5Lr1Z9zjjZR2pMueqyPZiPF
 LFgWcZaSrDd7Qac4VChNHQAO/vd+HqA5H9YX+W1MMCkVjemrE5Kh18mM9B/x1P7JUPj0
 zEhg==
X-Gm-Message-State: AOJu0YwSu8JcT/Oio/jKECLJmPOk1Mrx0kR6uq/cNJHJnE5DnFqR5VhQ
 GtRgQCYiqUxeszGjQDDJiWcppjzDcqCw5YnyR2IF3IEkMHPBZCFg8Op3uyKb
X-Gm-Gg: ATEYQzz0hEV6rsZtwLxn/SeaPgQ+rZOAz7SToK3S0p8e0yKg7cVTrrLa0JEolfSDF5e
 7CqOL8WMIE/xzj8o/Dvt6M/hDzWVjD1yaYK6GRTDNMbjfAHXMWp+jXQVRkwQR9Pj9odQEQwSCYu
 6SR6eJRLp/6wx4VKu1NgYMi80MMIcdnX36eEJdjbebHOg0XXhIkUualGWyU7FqIhrNvyFwwnaz7
 FUgIkwwR6/NbC0GDREMfqfF5uivpmFdegNBeZiQCNsd3BtmwH2NGhpjPYEvLfMHhFoohta6RHxs
 ga/SfDo8gDh2FVYrlXLnCZnPmvmI+qMl2OTCADq5ufhZSGdaj1glPsSskkaSEqtZ2rxuWpm490O
 kQnsfu6o+ekbwybh53/6jlshBV4w+En8S5mUIsgm6TNd4eBkolWna9nYGpZQohP4xPwCM0VDwgH
 eTzeJBI+DmNhzaH0Zi28yMN9Ep4Yy2v2czfSpysP6jdFvtg7Ql
X-Received: by 2002:a17:907:a807:b0:b97:b2dc:91e2 with SMTP id
 a640c23a62f3a-b982f1e66a0mr474615566b.16.1774111120516; 
 Sat, 21 Mar 2026 09:38:40 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b98335de1e3sm284237066b.39.2026.03.21.09.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2026 09:38:40 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Sat, 21 Mar 2026 17:38:14 +0100
Message-ID: <20260321163837.11161-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774111121; x=1774715921; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EPEq9HRe4WTvw8IK48EPEZQkO0xNv8iuTlPeVIKOYJU=;
 b=Ms18UNORi6yWGpPVPUEpurkyspVK30Xpn+gBAuEii9cQY/Xigckfcdedq46AvFrZEj
 QqrrC8n5/HH+jWaklQDx+SEmbkA/YXY2YtzosGup/3axyNxZmsSGk5aF4zg4PESjfVCE
 qjB9d4xGslM6anCE3/ZozQBtf1UBnb6CvNd8tRkGYz35yTEELaYcp6YwxoPgPi+4NkbJ
 XjePs2ZCCgcWFZxah73SCMjwUqMkPEHUOAaoH1gH8VmvHMapkiTwvVHRBS+itd4faeA1
 bFHza9mwZntnyotUPWDAfMSabSq4XoSBVvTQQcut33LHBB3m7GKXwgffnLx857/X+scQ
 9VWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ms18UNOR
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.56.1
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

Changelog: https://github.com/Canop/broot/blob/v1.56.1/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index e8113fca1f..a86498a169 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  4eabb24bd95af9f7ecf52e68b02d2afedc631bcf059f5fc8354c09a0878bcc0a  broot-1.55.0-cargo4.tar.gz
+sha256  bd6e52151e28b4f76248156dcef5c0c56260caaffe39599c798792a528786fac  broot-1.56.1-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 83b2e3443c..f1174358ec 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.55.0
+BROOT_VERSION = 1.56.1
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
