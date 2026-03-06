Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167F7FCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC4AA4202B;
	Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tn3NOtbN5Lim; Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BBA41F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826785;
	bh=UAO9Zz2iEhk65ooTb1gN8xGzA9lZ0/5Of0lPhhYCtm8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kya9StRcms9ixZHwOyn9G71a3OtsqlhARFjGZtSF5qH+pX1+0LX/daSMp8AArVuIF
	 qhmxcQgzxKJifm800BVMHG8pPvz+T4uODVK0ofHElSwZP8nLiJbQcMRqlNDxifduxZ
	 ynaHEybq9wvNG/pE3XBvDbdw4bhzcnYBZSqOOJTb95U1Ee82rPeTm1LT5KmS8tiIIU
	 erdawiIjHNJbngrg7wuknixFH4J2RhJUQtOUZnkPLXOjo/4IXZMfaDtfeSSKlukySt
	 j84vhhCZvOHqvchWpXLaoWRVK8bSAy2dTjFfPbXyR2Y4JUzg2G2y5pbnWgO8d2B8J0
	 tY0RwA3s2u4NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00BBA41F29;
	Fri,  6 Mar 2026 19:53:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AEC25B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 970A8613CD
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XTN-gzFxHmSB for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3EB9661481
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EB9661481
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3EB9661481
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo3971469f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826780; x=1773431580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fyRmuv1becsPqDQQ4gAyCg1cwWI0H8NhRevPbDnKV6Q=;
 b=Ifa0dRtGzjEdlxtC80FP9FlufIJSpBT6jJtDtMdlxtinA+CAM5GH/0+53u83NrQ6jW
 JYiQSRNHLsY2V3GLGDDezQc5ar802ceZDGa84mt8LaIrTYtzjGiKkMcpYYMlCCpPMQiM
 H2fyOTnjrmal13V8BrlBwYHsyKXLYbCojcF8MV+lki2GPhuw9PghmSKgI6dvrxnb+Bo5
 F7bwlUSAh7dL66/Tnmd2zJTiy9bzV+3kEPRQOyZsaGVhQ8EUeKK0JrWlU//MUAdei7YJ
 +Uy50/R5tCt45qqOcfNqO2bbIWeMDgUWYrCMw3PwLGVoL2yzGp8FhStogzwH3Bg/AyXW
 mggA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9ILhEo6H8yw2p7mvJUDbsOzS9pgPfF0hlCDKXyzLgYdzj/YrWb2y037JDI8B5CJL7vzSfSMSO+/c=@buildroot.org
X-Gm-Message-State: AOJu0YyVqMesq9zAbHmkHLjYhueNN96nM2E53wMw/vU5soKgdYzYAJjJ
 wj2OG7aTvyj7XyDbQeNZn+Uv4JvUfyEU+4glCr3BQFckitburHL7cgIJa6irNNwtnUcRnrXwOTq
 GNymF
X-Gm-Gg: ATEYQzzCuLWca0P+sh67G4QBvCKY9vXa5ak9olK9o3EjNZ4jD1xHAAiAlup+RXjtgr1
 zVzeXOsZT+s1a69IH0RGH8O6xb492+DU1rE4MstUSJ6p8hgRXygZIchzdSpOqUbrquj4K9CBbt8
 tvuSQ8Njdb0LMbwp2COvktLf9acxgzCYuXz4+ASMGzZ9Ldl5tSynoUhhORmBI/CPZFZPDRbOgyA
 s3XeHUUcTFYxIZmpILgxi8fOouX3qftoi7Shp6K6sy9ModQ5GDryt5cxTgqlj/KJe/Qq28qkdQh
 86k2aD9+Y8/HpfAa5sW7s/a92aEjw6ZlqrYeoRoVo10V770IJtW/DjAT1Rtr0/uQIPgr0fWyiBy
 x8Muav4xdQ4rRNWPJ8NRTkLTP6LY0CjOA4BITIay2IodHKS1BN2tPPuKyg8rAekqKBZkyO0H35v
 j9l7Y4nY747KCjYMo=
X-Received: by 2002:a05:6000:40de:b0:439:b744:c610 with SMTP id
 ffacd0b85a97d-439da3488ebmr5843724f8f.8.1772826779782; 
 Fri, 06 Mar 2026 11:52:59 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm7008629f8f.32.2026.03.06.11.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:52:59 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:52:58 +0100
Message-ID: <20260306195258.7133-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251220214206.1089100-17-bernd@kuhls.net>
References: <20251220214206.1089100-17-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826780; x=1773431580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fyRmuv1becsPqDQQ4gAyCg1cwWI0H8NhRevPbDnKV6Q=;
 b=Msn2MeVIhOyOrr6wWJ1DuPyWwS4y6iw510tWED8q9h/vPweOxgxFUoe4LwMsYDVu0M
 6xaXgwghqz0I7+MNE0qm29AV4yTNTjSyhkTNb0tWmyTXcCneaU6J33+3DxmK32nxXpkM
 scxzwQtNqqKjfH7tAEYfK4t+6YzXmosusWDfHQAWIuEhgDMW3qfN3wwsaOMM0i+tfk9j
 nk0w/l7PSQ201RoEgIa359+Cg0mgKitGUCA63CcVmRHKthbuEVXowE5OoBU7IbiqEkuV
 AtFvz6V9hJOrlOtPulO/LGBozCTC8TIu2I7MR5rXPkW/NbQqzQ6OxjUKrth7WJGQwRSm
 LT5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Msn2MeVI
Subject: Re: [Buildroot] [PATCH 17/18] package/python-multipart: bump
 version to 0.0.21
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

In reply of:
> https://github.com/Kludex/python-multipart/blob/0.0.21/CHANGELOG.md
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/python-multipart/python-multipart.hash | 6 +++---
>  package/python-multipart/python-multipart.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
> index 594c7cd497..ed01763cd7 100644
> --- a/package/python-multipart/python-multipart.hash
> +++ b/package/python-multipart/python-multipart.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/python-multipart/json
> -md5  fa3ee0a8ee83e24b66ab40a841922244  python_multipart-0.0.20.tar.gz
> -sha256  8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13  python_multipart-0.0.20.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/python_multipart/json
> +md5  fd24645f1b328d5d328e8b10bc2c596c  python_multipart-0.0.21.tar.gz
> +sha256  7137ebd4d3bbf70ea1622998f902b97a29434a9e8dc40eb203bbcf7c2a2cba92  python_multipart-0.0.21.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
> diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
> index 8e11f5f6cd..6921d935eb 100644
> --- a/package/python-multipart/python-multipart.mk
> +++ b/package/python-multipart/python-multipart.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_MULTIPART_VERSION = 0.0.20
> +PYTHON_MULTIPART_VERSION = 0.0.21
>  PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
> -PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f274c7ee665a29b885ec97089ec5dc034c7f3fafa03da9e39a09e
> +PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/78/96/804520d0850c7db98e5ccb70282e29208723f0964e88ffd9d0da2f52ea09
>  PYTHON_MULTIPART_SETUP_TYPE = hatch
>  PYTHON_MULTIPART_LICENSE = Apache-2.0
>  PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
