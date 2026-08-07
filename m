Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB902C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB09E40A9A;
	Fri,  7 Aug 2026 12:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvgnAQZIwoba; Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B470440A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107319;
	bh=1XcSUJdfWzEQiGCyXSKdghMDnRckJOpvNwcAOSGMq/o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FF84z3sCrogRbMOT8Xi3K+noZXVrRbryGt58LCh0gft8LMfXBelVk90xwKknk1kIU
	 SR7490wfymiPEKqB9XdmKaPv/FeIkrGmUceWJ6rcQ5ALunqilK8seab+ycMrmuVbCi
	 jeZ4C65DSs9V9s0U1P5z14eL6AX4TCtRpd9HUriXr0NeWgdCa2GnUFRkT7Jt4vDcgW
	 pklMkRe4jzVGAXWoF+7y3pYvWGypXISaFYlBACXMmonVvXdByDf2pqDXyWV4Ck2nMK
	 hHKRZHIm7ZvT5mN1SyiDzs7QoCUg8TbEHG2edrTiE+PsRgdxxFLu41JJniuSiC7eft
	 SmuicU++F0cMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B470440A8F;
	Fri,  7 Aug 2026 12:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB2A397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FAF8812FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHoqZpi_tx-t for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46CE6812F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46CE6812F9
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46CE6812F9
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c16111a9b8dso35401866b.1
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107314; x=1786712114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rv5fTfBEeVO/+/GW18ff2CctCmU6QcYXtsgzrbRC4jE=;
 b=EeNGPW2C5PmpAw+F4u1uco1hiP0NCwBx9VLxY5nuvHH97BoXNjYr/0U1ptxERZydeA
 9Jv4E3p2DiThyTVHQPICpJEwDEMzsQpua+Lxk3bPK1s79V1uKZhUIAG/PLW6G7iwsrTy
 CRzGUvdRaflwR2nXAPnZ9WKVt5YiDobZu3HkTrWnq4TBub1/jTUcVIhGYIepZVc/iQRe
 lmhvssH8F9itc/zTzuBnzMPEBb10hok7VSnip46MznAh6dj0AacsscXeXbl6Z9zFSMtR
 7WSENsxevrRQZNRfcd90RfUTl4nFWb4wD1BbUVMn6XGAzyiogEiHS4LeRRT4S4/CPF8l
 qsbw==
X-Gm-Message-State: AOJu0YxD2tYBcIx14rq1MsSL72xn5BgBcwG1DU1CPmVhiPKws50mXvFW
 0h2tMNGmOiXqCE2XACAWJdiubbhadQ4UXY49+c3BZCJi/403yX30L3CG20VeOqkdRq2oR4M2/O/
 h0ioInDE=
X-Gm-Gg: AR+sD12Fzc371wHQxjOu0be3Uh3XM1slCiVEpovdkZOwv4nLQ/nYxfJgG44KNMU76ef
 AA+mDlkkDySXrCTB3EFnAG6aMS0Tvq+N4RBVy7hfFgBZm4XOR8ShgV0XBKJWS0ns91ZNykQ1ePt
 myoYOiDHLjS5STWam1iKNJGQ1SOxdHf5n+nxsDYPZw0zggBszjGpvh2JPc5fpCUw51ARDWTeulI
 1kyg3fyXlKWMED9XBD6U3lyyxKvs4MnLd+TNBkMVnl3Gdj5amiMh3fWNS2YSQtDgfue/oACPaQN
 eYuikQXg3G4hBeTawejAhatSAOjPNv/djyVgB4DI+Rr27KLWirQ8Ewb8sIxrEgpVyyL9NfHYogF
 D20fZDTwA/1uEJVVTSn4KgSBRgkp05bRUsMKIeegi8MAuWDCFcfinufOPckKjGyKEpP5dB5bQtC
 I7lIVIZSeMYZrwy5lgO8tWx9IloSwf1cdEPMAFt+w9XZO6bKEmkDb+fZN+YTWCSgVTJkpGfFbnV
 E08dY4EakC95nIoYB//xLYjelnXYi9k7eZ894/lgHPkH0scbDFtF6Tjphg9cDKZkpBm90f7s6vH
 2e+uNAXbvqZ211Cn38fvXiu6nVnYmtmc109CEW7ek2Mvc+R3rv3yf49nWjUDD2iZyM97lqfSSig
 =
X-Received: by 2002:a17:907:18c4:b0:c15:ccda:26d5 with SMTP id
 a640c23a62f3a-c2039de6759mr645725066b.4.1786107314098; 
 Fri, 07 Aug 2026 05:55:14 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:01 +0200
Message-ID: <20260807125510.1285300-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107314; x=1786712114;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rv5fTfBEeVO/+/GW18ff2CctCmU6QcYXtsgzrbRC4jE=;
 b=cr8VhXF0X2XHZOzYlMboXMadFiF0bBeKvv2BqdDD8O2wTgxkReRN3nlQo+m52ssFWn
 ggQRZDzxlEfJ/lr2L4lEpKmGLOx/ZJWql9WEqMKj64LIV7hK+eJyX8tEI81rgVsGIs3U
 GoTuiLCCqlWaG3ZxzuzebRIWuDfvIPq1twm6Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=cr8VhXF0
Subject: [Buildroot] [PATCH 02/11] package/mender-update-modules: fix
 license hash
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

Fixes:
https://autobuild.buildroot.net/results/5afb0ab3362cb67014f470dd976449b756224566/

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-update-modules/mender-update-modules.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender-update-modules/mender-update-modules.hash b/package/mender-update-modules/mender-update-modules.hash
index ec879f46a1..f6de69c42c 100644
--- a/package/mender-update-modules/mender-update-modules.hash
+++ b/package/mender-update-modules/mender-update-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4846f39abc254ad2ae2a9f3d5479b064bc1bae5034b9d276ebdb09d8c60f4541  mender-update-modules-d8c4683e6660af6c65069e10ee4b8ee50ec1af46.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
