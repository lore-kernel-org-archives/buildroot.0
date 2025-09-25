Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870FECAC5A7
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 15:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C23E84249;
	Thu, 25 Sep 2025 15:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CUFuk-oChVY; Thu, 25 Sep 2025 15:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C89841E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C89841E6;
	Thu, 25 Sep 2025 15:53:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57DF412D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 15:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4705540FC3
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 15:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZnmjBre4566 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 15:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1B584059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B584059E
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1B584059E
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 15:53:16 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-634a4829c81so1555362a12.1
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 08:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758815594; x=1759420394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zFyJ+pb8ddoaDeXGhjJkYnrqK8U1igVthjhmkFb6BY=;
 b=sADEd3RC2stq1p6O1MonvYAA5rWaSrzCocjqWEnYJTwcYG7/wHV4QJ91ZCQg4n/MkL
 jNgtm8ju5/8mRXhhomcnXclngWOfD58fAgm1Y1HBqIpzHZEipoquUvEqDBosaQsCk/zK
 EIaB4Lyo2r1zX8r9KoTzZhDz2rPaTlzrG9ZydiiVCot0W4J7rBFUL+pmsquDg7vu6BMH
 yFbccPKzFmW4ntP6VM3W2aw0lB7/3N84qOkcsZFpt89WxgnCEirVoXhAR9nD2cTwkxXt
 LyfIrPRtKJQbHujbq3H+JRWET77sIn/ahaZzsUe1iq8uZbn+vLycBIWCXc+iUnyGBrCF
 ZoXQ==
X-Gm-Message-State: AOJu0YzLHMhrZ8T8dGB9Wa4B7vB6cNWMnMn/d80/0gpyjoLdCAGYL/56
 6sAsgg6vOo1yLUbsUH/vd9CQa88qCXMNz1cjqnXJwMHZTZPnxwZVZyctzefTFFYjUHp4k1H/yGf
 2IGNRtbU=
X-Gm-Gg: ASbGncvoNxVMWuh+45znbW0xg4U8g92pC0rQdsJhEDe6DNTMjzQG6zAA5Q+H0+F63vj
 mMkjMBBL54G8aOVMmvZjMPm2k8JvrgGDtrFP/kBH/PfIT+frBI5XOKD/HjwxbcMS5p+Cdj5V0qK
 OFjuMrJBBaNNrZbY8a17fHZW2LEJZnJckUBpfCP9YZ9hv8BLsA5+1TzIh+amn8v9V0f4dNhsJul
 jpDXDZW4KJzI83w6qtq4GxEkRUOGZesr0bxKrVEs+RJPWoH9Z0sYo+CsCoJ54ur6HIctc1Ic/8P
 k9gz4yDG6rDR6wdYrjQkzfu+dV/YoLDpfRPzjclEPn5zBoOB/wQ1pAPgRlFc49oe0sTZlVgewey
 hSC4rCezt5m6+HlMdd6+To9uN00Yl53Kvdp8guGd6Rt0cTa2k6eCpec4aaAGbogvQWulhcYUGmn
 aBliLw1+5826Cxszwqin9gf+xAJ9+RWjqVhwh7lT6YBNdarA9rBmCB3hHxZnTAW6mG
X-Google-Smtp-Source: AGHT+IHDE/8lMIPXy/La5qrjvNx85DbNChIci6catdn5vBGH3PyhUVhL50j908K+ZgNkEfUnGloVHg==
X-Received: by 2002:a17:907:7f0f:b0:b04:25e6:2ddc with SMTP id
 a640c23a62f3a-b34b635567bmr374437766b.8.1758815594451; 
 Thu, 25 Sep 2025 08:53:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efa4c35sm190959766b.26.2025.09.25.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:53:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 25 Sep 2025 17:53:10 +0200
Message-ID: <20250925155310.4084901-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758815594; x=1759420394;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4zFyJ+pb8ddoaDeXGhjJkYnrqK8U1igVthjhmkFb6BY=;
 b=XRGitaNgeNMgTGPMisl76SlW3TvAk5erFnwfIzzHz9geatcGGdoRSgPC+wBsRYazry
 pTwt9FXnLqn64dYFUElVKl5U/cTzbZhD8c9Amv6fmVRYp3Iacwa42N6KGdtzP23VHCVN
 IccA1lcxPAj0KUb9xo7nJ9zVt9CMpc8bhftKk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XRGitaNg
Subject: [Buildroot] [RFC PATCH 1/1] package/cutekeyboard: fix
 CUTEKEYBOARD_VERSION
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

Make CUTEKEYBOARD_VERSION compliant with release-monitoring.org

Fixes: b28ec6f4313cc805dfb152e06408f1e7137c2ea6
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index e4093dc4efac..4585996412c7 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-v1.4.0.tar.gz
+sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-1.4.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index e97eb9db2c9e..b7085c8d7b3e 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = v1.4.0
-CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
+CUTEKEYBOARD_VERSION = 1.4.0
+CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
 CUTEKEYBOARD_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
