Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89A4CDE005
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EEC860A82;
	Wed, 24 Jun 2026 14:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkHct7JznBtB; Wed, 24 Jun 2026 14:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6333160BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310023;
	bh=WbYOefJVLmAmJvHKLasHFUw3VvRtm6SHgafBzCc9pxI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=lsObi+o3mFLe41u88ekM6OV99P5j3Q83i2CKIxj8w/AGGssLo+vwOzc5X38nrDoKI
	 qvpjuVb+RNrS610I+tjIfsjLCCCHIzq4XLgo0L9k6Od18WXCFED1MwkCPxUO0SlUkJ
	 WF7zQChXU0/1V2qOO88fOwN+WXYFEijwZYpaEQBg6/UsaHfgCCl1btnnKRsSDrtboS
	 EKkZeyJRHApYWNN0JoJ9Xehwm481uoXaN6UYAnxHpil5Wo1ZI1/xNKZSxNAGPv2tOE
	 LPApSqixzu7rGJozp90VQM1kFZr5dzUT5pHABlX4j32iE4WCNl0y/I7MV0Xm/7cKXN
	 QGepFh95UaYYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6333160BA4;
	Wed, 24 Jun 2026 14:07:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D11C7363
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2B8881585
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fl0shD1RDYsV for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFCC1814C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFCC1814C3
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFCC1814C3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:53 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-461edb387ddso1264128f8f.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310012; x=1782914812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zvL4WBpJzIaEzqmtPe3zFY0dud6uoJkvNpes/hy0lmw=;
 b=IJGUqCFtSWppnMeopd28xo0wcY3wnaAz09cq3/kadi2XgHT29OiS9lY3pV4mq1xgzG
 dCljWLZJ4lp+7vK6IVXmYGJW1AfwUtOpnqVI2eD1A21Ba+E/Cy3FPmpJvU1E/sYROdV8
 8A29bpHXcycr3lL8HVSw5nsowEm9q66wg/n6PDOEUcZHA0XtmWoqkWgFx4jhOfp2Fpzp
 yJTe4uE4u1ug99iP+z1W3+EwXixJLZncBKXrSZ7Qk4ZByEJ0T8hhl157fwmMTYK4lLPv
 yRwAQtSaGMBgfgb6rNB89lexUXA73n8gpNjQssxKyCpJG8jNk4vSuIBnesRQ/OY6qwqn
 vbzg==
X-Gm-Message-State: AOJu0Yzs0xJIR3oWpKnmhgLRUqCrpILLT43ESuIrK8BWMrSO0Dlp8ER1
 RQyrBu0U1JvdekFekzKjD53O+p1GusDqiy2FYRB6Qt43a2B9Ap+Tad8MeOs19t5TqfrU6EJk657
 19NEq
X-Gm-Gg: AfdE7ck61c3a+DG92Rz1XcH8VfXXd8Tyve7o0LSYRSywtpw3YEgnZedXcoSgoW/kovi
 Cp/LkZpeOzxNemPZocEIe9ADXwbPWIu1KdO0vS3YT6cEA6BOONu5PGlu72Xwoc9D3LSmGFKvdEp
 LB5P41DWDbP9jZhZ6TyV96gNAzH89jyeNGst3WK0pVoU3kBQexO/wsYuToDRJpTRvqpCxR5iNr0
 yVhnpnJpW5XSIO+Q3lrXAgXEaoPm3YDq3fb4pgS3IMN3stJl8mYj8RqnzVghrmZM4C9y9r4PTGk
 daj5T1LRXFj3nGHlrFw7G5WyVd+zKO8NGNNrtZwMH7i5uDvYLBHTR3jQj2nIv7o/2abrdm+12jd
 85jzeSEpHBGhXEUds+wfQMTcVYDwAP7rb0KgZersmTcHBspCvc9Qe3xfnEozFcE9Z4roZjZRGt5
 5vPPLV
X-Received: by 2002:a05:600c:c4b8:b0:492:4050:d495 with SMTP id
 5b1f17b1804b1-49260879083mr52621525e9.30.1782310011747; 
 Wed, 24 Jun 2026 07:06:51 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:38 +0200
Message-ID: <20260624140645.185318-8-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310012; x=1782914812; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zvL4WBpJzIaEzqmtPe3zFY0dud6uoJkvNpes/hy0lmw=;
 b=J8/UfH6ph+zf+/i0JEnvmOglZl8fNfNW/FFpWiVUc4VoaYK7X8SXL7fNOsJlFJZF2J
 idvNbbv7uw4hcTud/m1/5MlmeU4LGKhcCku2Mog9v15dgzHjcwNK+vUqn/iyDQX6L3Gv
 /bGBOS/4WGJN66vTrc8Adld8jzZ7D9NFP2O7UlfsZQnTY8K/6ofssZ3bmtbmIxTwAFIK
 aM+ykgIClNqzSZoOZ0OKq7+vGokygzeZRFHL4Ixm/b9irQ+bvGE2A6nw8lFn/Alzoy4T
 MUsmJ0U91hv+oiLzxA98iJBzIfCKP0/sNqH1yrZ9DkMMoJhR3VG7Y/ZdgiNDRZ0KSCL4
 Px4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=J8/UfH6p
Subject: [Buildroot] [RFC PATCH 07/14] package/mupdf: add vulnerabilities
 details
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Those vulnerabilities applies to another package and have been then
marked as 'not-affected-vulnerable-code-not-present'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index c538b9bec8..8d96b18062 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,11 +21,11 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
-# Fix is in libfreeglut, but CVE applied to mupdf 1.23.9.
-# Buildroot libfreeglut is >3.4.0 then is not affected.
-MUPDF_IGNORE_CVES = \
-	CVE-2024-24258 \
-	CVE-2024-24259
+MUPDF_IGNORE_CVES += CVE-2024-24258 CVE-2024-24259
+MUPDF_CVE-2024-24258_STATUS = not-affected-vulnerable-code-not-present
+MUPDF_CVE-2024-24258_DETAIL = Fix is in libfreeglut, but CVE applied to mupdf 1.23.9
+MUPDF_CVE-2024-24259_STATUS = not-affected-vulnerable-code-not-present
+MUPDF_CVE-2024-24259_DETAIL = Fix is in libfreeglut, but CVE applied to mupdf 1.23.9
 
 # 0001-Fix-incorrect-error-case-free-of-pixmap.patch
 MUPDF_IGNORE_CVES += CVE-2026-25556
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
