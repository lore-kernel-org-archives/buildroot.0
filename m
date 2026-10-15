Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86DFCCA466
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A8C160A86;
	Thu, 15 Oct 2026 19:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xra9ZcubYMJl; Thu, 15 Oct 2026 19:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B91F360A80
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792092786;
	b=AdgaAUBAhtQbKD5SWpak3wlfjew9Nhtsqy2fLCDaGm404FJ214YVCTCbSVX9ya8y22jo
	 1/Lefd+WrPH2iSJltY6zUBOY/5d3d53M1C90Wtl3ABmQFaJT3xXr2G5F0tUGBsSVPqxmt
	 mZ5mbnG0AL42PmFgZghuT83SzXxKbXsVgcXSDvnouvPawEBDZ7f5s76Sp8yXWvaaR8pyt
	 rCp1Sl9gMJ/w2KHkmqOPvroScGnZnRXAI479YlQljbdelXwO1aSYPA5KoHw2le0QYcw8i
	 3a6tKRdx/5cFRYCvaqf2GQopFhb2pvT4Y3ZKupQnkh7+gqtlfoak6xhUiRqHik5HWyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792092786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=X9bcTU1IL4LE5QggN7oDz6DGNqC2J1yB56PjwUQLPKI=;
	b=ec8U1PNGIw9y9kl/9W9K54/kyPn02owimQT7Kj03rwVHrbQSNiCQ56wvoZBgogOaXr+T
	 JfnN8PZhpRfNy/OKOAlHW+Uzt7+uipvG12PyNstbVkWstQdp06fP6WTqth5KvqWg/YUsS
	 te2InU3F8wjpkKhONahNfwjsSMAeeyoS/4DZ9cOHyzfPCkqujn6pU4qSW3wAcgRBkFgho
	 Xa8dRu2QjXUQLnajLb8r+1UFDLLZ8StHk/LoxmJnoaJFa4q2h6A0HQBV3S2pk0rdWo83c
	 +q1c559EKLiwD7HDvkYs8erT0P5Ysq6DSRB8IrtKC/p9UtVH/sIH67s/vZr7ReVReRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792092786;
	bh=X9bcTU1IL4LE5QggN7oDz6DGNqC2J1yB56PjwUQLPKI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ThzKATMLoV1azKkPodMlR8GG00WEr2h0AlDjuPBBdTrs4+HzgfgeEi9pLYFKDM1DW
	 Ze95OfgHKSzwmulbLRUhPi0lpqOen5+cD6RKSqa5L51OEAJ5xVKdyU7lkFe7VJbMv9
	 OD8pqfF978jD//y6eCW00VOJ1F9K+8KjHkGyPQI/bnTu5QzsYLOSbdtKNLq38+PIZm
	 guiVP/laWvqCcvrz2gt0a9YWhnbF4UOBk/7JfDnF5vrg+yh8b7HTiFHlBmn1YiiIft
	 y9PlM6H+dF6sOoNEd+/D8k40JVdkAYh9kwPI1QcKvYaAj1Zru6vWn67CwsGvb+dgIh
	 HpqzRRAbbHL+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91F360A80;
	Thu, 15 Oct 2026 19:33:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 759211AB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67F1E81201
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEpEMUtUjDDh for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:33:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB2A2811DA
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792092784;
 b=s1HOTGxpe97pTKQxtMDHXPSe1XOZqbelfLR1R5hMh2Dtvr1AT9W1WVyV1ruRkJz6Znqy
 G9JdDlsNpLhwdGxtcC5V60cqEYAiJImXpT4w8npaPp7kI/2YsY/zKS6lQI3DP8TMwK+Kn
 6o46k+/W4W19qiwDAfP62UJ9dNzUIIPF03vGooXlitn/OFJA6g7z+0weHdNRvJwRbYvl4
 i5exJ/htLEaGgCG03ShlwdfUYKEQekECMlvQSjNbs1jUTRcfXwXpWpawMt9OfbHkFIVDr
 ANwiSoNqMSWVTOu+HiZA9yDbLNm9YearUprJJPPmShJiiXW88YDEuWhKe8JkhUPJ1Zw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792092784;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=PRdSiDTM26LcRe8fVrMefJSxwAuOqKZSTA4IuGfpXS6tf8rCP1/vgl1I/0CWDIsWgqY6
 BPDLEGWSx9rV8xf5vkQ7WfjwT5b0SKMP5H7G9Vo4clXbc3Kaqi7e8XFc4k4oqd3DK22Hc
 rhaVSUqLLBDxqX4EHdyNvU/BjGmbUfRvr1G8MR+7pFS7esnEDYn7FhTpQjb/Pidqf1iI6
 yi/id/YR+tiNUvYGN9LrNuzgntVMR+Lk2YqSjbZ3c7TUtCDJMu2l6ck2N33D3oRYxzgLw
 D0Gs/wcB1c0Lhg/6Q0YihenPLECKPWTtznVy+yK1oQ+fE3Q3kyJLJVyAAAqGLrRvlfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oDsVOuih; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oDsVOuih
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB2A2811DA
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:33:03 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-6b8e2d8df4fso4181928eaf.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 12:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792092782; x=1792697582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=oDsVOuihR++RqujkrSj6nCvT7ThUjRUbFZoo+ZRv4DenZvovFP6nZTyPyof880A7+B
 nuofE8+9ZqsXmvZ+2Js+b7O/1JCE8gOvVBH9tteIdXBwYVWbkDmdUoaGl7aetiyBvdXQ
 8AUrcaN2pe1wWrAzMG0H5Mu3k5Svn5vKlaIdJPiS5DaUZ2bzKeZCjLxVpiXiXpwOjxps
 uNwzP7jx7LTZnOOoGVxSOF/2I1Wg2PHd1Vcx1VS9xKN4kZYt1CUq6lkXbkJMYxzlncxR
 pH39mufqxg5duB/K3ankK88jdOV+y+UzfO3rah9h6QI9cPnIzUs7NxgR0zaqUtFHBFu9
 Wlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792092782; x=1792697582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=VWlg8aAoLRi7tsGktEdvl8V1qlin2P4x+bTTMTy2pykuUg7QER4XZ8YFvoHL1WaCK/
 9LXOiznEaJOytifJi8EVqC5DFvpoKWkb4bhmR5QhLM8Fv5iRPzu2yMFcya+WX+nz5Ma8
 fVrAIaI/Ur8SHx3bnqDGLcgJ2kLtATfJ34dPW2sphfMyJSJq1EW4JCHynsAsZi6ZKXXf
 hFfsVDONuFjjuvVk55Z7sCz3hyO+w88+x0zi/QQDIF6tQo08PT8ck65fWKfxi51jio2y
 1hpqt1X1+5S/6zuWKwlcX8zaebIfN51C7f6k2IpIk1FtEMML6l0HXT17p+9AWdkhFjYK
 tkuw==
X-Gm-Message-State: AFq9FYJ3YNcHSuRc2n1UVjFTZuCLrlh3fKJZMburnV7YKhvrmAJWVYZg
 2SksA8JFpN3N+ZNhKAeugFLHVp/AjoNOFpBfCrI2i7arsO1OUhS8WRCBADBAnQ==
X-Gm-Gg: AYBFou2bHSNCpNACti8gfYLAgRm54QQ04MXuiELbpHReVQ2+Jw0DUIsrvqtlDhF+JVo
 WCLSqVJytpakDRs7BGD0Blbese/qXPyt2MZsv9lgvOxRss1mpKmRBO/p9KRx9qCYjV3NzNQOjfj
 o8n4Al1lEL0U0/CBlEeba4zeqpIvSBFmwSuN7fhCNA8zG3/EmJWDpor+eHJcuL8j61/eq+q+Wiv
 BE0FfpMiyOmrS7u4wPzC+05/wNEPTR4CYTpqenzG2c1bpAy5qKXQvCJVAqRmPdf8Q/iZB/o6paA
 vFD6/ANtjeCEABrcJ4bAYRKGBRNqRT3l0rYOGXc7FQOZ/yMPXfnDOAT0lwGrVNACM1D5kbG2zzq
 Y4VAfUNsZ7uTf8jtwPHPIuEVm1RUXwpm7Jn+PZaC4Y92quX9kYXoSTRHHNzFGtyQ79FU1buJ3g3
 w9CoPZPuHYUUCj99mCziS3YL1b5bDdQANru0gQeh1W0A6FxydLqOT/xhHNjAF3BBJ1imSat7XOi
 t2b4+QED9eZN1Pvr4l8px8+P6xa8e+95IUWXGpygq0MhH8X+2Yo66Fy/qn8B5WOUUALvVb7k3aA
 6X6geFa4vlIXyli187FYbhMmOtIQ2DNm/8T8YldMLb76PCcu3DWFWOgL5+5o/VugnGvbaGHHnxV
 BX2L6P8iZ/TQ6GuCXmtdiEO2QXmxUbv+6ovVw51oJUjkdO8nB0bbt
X-Received: by 2002:a05:6820:a0a:b0:6c2:396e:b991 with SMTP id
 006d021491bc7-6ef0f69536cmr15155266eaf.61.1792092782679; 
 Thu, 15 Oct 2026 12:33:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-7018f2df328sm180045eaf.7.2026.10.15.12.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 12:33:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 13:32:39 -0600
Message-ID: <20261015193243.3299884-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/9] package/python-jaraco-functools: add
 host variant
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable a host variant for host-python-jaraco-text. Include more-itertools
as a runtime dependency in addition to the build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-functools/python-jaraco-functools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 2e144f0191..62f9e1945e 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -13,5 +13,10 @@ PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
 PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-more-itertools \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
