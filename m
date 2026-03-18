Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A36E107BCF2
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 10:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE6628318C;
	Wed, 18 Mar 2026 10:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2CmtzBg4IqY; Wed, 18 Mar 2026 10:24:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9763830E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773829463;
	bh=aR3Y3Ium+69pHNsMWF3+R7de316kt4/phy1U16UZr3E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K8lSyM+JAKTeolPXxcglMHufWBEbdorApwkUGzW7Oe6Yl9uo2BkCX/xsLYogOoT/u
	 HBtT084BD3bbM4BDoJbjilB4TxhY7Mw0OTXeq7DNeGH53mXNpm7v7397qXMUe421Hv
	 ZvaQfBMs9fUpgDAIx3TqcpbWVjjFAenbseL5h2JMXtm8RrOlSxDxn8yl22C4HguJ9n
	 GdUMp4ibkf7Vvf3RjfnfT8xpwmdE8q57d+kfSj8WRN+Q91Jiu6VJYamI+M27kSTbyO
	 pTs49NXu1z+SsPC4fz7l2DSXl8MfCQHLXPGZEvPVJ0lZKBnvizHDgCPJcjFqGFwLLD
	 bEYG34fOECnJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9763830E3;
	Wed, 18 Mar 2026 10:24:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADA9C1BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 924EF40388
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CthSZJwJUVSA for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 10:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76ACC4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76ACC4007D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76ACC4007D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 10:24:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso7115765e9.0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 03:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773829458; x=1774434258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLeaaO6mgErfNQRyxPgByaDafTewPa3n9UsSurXfvQ0=;
 b=szaLK31PGCagVyfgiysIWxCbClEAny15dkTFoRMhy0HSba7w9gNwG5RPl6tZ5+fWLN
 ZTQVgUSziwuDVEhP60mhLQil+VukJVtCGpBU5XECuTd9XYJ21Pft2rSZ/uYQY/DhEZ15
 OgT8trUummkCXfCP5I+PJoyzr58/oWUzQHJWtA16XWeHnYOe5AbayaO5X/nLcxyxoiyn
 elwcQKAluUL2S3iZ9Amj+Evr9K/fkHIPiqJuO3h/JmcsBDUoY7aDAc5cbn3PdnNBe3kn
 JgU5QTMO0BDRFQ60evJ3QhiGLV0bVHB9qwR9AXrfEok0Zkv8isdw94vCybuZUv8VG/Tw
 mQNA==
X-Gm-Message-State: AOJu0YzS1ItFhbVgJYb2jQLka6yJgGrih9v2IBIKSbBdrBpWvjr1n7VK
 +PMvxwE0E5AFy6gP+00nYN3LLosLCmaSilsN9qFtM3XdcxGHtvDuoHsfGMYLw9cEvl5pKY97d3w
 yTWGO
X-Gm-Gg: ATEYQzw8dC0T/AyQvIHKFFKFCEn5oPv+kLHM3xJNG4rSqHSInOSOljOJRLSElFrVJtO
 3MopW67l2JzySDLe33zeA/JFbf6eDjowWDjABMRGVIofXtKoi+hUeIWhpEwnKQjzpMinkDVvoq1
 cnHqnwpMu3d1o0wHy0FTck+VqsX52GHS1CpxaabDmk56fZU3mGSwmsYWI+gHO0pZinE2y6pOidH
 I54zi3gn3iYg5UJMKNnyzYs4oLwfRnX9T4vpS9iysekSKKcN1h0roZdJX9AjyHMpQi/Q4iGWQ+4
 HXQ/9mqJOMVYZdICW+7EBE4MYW68LnMbr4vNLHXeVCEidK6ZLSIXBp30l1MO+L5VgBOjnChTKxX
 iMQBGuwgy2FWUVDibgmFB0+lwrDVQCK2LqZRl71zFc8iZQwuImCS2nci99DYaMe6EFgqXh8Ifqz
 mmdVuWHYsWR6nKoyPrLdTctAHDlXPN8pcgpB8GTmyBrXA/85MvTf2QTNF8KbDHo5VeUMJY9B9nG
 FBFS4Y7mabth5WPbQuAKBmBOHMllGAy
X-Received: by 2002:a05:600c:8709:b0:485:3c2e:60d5 with SMTP id
 5b1f17b1804b1-486f40a0cfdmr45271205e9.2.1773829457895; 
 Wed, 18 Mar 2026 03:24:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.57])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4856eaeca12sm225924295e9.12.2026.03.18.03.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 03:24:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 18 Mar 2026 11:24:12 +0100
Message-ID: <20260318102413.107588-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1773829458; x=1774434258;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PLeaaO6mgErfNQRyxPgByaDafTewPa3n9UsSurXfvQ0=;
 b=YIlWACE2LAx1OfLLQ1dLxBvKw/BPxO/mCkCpjqS9t7h3Y8pIPXss38lXoeNU7DT2Ih
 9FRj2OPZyIYg+uDEYBHgcJEzQkw7mJb9rJSnsTV+5SMdQbqd36jGV9NPb5mAN1mo2jjQ
 9JNckq9mg+7qJVNUcLtNTSdSy+bzhLX8tTbt8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YIlWACE2
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.2.4
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
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index b830037783ec..bc6a19a13146 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  0182d67d6949e4347a0bc62fc8c2793be7eb203c71f19edff93f8c45fd4a8190  armadillo-15.2.3.tar.xz
+sha256  bb03a16da6b2cca43962b65a2890faf4e6b16607220cf60270436a11e09e6f46  armadillo-15.2.4.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 2df7f10375ec..8c9c44f89ab5 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.3
+ARMADILLO_VERSION = 15.2.4
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
