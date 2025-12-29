Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C899AE8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 09:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C2D407A1;
	Mon, 29 Dec 2025 09:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHJc_w-9B2ua; Mon, 29 Dec 2025 09:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A891B4076D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766999251;
	bh=bex7Hy1y1OLu9m21T5Huup0KbyMbDofvai/MFGzihIE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YyuuRfb5qcluba+8ilj4O9Oy9/Mr7Us9WLeeI3UKuWVUhzNYoL4tn1ZDIUu85mVqx
	 6sCGcPHDCZsCjcAuUJoDGaOFGOk+drZKYqr1JE0/CWGcWyoyz0a2rnwALsg136+N8R
	 Er/BY1xjiwndGQprkb8oo6XSNbWa56MpEzi32j+Jbw+6tlLX7X8pxHIRHOc9pdzaCx
	 uYORmNwo7MCeonO3Hp7aFThwSTxnPefGn4pX4Vdifzj3c975AHzNR2u1Eddp2sUspM
	 Bw54S/DMSuYKLY2oHOOnBAKrT8TKy9mMbykjo24/5fxaYYItDv4+C52dSfoUM1fyXM
	 3lbR9D+pxq6hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A891B4076D;
	Mon, 29 Dec 2025 09:07:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C601B1E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC66140131
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGS0Lnz6rVF7 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 09:07:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7B48400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7B48400A4
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7B48400A4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 09:07:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so93577625e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 01:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766999245; x=1767604045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sw8+47NlrCqMZyvVsJUdgJyg6SeUcrKxiYTO+w3HXEc=;
 b=nCSOWXgQGblf4QJYFrYgLNKFVRhXUtpsQoPseDcje5u6IsJVqltfD94nmZK5GJveBs
 xgZ0YJtNKTgkddLtIp4uYHiryR5m2mb+qlj0XY1+Ck2qEg42egGqDkMC5YmnSAXGogOD
 nMZXisE1Xsly3MbyQUDoklHReku1BPQR9ocw6ekRqxAFM2Zj8rCTT7aC2B2bff3vRmX1
 34RulHdbYWoJU7ZI4Mjzs2U8MLJCCQx2Ry1O6vZk5tihS4daq9Cz1Aw55SxQXeBKD0My
 +PkeJFkfcyuzbmkapHdx/MH7tEnu9iV5EU2QUGVYf0n0dekYqwU+j4agnbnhrw9T1rcf
 0hvQ==
X-Gm-Message-State: AOJu0Yzl0vgegC85Q3KhQR4Ec3g/4i/y4ZLfdPTyrMFOxONM2JQxW5QE
 ehcFo5Q2rO3oUMYOxQBr+j9o1DOsM9gPvtG6ZP2JFmWIIBHLRb8F1Y/i1/XBwhmH46PRujZ1397
 WA+HImFI=
X-Gm-Gg: AY/fxX7qOH1k2wt6S+dTe7LAXGGp+P99msVdhCamBeR1c+C/eqyXqtijBMVg+Hs+fRo
 p1WR+SezuYRo0s5PsJG6H209MqJmAWdQDh0zSJ/ujjDd5mLhwhfG0Rz6VYqveYuFeRumHdnOh3M
 j/f+JcFJKM1LzVYbbQusu2kZ7h3r/2zxl74yM5MdxhnHKrcPVjBcMpVk54Q5T0OZ6ysw5AdGL1D
 ONKeTS6Avm7FH09qnAlb2FGqIHPGetQIES8HajV5afN+xlv8WQm5Wj7X5Z1au9Mb+Fpk8r6KhpZ
 M8w9NprxiOed2rJ6RnvWOQD1fSa/wNC9bfhG3law8YpyR/+lFK3y/mgASr6S30eYmvyv/TSZ3ZL
 1jc3d+GBNaQvGICKj43G8RUIKIMa6BCpTDCusvFiQ0k4OG+SOWbeitxkVYA4rrNU2sQiBcG2DwU
 vdVvzZfvLwSxiV15cPBPJs+zp/LLZ9uns2NQRNM13omFn4y1MZBQh9fhooy4JiY4EhCy88LbjGO
 A==
X-Google-Smtp-Source: AGHT+IFJ0uW9AhL5CIw6GJ3yWth8OjE2d4ZNFr5eOSmqO3NwmOoyoJ5a3W8VOf0EHDAoKiCbNg8RPg==
X-Received: by 2002:a05:600c:46ce:b0:477:8985:4036 with SMTP id
 5b1f17b1804b1-47d1953bb1emr368581605e9.1.1766999245440; 
 Mon, 29 Dec 2025 01:07:25 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm538910175e9.12.2025.12.29.01.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 01:07:25 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 10:07:08 +0100
Message-ID: <20251229090719.13291-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-1-thomas.perale@mind.be>
References: <20251229090719.13291-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766999245; x=1767604045; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sw8+47NlrCqMZyvVsJUdgJyg6SeUcrKxiYTO+w3HXEc=;
 b=cstdzYSRCVhjkFqBzpEn2kN2yCot2Jx68oMxE7Wy7SEAzRJxps4Y+NXW2Q9Lhk076f
 mTFrcH7pTYypg4aZMt0Kbe+ddtDOD/UmgX7UBf9XcWQ9vKL9RjTTWnCJLwN/exhk8bKF
 yJMjuoplh513ug6i8tUgu/dWPtfsSHFvHWE4j+ze/EJI0R5BdqfGir1sE5Fo4+v8YEZO
 ZJ/8ZJ5iQy3BDKml9zNEYr7S7EnE4TkCXvSfG5o1tkNGuqDy40KqO2SFCjiJNQ12hLbk
 n/GWwPZeqevV6tD70LiK+Dg15aalc8NRPnpQLf+oiZAKyxk2MbkFKDu+qjiqGau7ireu
 UqDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cstdzYSR
Subject: [Buildroot] [PATCH 03/14] package/tinyxml: add CVE trailer in patch
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Bernd Kuhls <bernd@kuhls.net>, Gilles Talis <gilles.talis@gmail.com>,
 Martin Kepplinger <martink@posteo.de>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header
and adds the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
index ea0f6476c8..1da5ee913d 100644
--- a/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
+++ b/package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
@@ -8,6 +8,8 @@ by two non-zero bytes. In case of malformed input (0xef should be
 the start byte of a three byte character) this leads to an infinite
 loop. (CVE-2021-42260)
 
+CVE: CVE-2021-42260
+Upstream: https://sourceforge.net/p/tinyxml/git/merge-requests/1
 [Retrieved (and backported) from:
 https://sourceforge.net/p/tinyxml/git/merge-requests/1]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
