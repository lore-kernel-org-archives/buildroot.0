Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE9C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9466853E9;
	Thu,  8 Feb 2024 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2W0K6wFKO7wb; Thu,  8 Feb 2024 21:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 418D5853D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 418D5853D8;
	Thu,  8 Feb 2024 21:15:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BCB41BF30D
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 061526156F
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJOOAEAhD_0z for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 21:15:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30502614CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30502614CF
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30502614CF
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 21:15:56 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5611850388cso372321a12.2
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 13:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707426955; x=1708031755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0kyuPIJ5bJe0nV0jUo7TntTMg0eZNECOs5XxdwUuvg=;
 b=soxlC71iLX24L70iwTqMvmimqbItxeK3F9g/lL6xhaj5Xetm0RlpqvPd3wd3SHaL5u
 6jvmmHQsg/msijg0jZTQeTVLPfiBmKr4UXzvLN+XIcl28zVf/crjcE7Gzh+A+3haN62T
 KnwKxLHWU/VGcU9cD0oPRAu1hXljHlNJ/yeS7N0Q3MRl1sSMzvTqWY3PPCQ3oEE2c6tO
 6kqrJr/kqDUBBw0xsw/bcgsALUGaBCcGLASyauoywcQO/F5xrARN4SO8sr7nr3s025aG
 +7txAfZ65DagkXh5bOi7mY8abxTaViZ6gvLhj0WZ9CSLOl7U9wp5H6k95sHjUeT3LTli
 U+KA==
X-Gm-Message-State: AOJu0YwNCdLRwJX0UwWMWyVcrgeDOGmB9ryBl+w+u/vkXEvvMzpIHzSz
 T6Gl+2tQdPBi3GNBlOTFu8+wGkLSUmNGTuN/1WhxYl3XPLnswRMYdSh/JQkA2454Aw==
X-Google-Smtp-Source: AGHT+IG2LE+sMbOHmUiLjyp5A5D2jYYSNqrC6Y8EpqJ+O735fyybqhTme9oSXrPxrEZi9+V0NDFpHA==
X-Received: by 2002:a05:6402:1608:b0:560:9277:80e5 with SMTP id
 f8-20020a056402160800b00560927780e5mr263623edv.21.1707426954659; 
 Thu, 08 Feb 2024 13:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWmSatPD7mKG9lhUtNsegNjk4QmBR6mHYCIVqjtkbcWoAb/n9aNEsVtDB1ffdmNjHs0ZpM8J5l2/IcmhuPZ9aPZlJG26NBKhFsSC4w6gfj3isXxOyVEThyLc27BfwZoH9Ta0UN1PM4=
Received: from yoga7.fritz.box (ip5f5bff47.dynamic.kabel-deutschland.de.
 [95.91.255.71]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056402004a00b0056003b75400sm126217edu.44.2024.02.08.13.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 13:15:54 -0800 (PST)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 22:15:15 +0100
Message-Id: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707426955; x=1708031755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0kyuPIJ5bJe0nV0jUo7TntTMg0eZNECOs5XxdwUuvg=;
 b=KgKvIC1Jq3S8vw1tDI4XgX+K/z9rvWYvfu03MmZKHBQ+oQUqSfKv0BsR9qD+AMKvue
 E8Et93zAgCkBXlk2gyX0jbz3y6Mss4slmjU4lLPEqJxGHbopvHkBdDeinsOgWx6Cr2fp
 UIB61ahObXLgUqKGCzLEDFpxGcAg//JyJX+1nWRoj5ZDHRumc9s0g+kwfxC00xOxvbzw
 RcPCzru3JUkr1PTpxzuzZRfuDKm8znVQDuN1aP4/8nagaEn7NiYNWASu121IFIXRD5Qc
 9/LyHxj7LzDFACI8HAVoYxXg0ARB663FpyNlABIgAQPJBQXlQr8Ng+B8K+R+yppUgRL6
 fOsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KgKvIC1J
Subject: [Buildroot] [PATCH v2 0/2] board/visionfive2: enable u-boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Lukasz Tekieli <tekieli.lukasz@gmail.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for U-Boot deployment in SD card image.

Lukasz Tekieli (2):
  board/visionfive2: fix genimage.cfg path
  board/visionfive2: enable u-boot

 board/visionfive2/genimage.cfg | 16 +++++++++-------
 configs/visionfive2_defconfig  | 21 ++++++++++++++++++++-
 2 files changed, 29 insertions(+), 8 deletions(-)

--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
