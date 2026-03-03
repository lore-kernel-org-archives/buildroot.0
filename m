Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF013EDEBFB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC10081287;
	Tue,  3 Mar 2026 22:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzKYO9o2vGsB; Tue,  3 Mar 2026 22:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B8B481279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772576641;
	bh=9WA1szCJe9uynlTB9QXTiLwj9fesTTx1+g8idtGA0Zo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AghRiwRwEiMIxHbkZUh8gZW0612rjtTOWTPSGYj+x1ZdEq2sPKNXMVFTvYWXl7+AP
	 zQ7KuT/8n5RjVszPLN6ljV45csEAgK3QsVxP/e1iUbtSKrn6zf91NgIkP0+SRw7OR3
	 3ysR/zOQ+sCMCS5HDWK9cnU9yJ7iuedxNcnbhKSPtURy86EcG1+FfYUny9mXxdVUuU
	 ZKTVGJRyV/3lvdonQgrUMT2vj0U8f41AhHtf+vBpmfaDvqq1h54Bgsw+3/t6ysm2yU
	 DjBC+hwtb/d6s5fCsEpsNeCFYO6BheBIgTvDLW3INXcFhDn/IeakYMEkaOheMGlEAP
	 bQzvo66+zKrQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B8B481279;
	Tue,  3 Mar 2026 22:24:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE4A01EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3EDE606CA
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZmEoKOWx4_y for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 22:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C40B9606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40B9606B4
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C40B9606B4
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:23:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso56144775e9.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 14:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576636; x=1773181436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8GzX2efNb+wodLXoC/QjrCNarl9npMqhR+V5K53Fdc=;
 b=adpo8dvlf8sQqUaeG+L+DhygBUfnQ92J+aNnY3hE530raUdAOk0/zaUWZOeEx/y2Ue
 ODnLUe7R3shaHf83oG8/qnT6Cz4IKaw5XbRBQsUXBiuJn0Hz6ueeWgleNbhYuCmyW3i8
 ySBHOGsyQbvU7MsyuVSnIJo+PCccUwNDJtv2XTDbxUkINFt6b7qQcQF2/1sh4+0aiQ5W
 HfG/mZ/XRBtsKG9/mEdoSWPt6rGD0ByU2KGA2XrvFPAEvgm9lahUEsOHbkt3bsPE+euu
 OeRdkIjcpksRlu8AFj6vr0IuoJL3VxV8BKkI2+m0VuYCxhmRqr0BxVe7+1sVPaOjNqmu
 jXoQ==
X-Gm-Message-State: AOJu0Yxcjjih4x2ljvXIyVcEtq5FTQ5FnWhgndDRxn7QxURKhewwL8DQ
 g3wTEdwt4p2IB89MbQoC4LPCCJKxgLNW2YUSJHfWEeTNPYYaBhWOaH2phLJESU59Q98NYkYGWYq
 W60Ks
X-Gm-Gg: ATEYQzxRMV5Gr75AX8GLkOb9hssxB0PudhZKsXuJKtd9y89UcMHfYX2OkeIjNlHS0zu
 BCvxMdoHhB89+Jc9aBawuv/a8q9mWIWMnoqtPaNr4iBXB+B8/+3fYJ12G6w2hPimGKrhYoEFC3r
 DDZOpC5CzncglwhHmBGOa3WMRLYDF8Tnn0uApM9sU4SFT53zsqyVxAqKAWN7cQh80ylq65+EEMV
 E7u++HaProrOUn5tuTF2MowlIIXSEGzd/8mcWeWOKXnO152gsXpoIq5iDyvSaU+fQyNJStedXTC
 aTDaTfPNDW8itB8QqtooFNB7Xkz/1pEJv/ucFDT10VzvBQZoPrRP0lXaZmqxEYX3Jli3+1YCsjF
 RZbRwJY+wUDaqkdT2eL7VQOjk4mAj3sRPqvuiMMAgjr2fyF0naOQJ+N/eUXviRg6s/DPzuiBWz6
 TAOsLMtj6pJ0Mzjcc5r5EKC3ub7Q==
X-Received: by 2002:a05:600c:1d0e:b0:480:3bba:1cac with SMTP id
 5b1f17b1804b1-483c9bc55c0mr286608905e9.6.1772576635736; 
 Tue, 03 Mar 2026 14:23:55 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187b6ffbsm7992775e9.2.2026.03.03.14.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:23:55 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Mar 2026 23:23:49 +0100
Message-ID: <20260303222352.95612-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772576636; x=1773181436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t8GzX2efNb+wodLXoC/QjrCNarl9npMqhR+V5K53Fdc=;
 b=eZaWjn9DZIKLmZB/gwWcl3uqAMzcgnd+UiV0IH1DHHTD32fLkXTU4cKvUUAOP4qCIF
 tVcCC4AlbbzwKlt/xzH/ECjGxoD2XgFfA5Pnh03VzbcoUHYwbXeN+ATWrG5vHQ6TLX94
 Y5+nbCZ8h22l8XbXWRnjmUV/5N0TXdLcJBJzthfbzy9ebZiRwvtybulpkACOGmNhLvZy
 Mcn1gYBA7V/lrDcZ1IeryZ1jwlxszB6LoCaD2OwbcMWK5fD8RfT/lvXaJ/QMyN0WnCnN
 p5asIPaV091xJzgK+z9Ao8DvpP6303YijifLJk/ftmbO49p2tqfSdZhcJKvE7iwHatIg
 1UAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eZaWjn9D
Subject: [Buildroot] [PATCH 1/4] support/scripts/cve-check: add indication
 how to run
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Always run this script from the output of 'generate-cyclonedx'. Do not re-run
this script over an already analysed SBOMs.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index ff14e4b238..2bb3524014 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -29,6 +29,9 @@ database.
 
 The NVD database is cloned using a mirror of it and the content is compared
 locally.
+
+Always run this script from the output of 'generate-cyclonedx'. Do not re-run
+this script over an already analysed SBOMs.
 """
 
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
