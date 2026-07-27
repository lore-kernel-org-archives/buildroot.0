Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBD3C53219
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 09:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B9A18086E;
	Mon, 27 Jul 2026 09:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aDgGPWEOWnP0; Mon, 27 Jul 2026 09:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D5880D7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785145756;
	bh=JipG8ylSkkiQujhuYWjTYnBXCYFvLyXJosgVKJ4Cmnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ozI+qn+WT/PWkIrYFq9URCuz0rueub3JWGKEITPsxDaU5XamqQbpRxCVjavyGjWoY
	 CkwCBjlJotKNrZfAvGLPkZ2dNu5SpHZj727qgwavB1fw4VdSyUjnKkVatuelZgsGUN
	 9xk5yobu+yfX5OeTLvda6FMMUkf5JF1BrXU+wnrZiyWxQCYskY486SxChMMkNBnd44
	 1106IA4bvOuc22ZwJtSIa4jhGh5XA2PPQ/pHcDDdABoAu6oEKPmvEJ1uLCe/faL+hU
	 5wizQvF3InkNndpW+mXOwdeqOLjoXkYPl2NrNe+sz0iyduhDGyNOE2ZP6pGAPp1OvM
	 QFBSu+X/Pq1hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D5880D7C;
	Mon, 27 Jul 2026 09:49:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F399D26C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E54F640109
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkS1tkMTEIgr for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 09:49:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3CE74010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CE74010A
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3CE74010A
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 09:49:13 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-69848c9462aso221717a12.2
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 02:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785145752; x=1785750552;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lWV77qNU7/cBVx1NVVLEeHeI2kufYCNQ8WCNaLmnX1s=;
 b=Y71bNqOXIUBk2i3p5Y8OYq23o4BwMv0VW/10i89ylcwiHd5+wptxyN1ohslh1BoHwZ
 3ivCRfevo8Eo2dRgFQI1919fFslXPWZUg1/NNaTasLei6IITlB8/8KXpX3T0qOD1lCwg
 9D/VDaOSeZ20rd5+42KiwPbpbU3qXOFvrJLxVtuR3fN70aIa67BXNvwGxKJAXmS4iQ4M
 ceixfOQvddykqQkV8MKpLlK7v0S+/5/4yx/Wkd9MWtx7HPCO0qJZrgdKECMXSNfDal4v
 I3X4w+JPR4cG0XbUQyC1eG56XX+0P+YLUSbBVZSjjiT0pYrtgUCyTP7A6HjJaejwsQZS
 xgAg==
X-Gm-Message-State: AOJu0Yzn5eUv/uEO9H1k4Hfi0T00jtB1GTfBiT+aR5MXE3QAdeR1J5iv
 ke5bJUrnAnv+q8ZW7XHDRMC4kF2Ry3Lqo4kI2yIbaA3dPG7NkA2tp4TbCLiFGfZ8ZArCx8oEkN3
 nTe2d
X-Gm-Gg: AR+sD10oVIQ1reWwEGCDfIBDwC9cUpL8Om24ZmfWXZTtVk8PbWyysh6hLmet203ldIH
 mtU0gke87EKiGVuP6EGtz0s2RR2G4dMpOil3ANEK1ZN1AjkDJPFIq+8Bne7m0UJA3GR0UbRLBfH
 VTojT2jlvK91jw5I05q/yoDBs6U3RTiaYQR9NaAWOC7glSJ0thdS/MXtN5Gy9wsBpTg3v2Rsfpt
 WefWIh+Ysped2gSndA3FylypP9lZHp5F0SksH+Rt5Y6waGyVK9hObNX9MsjIQ+hUDtJfSab7Jnd
 EwbvTBO/Y9ozpNCnulPnmID5saFPrE3GPtidX6NpKCiqzE+DfEkPirifLvt63Tqt7/DCoH4Dfli
 jO8CKIDGavv/+qEt7NyoNDAY6SuAvIT/EPj9T0BQIHgGpvqvoXdMdMn+3FSH048lnjUicV3RTN+
 IftheW/VJGP5XK2KHA7xseN8iVCmrBZNenAnPgQZOBKDOZb+Nu4tdzT2pPgR0BP6p5fYBqmMf2/
 YFonwW62BM0uanaTzQOxHLJIDPyDWapGp+qSxLbALKn/92QBM4dKfJOhxHKcsg+g5jXQlSph6oN
 51FVPQ==
X-Received: by 2002:a17:906:7955:b0:c1c:62b4:1ec0 with SMTP id
 a640c23a62f3a-c1f1eda8372mr197218766b.4.1785145751582; 
 Mon, 27 Jul 2026 02:49:11 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1c32c90b42sm617448566b.38.2026.07.27.02.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 02:49:11 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 27 Jul 2026 11:49:05 +0200
Message-ID: <20260727094909.1701843-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1785145752; x=1785750552;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lWV77qNU7/cBVx1NVVLEeHeI2kufYCNQ8WCNaLmnX1s=;
 b=LMfTns1B8iarUFXXs441Ht0XQ12AXvvWJsDWOiXy9QEnbvB2X4NlW47toil4YuyA8i
 DW/wi10YSEcx3kwQnqdw9e7ZA5g2lpqGqKI7vpCte5xXUmIIzsG4E+BTtMlkwMJH01YK
 lnOK2UDa1Sg3+h1k3c3zKo76jo3kIE+gG3L7s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LMfTns1B
Subject: [Buildroot] [PATCH 1/4] mender-artifact: bump version to 4.4.1
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

 - Update License hash due to year change to 2026.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-artifact/mender-artifact.hash | 6 +++---
 package/mender-artifact/mender-artifact.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.hash b/package/mender-artifact/mender-artifact.hash
index 19f650046a..5dffdbb7df 100644
--- a/package/mender-artifact/mender-artifact.hash
+++ b/package/mender-artifact/mender-artifact.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha256  14ba008df9b24321de72821de394bc4326e4dd9e17ed7c111340689e90d8b596  mender-artifact-4.2.0-go2.tar.gz
-sha256  a99c495576ecc6d6e137e471c515d38757179240ff6cc41bd481e29d3504f334  LIC_FILES_CHKSUM.sha256
+sha256  c7002052028496f230c34ef6f0488bf5e8ca32b075b7a96555532fe928aed984  mender-artifact-4.4.1-go2.tar.gz
+sha256  0e7c48f6471ca81a2fce9e3f605dffeb0385afd4dc3b5eb7f4e86ece4aa9b068  LIC_FILES_CHKSUM.sha256
 
 # License hash extracted from LIC_FILES_CHKSUM.sha256 using the
 # following command:
@@ -8,7 +8,7 @@ sha256  a99c495576ecc6d6e137e471c515d38757179240ff6cc41bd481e29d3504f334  LIC_FI
 #     sed '/^[A-Za-z0-9_]/s/^/sha256  /' LIC_FILES_CHKSUM.sha256
 
 # Apache 2.0 licenses.
-sha256  38791d93beae962b266e11ac888ea2af4f07578b272c2f9dcb05f54f32960a76  LICENSE
+sha256  d7e8fd4ad05371007d60285c309ba7a7ce3e61029b843f949fbb9ec79dc9eb47  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/github.com/minio/sha256-simd/LICENSE
 sha256  132fb47b89947cd5f98e380186bc412af5561c70669d37d3a83b36f03a0ddae5  vendor/github.com/mendersoftware/progressbar/LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  vendor/google.golang.org/genproto/LICENSE
diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 609ce05c5a..9f235b55bd 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MENDER_ARTIFACT_VERSION = 4.2.0
+HOST_MENDER_ARTIFACT_VERSION = 4.4.1
 HOST_MENDER_ARTIFACT_SITE = $(call github,mendersoftware,mender-artifact,$(HOST_MENDER_ARTIFACT_VERSION))
 HOST_MENDER_ARTIFACT_LICENSE = Apache2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, MPL-2.0
 # Vendor license paths generated with:
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
