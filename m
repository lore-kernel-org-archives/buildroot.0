Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A248DEA8521
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 15:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2947F6080E;
	Sun,  8 Mar 2026 15:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrRKf2hqCHMf; Sun,  8 Mar 2026 15:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374096081B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772982420;
	bh=NAlxUdkLZA99XkV5uS4J6NAOW7HBrYXvVoFjVZb4CGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N1sSet/GPruLVJrTU9bZFEQsuAx73Vk8kEnXJ0MAiYbPKxyCgUha/PU4Dt5Oa11yK
	 1T3puXtM0NOcpYQjWIhee/6s94g/X7K70XLAIz6OT6kAaTz9ENBHsrEj/IaeyqWfik
	 X3tDqrnKecSVtCtSPw1jeG5snGz85fygO5dIkA+Ca5Bjg0DxxH/nuwnrnV4RoKdjjk
	 GkpKiOVNahAqLhNkqSEk4y1KdKGSLKkcqrALcbh0y6slGcuFjG1bwvkAdDrRJ8Hkpq
	 yb6aZ9oqsLN2FSXXJz9zzzzpR/uh6K65MKV6gCy5smUYe+6z02NrJ4atshiTZc2Ui+
	 WSceqgIdzJSJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374096081B;
	Sun,  8 Mar 2026 15:07:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84DC2119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8261981341
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKZjkRBQDzvJ for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 15:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 878E381350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 878E381350
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 878E381350
 for <buildroot@busybox.net>; Sun,  8 Mar 2026 15:06:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so14570255e9.1
 for <buildroot@busybox.net>; Sun, 08 Mar 2026 08:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772982415; x=1773587215;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoSazwtw8DwkRtXTBmpIXylU3mY+IqSOgu8KfisxQVU=;
 b=iZiYtoyf41uInSWayOIboYXiRb4A33G9oJrRixhlsKpYMCwHH3rKi6mWg3c4UGRjeL
 sPaSOPkUpGoGatPaX05Me4/lW17mPs6igMizGnlNQTQoS0IE2+rVPPnVbv57RZkKKm7N
 2T0ltBMc8C5tN7z9ImXKtm/sx6VyGiDsm9XM9Ru5FY/0nrwqyrvuAlQeGwBCSXgqg/20
 Y12fVxVhweAl1iKpNXg+TeM4mkrAMIaw1h3xkOfOSFXTpAtfl5MVgbOsHzBg+Jf7gkkp
 /reja0gWscWCaAFFGd1PgOnOc2gTOSiyGO4pvhj7UkptSRi4ya38dW8Sri/LGpwqiO3f
 WPBw==
X-Gm-Message-State: AOJu0YxGn65RBdWQG39qSPOFoCR2keKS9lLH/xk4yuu8qWzV9thJWppU
 2H5XEeDk0OwVN+0x575eSLR2dkyRsh3XRmJaJ7kxOTZOxvZLbD9bxLxR8l9C/KRCpQWTB0gMhow
 00jf3jA==
X-Gm-Gg: ATEYQzx+hfl38bhxr5jj4oCnHRhmA+vsKmee/3fdvPVY0O9BabAit9dxkMmo0booY3v
 gIhV34OZeaL5dX6gU/ZNMHRT1swkv3FYdhh2A2Gx5rntNXqGyxKWHsaQAC094XRh9/H8erNLVMm
 hhoNLNlGEx8Wb6pfIryWZHwy+EBhoseFBbDaGdPyTJUkX8BKr1J6uVg3chOgKv9I5MR74V2cfQB
 UXpbn1PAqhbvr6deNxxaclvz9jB2vu8r44c0FtfdrfD7df0SymicyeLwIzK5LQb7htg9Lx6ESVA
 tyDv0fhV76UK9dUAgri00xG86u3wrncdmEUdvN7h7XrZw6jj+wTKPml98quuY4H3EW5lA4e+Qhn
 rD1WakHbRjlcpQoEIzLy/m/9X/rBxv+7C/6w2IzqjUw6kh/iw3STVBijax7CNjqWq0Lb2ZMaz31
 z6FHnyBP3QFIaUSn9D6pOpvfjT4+JFJozAxD8sRENRC1/e5yk3yw==
X-Received: by 2002:a05:600c:6489:b0:485:3253:6ee with SMTP id
 5b1f17b1804b1-485325308ffmr60153185e9.35.1772982414119; 
 Sun, 08 Mar 2026 08:06:54 -0700 (PDT)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853a59fc36sm52380345e9.9.2026.03.08.08.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 08:06:53 -0700 (PDT)
To: buildroot@busybox.net
Date: Sun,  8 Mar 2026 16:06:47 +0100
Message-ID: <20260308150650.48948-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1772982415; x=1773587215; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WoSazwtw8DwkRtXTBmpIXylU3mY+IqSOgu8KfisxQVU=;
 b=OZ66JL9k88SGGCMPl2UbviJWxvlvdhiC8KZ4HosXOcfFsFxDllv+OG6SpaYSm6cnOb
 rBgQmz0UqMOrQs0/hL8ogSWBh8uKpwm2nte9/2G75W6bflj97fCpT7esOXdbjo7gyCsH
 jKLnJIpvbxPzqgbHPbhHTw/GH3v0DrQh0ad5tZM1C7dZN5pIQjUz/oK7o2i8VuR/h9Z5
 ujxaSO8+adYbZH3wTVjM62vflnUyIXApzRE9P4JrmM8Tw7egDLJooF7X3UvTy7kYF2nk
 xMo4XA+lh/nz1TsynxsfQ30VqHM+RjYYrGCGtu2ixKYS3hfpTFfousH/MIPn8+1Hmb0f
 v0lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=OZ66JL9k
Subject: [Buildroot] [PATCH v2 0/2] ficl
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1 -> v2

- downgrade to 3.03
    - fix .checkpackageignore

- upgrade to 3.05
    - add dependency on gcc 4.6 (C11/static_assert)

Francois Perrad (2):
  package/ficl: downgrade to version 3.03
  package/ficl: bump to version 3.05

 .checkpackageignore                           |  1 -
 package/ficl/0001-fix-Makefile.patch          | 47 ------------------
 ...=> 0001-makefile.linux-pass-LDFLAGS.patch} | 27 +++++-----
 package/ficl/Config.in                        |  6 ++-
 package/ficl/ficl.hash                        |  4 +-
 package/ficl/ficl.mk                          | 49 ++++---------------
 6 files changed, 33 insertions(+), 101 deletions(-)
 delete mode 100644 package/ficl/0001-fix-Makefile.patch
 rename package/ficl/{0002-Makefile.linux-pass-LDFLAGS.patch => 0001-makefile.linux-pass-LDFLAGS.patch} (65%)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
