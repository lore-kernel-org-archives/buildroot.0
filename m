Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4670C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 20:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1416540F3E;
	Sun, 20 Sep 2026 20:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbI5FwuXw5cS; Sun, 20 Sep 2026 20:05:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4930540F39
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789934705;
	b=nBwVp5medFTOP0l03/DXOurGsr6bfgWiHdv2XDkHcKBjajY+TRHDIjhM+khZHVW3+sZA
	 hDeUsMiPJnNPcV8YHW8jC2DeMeWbi680qLYTYefCHDYkG5fk86JxiqslVvGEGuxuBZok8
	 9TcDeD2/jAwKlmjLuCUXul+ToJ3g36GD1XzeVT5ZB1o9NDZH35KL14w4mqRH08yOjSGgd
	 xSMC2oqpE1wKhn+BOYZioC289Tsm2eNLeIH9pERGAQKBsNCtPqKdEUW9fXnUXgd6Pfr2o
	 mg/NZ87LUqIQuUAvoIupdXIvMVdmqhr13vAUv9TDIdOd3+QoCnHsenPrMXnM2JkJQ0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789934705;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9LzMbR5ibzx2+ZiMY97iu4pZeUH7fXTL8w1jW791q9M=;
	b=iTxyUlnTJLkFYd0kr3fm/LSVJfNip317ncQZWY+qcANRQ+Bl8h7Xj5+9F0NY7birSubZ
	 22tdlSNM5q7kFPI3/F2gfshxDvjKRN4ThFn9LintqI0CQYBsh59mYDnYmfH7Y2Mbnyaxg
	 jJ4+sSrdx3dNuFkGWiT/nRAmP/J1rpdNmrsHskkMRdgGKzZKgVRm1S2vLTzI5KXxMw9Nr
	 FUm8EW2XHdHPeQkHzb5A9Xck1QHs6er9Ptlw72kJBnVdfxon4p7j1UoKcPODDrCfRTvz/
	 03R3sPx5aSBLWmH4hoYcsgzeOWUsz76cDyIIFCy6RdNMKYOdIGGcRaGkCxcbhYL7hzw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789934705;
	bh=9LzMbR5ibzx2+ZiMY97iu4pZeUH7fXTL8w1jW791q9M=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=swYW0TPc1MxLsJqpKijlbqb4KywOHyZvG3lOb8cmyJXLhvqbd2L377aBJ8pmsSYnq
	 SRCJBoDEZ3IL9kiPGaA7JQ9BEChdUyYP5CATc07MDw90sS5PgP+R/j/14dSl3OzWz8
	 v+FZySDHOImvfBF0ZML1MXYrvTMWl4rKJTAu1bNEHotMwat9x/3bQHAi3/G/4rUPgR
	 wkWwvZ/PhsKFZBCOFeROUDmSaCCtdAVgwHCmJ0OOSRd7owWtKS+HZRplSVvwhng77L
	 npTxVo0HbQuDgOrLxApKhDezx/R6RVdpql9/SZSiY7iu7c34j1pUebjI8Ll/FnloE1
	 9n9L+K8/KP18w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4930540F39;
	Sun, 20 Sep 2026 20:05:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9FD3DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A1544007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XW4r4U5C2G34 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 20:05:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 80D374007B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789934703;
 b=GfVY9WM9+rUMFbeQY8yO2ZBM4QLR3fOXe6wBvV53Uen2sSMKYVfFQBQEjNcY+8WpDs/C
 nq4b/N0+SSv+GDuK63SdHLbi/c/sil8Ye3E1k7yldlJarln5iJFSCyzAFoLSbrXofThqn
 D5nKKkYSyZnwlZZQ2Xi4MlTds3tIVkCbF08eM8kJxJXXRTaPF0EQ+tzTUPY9EvUASMIuP
 z3puTHW0HF3njLf7nfgFKekeRxQRl1xD6MODLbqe2w7XCBlKRFG1oX4mvKWQZYtNRvuvT
 XGqZFs7J6LjdvCQ4XP3pcWSHjFYsmCgxTUjys3oe7Skde9yzYEuQAFVwy1JKlI0DkFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789934703;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=Dvs58oOZzwrfCPA7rTRFRxLtUKHh2VyYIkE0tOX2pj4=;
 b=WqeqEanPGic1hjxpNXclycbUebGaV79b9WE3ut6LGu39G+PhaxiJpVe5b11n4vIRG2Aa
 PGCoJshtfwYIpKx1sxxvQbLF1L5cbNnsce865IhJNrOExhDB5XVt3KWG4cS98HxERtzrZ
 hGyCaf2CzyXqkMDHHpMaUXSm171DJNU4Jpq3o9+sUNT6fWtgIwTET+69zxJLiK2mopMeX
 z1pDKQ42QnnwHiAcdVAIxaROchi8fKlTR4mxhbHDvrr4Oxp6d7uoXUFcTUHhGCNbAZSuw
 P62OYMFqPiFdbN5sl2hhbvhkcdWhhWFqrWmZBZzvHSDxMH62isnEMsegw0TbnlY88eQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="XEQS30/r"; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=XEQS30/r
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80D374007B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:02 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a60591ae54so3563906a12.3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789934700; x=1790539500; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Dvs58oOZzwrfCPA7rTRFRxLtUKHh2VyYIkE0tOX2pj4=;
 b=XEQS30/rPegLUON8M+ulfoXuozshTcdSZZ6AshWBEjY+0ke8pik8kLKQgdlx27cWxt
 oKFKcV3t0pUnoTjFsTf99f4rTtRXAKIiKdjj754YvkyH0Lwav2IyTo/q8cPYZZbJu//g
 dsH4UHGMjIUmMEWFbasYYwWk1PrGdc+GVbGVuH4ENYqUkOemBsKx45e6CB+FQO/UaYfw
 icdwheVxwwnVqsE5k4PzHeQTVd6b8jw36qUiOlMP0j02Xp0xEwhIx92Jn/RRghbhaC44
 uZxcEeqcC7kqovj5zdPLU/3YBj7DWz5iuP7QWNq2Ix6eS4fpvnAbKK8aPNcQdI+6/ipC
 iJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789934700; x=1790539500;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Dvs58oOZzwrfCPA7rTRFRxLtUKHh2VyYIkE0tOX2pj4=;
 b=dPI3EZf+9gLjyK2sahjiyxr3K6uWqkxuSv6bOFqSJDwItVrCfLmAdkXeMjQCTFEfsb
 Lju92tmP3hWZmXCc0HtY2mD4PpxeWwinvbHIHjZoAzo0iv4RlNS5cunNRi3dMCDnupSb
 OQt9/wLYGejqUJDoyBW25Ign7faDAgKsnahSWYGBxBDelCIULi5E8/NLmvxvQ4jNHKVj
 b9iKz6bMtE13+f9hFtIHY17ihxq9kZN7TI2uUDmtKut/1jgYzs1HThlJj9qPnM5Uknb+
 PRj2cItUJpIt3orTBznlKoavMrXQi3k92IiaUUXUHkbFn76AUb03GDlgwmpkujbVyk7M
 VwMQ==
X-Gm-Message-State: AFuF++mN5V4qYoYwQc9md5ATNSzO4NVXNPVsEm85ouow5v4wqhNN0vaO
 FnvImcAa63Jp0lTvEM2NJaMLCOVxz3AYdxMl+ZfHlqRn4c+JPT299yVyEMhXJQ==
X-Gm-Gg: AYBFou3azUzXDl0Wp1qd1zFgP5l/JpLc3gFkab9bv9FbX6/SBAjHhTVmyioRdamFxRQ
 sAUZd7v+TOdINBVBbvDS3sSJn3pnF+GDwf1V/Vzri5rGkzTw1xD2rWk5WyPQLwEHd0ZQrqjPWsX
 E/fjBSHTHy1yzZlwimK+kK3K3XRJ7bPNb7E6GRp6OLDhmMoGFnrVctLA9k/ISPHIjAfe8WtTDp2
 4MSLbaHkY1qNQ07HbxGduoHmdpy4czbWtZx5ihaViVC0btdfsSrFO15yty+eNKi9rVxT66v766d
 MBwRbVSD9wPOAlx1BOf/ucuZc8IY6e24zhTvz82pyZcSrXn4AnSSJFGTSmBpyfVD+TXbqkPrL5C
 07FTgCr3fjozd8kr7UmBDvrCAkdyVon71NV4UtIWyV4/d/5iauQUxPGSC3I8XUSeAxiit6nygBg
 TIe9K9OkpxgUsgCyer8wpIHoIxXEiPm0Nwrmu+8R2Ib07uluevkcefFRzJOt6YvLYLD0ZTez2no
 DeqIJx73QeD5u8gD4hBtFIClA==
X-Received: by 2002:a05:6402:3818:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6aa5297a207mr10745277a12.22.1789934699728; 
 Sun, 20 Sep 2026 13:04:59 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa67e1b7e1sm2796115a12.26.2026.09.20.13.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 13:04:58 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2026 22:04:47 +0200
Message-ID: <20260920200450.15964-1-troglobit@gmail.com>
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
  package/mrouted: fix invalid daemon path in S41mrouted
  package/mrouted: bump to version 4.7

 package/mrouted/0001-gcc15.patch | 33 --------------------------------
 package/mrouted/S41mrouted       |  2 +-
 package/mrouted/mrouted.hash     |  4 ++--
 package/mrouted/mrouted.mk       |  4 ++--
 4 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 package/mrouted/0001-gcc15.patch
 mode change 100755 => 100644 package/mrouted/S41mrouted

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
