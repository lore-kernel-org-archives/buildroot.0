Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8722C61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 21:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78846809E9;
	Mon, 31 Aug 2026 21:41:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ec6BIVLAWY1h; Mon, 31 Aug 2026 21:41:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788212468;
	bh=AzmOrWDOMwVJ9vVNRDDuPaSWNaLLTxXVtNH9N2Sxejs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KlsPg6c+BslF4gX8GqypwAZoJRoI0sAdsRUTJFs6bxAcP30KKyr0QYalvsWkCHCNE
	 SUtBFanhhvSoAtHiHC1ufEgr3s1tFBBryuGj2I3FR69Hk8jouzn8iwStL+I77ZZMvx
	 p9QTzrb/3wrCIGbDWILNivMx6Rf7fhc89Yx+MJkmNdbdKoGE1P1fX8jrpSHAq6J46+
	 ocJNd2K+UoGwmV8oYcISgo/y9gA3Af+MfygSos6JoGlpvgvI0LQMC2HjVeQbcGKnyY
	 bYhqId8sX5ydmhnBe3ajQw5yuWWYtMDz9LxR4EfsXM6/8udBHw2AduT+AOUV3gSMMo
	 BVC1kY8vBPxJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 890BC8084C;
	Mon, 31 Aug 2026 21:41:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 08A5D363
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DECCD8087F
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXNJeCtRDgKI for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 21:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=duo4sJYz
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C53378083C
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 21:41:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-495590dde14so40213585e9.0
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788212463; x=1788817263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OU+a5/stzyHKOXFsZ7oU1nvdhaqSjmtJygJOpDX97hY=;
 b=duo4sJYzgeldvj6YRiK1FCd26BVUxhftjaXmWawo8wZAKiTA5xBlsg/rIndb1xoHwf
 eYYQl2vqpplydiJLcmD18wXfCet9SfQ/kLHa/flaFyaTn8qr6fafSoFCN5qgCNks8kjZ
 dlq9HPttiUxwdbxu+C7pW6YrMj5zwQMxeUswmQPJ2BM4KopnLzypR7nj4K7C1t0hZrvN
 sVpAo0Wm8U1RFy16FpyUJTnyI/NuxJ7S3E99lN1ZeKgbay7+W3SAbRCCgvaJ5Jg96Djk
 A5y46IT0Si8cZ2Rs1ewO3PguR5EMvg+aBw3R4dOzZ0OPgE50vHKnFIpP76D7GkBQk4Wb
 UV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788212463; x=1788817263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OU+a5/stzyHKOXFsZ7oU1nvdhaqSjmtJygJOpDX97hY=;
 b=QpolNTHbDPg88mZ2SOG3c7f6rMNRQwO0Olq7Rn+eMLRegrVL58CuZR3B1zUyzwa/Bw
 4zUXWJppR8yZ6jxgw8H6drFkGysy/CWyGb4Nt22r98kzu/c0+B+ba858A80DCXooulao
 awSPXhVCr1A0X65IGLxmp+fAOEJYWbFBo/1Jm6uOdP7svfxxIW1W3sh0Bx36EnhZZgY1
 864nFkJSb3ZSdJ5yahP4SLJjc9er/Fd9W4u6y3+hYPRidE+GEeXxaN1Prcfd9feILSGM
 JaQbEAF9HJ8k8sRt2FcxuBapUaLQud/j0p78gWsGmcaeDLOJArqkzeLEO6l1cGRe5l9x
 SSzg==
X-Gm-Message-State: AFuF++l1XrRJL1focIQTyS5Y/WmLWHYRurPgXTMyEhsdGYsXGhI3ElEg
 +ptHJAdB9OZX2PG3m5Us43ArNKdLzPXD5wJcHh2eLfKfPD3oWDYUJdOBCEpLGw==
X-Gm-Gg: AR+sD10ik0NVV2nxCJDW02QDHZ6HEm9UEeYJd8vOcKslPo36poKAA+6RuKcdE+dL7vP
 iV0l7Hd4zaFC4IxfXAugic5bT7Z4DF+WmX8wOAchTSj6zK08mdc7yXeqyZu1g29SSnX1ayRUBAD
 5PB9P9J5McQT6jFNAgiu48V05k8s9nEW7Y6ci1iIurTSqvTgPKZstNX6W5FaxxcRmOr589fn4n6
 RIJk12BzTpNzPU6WEqS2IQR2qzhSR8dql2eoNeZXWb3R4VROay4uOOtr1Jy8Ycy66VPujQ3oQw1
 mId6xtBnNDvXTiCdpioT2Qm5bQA0Q7rlFn24V5Zhfj6TymBtqubCmbLICI4XrToczCYuB77BwAb
 8sQ4BB173Sd511YZ0S7hoKmDuYxbi/s24h7TXYxSpiHQe64Gbv570oUY1e9j0dMdSK2TxZQxG7k
 Pi5JnFGmKn208tqyo8e3CbGyI3hVv9R6y1QvMYuowMArNksLPbrUSyFKGzxyRgUbcCL+UBwJEar
 BHIkFLyZo2WO8030Bo3x0XIyCNx95lLJcsPmAn54UiUAF9ArG1pL636XzMLNUsoUDbXVW7C3W4d
 Ofw4eTPr9xfxr4YqmokdFVX4sYUW
X-Received: by 2002:a05:600c:4f4f:b0:49c:dca4:94c with SMTP id
 5b1f17b1804b1-49cdca4097dmr63904885e9.13.1788212462458; 
 Mon, 31 Aug 2026 14:41:02 -0700 (PDT)
Received: from trial.home (aki234.neoplus.adsl.tpnet.pl. [83.26.12.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ccd1e19desm276034085e9.1.2026.08.31.14.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 14:41:02 -0700 (PDT)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Mon, 31 Aug 2026 23:40:40 +0200
Message-ID: <20260831214039.3575327-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nano: bump to version 9.2
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

Changelog:
https://www.nano-editor.org/dist/v9/ChangeLog
Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 62692d81cc..08fc6c115d 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
 # https://www.nano-editor.org/dist/v9/nano-9.0.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde  nano-9.0.tar.xz
+sha256  05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9  nano-9.2.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index a3e019d5e5..0a12b528cb 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 9
-NANO_VERSION = $(NANO_VERSION_MAJOR).0
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
