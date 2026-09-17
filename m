Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105F2C88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 16:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B975081096;
	Thu, 17 Sep 2026 16:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLReFCFPjB_l; Thu, 17 Sep 2026 16:06:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D772F81097
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789661164;
	b=UB2DEvQt3D3o7MZYlVC6ZzuREq/HbTzKV1KXDQz4RnXE3riQT+kBqrVUaJ3I2uJ30346
	 2/xjVNSZTOez/toPKoweJYBmpTJmvCYKuqfKr2jxY6l8Cw7uB9D+Yx2+ICzWTHZNDXDZx
	 XRd/2nX3udSoqyTeQ5NoZXDEak6tRMxlCmdF7YCcZn/06yBz+55Xb2Y5/dxSLzxomDdt1
	 dqW+yIbuRzogtfglCc0MKv2o63ADLM2TqlMZgYwtP2toXeeHwRh6ALeLWmFsn2AFK/0sF
	 pkkWqtm7oWMoe3FSGeJhkoJx4bLYNBkXvUntekw4a+/bdAmwGpXFBgEGHenjM1cQgsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789661164;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1uQK30f7wBp5L1w0rQaCva/II7pqRMvR7rTzqNJ4we4=;
	b=Qvj78FZ5kXeHyDefR2lDwSw2Z1A4DaXaDUe01QsQiZh3GIfdOd4+ucoB6H1IQIEdsTEY
	 V+HlVETdLp5AL/hVB1XGBMY7DWTvya8oruVDJt0WnAaDnLmSb3xFua+c7mX4i6+qSmEzX
	 5SiOunN6duBXVXurBbUeJAvn/p4jX9CPdYVcrPHrayf3dhvqvwGR2ZH/Lj4zMebJ54NCE
	 o048raFyJIucFwYnTjqFKEfD2z2U241NxF7/qcPbUeQl/gbDAiYdq7mn77/d5F0yT9oT2
	 6dX51AKhPGLSSE1Wvxnm7GfASAC5bYILHcU/rfzIZPE4HMYLQAn4z/JLJX9tci28Tfw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pR+V3kN+;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789661163;
	bh=1uQK30f7wBp5L1w0rQaCva/II7pqRMvR7rTzqNJ4we4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LgXgbyVh3GG1lYSeugMmpSB5/o+neUFxW6e3WH5q/RrHct/zQxboEXaG8Qc7yIUrz
	 yd15BeKiXKclV8YRKdWBcaVWT60iOS0aAGCuLj42gjr6P1X3QJBJ7KC6IYKjSOj/Pb
	 foPs8AWHCRPrzUWdYcA5toA64CHOTsL7nh/qP5kZYxttAUd0yASVCn5NnvTrLqbahI
	 zI5Hclxfk/lq8N4yHT6TEFmincWVWv8CH6q7ed7jSXNsmd3iwtwbuyQbm6Tb/el0Im
	 NXPS2E9NfUqkWI122P+fjjPzYEzjAuvUBV3c8aE5H2IMEfFCtH9kvukFTT+B0bh8SE
	 b/esIC/Ba2zJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D772F81097;
	Thu, 17 Sep 2026 16:06:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FC7465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 493CE81096
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BS2d9sFcRHcz for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 16:06:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3534281094
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789661161;
 b=QX9QkPuUoin406IbSNirPgLTy8xccEcR5XpqpQRvhrL3UMRz0guZvwDsRSqGmWBQEDvn
 y8BSa3w3C4aZQihGBA/3fUrMTxYmSnUP/tepXLfPn8+UeLu/Rlrdupim03ueXrtsaDzrs
 6VL5ew2YBgZi4IgtgEfllp7a9hwquEegS6eDYlVU75dMm0E5/Fr2QsMWpjp6ieTdljqMR
 awi91QJAcxKq85sfpuQR7j/bqj17Z9wiYdvggSrh6jCIdnpkch3hfQSUFb9EID+rAlpVz
 HkCv/6fqqYIsu6cOPGa1uJIZHu7RHsndkXqSUTE+Z1mPZUpduYrtLBrT2il4/Z4tvTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789661161;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=Ok1ERRBy26VRUE33J34nZrI+E86WFJBUaJZwaoYnuzY=;
 b=dTF1NkwnVjlt1m9/lzhyDOfGktQ8bnbi7Fy4JrUwVh2/6JvkxUlmWJP0yXBzgF4ZErNp
 HERZJ5vPC2Z54qY3Sv3U+jAmL/OkpWisgdqjCQ0qSmd3kJ2YCVTwMzIiZJShHMQrBulw5
 Cb+EByYQuOX6WbP3IfMKzdwcrr3RNkiYA/xCg2Xd3ZHvS7cPGErpM/rHNGMkQ6LiB8SP0
 AKZrYdPRQvxEPmfXuAPiFdenNrJMxtO4NT6j1iya8YunT5M4RE3RsUYZLPqwzr8ethfaQ
 AW5fxS5Ol5Hbv/370rRr8ASOjdzn8vdJkzeaHXCN/xmbkKXxAC0anYSGPN40/Hh3zLA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pR+V3kN+; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pR+V3kN+
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3534281094
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 16:06:00 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f70553dso159949866b.0
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789661159; x=1790265959; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ok1ERRBy26VRUE33J34nZrI+E86WFJBUaJZwaoYnuzY=;
 b=pR+V3kN+plqfKhSXKeY3ZdTN/nslVn6zvWAziWIja3h5OQ2k6rSHP9dOlezdi6jqyQ
 p8aeWa6R4t69bMJTbdMS6yn/E2kqN4C/IC10xxFavP1mSR8AUOQu3z2eLkUm/zII99Y5
 qcMbnGHLrJw4i1kjgER9SbzkZZwC53+KZhvXXWCQdQgEl2q+f7FWcoeEPyc/7bqhY+sD
 u7yUDHvWRnH6PzxAAV8xvWaKONptsfX8cyRyqriB1xAp+IkbPeoc2a8uLUwYYyCu0aAW
 JFBiQm18hqy3fss0L63tNZ0oT8LEtg9PYrs2kVFUi7DVzqEU5IPsQpovopzDMn7NxNQl
 CWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789661159; x=1790265959;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ok1ERRBy26VRUE33J34nZrI+E86WFJBUaJZwaoYnuzY=;
 b=YZFeWhJJdcRo6sZEhiFuiEIchI+SvrgoqRPIY+uLDXIaPIXSAR4K2bSW2BIQcr61Df
 yGtEdvaQQ+SkMEYuhysEeTfJYBVTGdVgkqQYiEYIjsled8zXu/8+igUgdAS5xsqXhLfN
 AN4hNaMrjFHOzdQD9AGfm6nSWrlccR2GWPm8wGn83zR7Go9otTxJS0F+WhH9sEJcmoX4
 loQpAG/UIBqKHzvA4pbX0AXedojXzNpQeuxK01lg+LGVomQrgMKy/UjCmfQSXXcq+WBB
 YDxRNf14znQx8bXIBV7hGzUCKERqGCpq9ZzqVvUg9PU4srLtovUQ0LP2Fd7Qgv3itqDU
 hZbQ==
X-Gm-Message-State: AFuF++l16Rq0WbRdLgLaNQ2cK+qN2zqOnfS96bdsf8ntQtoPM0hRnlVB
 1bGIQgrbKDzpCbw+5pU7mtpoh9mClNsmomSrbIz6bTZdpNw8p8u4iCsZi6MY4A==
X-Gm-Gg: AYBFou1C4ZxludJQJFT45hLi/seiQrKR8TFZ/O37+DR59fhJ7MVDXn0ywGdW+SF+fNy
 zi7hPsT/gc4G2WA5Rhu49QmA5o2TqDEb2P2HxLLIqIJzbjAfTohDPBrS1G3V7wZ7yOqg69lzKAH
 3DmEM/7RRk2TiFx1cIDphOGa+YqY/UOzLmqlOXOIHM3jBbqDiIqkPoObCto2fvmPz9vQdEVoV+H
 awHV8P0fBAjpXeCnW7sBGgX2s3bOwhW3wwCDwRcucEqUgL1UOPU8KIGp40ACdYXFdQdFLIi9Kiv
 9T8GpMwrAS1ndNWW/WcMf7Fkrihjh5epj6CB5WGMPXP11R1+04Et6oSsg1FrJmZn/wuVPtlVTu5
 QuhO6+iTuC3y/sxivYGzCx8qk3N7k3x59nXEURokAdD5/wzQvVULgBQR649qvlVCewxxlXyH9hm
 TQVYyJUoRPIGFDzvDFhNJ8Xvk+OwD2ETJsC4AdGvwmKggp1qvNyE9cD9xGsNrv22s8ocKOWBMP/
 x6coFMZ8tVRK7zA6G+n2GdCU4THcEcJZh+7
X-Received: by 2002:a17:907:9492:b0:c26:1648:a06b with SMTP id
 a640c23a62f3a-c29e530a418mr543932666b.38.1789661158610; 
 Thu, 17 Sep 2026 09:05:58 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c29de6903e2sm314189966b.60.2026.09.17.09.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:05:57 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2026 18:05:41 +0200
Message-ID: <20260917160543.243218-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914103020.3485030-1-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 0/2] package/mrouted: bump to version 4.7
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

Thomas noted that the S41mrouted daemon-path fix is unrelated to the
version bump and should be its own patch, so it can be identified and
backported to the stable branches independently. This v2 splits it
out.

Changes v1 -> v2:
- Split the S41mrouted fix (invalid /sbin path, executable bit) into
  its own patch, 1/2, and note the commit that introduced the bug
- Patch 2/2 is now just the version bump, unchanged otherwise

Best regards
 /Joachim

Joachim Wiberg (2):
  package/lldpd: security bump to version 1.0.22
  package/lldpd: rework start script

 .checkpackageignore      |  1 -
 package/lldpd/S60lldpd   | 80 +++++++++++++++++++++++++++++-----------
 package/lldpd/lldpd.hash |  6 +--
 package/lldpd/lldpd.mk   |  2 +-
 4 files changed, 62 insertions(+), 27 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
