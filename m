Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C95C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A57A409F0;
	Thu, 13 Aug 2026 17:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVlb76EsKQj6; Thu, 13 Aug 2026 17:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E8E409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786641152;
	bh=IY1JwcNs3X14IAWpmBGq0GJ76NLmXgMIhscJCBwF07o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=py3ET1w8+kuz4x/reuTOHzTSjs3oA7Dz2EOEw95jnqJAyZOk5x+0sVTjyz+enverM
	 R9Q1oIGs7Z/UXmG+HRbd3bMaHTYucvOIAF2sfaxeAWBe9rWFFqSR6YPNHGfcxr5PwT
	 aKwnCcouXNBbX30wvLUy7bTZRXS6SMEiM5OosxWCERagk3ncRZFWpik+MYCFFJelOX
	 7fKJIi08AC27GRcBBc3wPIusGlD1echeVPjKZY8+mqSzM8WHAmLcOitRiMfibSFn/B
	 DsjTxJ/n3SnS+WgKGTDnHjceXOZgTHs42rtNAn9sGErIibUp4V2uIqglcEjQRiMdpQ
	 0rpXvJfVxk42g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E8E409F1;
	Thu, 13 Aug 2026 17:12:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9316EC
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF40F812A3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOIfCFw8KcBm for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 17:12:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=richard@vodden.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 190AA81236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 190AA81236
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 190AA81236
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 17:12:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-471eeac43bfso37398f8f.3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 10:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786641147; x=1787245947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=I/cFVHQxPoJ+wzwdoelho5VwXcaOqW3JGAfgXvHAQIE=;
 b=a9xZmLbL90p8UXFuDvMdLlG9Yq2xs3/S2olnnkiFToWeuhA9jkl6dfA4PshZn75Nxz
 o2fHNVlnFsTJSPZoHtFtMVv+bl44NRrMyVOK6XjkyaCP23xaBGeEzcyWzJIHdCYT3iRs
 egblSJNpsBs4eQh4BK605PjWFQOZSbX7EXjCEEDhMlK/SonYY7iwwic1cUFOAvpfM/W5
 kdQcri/hoGpyRi76HXn7WjnPf1iSAF16NhWwdy7fXRLQREvMQA6+cObU0Bn+XhHGRP5F
 YwI+aKD0tlseNH1RnNZTUtN0u64zQkfoykGYFoJVWs3aDLaDmCNZEMYX5neaXtBMoIGu
 dv/A==
X-Gm-Message-State: AOJu0Yw1q7pkXpVDA48WFwmIPhoYNmxxa4eyynG6kshHpNOq3c3ADdO1
 PQtxmS/y2c1l6J2ePEYrIOIiU0n/DQhq0SGAXu1VmbT69tGZctbZm4Rj+aqrZm047cRMJ65/+Kj
 x5/L7CA6LZqK9
X-Gm-Gg: AR+sD11isjtNrNRA4vcOFBhan2TM7b06UPwlejIPasH4/pCYImR7NgZBZddsAQQdwKd
 zw1TKROLCRNE3zsX9tiPo9aP28ieHQ1EzfWPLx7Cuvo/pnHAe+9dK6QSTVmzt3q2VnIhhgTA/TK
 gDzUTN0vPhSDaYhNJ2Brd86IE+jHIUdoGyvWCaLsWG71Jf/rhY0Bx5ENZdcUEzDl34iLgnzatil
 iRLt83/Z6AdcqUwJE/xBCfmraRTcftNK+LYnsYqsdtSQZ85SbOB+XzrbDc7h6nY44fyCK5118tB
 LR/xh/v/mxiSmpskzya2D1dWgTNw5FHIa82GVtOu7OMZKuHB4DXY3PN0/stfpGKELRow9+8CT40
 CscGISqOXKVacKHnh9GxnceuIwxN0hinSdBub5MC6SOG3cwG4fmlmaWijMEXr0/Gx+I7qxxVKb2
 dEQcPWl5YQ3BNWyb2NrONaVtCXxBEzgyS2RsCDWF+xThEkyAini1oTs0Do5IvAj4o5j4RzI8Q2Q
 4cZkkfKPnGQWrXwlOWQeAYxeJNJ3p5U
X-Received: by 2002:adf:ed10:0:b0:47f:93b4:2def with SMTP id
 ffacd0b85a97d-4815a045f04mr8972758f8f.28.1786641147025; 
 Thu, 13 Aug 2026 10:12:27 -0700 (PDT)
Received: from Hamilton.. ([2a0e:1d47:d002:5c00:f03a:f2f4:3357:904])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f21a31dsm832291f8f.9.2026.08.13.10.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 10:12:26 -0700 (PDT)
From: Richard Vodden <richard@vodden.com>
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 17:12:09 +0000
Message-ID: <20260813171215.3483906-3-richard@vodden.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813171215.3483906-1-richard@vodden.com>
References: <20260813171215.3483906-1-richard@vodden.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vodden.com; s=google; t=1786641147; x=1787245947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=I/cFVHQxPoJ+wzwdoelho5VwXcaOqW3JGAfgXvHAQIE=;
 b=YevCurWmMV8O1TvxlkQM0XgEyHsNSBCavi4cc0gQKKHP81o2VK7qWE4suWxTE+MXF4
 NVQuIpgIfK3Q6IY2D7HReNOtE3Q6PdAI2JltoLBzOgem6j0cY0pjmH5X1qQbumgGEXyP
 oOPzdUzGf8P4nLEAIWCATLiHk054elbrLa0ns=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=vodden.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=vodden.com header.i=@vodden.com header.a=rsa-sha256
 header.s=google header.b=YevCurWm
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Richard Vodden for
 boot/opensbi
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
Cc: Leo Yu-Chi Liang <ycliang@andestech.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Richard Vodden <richard@vodden.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Richard Vodden <richard@vodden.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4460523447..8ed803c7cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2886,6 +2886,9 @@ N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
 F:	package/tzdata/
 
+N:	Richard Vodden <richard@vodden.com>
+F:	boot/opensbi/
+
 N:	RJ Ascani <rj.ascani@gmail.com>
 F:	package/azmq/
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
