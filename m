Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B67E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACD9405EE;
	Tue,  3 Feb 2026 15:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anW-eGVT3pFC; Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5462140C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133006;
	bh=HcJToqbj2UuchzA4xC21WUU88zi7+C6Wz1dwK29/OFo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bilLO4/h8e/jP30F7eLg2xk4xG0WgUfzKeZVsrLCqM7cSFgNXMxds4tg3VJqxQ2RQ
	 2oeSvQCqKFx2IyHFpOOLfXAATv/QRUiKN6lPWiatz6Z6mWYPwCY6aDX1TpWHwzUZJn
	 RRixLmWI7kVGjSk4UYvIi3bVuTa8kJQvinGOvS1511zKmK1FPmkHpVdZp94yRO7YQD
	 Mw2ohCQlNGBWUgNHp2ByAWNRBvu/nT7KMPY9x24S6MdHl/LzLG4J2su2EU8gJEJNlF
	 012Ke1iuclaTlJtg2mKnMxpuplrlVsECm3/7SanXrX2FYwRH9c+SmT3DbL0DzLIesb
	 8QKkl6gNSlIAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5462140C30;
	Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3C53F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A492183C8B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM1DcN9e0YSB for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACB2883C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB2883C98
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACB2883C98
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so44537255e9.2
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133001; x=1770737801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c/+YxzM1HKwCpvahaW11IGTgrACF4YQjOHG4dMnqAMo=;
 b=ADk+2WWgphe5IOlplfWiTkTf4J97sDiAfPVa9JOxOsjGsUslgR898aEtR1kzEcxD2y
 JmHSjCU9binEef6IkpH2EGuJ+AsNTW4yv3Thbn1sJFkhA/h2wZN/EAeJc2Fxt+CpPO5w
 kN9XnE1AwCOPh94Qi27xr3zy7ME7fX0q7Ar5eUYLBh6syXx/8reRe8KXLiMaMJv7lji8
 zXP2cZObHt5aocP13bcYhQrsj95EpLAT0Cus7yFTxWUCAzoVy8QmZXY6YZEPkVNQZqed
 nUHrsMzFIqxSgxaK49muaUK+HNIfVPvIJodoHYSnCN2ZBHNIPlsqlBwvUAwE/sQCHJfh
 LFHA==
X-Gm-Message-State: AOJu0YzWNi+zYyGTg81hPrhm5PEKAdVBz2HbpJKnB41nbjyTPz9cqlPS
 Mdk0VBAD4oTJ6eJelpjTTqQD1aQ2/KIdN+ilsn67zToskFHoL6DSewML4G0UA6SS
X-Gm-Gg: AZuq6aIMTPRUFWgF//b62VHgGR6vJbnoEbO6b0BFhfFzLCSwFVR7rl9y3jeDkt9G0i0
 onI0EycaRAut9Mt4BRu1iQA4XARYBHlK8NAZazHVCEyHT0xvsUr7os4Ip60LMiymWFa4tWpJlY6
 7jTZ+3ObwVvzcdegUMsZVzJPrZsDEz+E6APTMdqa69Uo3mFTEjvUy+mPPDETji/Mbye50d/Ia1c
 kep395M8sLsbzmN0w3X2pJXG9XOXGo/Ucnb+Bk4BdmnHbrKU5lc/fD2lb8JENXeux2WueBy83eb
 JyI97YpCGc/yY9zoW2/+kloanM4yDEg4tAQm+jVZY2LleA4MYQfensxd+1Rxpcy7Drh4fIxFpig
 Aby8Dcfy/TWzermHp8+3nDdg9Iarz+KK9/CwmzgO6rJOcI8fT8n7Kk3oHh0JQ5MZ+TPtMfCrqSX
 C+a2nJseLGcWbcbdefm85vk+PBiyIcBqn84XtvJPrg+LNO6oAp
X-Received: by 2002:a05:600c:3b16:b0:479:35e7:a0e3 with SMTP id
 5b1f17b1804b1-4830e993349mr274855e9.30.1770133001135; 
 Tue, 03 Feb 2026 07:36:41 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:40 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:12 -0800
Message-ID: <20260203153617.80012-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133001; x=1770737801; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c/+YxzM1HKwCpvahaW11IGTgrACF4YQjOHG4dMnqAMo=;
 b=eFYr6blJikedXPuoepHZzfQvsdvn/glZY0JM0EonIPqhGTdL+hj4D/Qf4gxUG363ak
 ooCQ1SkS3PVSjk3aj97qrC7NQXbEHT3Y8GOCg7Ou9/7xAP9UJCaUFLf85PMRvSqqit9q
 3MWlztaaSl5fJZnD+drvpL6FDACfiBzQRqQUUP1fErmfu0gbeOOM4YRvZCvJ/DHqoQP4
 0dkci2uK53PMaXhYeojDD6u+2JOtg3YUTB8krPU5XI3TlKGPEu2PwKPOJYTvFVSoVHkS
 iJTcetlFmXDDKpHysMiyYRb9s+iVacI5s1Gr/t+Gf/6PTh9uxtjyN+vIj4C3x0XIXX1E
 f2ZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eFYr6blJ
Subject: [Buildroot] [PATCH 05/10] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.4
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This version is aligned with NXP Linux BSP version "lf-6.12.49-2.2.0".
This is mostly needed because newer package versions also include the
ELE firmware for the i.MX95 B0 SoC.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../freescale-imx/firmware-ele-imx/firmware-ele-imx.hash    | 6 +++---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index 55e1864e31..f064ef1830 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a2f16e43e8aff9cf018d0962b70313940f77079b314331ab3980c4c5f44249cb  firmware-ele-imx-2.0.1-0a66c34.bin
-sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
-sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
+sha256  c3ae4a1e1a41da441bd61483ef011ac24bf624aa6bad36f879b5dfa435647b4c  firmware-ele-imx-2.0.4-93492e0.bin
+sha256  3001cf84018c5cb10d183a678f6ec8a928c797616ba06b398d7ca93c0779aaa2  COPYING
+sha256  a829b109a0a406a6a2fec19975a332feca225098ce66bfab2220c6608db8fce5  EULA
 sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 8f25f4b5b5..a844ca0d94 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 2.0.1
-FIRMWARE_ELE_IMX_REVISION = 0a66c34
+FIRMWARE_ELE_IMX_VERSION = 2.0.4
+FIRMWARE_ELE_IMX_REVISION = 93492e0
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
